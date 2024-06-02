import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
final TextEditingController textEditingController;
final IconData? iconData;
final String? assetRefrance;
final String labelString;
final bool isObscure;

const InputTextWidget({
  super.key,
  required this.textEditingController,
  this.iconData,
  this.assetRefrance,
  required this.labelString,
  required this.isObscure
});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        prefixIcon: iconData != null
            ?Icon(iconData)
            : Padding(
          padding:const EdgeInsets.all(8),
          child: Image.asset(assetRefrance!, width: 10,),
        ),
        labelText: labelString,
        labelStyle: const TextStyle(
            fontSize: 14
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
                color: Colors.grey
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
                color: Colors.grey
            )
        ),
      ),
      obscureText: isObscure,
    );
  }
}
