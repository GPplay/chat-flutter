import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String pregunta;
  final String respuesta;

  const Labels(
      {super.key,
      required this.ruta,
      required this.pregunta,
      required this.respuesta});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(pregunta,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300)),
        SizedBox(height: 10),
        GestureDetector(
          child: Text(respuesta,
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
