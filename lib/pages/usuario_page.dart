import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat_flutter/models/usuario.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UsuarioPageState createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final usuarios = [
    Usuario(
        online: true, email: "MzG6y@example.com", nombre: "Miguel", uid: "1"),
    Usuario(
        online: false, email: "MzG6y@example.com", nombre: "juan", uid: "2"),
    Usuario(
        online: true, email: "MzG6y@example.com", nombre: "pedro", uid: "3"),
    Usuario(online: true, email: "MzG6y@example.com", nombre: "luis", uid: "4"),
    Usuario(
        online: true, email: "MzG6y@example.com", nombre: "maria", uid: "5"),
    Usuario(online: true, email: "MzG6y@example.com", nombre: "jose", uid: "6"),
    Usuario(
        online: true, email: "MzG6y@example.com", nombre: "pedro", uid: "7"),
    Usuario(online: true, email: "MzG6y@example.com", nombre: "luis", uid: "8"),
    Usuario(
        online: true, email: "MzG6y@example.com", nombre: "maria", uid: "9"),
    Usuario(
        online: true, email: "MzG6y@example.com", nombre: "jose", uid: "10"),
    Usuario(
        online: true, email: "MzG6y@example.com", nombre: "gybram", uid: "11"),
    Usuario(
        online: true, email: "MzG6y@example.com", nombre: "brayan", uid: "12"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi nombre'),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.black),
          onPressed: () {},
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue[400]),
            //child: Icon(Icons.offline_pin, color: Colors.red[400]), CUANDO NO ESTEN CONECTADOS
          )
        ],
      ),
      body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _cargarUsuarios,
          header: WaterDropHeader(
            complete: Icon(Icons.check, color: Colors.blue[400]),
            waterDropColor: Colors.blue[400]!,
          ),
          child: _listViewUsuarios()),
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _usuarioTitle(usuarios[i]),
      separatorBuilder: (_, i) => Divider(),
      itemCount: usuarios.length,
    );
  }

  ListTile _usuarioTitle(Usuario usuario) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        // ignore: sort_child_properties_last
        child: Text(usuario.nombre.substring(0, 2)),
        backgroundColor: Colors.blue[100],
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }

  void _cargarUsuarios() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
