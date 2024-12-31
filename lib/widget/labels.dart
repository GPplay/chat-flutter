import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;

  const Labels({super.key, required this.ruta});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('¿No tienes cuenta?',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300)),
        SizedBox(height: 10),
        GestureDetector(
          child: Text('Crea una ahora!',
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          onTap: () => Navigator.pushReplacementNamed(context, ruta),
        )
      ],
    );
  }
}
