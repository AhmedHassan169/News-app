import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  // هعمل متغيرين عشان افرق بين setting w category اما يجي يدوس ويستدعى الفانكشن
  static const int setting=1;
  static const int cattogry=2;
  //هستقبل الفانكشن onSideClick اللى عملتها call فى home Screen
  Function onSideClickk;
   SideMenu(this.onSideClickk);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 64),
            alignment: Alignment.center,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: const Text('News App'
            ,style: TextStyle(color: Colors.white , fontSize: 24 ,fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
             onTap: (){
               onSideClickk(cattogry);
             },
              child: Row(
                children: const [
                  ImageIcon(AssetImage('assets/images/catogry.png')
                    ,size: 48,
                  )
                  ,Text('Catogories', style: TextStyle(
                    fontSize: 24 , fontWeight: FontWeight.bold
                    ,color: Color(0xFF303030),
                  ),)
                ],
              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                onSideClickk(setting);
              },
              child: Row(
                children: const [
                  ImageIcon(AssetImage('assets/images/settings.png')
                    ,size: 48,
                  )
                  ,Text('Settings', style: TextStyle(
                    fontSize: 24 , fontWeight: FontWeight.bold
                    ,color: Color(0xFF303030),
                  ),)
                ],
              ),
            ),

          )
        ],
      ),
    );
  }
}
