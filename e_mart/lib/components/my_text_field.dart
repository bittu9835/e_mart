import 'package:e_mart/utils/my_theme.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function()? onTap;
  final BorderRadius? borderRadius;
  final InputBorder? inputBorder;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? padding;
  final String? label;
  final String? hint;
  final TextStyle? labelTextStyle;
  final TextStyle? hintTextStyle;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final TextInputType? textInputType;
  final TextStyle? style;
  final bool isReadOnly;

  const MyTextField(
      {super.key,
      this.controller,
      this.onTap,
      this.borderRadius,
      this.inputBorder,
      this.contentPadding,
      this.padding,
      this.label,
      this.hint,
      this.labelTextStyle,
      this.hintTextStyle,
      this.suffixWidget,
      this.prefixWidget,
      this.textInputType = TextInputType.text,
      this.style,
      this.isReadOnly = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: padding ?? const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: MyTheme.primaryLight.withOpacity(0.6),
          borderRadius: borderRadius ??
              const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
        ),
        child: TextField(
          controller: controller,
          cursorColor: MyTheme.primary,
          onTap: onTap,
          readOnly: isReadOnly,
          style: style ??
              const TextStyle(
                  color: MyTheme.primary, fontSize: 18, fontFamily: "Roboto"),
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: hint,
            labelText: label,
            prefix: prefixWidget,
            suffix: suffixWidget,
            labelStyle: labelTextStyle ??
                TextStyle(color: MyTheme.primary.withOpacity(0.8)),
            contentPadding: contentPadding ?? const EdgeInsets.only(left: 10),
            border: inputBorder ?? InputBorder.none,
          ),
        ),
      ),
    );
  }
}
