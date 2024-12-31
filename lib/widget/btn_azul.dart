import 'package:flutter/material.dart';

class BtnAzul extends StatelessWidget {
  final VoidCallback onPressed;

  const BtnAzul({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[600],
        shape: StadiumBorder(),
        elevation: 0,
      ),
      onPressed: onPressed,
      // ignore: sized_box_for_whitespace
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            'Ingresar',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
