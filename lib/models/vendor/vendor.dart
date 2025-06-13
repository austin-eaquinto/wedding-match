class Vendor {
  final String id;
  final String businessName;
  final VendorType type;
  final String description;
  final String location;
  final String address;
  final double latitude;
  final double longitude;
  final PriceRange priceRange;
  final List<String> images;
  final String profileImage;
  final double rating;
  final int reviewCount;
  final List<String> services;
  final List<VendorStyle> styles;
  final ContactInfo contactInfo;
  final BusinessInfo businessInfo;
  final bool isVerified;
  final bool isAvailable;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Vendor({
    required this.id,
    required this.businessName,
    required this.type,
    required this.description,
    required this.location,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.priceRange,
    required this.images,
    required this.profileImage,
    required this.rating,
    required this.reviewCount,
    required this.services,
    required this.styles,
    required this.contactInfo,
    required this.businessInfo,
    required this.isVerified,
    required this.isAvailable,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'] as String,
      businessName: json['business_name'] as String,
      type: VendorType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
      ),
      description: json['description'] as String,
      location: json['location'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      priceRange: PriceRange.fromJson(json['price_range'] as Map<String, dynamic>),
      images: List<String>.from(json['images'] as List),
      profileImage: json['profile_image'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['review_count'] as int,
      services: List<String>.from(json['services'] as List),
      styles: (json['styles'] as List)
          .map((style) => VendorStyle.values.firstWhere(
                (e) => e.toString().split('.').last == style,
              ))
          .toList(),
      contactInfo: ContactInfo.fromJson(json['contact_info'] as Map<String, dynamic>),
      businessInfo: BusinessInfo.fromJson(json['business_info'] as Map<String, dynamic>),
      isVerified: json['is_verified'] as bool,
      isAvailable: json['is_available'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'business_name': businessName,
      'type': type.toString().split('.').last,
      'description': description,
      'location': location,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'price_range': priceRange.toJson(),
      'images': images,
      'profile_image': profileImage,
      'rating': rating,
      'review_count': reviewCount,
      'services': services,
      'styles': styles.map((style) => style.toString().split('.').last).toList(),
      'contact_info': contactInfo.toJson(),
      'business_info': businessInfo.toJson(),
      'is_verified': isVerified,
      'is_available': isAvailable,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

enum VendorType {
  photographer,
  videographer,
  venue,
  caterer,
  florist,
  dj,
  band,
  baker,
  weddingPlanner,
  decorator,
  makeup,
  hair,
  transportation,
  officiant,
  jeweler,
  bridal,
  tuxedo,
  invitations,
  favors
}

enum VendorStyle {
  rustic,
  elegant,
  modern,
  vintage,
  bohemian,
  classic,
  romantic,
  minimalist,
  luxurious,
  outdoor,
  indoor,
  destination,
  cultural,
  themed
}

class PriceRange {
  final double min;
  final double max;
  final String currency;

  const PriceRange({
    required this.min,
    required this.max,
    this.currency = 'USD',
  });

  factory PriceRange.fromJson(Map<String, dynamic> json) {
    return PriceRange(
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
      currency: json['currency'] as String? ?? 'USD',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min': min,
      'max': max,
      'currency': currency,
    };
  }

  String get displayRange {
    if (min == max) {
      return '\$${min.toStringAsFixed(0)}';
    }
    return '\$${min.toStringAsFixed(0)} - \$${max.toStringAsFixed(0)}';
  }
}

class ContactInfo {
  final String email;
  final String phone;
  final String? website;
  final String? instagram;
  final String? facebook;

  const ContactInfo({
    required this.email,
    required this.phone,
    this.website,
    this.instagram,
    this.facebook,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      email: json['email'] as String,
      phone: json['phone'] as String,
      website: json['website'] as String?,
      instagram: json['instagram'] as String?,
      facebook: json['facebook'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'website': website,
      'instagram': instagram,
      'facebook': facebook,
    };
  }
}

class BusinessInfo {
  final String? licenseNumber;
  final bool isInsured;
  final int yearsInBusiness;
  final String? bio;
  final List<String> certifications;

  const BusinessInfo({
    this.licenseNumber,
    required this.isInsured,
    required this.yearsInBusiness,
    this.bio,
    required this.certifications,
  });

  factory BusinessInfo.fromJson(Map<String, dynamic> json) {
    return BusinessInfo(
      licenseNumber: json['license_number'] as String?,
      isInsured: json['is_insured'] as bool,
      yearsInBusiness: json['years_in_business'] as int,
      bio: json['bio'] as String?,
      certifications: List<String>.from(json['certifications'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'license_number': licenseNumber,
      'is_insured': isInsured,
      'years_in_business': yearsInBusiness,
      'bio': bio,
      'certifications': certifications,
    };
  }
}