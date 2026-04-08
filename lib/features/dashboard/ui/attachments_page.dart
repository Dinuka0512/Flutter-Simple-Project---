import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frist_mobile_app/providers/auth_providers.dart';

class AttachmentsPage extends ConsumerWidget {
  const AttachmentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    return Text("Atachments.. \n$email");
  }
}
