import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/authorisation_controller.dart';

class RegistrationView extends GetView<AuthorisationController> {
  const RegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: const [Text("Authorisation")],
      ),
    ));
  }
}
