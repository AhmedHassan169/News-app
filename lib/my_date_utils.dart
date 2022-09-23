//  هعمل كلاس عشان اسستقبل التاريخ من الداتا بيز واعرضو بطريقه معينه عن طريق date format

import 'package:intl/intl.dart';

class MyDateUtils {
  static String formatNewsDate(String inputDateString) {
    // هستدعى dateFormate واحطها ف اوبجكت عشان استخدمها واكتب جوها شكل التاريخ اللى جايلى
    var inputDateFormater = DateFormat('yyyy-MM-ddThh:mm:ssZ');
    // هستدعى dateFormate واحطها ف اوبجك عشان اكتب جوها شكل التاريخ اللى عايز اعرضو
    var outputDateFormater = DateFormat('yyyy/MMM/dd hh:mm a');
    var inputDate = inputDateFormater.parse(inputDateString);
    var outputDateString = outputDateFormater.format(inputDate);
    return outputDateString;
  }
}
