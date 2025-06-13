import 'package:flutter/material.dart';
import '../../../models/vendor/vendor_card_data.dart';

class VendorCard extends StatelessWidget {
  final VendorCardData cardData;
  final double cardWidth;
  final double cardHeight;
  final VoidCallback? onTap;

  const VendorCard({
    super.key,
    required this.cardData,
    this.cardWidth = 350,
    this.cardHeight = 600,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Background Image
              _buildBackgroundImage(),
              
              // Gradient Overlay
              _buildGradientOverlay(),
              
              // Content
              _buildContent(),
              
              // Top Badges
              _buildTopBadges(),
              
              // Match Score Badge
              _buildMatchScore(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: cardData.primaryImage.isNotEmpty
          ? Image.network(
              cardData.primaryImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return _buildPlaceholderImage();
              },
            )
          : _buildPlaceholderImage(),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      color: Colors.grey[300],
      child: const Center(
        child: Icon(
          Icons.business,
          size: 80,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.black.withValues(alpha: 0.3),
              Colors.black.withValues(alpha: 0.8),
            ],
            stops: const [0.0, 0.5, 0.8, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Business Name
          Text(
            cardData.vendor.businessName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          
          const SizedBox(height: 4),
          
          // Vendor Type
          Text(
            cardData.vendorTypeDisplay,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          const SizedBox(height: 8),
          
          // Location and Distance
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  '${cardData.vendor.location} • ${cardData.distanceDisplay}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          // Rating and Price
          Row(
            children: [
              // Rating
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${cardData.vendor.rating.toStringAsFixed(1)} (${cardData.vendor.reviewCount})',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              
              const Spacer(),
              
              // Price Range
              Text(
                cardData.vendor.priceRange.displayRange,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          // Styles
          if (cardData.stylesDisplay.isNotEmpty)
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: cardData.stylesDisplay.take(3).map((style) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    style,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildTopBadges() {
    return Positioned(
      top: 16,
      left: 16,
      child: Row(
        children: [
          if (cardData.hasVerifiedBadge)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.verified,
                    color: Colors.white,
                    size: 14,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Verified',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          
          if (cardData.hasVerifiedBadge && cardData.hasInsuredBadge)
            const SizedBox(width: 8),
          
          if (cardData.hasInsuredBadge)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.security,
                    color: Colors.white,
                    size: 14,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Insured',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMatchScore() {
    return Positioned(
      top: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: Colors.pink.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          '${cardData.matchPercentage} Match',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}