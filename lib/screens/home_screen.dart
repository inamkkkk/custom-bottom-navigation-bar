import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:custom_bottom_nav/models/app_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Bottom Nav'),
      ),
      body: Center(
        child: Text('Current Index: ${context.watch<AppState>().currentIndex}'),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final currentIndex = appState.currentIndex;

    return Container(
      height: 70,
      decoration:
       const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10.0)]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, 0, Icons.home, currentIndex),
          _buildNavItem(context, 1, Icons.search, currentIndex),
          _buildNavItem(context, 2, Icons.add, currentIndex),
          _buildNavItem(context, 3, Icons.person, currentIndex),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, IconData icon, int currentIndex) {
    final isSelected = currentIndex == index;
    final color = isSelected ? Colors.blue : Colors.grey;
    final appState = Provider.of<AppState>(context, listen: false);

    return InkWell(
      onTap: () {
        appState.updateIndex(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  _getLabel(index),
                  style: TextStyle(color: color),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Search';
      case 2:
        return 'Add';
      case 3:
        return 'Profile';
      default:
        return '';
    }
  }
}
