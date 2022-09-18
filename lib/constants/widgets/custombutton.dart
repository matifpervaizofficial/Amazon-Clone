import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final double BorderRadiusvalue;
  final VoidCallback ontap;
  final String title;
  final double textsize;
  const CustomButton({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    required this.BorderRadiusvalue,
    required this.ontap,
    required this.title,
    required this.textsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(BorderRadiusvalue),
            border: Border.all(
              color: color,
              width: 2,
            )),
        height: height,
        width: width,
        child: Center(
            child: Text(title,
                style: TextStyle(
                  fontSize: textsize,
                  color: Colors.white,
                ))),
      ),
    );
  }
}
