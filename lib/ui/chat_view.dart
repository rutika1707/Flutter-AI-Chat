import 'package:ai_chat/utils/app_icons/app_icons.dart';
import 'package:ai_chat/utils/common_widget/common_text_field.dart';
import 'package:ai_chat/utils/ui_extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:tuple/tuple.dart';

import 'chat_view_cubit.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  static const String routeName = "/chat_view";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatViewCubit(
        context,
        ChatViewState(
          chatController: TextEditingController(),
        ),
      ),
      child: const ChatView(),
    );
  }

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  ChatViewCubit get cubit => BlocProvider.of<ChatViewCubit>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocBuilder<ChatViewCubit, ChatViewState>(
          builder: (context, state) {
            return Container(
              height: context.height,
              width: context.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.bgImage),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      itemCount: state.contents.length,
                      itemBuilder: (context, index) {
                        var alignment = state.contents[index].role == "user"
                            ? Alignment.centerRight
                            : Alignment.centerLeft;
                        return Align(
                          alignment: alignment,
                          child: IntrinsicWidth(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: context.colorScheme.primary
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    state.contents[index].parts?.first.text ??
                                        "",
                                    style: TextStyle(
                                      color: context.colorScheme.primary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                if (state.errorMsg.containsKey(index)) ...[
                                  Text(
                                    state.errorMsg[index]!,
                                    style: TextStyle(
                                      color: context.colorScheme.onSurface,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ] else ...[
                                  const SizedBox.shrink()
                                ],
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (state.isLoading) ...[
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Lottie.asset(
                        LottieImages.lottie,
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BlocSelector<ChatViewCubit, ChatViewState,
          Tuple2<TextEditingController, bool>>(
        selector: (state) => Tuple2(state.chatController, state.isLoading),
        builder: (context, state) {
          return IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 20, vertical: 8) +
                  EdgeInsetsDirectional.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
              child: ChatBottomNavigation(
                massageController: state.item1,
                sendMsg: () => state.item2 ? null : cubit.chatApi(),
                isLoading: false,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ChatBottomNavigation extends StatelessWidget {
  final TextEditingController massageController;
  final VoidCallback sendMsg;
  final bool isLoading;

  const ChatBottomNavigation({
    super.key,
    required this.massageController,
    required this.sendMsg,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      controller: massageController,
      hintText: "Search",
      suffixIcon: Padding(
        padding:
            const EdgeInsets.only(right: 10, top: 10, bottom: 10, left: 10),
        child: Wrap(
          spacing: 10,
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            InkWell(
              onTap: () => sendMsg(),
              child: isLoading
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(
                            child: CircularProgressIndicator(
                          color: context.colorScheme.onPrimary,
                        )),
                      ),
                    )
                  : SvgPicture.asset(AppIcons.sendICon),
            ),
          ],
        ),
      ),
    );
  }
}
