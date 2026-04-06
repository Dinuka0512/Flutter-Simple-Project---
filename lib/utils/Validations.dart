class Validators {
  // Email validation
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  // Password validation (min 8 chars, at least 1 letter & 1 number)
  static bool isValidPassword(String password) {
    final regex = RegExp(r'^.{6,}$'); // any 6 or more characters
    return regex.hasMatch(password);
  }


  // Mobile number validation (10 digits, adjust for your country)
  static bool isValidMobile(String mobile) {
    final regex = RegExp(r'^[0-9]{10}$');
    return regex.hasMatch(mobile);
  }

  // Name validation (only letters, min 2 chars)
  static bool isValidName(String name) {
    final regex = RegExp(r'^[a-zA-Z]{2,}$');
    return regex.hasMatch(name);
  }

  // Integer validation
  static bool isInt(String value) {
    return int.tryParse(value) != null;
  }

  // Double validation
  static bool isDouble(String value) {
    return double.tryParse(value) != null;
  }
}
