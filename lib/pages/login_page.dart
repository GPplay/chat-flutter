import 'package:chat_flutter/widget/btn_azul.dart';
import 'package:chat_flutter/widget/labels.dart';
import 'package:chat_flutter/widget/logo.dart';
import 'package:flutter/material.dart';

import 'package:chat_flutter/widget/custom_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Logo(),
            _Form(),
            Labels(),
            Text(
              'Términos y condiciones de uso',
              style: TextStyle(fontWeight: FontWeight.w200),
            )
          ]),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),
          BtnAzul(
              text: 'Ingresar',
              onPressed: () {
                debugPrint(emailCtrl.text);
                debugPrint(passCtrl.text);
              }),
        ],
      ),
    );
  }
}
