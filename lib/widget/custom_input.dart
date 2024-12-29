import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withAlpha(13),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]),
      child: TextField(
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        obscureText: false,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail_outline),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: 'Email'),
      ),
    );
  }
}
