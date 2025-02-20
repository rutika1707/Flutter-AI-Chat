import 'dart:developer';

import 'package:ai_chat/chat_model/chat_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_view_state.dart';

class ChatViewCubit extends Cubit<ChatViewState> {
  final BuildContext context;

  ChatViewCubit(this.context, super.initialState);

  Future<void> chatApi() async {
    if (state.isLoading) return;
    if (state.chatController.text.isNotEmpty) {
      Dio dio = Dio();
      final List<Content> chatMsg = List.from(state.contents);

      try {
        int currentIndex = chatMsg.length;

        chatMsg.add(Content(
          role: "user",
          parts: [Part(text: state.chatController.text.trim())],
        ));
        state.chatController.clear();
        emit(
            state.copyWith(contents: chatMsg, errorMsg: null, isLoading: true));
        var url =
            "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro:generateContent?key={YOUR_API_KEY}";
        final request = await dio.post(url, data: {
          "contents": chatMsg.map((e) => e.toJson()).toList(),
          "generationConfig": {
            "temperature": 0,
            "topK": 40,
            "topP": 0.95,
            "maxOutputTokens": 100,
            "responseMimeType": "text/plain"
          }
        });
        state.chatController.clear();
        if (request.statusCode == 200) {
          log("response =======> ${request.data}");
          var data = request
              .data["candidates"].first['content']['parts'].first['text'];
          final List<Content> updatedChatMsg = List.from(chatMsg);
          updatedChatMsg.add(Content(
            role: 'model',
            parts: [Part(text: data)],
          ));
          emit(state.copyWith(
              contents: updatedChatMsg, isLoading: false, errorMsg: null));
        } else {
          final newErrorMessages = Map<int, String>.from(state.errorMsg);
          newErrorMessages[currentIndex] = "Something went wrong";
          emit(state.copyWith(errorMsg: newErrorMessages, isLoading: false));
        }
      } on DioException catch (e) {
        final newErrorMessages = Map<int, String>.from(state.errorMsg);
        newErrorMessages[chatMsg.length - 1] = "Something went wrong";
        emit(state.copyWith(errorMsg: newErrorMessages, isLoading: false));
        log("error ===> ${e.message}");
      }
    }
  }
}
