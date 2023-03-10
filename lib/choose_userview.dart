import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jsninja/admin_viewpage.dart';
import 'package:jsninja/providers/firestore.dart';
import 'package:jsninja/user_viewpage.dart';

class ChooseUserViewWidget extends ConsumerWidget {
  const ChooseUserViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(docSP('admin/${FirebaseAuth.instance.currentUser!.uid}')).when(
          loading: () => Container(),
          error: (e, s) => ErrorWidget(e),
          data: (doc) =>
              (doc.exists) ? const AdminViewWidget() : const UserViewWidget());
}
