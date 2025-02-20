part of 'chat_view_cubit.dart';

class ChatViewState extends Equatable {
  final List<Content> contents;
  final TextEditingController chatController;
  final Map<int, String> errorMsg;
  final bool isLoading;

  @override
  List<Object?> get props => [contents, chatController, errorMsg, isLoading];

  const ChatViewState({
    this.contents = const [],
    required this.chatController,
    this.errorMsg = const {},
    this.isLoading = false,
  });

  ChatViewState copyWith({
    List<Content>? contents,
    TextEditingController? chatController,
    Map<int, String>? errorMsg,
    bool? isLoading,
  }) {
    return ChatViewState(
      contents: contents ?? this.contents,
      chatController: chatController ?? this.chatController,
      errorMsg: errorMsg ?? this.errorMsg,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
