///
/// see: https://www.rfc-editor.org/info/rfc6265/#section-5.1.1
/// see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#expiresdate
/// see: https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Date
///
library;

// this is a strict regex to extract the rfc6265 date format.
// If you edit this regexp, please isolate the separators (e.g
// spaces, commas) in their own part of the regexp.
final regexp = RegExp(
  r'^'
    r'('
      r'(?<weekday>Mon|Tue|Wed|Thu|Fri|Sat|Sun),'
      r' '
      r'(?<day>((0[0-9])|(1[0-9])|(2[0-9])|(3[0-1])))'
      r' '
      r'(?<month>Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)'
      r' '
      r'(?<year>\d{4})'
      r' '
      r'(?<hour>0[0-9]|[1-5][0-9]):'
      r'(?<minute>0[0-9]|[1-5][0-9]):'
      r'(?<second>0[0-9]|[1-5][0-9])'
      r' '
      r'(?<timezone>GMT)'
    r')'
  r'$',
  multiLine: false,
  caseSensitive: false,
  unicode: false,
  dotAll: false,
);

/// decode a rfc6265 date format into DateTime.
DateTime? decode(String string) {
  final ret = regexp.allMatches(string);
  switch (ret.toList()) {
    // Because the first match pattern is matching the
    // whole success case, it should only have one and 
    // only one element in the list.
    case [RegExpMatch match]:
      return _regexpToDateTime(match);

    // if it's not valid, null is return.
    default:
      return null;
  }
}

/// encode a DateTime object into a rfc6265 compatible date format.
String encode(DateTime datetime) {
  final weekday = _intToWeekDay(datetime.weekday);
  final year = datetime.year;
  final month = _intToMonth(datetime.month);
  final day = datetime.day.toString().padLeft(2, '0');
  final hour = datetime.hour.toString().padLeft(2, '0');
  final minute = datetime.minute.toString().padLeft(2, '0');
  final second = datetime.second.toString().padLeft(2, '0');
  final timezone = "GMT";
  return "$weekday, $day $month $year $hour:$minute:$second $timezone";
}

DateTime _regexpToDateTime(RegExpMatch match) {
  return DateTime(
    int.parse(match.namedGroup('year')!),
    _monthToInt(match.namedGroup('month')!),
    int.parse(match.namedGroup('day')!),
    int.parse(match.namedGroup('hour')!),
    int.parse(match.namedGroup('minute')!),
    int.parse(match.namedGroup('second')!),
  );
}

int _monthToInt(String string) {
  switch (string) {
    case "Jan": return 1;
    case "Feb": return 2;
    case "Mar": return 3;
    case "Apr": return 4;
    case "May": return 5;
    case "Jun": return 6;
    case "Jul": return 7;
    case "Aug": return 8;
    case "Sep": return 9;
    case "Oct": return 10;
    case "Nov": return 11;
    case "Dec": return 12;
    default: throw "invalid month";
  }
}

String _intToMonth(int month) {
  switch (month) {
    case 1: return "Jan";
    case 2: return "Feb";
    case 3: return "Mar";
    case 4: return "Apr";
    case 5: return "May";
    case 6: return "Jun";
    case 7: return "Jul";
    case 8: return "Aug";
    case 9: return "Sep";
    case 10: return "Oct";
    case 11: return "Nov";
    case 12: return "Dec";
    default: throw "invalid month";
  }
}

String _intToWeekDay(int weekDay) {
  switch(weekDay) {
    case 1: return "Mon";
    case 2: return "Tue";
    case 3: return "Wed";
    case 4: return "Thu";
    case 5: return "Fri";
    case 6: return "Sat";
    case 7: return "Sun";
    default: throw "invalid weekday";
  }
}

int weekDayToInt(String weekDay) {
  switch(weekDay) {
    case "Mon": return 1;
    case "Tue": return 2;
    case "Wed": return 3;
    case "Thu": return 4;
    case "Fri": return 5;
    case "Sat": return 6;
    case "Sun": return 7;
    default: throw "invalid weekday";
  }
}
