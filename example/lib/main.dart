import 'package:animated_toggle/animated_toggle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: AnimatedToggleDemo()));
}

class AnimatedToggleDemo extends StatefulWidget {
  const AnimatedToggleDemo({Key? key}) : super(key: key);

  @override
  State<AnimatedToggleDemo> createState() => _AnimatedToggleDemoState();
}

class _AnimatedToggleDemoState extends State<AnimatedToggleDemo> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3f7bbe),
        title: const Text(
          'Choose Pokémon',
          style: TextStyle(
            color: Color(0xffffd300),
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: AnimatedToggle(
          duration: const Duration(milliseconds: 100),
          toggleColor: Colors.red,
          onSwitch: (value) {
            setState(() {
              this.value = value;
            });
          },
          childLeft: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 10),
                child: Icon(
                  Icons.catching_pokemon,
                  color: value ? Colors.red : Colors.white,
                ),
              ),
              const Text(
                'Charizard',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          childRight: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 10),
                child: Icon(
                  Icons.catching_pokemon,
                  color: value ? Colors.white : Colors.red,
                ),
              ),
              const Text(
                'Empoleon',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
