import 'package:ai_chat/utils/ui_extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final List<String>? autofillHints;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? hintText;
  final TextInputAction? action;
  final bool obscureText;
  final bool? isEnable;
  final String? obscuringCharacter;
  final ValueChanged<String>? fieldSubmitted;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final AutovalidateMode? autoValidateMode;
  final GlobalKey<FormFieldState>? fieldKey;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? minLines;
  final int maxLines;
  final bool readOnly;
  final bool autofocus;
  final Color? cursorColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final InputCounterWidgetBuilder? buildCounter;
  final int? maxLength;
  final Color? fillColor;
  final bool filled;
  final Color? labelColor;
  final String? label;
  final TextDirection? textDirection;
  final EdgeInsetsGeometry? contentPadding;

  const CommonTextField({
    super.key,
    required this.controller,
    GlobalKey<FormFieldState>? globalKey,
    this.validator,
    this.autofillHints,
    this.textInputAction,
    this.keyboardType,
    this.textDirection,
    this.hintText,
    this.suffixIcon,
    this.minLines,
    this.maxLines = 1,
    this.readOnly = false,
    this.autofocus = false,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.action,
    this.cursorColor,
    this.obscureText = false,
    this.isEnable = true,
    this.obscuringCharacter = '•',
    this.fieldSubmitted,
    this.onChanged,
    this.onTap,
    this.autoValidateMode,
    this.prefixIcon,
    this.style,
    this.focusNode,
    this.hintStyle,
    this.textAlign,
    this.buildCounter,
    this.maxLength,
    this.fillColor,
    this.filled = true,
    this.labelColor,
    this.contentPadding,
    this.label,
  }) : fieldKey = globalKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label ?? "",
            style: style ??
                TextStyle(
                    fontSize: 14,
                    color: context.colorScheme.onSurface,
                    fontWeight: FontWeight.w700),
            //overflow: TextOverflow.ellipsis,
          ),
          const Gap(8),
        ],
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          onTap: onTap,
          key: fieldKey,
          style: TextStyle(
            color: context.colorScheme.primary,
          ),
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          autofillHints: autofillHints,
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          maxLines: maxLines,
          minLines: minLines,
          onChanged: onChanged,
          onFieldSubmitted: fieldSubmitted,
          readOnly: readOnly,
          autofocus: autofocus,
          obscureText: obscureText,
          textAlign: textAlign ?? TextAlign.start,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          cursorColor: cursorColor ?? context.colorScheme.onPrimary,
          buildCounter: buildCounter,
          maxLength: maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.none,
          decoration: InputDecoration(
              errorMaxLines: 3,
              isDense: true,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              suffixIconConstraints: const BoxConstraints.tightFor(height: 40),
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              hintText: hintText,
              floatingLabelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: context.colorScheme.primary),
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: context.colorScheme.primary,
                  fontSize: 14),
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: context.colorScheme.primary,
                  fontSize: 14),
              prefixIconConstraints: prefixIcon != null
                  ? null
                  : BoxConstraints.tight(const Size(10, 60)),
              errorStyle: const TextStyle(fontWeight: FontWeight.w600),
              constraints: const BoxConstraints(maxWidth: 440),
              filled: true,
              fillColor: fillColor ?? Colors.transparent.withOpacity(0.6),
              disabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: context.colorScheme.primary,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: context.colorScheme.primary,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                      color: context.colorScheme.primary, width: 1.5)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: context.colorScheme.primary,
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide:
                      BorderSide(color: context.colorScheme.error, width: 1.5)),
              focusColor: context.colorScheme.onPrimary),
        ),
      ],
    );
  }
}
