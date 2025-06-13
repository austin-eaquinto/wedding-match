enum SwipeAction {
  like,
  dislike,
  superLike
}

class SwipeResult {
  final String vendorId;
  final SwipeAction action;
  final DateTime timestamp;
  final double swipeVelocity;
  final double swipeDistance;

  const SwipeResult({
    required this.vendorId,
    required this.action,
    required this.timestamp,
    required this.swipeVelocity,
    required this.swipeDistance,
  });

  Map<String, dynamic> toJson() {
    return {
      'vendor_id': vendorId,
      'action': action.toString().split('.').last,
      'timestamp': timestamp.toIso8601String(),
      'swipe_velocity': swipeVelocity,
      'swipe_distance': swipeDistance,
    };
  }

  factory SwipeResult.fromJson(Map<String, dynamic> json) {
    return SwipeResult(
      vendorId: json['vendor_id'] as String,
      action: SwipeAction.values.firstWhere(
        (e) => e.toString().split('.').last == json['action'],
      ),
      timestamp: DateTime.parse(json['timestamp'] as String),
      swipeVelocity: (json['swipe_velocity'] as num).toDouble(),
      swipeDistance: (json['swipe_distance'] as num).toDouble(),
    );
  }
}