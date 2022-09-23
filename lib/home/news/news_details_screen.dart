import 'package:flutter/material.dart';

class NewsDwetailsScreen extends StatelessWidget {
  static const String Routname = 'NewsDwetailsScreen';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/back_ground.png'),
          )),
        child:  Scaffold(

          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(35 )
              )
            ),
            centerTitle: true,
            title: const Text('news Details'),
          ),

        ),
    );
  }
}
