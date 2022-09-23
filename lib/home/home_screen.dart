import 'package:flutter/material.dart';
import 'package:news_app/home/Side_menu.dart';
import 'package:news_app/home/categories/catogory.dart';
import 'package:news_app/home/news/news_fragment.dart';
import 'package:news_app/home/settings/settings.dart';

class Home_Screen extends StatefulWidget {
  static const String Routname = 'homeScreen';

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/back_ground.png'),
          )),
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(35 )
              )
          ),
          centerTitle: true,
          title: const Text('news app'),
        ),
        // هعمل side Menu
        drawer: Drawer(
          child: SideMenu(onSideMueneClick),
        ),
        backgroundColor: Colors.transparent,

        body: currentWidgt,
      ),
    );
  }

  @override
  // initState بتتنفذ مره واحده بس وبتتعمل قبل build
  void initState() {
    super.initState();
    currentWidgt = CatogoryFragment(onCatogryClick);
  }

  void onCatogryClick(Catogory catogory) {
    currentWidgt = NewsFragment(catogory);
    setState(() {});
  }

  late Widget currentWidgt;
  // هعمل فانكشن عشان اما ادوس على حاجه من sidemenu يقوم مغير فى homesreen
  void onSideMueneClick(int type) {
    if (type == SideMenu.cattogry) {
      // لو دوست على category اعرضلى Category Fragment
      currentWidgt = CatogoryFragment(onCatogryClick);
    } else if (type == SideMenu.setting) {
      // لو دوست على cattogry اعرضلى SettingFragment
      currentWidgt = SettingFragment();
    }
    setState(() {});
    // اقفل sideMune
    Navigator.pop(context);
  }
}
