import 'dart:developer';

import 'package:alarm_mix/screens/achievements_screen.dart';
import 'package:alarm_mix/screens/add_task_screen.dart';
import 'package:alarm_mix/screens/calendar_screen.dart';
import 'package:alarm_mix/screens/setting_screen.dart';
import 'package:alarm_mix/screens/upcoming_screen.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomTabNav extends StatefulWidget {
  const BottomTabNav({super.key});

  @override
  State<BottomTabNav> createState() => _BottomTabNavState();
}

class _BottomTabNavState extends State<BottomTabNav> {
  final _pageController = PageController(initialPage: 2);

  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 2);

  int maxCount = 6;
  int _currentIndex = 2;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      int newIndex = _pageController.page!.round();
      if (newIndex != _currentIndex) {
        setState(() {
          _currentIndex = newIndex;
          _controller.index = newIndex;
          _pageController.jumpToPage(_currentIndex);
          log('$_currentIndex');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      const AchievementsScreen(),
      const CalendarScreen(),
      AddTaskScreen(
        controller: (_controller),
      ),
      const UpcomingScreen(),
      const SettingScreen(),
    ];
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const PageScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
          (index) => bottomBarPages[index],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              color: const Color.fromARGB(240, 80, 75, 75),
              textOverflow: TextOverflow.visible,
              maxLine: 1,
              shadowElevation: 5,
              kBottomRadius: 15.0,
              notchShader: const SweepGradient(
                startAngle: 0,
                endAngle: 3.14 / 2,
                colors: [Colors.black, Colors.grey, Colors.white],
                tileMode: TileMode.mirror,
              ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
              notchColor: Colors.black,
              removeMargins: false,
              bottomBarWidth: 500,
              showShadow: false,
              durationInMilliSeconds: 300,
              itemLabelStyle: const TextStyle(fontSize: 10),
              elevation: 1,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.check_circle_outline,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                  ),
                  // itemLabel: 'Page 1',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.calendar_month_sharp,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.calendar_month_sharp,
                    color: Colors.white,
                  ),
                  // itemLabel: 'Page 2',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.add,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  // itemLabel: 'Page 4',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.white,
                  ),
                  // itemLabel: 'Page 5',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.settings,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  // itemLabel: 'Page 3',
                ),
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }
}
