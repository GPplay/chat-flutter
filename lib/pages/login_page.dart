import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _Logo(),
            _Form(),
            _Labels(),
            Text(
              'Términos y condiciones de uso',
              style: TextStyle(fontWeight: FontWeight.w200),
            )
          ]),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: EdgeInsets.only(top: 50),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Image(image: AssetImage('assets/tag-logo.png')),
              SizedBox(height: 20),
              Text('Messenger',
                  style: TextStyle(fontSize: 30, color: Colors.blue[600]))
            ],
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          Container(
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
          )

          //TODO: Crear el boton
          // ElevatedButton(
          //   onPressed: () {},
          //   child: Text('Ingresar'),
          // )
        ],
      ),
    );
  }
}

class _Labels extends StatelessWidget {
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
        Text('Crea una ahora!',
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}
