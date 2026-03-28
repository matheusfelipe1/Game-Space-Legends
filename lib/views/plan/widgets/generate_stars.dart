import 'dart:math';

import 'package:flutter/material.dart';

import 'package:space_legends/shared/middleware/constants.dart';
import 'package:space_legends/views/plan/widgets/stars.dart';

class GenerateSTARS extends StatefulWidget {
  final List<Offset> offsets;
  const GenerateSTARS({Key? key, required this.offsets}) : super(key: key);

  @override
  State<GenerateSTARS> createState() => _GenerateSTARSState();
}

class _GenerateSTARSState extends State<GenerateSTARS> {
  List<Offset> offsets = [];
  List<Offset> offsetsAnimations = [];
  @override
  void initState() {
    super.initState();
    generatePositionStars();
  }

  @override
  Widget build(BuildContext context) {
    return widget.offsets.isNotEmpty &&
            (offsets.isNotEmpty || offsetsAnimations.isNotEmpty)
        ? Stack(
            key: UniqueKey(),
            children: List.generate(
                200,
                (index) => StarsComponent(
                      x: offsets[index].dx,
                      y: offsets[index].dy,
                      index: index,
                    )),
            alignment: Alignment.center,
          )
        : const SizedBox();
  }

  double get next => Random().nextInt(700).toDouble();

  generatePositionStars() {
    List<Offset> offsets = [];
    for (var i = 0; i < 200; i++) {
      if (i == 0) {
        Offset off = Offset.zero;
        offsets.add(off);
      } else {
        Offset off = Offset(next, next);
        bool valid = false;
        for (var item in offsets) {
          valid = calculateCoordinates(item.dx, item.dy, off.dx, off.dy);
          while (!valid) {
            off = Offset(next, next);
            valid = calculateCoordinates(item.dx, item.dy, off.dx, off.dy);
          }
        }
        if (valid) {
          offsets.add(off);
        }
      }
    }
    this.offsets = offsets;
    animationOffsets();
  }

  calculateCoordinates(double startX, double startY, double endX, double endY) {
    final distance = (Offset(startX, startY) - Offset(endX, endY)).distance;
    return distance > Constants.neighborhood;
  }

  animationOffsets() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.offsets.isNotEmpty) {
        List<Offset> offsetsAnimations = [];
        for (var item in offsets) {
          double maxDistance = -1.0;
          Offset bestMatch = Offset.zero;
          
          for (var data in widget.offsets) {
            final distance = (item - data).distance;
            if (distance > maxDistance) {
              maxDistance = distance;
              bestMatch = data;
            }
          }
          offsetsAnimations.add(bestMatch);
        }
        this.offsetsAnimations = offsetsAnimations;
      }
    });
  }
}
