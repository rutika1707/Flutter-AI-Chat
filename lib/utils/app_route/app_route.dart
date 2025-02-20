import 'package:ai_chat/ui/chat_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.chatView:
        return MaterialPageRoute(
          builder: (context) => ChatView.builder(context),
        );
      default:
        return null;
    }
  }
}

class AppRoutes {
  static const chatView = '/chat_view';
}
