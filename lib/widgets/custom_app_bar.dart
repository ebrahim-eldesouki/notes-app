import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon, this.onPressed});
final IconData icon ; 
final String title ; 
final void Function()? onPressed ; 
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const SizedBox(width: 10,),
        Text( title ,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
        const Spacer(),
         CustomIcon(
          icon: icon,
         onPressed: onPressed ,
         )
      ],
    );
  }
}