import 'package:flutter/material.dart';
import 'package:todo/data/notifier.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentScreen,
      builder: (context, value, child) {
        return NavigationBar(destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.person), label: "Account")
        ],
        selectedIndex: value,
        onDestinationSelected: (value) {
          currentScreen.value=value;
        },
        );
      }
    );
  }
}