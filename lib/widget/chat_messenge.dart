import 'package:flutter/material.dart';

class ChatMessenge extends StatelessWidget {

  final String texto;
  final String uid;
  const ChatMessenge({super.key, required this.texto, required this.uid});

  @override
  Widget build(BuildContext context) {
    return Container(
      child : uid == '123' 
      ?_myMenssage()
      :_notMyMenssage()
      
    );
  }
  
  Widget _myMenssage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(
          right: 10.0,
          bottom: 5.0,
          left: 50.0
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
          ),
        child: Text(texto, style: TextStyle(color: Colors.white)),
      ),
      );
  }
  
  Widget _notMyMenssage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(
          right: 50.0,
          bottom: 5.0,
          left: 10.0
        ),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
          ),
        child: Text(texto, style: TextStyle(color: Colors.black87)),
      ),
      );
  }
}