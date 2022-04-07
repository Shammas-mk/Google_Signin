import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googlesignin/login_controlleer.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LoginPage')),
      body: Center(
        child: Obx(() {
          if (controller.googleAccount.value == null) {
            return buildLoginButton();
          } else {
            return buildProfileView();
          }
          // buildLoginButton(),
        }),
      ),
    );
  }

  Column buildProfileView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(
            controller.googleAccount.value?.photoUrl ?? '',
          ).image,
          radius: 100,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          controller.googleAccount.value?.displayName ?? '',
          style: Get.textTheme.headline3,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          controller.googleAccount.value?.email ?? '',
          style: Get.textTheme.bodyText1,
        ),
        const SizedBox(
          height: 30,
        ),
        ActionChip(
            label: const Text("Logout"),
            onPressed: () {
              controller.logout();
            })
      ],
    );
  }

  FloatingActionButton buildLoginButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        controller.login();
      },
      icon: Image.asset(
        "assets/images/google.png",
        height: 32,
        width: 32,
      ),
      label: const Text("Login With Google"),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }
}
