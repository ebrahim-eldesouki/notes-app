import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color, });

  final bool isSelected;
  final Color color ; 
  @override
  Widget build(BuildContext context) {
    return isSelected
        ?  CircleAvatar(
            backgroundColor: Colors.white,
            radius: 38,
            child: CircleAvatar(
              backgroundColor:color,
              radius: 35,
            ),
          )
        :  CircleAvatar(
            backgroundColor: color,
            radius: 38,
          );
  }
}
