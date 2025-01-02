import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

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
              itemBuilder: (_, i) => Text('$i'),
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
              onSubmitted: (value) => debugPrint(value),
              onChanged: (String text) {
                //TODO: Cuando hay un valor para poder postear
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
                        child: Text("Enviar",
                            style: TextStyle(color: Colors.blue[400])),
                        onPressed: () {},
                      )
                    : IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          size: 30,
                          color: Colors.blue[400],
                        ),
                        color: Colors.blue[400]),
          )
        ],
      ),
    ));
  }
}
