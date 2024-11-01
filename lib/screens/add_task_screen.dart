import 'package:alarm_mix/components/addTask/calendar_picker.dart';
import 'package:alarm_mix/components/addTask/time_picker.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final NotchBottomBarController? controller;

  const AddTaskScreen({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 26),
      child: const Column(
        children: <Widget>[
          SizedBox(
            width: 200,
            height: 200,
            child: Card(
              elevation: 10,
              surfaceTintColor: Color(0xffe6e4fe),
              color: Color(0xffe6e4fe),
              shadowColor: Colors.black,
              child: Text("Add Task"),
            ),
          ),
          CalendarPicker(),
          TimePicker(),
        ],
      ),
    );
  }
}
