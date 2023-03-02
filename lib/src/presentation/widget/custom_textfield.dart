import 'package:flutter/material.dart';
import 'package:task_manager/src/util/color.dart';
import 'package:task_manager/src/util/text_style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final bool? readOnly;
  final Function(String)? onChanged;
  final TextAlign? textAlign;
  final VoidCallback? onTap;
  const CustomTextField({super.key, 
    required this.hintText,
    required this.textController,
    this.onChanged,
    this.onTap,
    this.readOnly,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      readOnly: readOnly ?? false,
      cursorColor: CustomColor.greenColor,
      style: TextTypography.customTextStyle(context)
          .copyWith(color: CustomColor.whiteColor),
      decoration: InputDecoration(
        isDense: true,
        hintStyle: TextTypography.customTextStyle(context)
            .copyWith(color: CustomColor.greenColor.withOpacity(0.5)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColor.greenColor)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColor.greenColor, width: 3)),
        hintText: hintText,
        focusColor: Colors.white,
      ),
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
