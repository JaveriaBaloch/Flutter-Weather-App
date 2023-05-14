import 'package:intl/intl.dart';

class Utils{
  static String appId= '514d4d86c401d36a27e0f1172c573e0e';
  static String getFormattedDate(DateTime dateTime){
    return new DateFormat("EEEE, MMM, d, y").format(dateTime);
  }
  static String getDay(DateTime dateTime){
    return new DateFormat("EEEE").format(dateTime);
  }
}