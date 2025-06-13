import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../models/vendor/vendor_card_data.dart';
import '../../../shared/components/cards/vendor_card.dart';
import '../models/swipe_action.dart';

class SwipeCardStack extends StatefulWidget {
  final List<VendorCardData> cards;
  final Function(SwipeResult) onSwipe;
  final VoidCallback? onStackEmpty;
  final Function(VendorCardData)? onCardTap;

  const SwipeCardStack({
    super.key,
    required this.cards,
    required this.onSwipe,
    this.onStackEmpty,
    this.onCardTap,
  });

  @override
  State<SwipeCardStack> createState() => SwipeCardStackState();
}

class SwipeCardStackState extends State<SwipeCardStack>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  double _dragPosition = 0.0;
  double _dragStartPosition = 0.0;
  bool _isDragging = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  // Swipe thresholds
  static const double _swipeThreshold = 80.0;
  static const double _superLikeThreshold = -100.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<VendorCardData> get _visibleCards {
    if (_currentIndex >= widget.cards.length) return [];
    return widget.cards.skip(_currentIndex).take(3).toList();
  }

  void _onPanStart(DragStartDetails details) {
    setState(() {
      _isDragging = true;
      _dragStartPosition = details.localPosition.dx;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragPosition = details.localPosition.dx - _dragStartPosition;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    final velocity = details.velocity.pixelsPerSecond.dx;
    final swipeDistance = _dragPosition.abs();
    
    SwipeAction? action;
    
    // Determine swipe action
    if (_dragPosition > _swipeThreshold || velocity > 500) {
      action = SwipeAction.like;
    } else if (_dragPosition < -_swipeThreshold || velocity < -500) {
      action = SwipeAction.dislike;
    } else if (details.velocity.pixelsPerSecond.dy < _superLikeThreshold) {
      action = SwipeAction.superLike;
    }

    if (action != null) {
      _performSwipe(action, velocity.abs(), swipeDistance);
    } else {
      _resetCard();
    }
  }

  void _performSwipe(SwipeAction action, double velocity, double distance) {
    if (_currentIndex >= widget.cards.length) return;

    final currentCard = widget.cards[_currentIndex];
    final swipeResult = SwipeResult(
      vendorId: currentCard.vendor.id,
      action: action,
      timestamp: DateTime.now(),
      swipeVelocity: velocity,
      swipeDistance: distance,
    );

    // Trigger haptic feedback
    _triggerHapticFeedback(action);

    // Animate card out
    _animateCardOut(action).then((_) {
      setState(() {
        _currentIndex++;
        _dragPosition = 0.0;
        _isDragging = false;
      });

      widget.onSwipe(swipeResult);

      if (_currentIndex >= widget.cards.length) {
        widget.onStackEmpty?.call();
      } else {
        _animationController.forward();
      }
    });
  }

  void _triggerHapticFeedback(SwipeAction action) {
    switch (action) {
      case SwipeAction.like:
        HapticFeedback.lightImpact();
        break;
      case SwipeAction.dislike:
        HapticFeedback.lightImpact();
        break;
      case SwipeAction.superLike:
        HapticFeedback.mediumImpact();
        break;
    }
  }

  Future<void> _animateCardOut(SwipeAction action) async {
    double targetX = 0;

    switch (action) {
      case SwipeAction.like:
        targetX = MediaQuery.of(context).size.width;
        break;
      case SwipeAction.dislike:
        targetX = -MediaQuery.of(context).size.width;
        break;
      case SwipeAction.superLike:
        targetX = 0; // For super like, we'll use a different animation
        break;
    }

    await _animationController.reverse();
    setState(() {
      _dragPosition = targetX;
    });
  }

  void _resetCard() {
    setState(() {
      _dragPosition = 0.0;
      _isDragging = false;
    });
  }

  // Public methods for programmatic swiping
  void swipeRight() {
    _performSwipe(SwipeAction.like, 1000, 100);
  }

  void swipeLeft() {
    _performSwipe(SwipeAction.dislike, 1000, 100);
  }

  void swipeUp() {
    _performSwipe(SwipeAction.superLike, 1000, 100);
  }

  @override
  Widget build(BuildContext context) {
    if (_visibleCards.isEmpty) {
      return const Center(
        child: Text(
          'No more vendors to show',
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return SizedBox(
      height: 600,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background cards
          ..._buildBackgroundCards(),
          
          // Front card
          _buildFrontCard(),
          
          // Swipe indicators
          if (_isDragging) _buildSwipeIndicators(),
        ],
      ),
    );
  }

  List<Widget> _buildBackgroundCards() {
    final backgroundCards = <Widget>[];
    
    for (int i = _visibleCards.length - 1; i > 0; i--) {
      final scale = 1.0 - (i * 0.05);
      final yOffset = i * 8.0;
      
      backgroundCards.add(
        AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            final animatedScale = i == 1 
                ? scale + (0.05 * _scaleAnimation.value)
                : scale;
            
            return Transform.translate(
              offset: Offset(0, yOffset),
              child: Transform.scale(
                scale: animatedScale,
                child: VendorCard(
                  cardData: _visibleCards[i],
                  onTap: () => widget.onCardTap?.call(_visibleCards[i]),
                ),
              ),
            );
          },
        ),
      );
    }
    
    return backgroundCards;
  }

  Widget _buildFrontCard() {
    if (_visibleCards.isEmpty) return const SizedBox.shrink();

    final rotation = _dragPosition / 1000;
    final opacity = 1.0 - (_dragPosition.abs() / 200).clamp(0.0, 0.3);

    return GestureDetector(
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Transform.translate(
        offset: Offset(_dragPosition, 0),
        child: Transform.rotate(
          angle: rotation,
          child: Opacity(
            opacity: opacity,
            child: VendorCard(
              cardData: _visibleCards[0],
              onTap: () => widget.onCardTap?.call(_visibleCards[0]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwipeIndicators() {
    return Positioned.fill(
      child: Stack(
        children: [
          // Like indicator (right)
          if (_dragPosition > 30)
            Positioned(
              top: 100,
              right: 50,
              child: Transform.rotate(
                angle: -0.3,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: const Text(
                    'LIKE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          
          // Dislike indicator (left)
          if (_dragPosition < -30)
            Positioned(
              top: 100,
              left: 50,
              child: Transform.rotate(
                angle: 0.3,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: const Text(
                    'NOPE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}