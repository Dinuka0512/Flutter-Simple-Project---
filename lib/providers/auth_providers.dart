import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailProvider = StateProvider<String>((ref) {
  return "";
});

final userDataProvider = StateProvider<Map<String, dynamic>?>((ref) {
  return null;
});
