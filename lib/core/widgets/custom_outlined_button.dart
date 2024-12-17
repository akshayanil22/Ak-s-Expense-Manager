import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.buttonName,

  });

  final void Function()? onPressed;
  final String buttonName;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.sizeOf(context).width;

    return SizedBox(
      width: width,
      height: 52,
      child: OutlinedButton(onPressed: onPressed,style: ButtonStyle(
        shape: WidgetStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ), child: Text(buttonName),),
    );
  }
}
