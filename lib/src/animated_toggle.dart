// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'dart:math';

import 'package:flutter/material.dart';

class _ToggleIndicator extends StatelessWidget {
  const _ToggleIndicator({
    required this.color,
    required this.child,
    required this.decoration,
    required this.onSwipe,
    this.padding,
    Key? key,
  }) : super(key: key);

  final Color color;
  final Widget child;
  final BoxDecoration decoration;
  final EdgeInsetsGeometry? padding;

  final void Function(bool swipeToRight) onSwipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails dragUpdateDetails) {
        if (dragUpdateDetails.delta.dx > 0) {
          onSwipe(true);
        } else {
          onSwipe(false);
        }
      },
      child: DecoratedBox(
        decoration: decoration.copyWith(color: color),
        child: Container(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

/// Switch toggle button with animation
class AnimatedToggle extends StatefulWidget {
  const AnimatedToggle({
    required this.onSwitch,
    required this.childLeft,
    required this.childRight,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.initialState = false,
    this.toggleColor = Colors.yellow,
    this.decoration,
    this.width = 320,
    this.duration = const Duration(milliseconds: 300),
    this.padding = const EdgeInsets.symmetric(vertical: 15),
    Key? key,
  }) : super(key: key);

  /// Called on switch, passes the current value
  final void Function(bool) onSwitch;

  /// Widget shown on the left side of the button
  final Widget childLeft;

  /// Widget shown on the right side of the button
  final Widget childRight;

  /// Initial state
  final bool initialState;

  /// Selected color
  final Color toggleColor;

  /// Duration of the animation
  final Duration duration;

  /// Button width
  final double width;

  /// Decoration of the button. The default decoration adds a dark shadow.
  final BoxDecoration? decoration;

  /// Button padding
  final EdgeInsetsGeometry padding;

  /// Alignment of the button
  final MainAxisAlignment mainAxisAlignment;

  @override
  State<AnimatedToggle> createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  bool pressed = false;
  late bool switchStatus = widget.initialState;

  late BoxDecoration _boxDecoration;

  @override
  void initState() {
    super.initState();

    // Constructor parameters have to be const which our default isn't
    // so we can't set it in the widget constructor
    // However we still want a default and
    // have the parameter be optional for outsiders
    // Thus, set the default here instead
    if (widget.decoration != null) {
      _boxDecoration = widget.decoration!;
    } else {
      _boxDecoration = BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black.withOpacity(0.5),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      );
    }
  }

  Future<void> _onInteract() async {
    if (!pressed) {
      setState(() {
        pressed = true;
      });
    } else {
      return;
    }

    // Make sure to switch status just before
    // the animation is done to prevent it from looking bad
    await Future.delayed(widget.duration - widget.duration * 0.3);
    if (mounted && pressed) {
      setState(() {
        pressed = false;
        switchStatus = !switchStatus;
      });
    }

    widget.onSwitch(switchStatus);
  }

  bool _canInteractOnSwipe(bool swipeToRight) {
    return (!switchStatus && swipeToRight) || (switchStatus && !swipeToRight);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: _onInteract,
              child: Container(
                width: widget.width,
                decoration: _boxDecoration,
                child: Row(
                  children: [
                    Container(
                      width: widget.width / 2,
                      padding: widget.padding,
                      child: widget.childLeft,
                    ),
                    Container(
                      width: widget.width / 2,
                      padding: widget.padding,
                      child: widget.childRight,
                    ),
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              duration: widget.duration,
              curve: Curves.easeInOutQuart,
              width: widget.width / 2,
              margin: switchStatus
                  ? EdgeInsets.only(
                      left: max(0, pressed ? 0 : widget.width / 2),
                    )
                  : EdgeInsets.only(
                      left: max(0, pressed ? widget.width / 2 : 0),
                    ),
              child: Row(
                children: [
                  SizedBox(
                    width: widget.width / 2,
                    child: _ToggleIndicator(
                      color: widget.toggleColor,
                      decoration: _boxDecoration,
                      padding: widget.padding,
                      child:
                          switchStatus ? widget.childRight : widget.childLeft,
                      onSwipe: (bool swipeToRight) {
                        if (_canInteractOnSwipe(swipeToRight)) {
                          _onInteract();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
