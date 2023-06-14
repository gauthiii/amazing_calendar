library amazing_calendar;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AmazingCalendar extends StatefulWidget {
  final TextStyle textStyle;
  const AmazingCalendar({
    super.key,
    this.textStyle = const TextStyle(
        fontFamily: "Poppins-Regular",
        fontWeight: FontWeight.bold,
        color: Colors.white),
  });

  @override
  Cstate createState() => Cstate();
}

class Cstate extends State<AmazingCalendar> {
  DateTime timestamp = DateTime.now();
  late String day;
  late String day1;
  late int dd;
  List weekd = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  List month = [
    "",
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  List ld = [31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  late int x;
  late int x1;
  late DateTime dx;

  @override
  void initState() {
    super.initState();

    ij();
  }

  change(DateTime v) {
    setState(() {
      dx = v;
    });
  }

  ij() {
    timestamp = DateTime.now();

    day = DateFormat('EEEE').format(timestamp);
    day1 =
        DateFormat('EEEE').format(DateTime(timestamp.year, timestamp.month, 1));
    dd = weekd.indexOf(day1);

    x = ld[timestamp.month];
    x1 = ld[timestamp.month - 1];

    dx = timestamp;
  }

  dtext(i, j) {
    if (x == 28 && timestamp.year % 4 == 0) x = 29;
    if (x1 == 28 && timestamp.year % 4 == 0) x1 = 29;

    if (calM) {
      return "${month[(j + 1) + (i * 3)]}";
    } else {
      if (((j + 1) + (i * 7) - dd) <= 0) {
        return "${x1 + (j + 1) + (i * 7) - dd}";
      } else if (((j + 1) + (i * 7) - dd) <= x) {
        return "${(j + 1) + (i * 7) - dd}";
      } else {
        return "${(j + 1) + (i * 7) - dd - x}";
      }
    }
  }

  dcolor(i, j) {
    if (calM) {
      return Colors.black;
    } else {
      if (((j + 1) + (i * 7) - dd) <= 0) {
        return Colors.grey[350];
      } else if (((j + 1) + (i * 7) - dd) <= x) {
        return Colors.black;
      } else {
        return Colors.grey[350];
      }
    }
  }

  int isTap = -100;
  DateTime tapDate = DateTime(0, 1, 1);
  bool calM = false;

  display(i, j) {
    if (calM) {
      return ((((j + 1) + (i * 3)) == timestamp.month &&
                  timestamp.year == DateTime.now().year &&
                  tapDate.year == 0) ||
              (((j + 1) + (i * 3)) == tapDate.month &&
                  tapDate.year == timestamp.year))
          ? Card(
              color: Colors.black,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              elevation: 0.0,
              child: Container(
                  height: 45,
                  width: 75,
                  padding: const EdgeInsets.all(2),
                  alignment: Alignment.center,
                  child: Text(
                    dtext(i, j),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins-Regular"),
                  )))
          : Card(
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              elevation: 0.0,
              child: Container(
                  height: 45,
                  width: 65,
                  padding: const EdgeInsets.all(2),
                  alignment: Alignment.center,
                  child: Text(
                    dtext(i, j),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: dcolor(i, j),
                        fontSize: 14,
                        fontWeight:
                            (((j + 1) + (i * 3)) == DateTime.now().month &&
                                    (dcolor(i, j) == Colors.black) &&
                                    DateTime.now().year == timestamp.year)
                                ? FontWeight.bold
                                : FontWeight.normal,
                        fontFamily: "Poppins-Regular"),
                  )));
    } else {
      return ((((j + 1) + (i * 7) - dd) == timestamp.day &&
                  timestamp.day == DateTime.now().day &&
                  timestamp.month == DateTime.now().month &&
                  timestamp.year == DateTime.now().year &&
                  tapDate != timestamp) ||
              (((j + 1) + (i * 7) - dd) == tapDate.day &&
                  tapDate.month == timestamp.month &&
                  tapDate.year == timestamp.year))
          ? Card(
              color: Colors.black,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              elevation: 0.0,
              child: Container(
                  height: 25,
                  width: 25,
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    dtext(i, j),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins-Regular"),
                  )))
          : Card(
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              elevation: 0.0,
              child: Container(
                  height: 25,
                  width: 25,
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    dtext(i, j),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: dcolor(i, j),
                        fontSize: 14,
                        fontWeight:
                            (((j + 1) + (i * 7) - dd) == DateTime.now().day &&
                                    (dcolor(i, j) == Colors.black) &&
                                    DateTime.now().month == timestamp.month &&
                                    DateTime.now().year == timestamp.year)
                                ? FontWeight.bold
                                : FontWeight.normal,
                        fontFamily: "Poppins-Regular"),
                  )));
    }
  }

  cha(int n, int o, int m) {
    timestamp = DateTime(
        timestamp.year + n, timestamp.month + o, (m == 0) ? timestamp.day : m);

    day = DateFormat('EEEE').format(timestamp);

    day1 =
        DateFormat('EEEE').format(DateTime(timestamp.year, timestamp.month, 1));

    dd = weekd.indexOf(day1);

    x = ld[timestamp.month];

    x1 = ld[timestamp.month - 1];
  }

  cal() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.only(top: 60, right: 15),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 261,
                    height: 296,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  calM ? cha(-1, 0, 0) : cha(0, -1, 0);
                                });
                              },
                              child: const Icon(Icons.chevron_left,
                                  color: Colors.grey, size: 30)),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  calM = !calM;
                                  cha(0, 0, 0);
                                });
                              },
                              child: Row(children: [
                                Text(
                                  (calM)
                                      ? "${timestamp.year}"
                                      : "${month[timestamp.month]} ${timestamp.year}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins-Regular"),
                                ),
                                (calM)
                                    ? const SizedBox(height: 0, width: 0)
                                    : const Icon(Icons.expand_more,
                                        color: Colors.grey, size: 20),
                              ])),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  calM ? cha(1, 0, 0) : cha(0, 1, 0);
                                });
                              },
                              child: const Icon(Icons.chevron_right,
                                  color: Colors.grey, size: 30))
                        ],
                      ),
                      Container(height: 5),
                      (calM)
                          ? Column(children: [
                              for (var i = 0; i < 4; i++)
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      for (var j = 0; j < 3; j++)
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                cha(
                                                    0,
                                                    ((j + 1) + (i * 3)) -
                                                        timestamp.month,
                                                    0);
                                                calM = !calM;
                                              });
                                            },
                                            child: display(i, j)),
                                    ]),
                            ])
                          : Column(children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (int z = 0; z < 7; z++)
                                      Card(
                                          color: Colors.white,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          elevation: 0.0,
                                          child: Container(
                                              height: 25,
                                              width: 25,
                                              padding: const EdgeInsets.all(1),
                                              child: Text(
                                                weekd[z].substring(0, 3),
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        "Poppins-Regular"),
                                              ))),
                                  ]),
                              for (var i = 0; i < 6; i++)
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      for (var j = 0; j < 7; j++)
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (((j + 1) + (i * 7) - dd) <=
                                                    0) {
                                                  isTap = x1 +
                                                      ((j + 1) + (i * 7) - dd);
                                                  cha(0, -1, isTap);
                                                } else if (((j + 1) +
                                                        (i * 7) -
                                                        dd) <=
                                                    x) {
                                                  isTap =
                                                      ((j + 1) + (i * 7) - dd);
                                                  cha(0, 0, isTap);
                                                } else {
                                                  isTap =
                                                      ((j + 1) + (i * 7) - dd) -
                                                          x;
                                                  cha(0, 1, isTap);
                                                }

                                                tapDate = timestamp;
                                              });

                                              change(timestamp);

                                              Navigator.pop(context);
                                            },
                                            child: display(i, j)),
                                    ]),
                            ]),
                    ]),
                  )),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cal,
      child: Text('${dx.day} ${month[dx.month]} ${dx.year}',
          style: widget.textStyle),
    );
  }
}
