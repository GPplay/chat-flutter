import 'dart:io';

import 'package:chat_flutter/widget/chat_messenge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  final List<ChatMessenge> _mensajes = [];

  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(children: <Widget>[
          CircleAvatar(
            // ignore: sort_child_properties_last
            child: Text('Te', style: TextStyle(fontSize: 12)),
            backgroundColor: Colors.blue[100],
            maxRadius: 14,
          ),
          SizedBox(height: 3),
          Text('melisa', style: TextStyle(color: Colors.black87, fontSize: 12)),
        ]),
        centerTitle: true,
        elevation: 1,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _mensajes.length,
              itemBuilder: (_, i) => _mensajes[i],
              reverse: true,
            )),
            Divider(height: 1),
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handelSumit,
              onChanged: (String texto) {
                setState(() {
                  if(texto.trim().isNotEmpty){ 
                    _estaEscribiendo = true;
                  } else {
                    _estaEscribiendo = false;
                  }
                }
                );
              },
              decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje'),
              focusNode: _focusNode,
            ),
          ),
          //Boton de enviar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: kIsWeb
                ? IconButton(onPressed: () {}, icon: Icon(Icons.send))
                : Platform.isIOS
                    ? CupertinoButton(
                        onPressed: _estaEscribiendo
                                ? () => _handelSumit(_textController.text.trim())
                                : null,
                        child: Text("Enviar",
                            style: TextStyle(color: Colors.blue[400])),
                      )

                    : Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue[400]),
                        child: IconButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: _estaEscribiendo
                                ? () => _handelSumit(_textController.text.trim())
                                : null,
                            icon: Icon(
                              Icons.send,
                              size: 30,
                            ),
                            color: Colors.blue[400]),
                      ),
                    ),
          )
        ],
      ),
    ));
  }

  _handelSumit(String text) {

    if (text.isEmpty) return; //si es vacio.isEmpty) return;


    debugPrint(text);
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessenge(
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 400)),
      texto: text,
      uid: '123',
    );
    _mensajes.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO: off del socket
    for (ChatMessenge message in _mensajes) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
