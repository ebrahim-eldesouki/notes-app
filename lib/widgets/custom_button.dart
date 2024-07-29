import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap,  this.isLoading = false });
  final void Function()? onTap;
  final  bool isLoading ; 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white70),
        height: 45,
        width: MediaQuery.of(context).size.width,
        child:  Center(
          child:isLoading?const SizedBox( width: 24,height: 24 ,child: CircularProgressIndicator(color: Colors.black,)) :const Text(
            'Add',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
