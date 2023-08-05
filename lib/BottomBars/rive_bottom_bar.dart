import 'package:bottombars/home/home_screen.dart';
import 'package:bottombars/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:bottombars/utils.dart';

class RiveBottomBar extends StatefulWidget {
  const RiveBottomBar({super.key});

  @override
  State<RiveBottomBar> createState() => _RiveBottomBarState();
}

class _RiveBottomBarState extends State<RiveBottomBar> {
  RiveAsset selectedbottomNav = bottomNavs.first;
  List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    // BellScreen(),
    // TimerScreen(),
    // UserScreen(),
    // ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: AnimatedSwitcher(
          duration: Duration(milliseconds: 1000),
          child: _pages[bottomNavs.indexOf(selectedbottomNav)]),
      bottomNavigationBar: SafeArea(
          child: Container(
        height: 65,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 24, right: 24, bottom: 10),
        decoration: BoxDecoration(
          color: Color(0xff49484d),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(
                  bottomNavs.length,
                  (index) => GestureDetector(
                        onTap: () {
                          bottomNavs[index].input!.change(true);

                          if (bottomNavs[index] != selectedbottomNav)
                            setState(() {
                              selectedbottomNav = bottomNavs[index];
                            });
                          Future.delayed(Duration(seconds: 1), () {
                            bottomNavs[index].input!.change(false);
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedBar(
                              isActive: bottomNavs[index] == selectedbottomNav,
                            ),
                            SizedBox(
                                height: 36,
                                width: 36,
                                child: Opacity(
                                  opacity:
                                      selectedbottomNav == bottomNavs[index]
                                          ? 1
                                          : 0.5,
                                  child: RiveAnimation.asset(
                                    bottomNavs.first.src,
                                    artboard: bottomNavs[index].artboard,
                                    onInit: (artboard) {
                                      StateMachineController controller =
                                          RiveUtils.getRiveController(artboard,
                                              stateMachineName:
                                                  bottomNavs[index]
                                                      .stateMachineName);
                                      bottomNavs[index].input = controller
                                          .findSMI('active') as SMIBool;
                                    },
                                  ),
                                )),
                          ],
                        ),
                      )),
            ],
          ),
        ),
      )),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 2),
        height: 4,
        width: isActive ? 20 : 0,
        decoration: const BoxDecoration(
          color: Color(0xff81B4FF),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ));
  }
}

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(
    this.src, {
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input,
  });
  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset('assets/icons/rive-icons.riv',
      artboard: "HOME", stateMachineName: "HOME_interactivity", title: "Home"),
  RiveAsset('assets/icons/rive-icons.riv',
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  RiveAsset('assets/icons/rive-icons.riv',
      artboard: "BELL", stateMachineName: "BELL_Interactivity", title: "Bell"),
  RiveAsset('assets/icons/rive-icons.riv',
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "Timer"),
  RiveAsset('assets/icons/rive-icons.riv',
      artboard: "USER", stateMachineName: "USER_Interactivity", title: "User"),
  RiveAsset('assets/icons/rive-icons.riv',
      artboard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Chat"),
  RiveAsset('assets/icons/rive-icons.riv',
      artboard: "SETTINGS",
      stateMachineName: "SETTINGS_Interactivity",
      title: "Settings"),
  RiveAsset('assets/icons/rive-icons.riv',
      artboard: "AUDIO",
      stateMachineName: "AUDIO_Interactivity",
      title: "Audio"),
];
