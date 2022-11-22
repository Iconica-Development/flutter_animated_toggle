// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

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
  bool valueFireStarter = false;
  bool valueGrassStarter = false;
  bool valueWaterStarter = false;

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: AnimatedToggle(
              duration: const Duration(milliseconds: 100),
              toggleColor: Colors.red,
              onSwitch: (value) {
                setState(() {
                  valueFireStarter = value;
                });
              },
              childLeft: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 10),
                    child: Icon(
                      Icons.catching_pokemon,
                      color: valueFireStarter ? Colors.red : Colors.white,
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
                      color: valueFireStarter ? Colors.white : Colors.red,
                    ),
                  ),
                  const Text(
                    'Infernape',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: AnimatedToggle(
              duration: const Duration(milliseconds: 100),
              toggleColor: Colors.green,
              onSwitch: (value) {
                setState(() {
                  valueGrassStarter = value;
                });
              },
              childLeft: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 10),
                    child: Icon(
                      Icons.catching_pokemon,
                      color: valueGrassStarter ? Colors.green : Colors.white,
                    ),
                  ),
                  const Text(
                    'Venusaur',
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
                      color: valueGrassStarter ? Colors.white : Colors.green,
                    ),
                  ),
                  const Text(
                    'Torterra',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: AnimatedToggle(
              duration: const Duration(milliseconds: 100),
              toggleColor: Colors.blue,
              onSwitch: (value) {
                setState(() {
                  valueWaterStarter = value;
                });
              },
              childLeft: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 10),
                    child: Icon(
                      Icons.catching_pokemon,
                      color: valueWaterStarter ? Colors.blue : Colors.white,
                    ),
                  ),
                  const Text(
                    'Blastoise',
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
                      color: valueWaterStarter ? Colors.white : Colors.blue,
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
        ],
      ),
    );
  }
}
