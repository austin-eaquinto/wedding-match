import 'vendor.dart';

class VendorCardData {
  final Vendor vendor;
  final double matchScore;
  final List<String> matchReasons;
  final bool isLiked;
  final bool isDisliked;
  final bool isSuperLiked;
  final DateTime viewedAt;

  const VendorCardData({
    required this.vendor,
    required this.matchScore,
    required this.matchReasons,
    this.isLiked = false,
    this.isDisliked = false,
    this.isSuperLiked = false,
    required this.viewedAt,
  });

  VendorCardData copyWith({
    Vendor? vendor,
    double? matchScore,
    List<String>? matchReasons,
    bool? isLiked,
    bool? isDisliked,
    bool? isSuperLiked,
    DateTime? viewedAt,
  }) {
    return VendorCardData(
      vendor: vendor ?? this.vendor,
      matchScore: matchScore ?? this.matchScore,
      matchReasons: matchReasons ?? this.matchReasons,
      isLiked: isLiked ?? this.isLiked,
      isDisliked: isDisliked ?? this.isDisliked,
      isSuperLiked: isSuperLiked ?? this.isSuperLiked,
      viewedAt: viewedAt ?? this.viewedAt,
    );
  }

  String get matchPercentage => '${(matchScore * 100).round()}%';

  String get primaryImage => vendor.profileImage.isNotEmpty 
      ? vendor.profileImage 
      : vendor.images.isNotEmpty 
          ? vendor.images.first 
          : '';

  List<String> get additionalImages => vendor.images.length > 1 
      ? vendor.images.skip(1).toList() 
      : [];

  String get vendorTypeDisplay {
    switch (vendor.type) {
      case VendorType.photographer:
        return 'Photographer';
      case VendorType.videographer:
        return 'Videographer';
      case VendorType.venue:
        return 'Venue';
      case VendorType.caterer:
        return 'Caterer';
      case VendorType.florist:
        return 'Florist';
      case VendorType.dj:
        return 'DJ';
      case VendorType.band:
        return 'Live Band';
      case VendorType.baker:
        return 'Baker';
      case VendorType.weddingPlanner:
        return 'Wedding Planner';
      case VendorType.decorator:
        return 'Decorator';
      case VendorType.makeup:
        return 'Makeup Artist';
      case VendorType.hair:
        return 'Hair Stylist';
      case VendorType.transportation:
        return 'Transportation';
      case VendorType.officiant:
        return 'Officiant';
      case VendorType.jeweler:
        return 'Jeweler';
      case VendorType.bridal:
        return 'Bridal Shop';
      case VendorType.tuxedo:
        return 'Tuxedo Shop';
      case VendorType.invitations:
        return 'Invitations';
      case VendorType.favors:
        return 'Wedding Favors';
    }
  }

  List<String> get stylesDisplay {
    return vendor.styles.map((style) {
      switch (style) {
        case VendorStyle.rustic:
          return 'Rustic';
        case VendorStyle.elegant:
          return 'Elegant';
        case VendorStyle.modern:
          return 'Modern';
        case VendorStyle.vintage:
          return 'Vintage';
        case VendorStyle.bohemian:
          return 'Bohemian';
        case VendorStyle.classic:
          return 'Classic';
        case VendorStyle.romantic:
          return 'Romantic';
        case VendorStyle.minimalist:
          return 'Minimalist';
        case VendorStyle.luxurious:
          return 'Luxurious';
        case VendorStyle.outdoor:
          return 'Outdoor';
        case VendorStyle.indoor:
          return 'Indoor';
        case VendorStyle.destination:
          return 'Destination';
        case VendorStyle.cultural:
          return 'Cultural';
        case VendorStyle.themed:
          return 'Themed';
      }
    }).toList();
  }

  String get distanceDisplay {
    // This would typically calculate actual distance based on user location
    // For now, return a placeholder
    return '${(matchScore * 50).round()} mi';
  }

  bool get hasVerifiedBadge => vendor.isVerified;
  
  bool get hasInsuredBadge => vendor.businessInfo.isInsured;
}