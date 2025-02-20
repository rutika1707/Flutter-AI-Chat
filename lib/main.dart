import 'package:ai_chat/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'utils/app_route/app_route.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: "ChatAi",
      onGenerateTitle: (context) => "Chat_Ai",
      scrollBehavior: null,
      initialRoute: AppRoutes.chatView,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: AppTheme.themColors(),
    );
  }
}
