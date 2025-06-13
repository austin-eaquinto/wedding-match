import 'package:flutter/material.dart';
import '../../../models/vendor/vendor_card_data.dart';
import '../../../models/vendor/vendor.dart';
import '../widgets/swipe_card_stack.dart';
import '../models/swipe_action.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  final GlobalKey<SwipeCardStackState> _stackKey = GlobalKey();
  List<VendorCardData> _vendorCards = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadVendors();
  }

  Future<void> _loadVendors() async {
    // Simulate loading vendors from API
    await Future.delayed(const Duration(seconds: 1));
    
    setState(() {
      _vendorCards = _generateMockVendors();
      _isLoading = false;
    });
  }

  List<VendorCardData> _generateMockVendors() {
    return [
      VendorCardData(
        vendor: Vendor(
          id: '1',
          businessName: 'Elegant Photography Studio',
          type: VendorType.photographer,
          description: 'Capturing your special moments with artistic flair',
          location: 'San Francisco, CA',
          address: '123 Market St, San Francisco, CA 94103',
          latitude: 37.7749,
          longitude: -122.4194,
          priceRange: const PriceRange(min: 2500, max: 5000),
          images: [
            'https://images.unsplash.com/photo-1606216794074-735e91aa2c92?w=400',
            'https://images.unsplash.com/photo-1511285560929-80b456fea0bc?w=400',
          ],
          profileImage: 'https://images.unsplash.com/photo-1606216794074-735e91aa2c92?w=400',
          rating: 4.8,
          reviewCount: 127,
          services: ['Wedding Photography', 'Engagement Shoots', 'Photo Editing'],
          styles: [VendorStyle.romantic, VendorStyle.elegant, VendorStyle.modern],
          contactInfo: const ContactInfo(
            email: 'hello@elegantphoto.com',
            phone: '+1 (555) 123-4567',
            website: 'https://elegantphoto.com',
            instagram: '@elegantphoto',
          ),
          businessInfo: const BusinessInfo(
            isInsured: true,
            yearsInBusiness: 8,
            certifications: ['Professional Photographers of America'],
          ),
          isVerified: true,
          isAvailable: true,
          createdAt: DateTime.now().subtract(const Duration(days: 365)),
          updatedAt: DateTime.now(),
        ),
        matchScore: 0.92,
        matchReasons: ['Location match', 'Style preference', 'Budget aligned'],
        viewedAt: DateTime.now(),
      ),
      
      VendorCardData(
        vendor: Vendor(
          id: '2',
          businessName: 'Golden Gate Florals',
          type: VendorType.florist,
          description: 'Creating stunning floral arrangements for your perfect day',
          location: 'Marin County, CA',
          address: '456 Flower Lane, Mill Valley, CA 94941',
          latitude: 37.9061,
          longitude: -122.5450,
          priceRange: const PriceRange(min: 1200, max: 3500),
          images: [
            'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
            'https://images.unsplash.com/photo-1520763185298-1b434c919102?w=400',
          ],
          profileImage: 'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
          rating: 4.9,
          reviewCount: 89,
          services: ['Bridal Bouquets', 'Centerpieces', 'Ceremony Arrangements'],
          styles: [VendorStyle.romantic, VendorStyle.bohemian, VendorStyle.vintage],
          contactInfo: const ContactInfo(
            email: 'info@goldengateflorals.com',
            phone: '+1 (555) 987-6543',
            website: 'https://goldengateflorals.com',
          ),
          businessInfo: const BusinessInfo(
            isInsured: true,
            yearsInBusiness: 12,
            certifications: ['California Certified Florist'],
          ),
          isVerified: true,
          isAvailable: true,
          createdAt: DateTime.now().subtract(const Duration(days: 500)),
          updatedAt: DateTime.now(),
        ),
        matchScore: 0.88,
        matchReasons: ['Style match', 'High ratings', 'Local vendor'],
        viewedAt: DateTime.now(),
      ),
      
      VendorCardData(
        vendor: Vendor(
          id: '3',
          businessName: 'Bay Area DJ Services',
          type: VendorType.dj,
          description: 'Professional DJ services to keep your party going all night',
          location: 'Oakland, CA',
          address: '789 Music Ave, Oakland, CA 94612',
          latitude: 37.8044,
          longitude: -122.2712,
          priceRange: const PriceRange(min: 800, max: 2000),
          images: [
            'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400',
            'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?w=400',
          ],
          profileImage: 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400',
          rating: 4.6,
          reviewCount: 156,
          services: ['Wedding DJ', 'MC Services', 'Sound System Rental'],
          styles: [VendorStyle.modern, VendorStyle.classic],
          contactInfo: const ContactInfo(
            email: 'bookings@bayareadj.com',
            phone: '+1 (555) 246-8135',
            website: 'https://bayareadj.com',
          ),
          businessInfo: const BusinessInfo(
            isInsured: true,
            yearsInBusiness: 6,
            certifications: ['Licensed DJ Professional'],
          ),
          isVerified: false,
          isAvailable: true,
          createdAt: DateTime.now().subtract(const Duration(days: 200)),
          updatedAt: DateTime.now(),
        ),
        matchScore: 0.75,
        matchReasons: ['Budget friendly', 'Available date', 'Local vendor'],
        viewedAt: DateTime.now(),
      ),
    ];
  }

  void _handleSwipe(SwipeResult result) {
    // Log: Swiped ${result.action} on vendor ${result.vendorId}
    
    // Here you would typically:
    // 1. Send the swipe result to your backend
    // 2. Update user preferences based on swipe patterns
    // 3. If it's a like/super like, add to saved vendors
    
    switch (result.action) {
      case SwipeAction.like:
        _showSnackBar('Vendor saved to your likes!', Colors.green);
        break;
      case SwipeAction.superLike:
        _showSnackBar('Super liked! Vendor will be notified.', Colors.blue);
        break;
      case SwipeAction.dislike:
        // No feedback for dislikes typically
        break;
    }
  }

  void _handleStackEmpty() {
    _showSnackBar('No more vendors! Check back later for new ones.', Colors.orange);
  }

  void _handleCardTap(VendorCardData cardData) {
    // Navigate to vendor detail screen
    // TODO: Navigate to vendor detail screen for ${cardData.vendor.businessName}
    // TODO: Navigate to vendor detail screen
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Discover Vendors',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Open filter options
              // TODO: Open filter options
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              _loadVendors();
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                // Header with match info
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Found ${_vendorCards.length} vendors matching your preferences',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                
                // Card stack
                Expanded(
                  child: SwipeCardStack(
                    key: _stackKey,
                    cards: _vendorCards,
                    onSwipe: _handleSwipe,
                    onStackEmpty: _handleStackEmpty,
                    onCardTap: _handleCardTap,
                  ),
                ),
                
                // Action buttons
                _buildActionButtons(),
              ],
            ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Dislike button
          FloatingActionButton(
            heroTag: 'dislike',
            onPressed: () => _stackKey.currentState?.swipeLeft(),
            backgroundColor: Colors.red,
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 32,
            ),
          ),
          
          // Super like button
          FloatingActionButton(
            heroTag: 'superlike',
            onPressed: () => _stackKey.currentState?.swipeUp(),
            backgroundColor: Colors.blue,
            child: const Icon(
              Icons.star,
              color: Colors.white,
              size: 32,
            ),
          ),
          
          // Like button
          FloatingActionButton(
            heroTag: 'like',
            onPressed: () => _stackKey.currentState?.swipeRight(),
            backgroundColor: Colors.green,
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}