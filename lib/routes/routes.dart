import 'package:flutter/material.dart';

import 'package:chat_flutter/pages/chat_page.dart';
import 'package:chat_flutter/pages/loading_page.dart';
import 'package:chat_flutter/pages/login_page.dart';
import 'package:chat_flutter/pages/register_page.dart';
import 'package:chat_flutter/pages/usuario_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  "usuarios": (_) => UsuarioPage(),
  "chat": (_) => ChatPage(),
  "login": (_) => LoginPage(),
  "loading": (_) => LoadingPage(),
  "register": (_) => RegisterPage(),
};
