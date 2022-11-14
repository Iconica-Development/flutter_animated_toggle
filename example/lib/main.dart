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
  bool _valueFireStarter = false;
  bool _valueGrassStarter = false;
  bool _valueWaterStarter = false;
  bool _dayNight = true;
  bool _switch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _dayNight ? Colors.white : Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xff3f7bbe),
        title: const Text(
          'Animated Toggle',
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
                  _valueFireStarter = value;
                });
              },
              childLeft: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 10),
                    child: Icon(
                      Icons.catching_pokemon,
                      color: _valueFireStarter ? Colors.red : Colors.white,
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
                      color: _valueFireStarter ? Colors.white : Colors.red,
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
                  _valueGrassStarter = value;
                });
              },
              childLeft: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 10),
                    child: Icon(
                      Icons.catching_pokemon,
                      color: _valueGrassStarter ? Colors.green : Colors.white,
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
                      color: _valueGrassStarter ? Colors.white : Colors.green,
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
                  _valueWaterStarter = value;
                });
              },
              childLeft: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 10),
                    child: Icon(
                      Icons.catching_pokemon,
                      color: _valueWaterStarter ? Colors.blue : Colors.white,
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
                      color: _valueWaterStarter ? Colors.white : Colors.blue,
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
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: AnimatedToggle(
              initialState: _dayNight,
              width: 100,
              decoration: const BoxDecoration(color: Colors.white),
              childLeft: const Icon(Icons.dark_mode),
              childRight: const Icon(Icons.light_mode),
              onSwitch: (value) {
                setState(() {
                  _dayNight = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 125,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 12, 227, 213),
                        Color.fromARGB(255, 1, 135, 244),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      _switch ? 'Off' : 'On',
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Arial',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                AnimatedToggle(
                  initialState: _switch,
                  toggleColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: 150,
                  onSwitch: (value) {
                    setState(() {
                      _switch = value;
                    });
                  },
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  childLeft: const Text(''),
                  childRight: const Text(''),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
