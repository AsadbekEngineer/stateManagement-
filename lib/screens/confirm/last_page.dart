import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class LastPage extends StatefulWidget {
  const LastPage({super.key});

  @override
  State<LastPage> createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  int sliding = 0;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 0),
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 25),
                        children: [
                          TextSpan(
                            text: "Welcome, ",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          TextSpan(
                              text: "Mangcoding",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(11), // Border thickness
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      child: Icon(
                        Icons.notification_add,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Let's schedule your activities",
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
              ],
            ),
          ),
          //! Expamded
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Schedule",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.abc,
                        size: 35,
                      ),
                    ],
                  ),
                  Text(
                    "Let's schedule your activities",
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //! Calendar
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TableCalendar(
                      calendarFormat: _calendarFormat,
                      availableCalendarFormats: const {
                        CalendarFormat.week: "Week"
                      },
                      firstDay: DateTime.utc(2010, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                      calendarStyle: CalendarStyle(
                        isTodayHighlighted: false,
                        selectedDecoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        weekendTextStyle: TextStyle(color: Colors.red),
                        defaultTextStyle: TextStyle(color: Colors.black),
                        selectedTextStyle: TextStyle(color: Colors.white),
                        outsideDaysVisible: false, // Hide outside month days
                      ),
                      headerStyle: HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                        titleTextStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        leftChevronIcon: Icon(Icons.arrow_back_ios,
                            color: Colors.black, size: 16),
                        rightChevronIcon: Icon(Icons.arrow_forward_ios,
                            color: Colors.black, size: 16),
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekendStyle: TextStyle(color: Colors.red),
                        weekdayStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Divider(),
                  //! SEGMENTED Control
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: CupertinoSlidingSegmentedControl(
                      thumbColor: Colors.blue,
                      children: {
                        0: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "All",
                            style: TextStyle(
                                fontSize: 19,
                                color:
                                    sliding == 0 ? Colors.white : Colors.black),
                          ),
                        ),
                        1: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "New",
                            style: TextStyle(
                                fontSize: 19,
                                color:
                                    sliding == 1 ? Colors.white : Colors.black),
                          ),
                        ),
                      },
                      groupValue: sliding,
                      onValueChanged: (value) {
                        setState(() {
                          sliding = value!.toInt();
                        });
                      },
                    ),
                  ),
                  //! Notification Container
                  Expanded(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: sliding == 1
                            ? Column(
                                children: [
                                  NotificationContainer(
                                    id: 'new',
                                    yangi: true,
                                    urgency: 'Urgent',
                                  ),
                                  NotificationContainer(
                                    id: 'new',
                                    yangi: true,
                                    urgency: 'Urgent',
                                  ),
                                  NotificationContainer(
                                    id: 'new',
                                    yangi: true,
                                    urgency: 'Urgent',
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  NotificationContainer(
                                    id: 'old',
                                    yangi: false,
                                    urgency: 'Not urgent',
                                  ),
                                  NotificationContainer(
                                    id: 'old',
                                    yangi: false,
                                    urgency: 'Not urgent',
                                  ),
                                  NotificationContainer(
                                    id: 'old',
                                    yangi: false,
                                    urgency: 'Not urgent',
                                  ),
                                ],
                              )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationContainer extends StatelessWidget {
  bool yangi;
  String id;
  String urgency;
  NotificationContainer(
      {required this.id, required this.yangi, required this.urgency});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      height: 100,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Sun, 20/1/2023"),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(CupertinoIcons.clock, color: Colors.blue),
                  SizedBox(
                    width: 10,
                  ),
                  Text("10.00 AM - 01.00 PM"),
                ],
              ),
              Icon(Icons.settings),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Development of software for the protection of information sources",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.photo),
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.red.shade100),
                child: Center(
                  child: Text(
                    urgency,
                    style: TextStyle(fontSize: 13, color: Colors.red.shade300),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
