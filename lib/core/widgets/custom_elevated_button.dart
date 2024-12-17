import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
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
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(Colors.blueAccent),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          shape: WidgetStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        ),
        onPressed: onPressed,
        child: Text(buttonName),
      ),
    );
  }
}
