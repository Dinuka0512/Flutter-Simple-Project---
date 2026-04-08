class AuthResult {
  final bool success;
  final String message;
  final Map<String, dynamic>? user; // optional user details

  AuthResult(this.success, this.message, {this.user});

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'user': user,
    };
  }

  // Create from JSON
  factory AuthResult.fromJson(Map<String, dynamic> json) {
    return AuthResult(
      json['success'] as bool,
      json['message'] as String,
      user: json['user'] as Map<String, dynamic>?,
    );
  }
}
