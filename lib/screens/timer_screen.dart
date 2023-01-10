import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:round_timer/widgets/round_timer_icons.dart';
import '../functions/formating.dart';
import 'package:audioplayers/audioplayers.dart';

class TimerScreen extends StatefulWidget {
  final int roundLength;
  final int rest;
  final int prepearing;
  final int rounds;
  const TimerScreen(
      {super.key,
      required this.roundLength,
      required this.prepearing,
      required this.rest,
      required this.rounds});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int curentRound = 1;
  String timerStage = "prepearing";
  String timerState = "not started";
  Timer? countdownTimer;
  int? curentTime;
  void startTimer(int time) {
    setState(() {
      curentTime = time;
      timerState = "started";
    });
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() {
      timerState = "stoped";
      countdownTimer!.cancel();
    });
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = curentTime! - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        curentTime = seconds;
      }
    });
  }

  //RIVE
  // Controller for playback
  late RiveAnimationController _controller;

  // Toggles between play and pause animation states
  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;
  SMITrigger? _prepearingEndTriger;
  SMITrigger? _boxingEndTriger;
  SMITrigger? _restEndTriger;
  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation("boxing");
  }

  @override
  Widget build(BuildContext context) {
    if (timerState == "not started") {
      setState(() {
        if (timerStage == "prepearing" && widget.prepearing == 0) {
          timerStage = "boxing";
        }
        if (timerStage == "prepearing") {
          curentTime = widget.prepearing;
        } else if (timerStage == "boxing") {
          curentTime = widget.roundLength;
        } else if (timerStage == "rest") {
          curentTime = widget.rest;
        }
      });

      startTimer(curentTime!);
    }
    if (curentTime == 0 && curentRound < widget.rounds) {
      if (timerStage == "prepearing") {
        timerStage = "boxing";
      } else if (timerStage == "boxing") {
        timerStage = "rest";
      } else if (timerStage == "rest") {
        curentRound += 1;
        timerStage = "boxing";
      }
      timerState = "not started";
      setState(() {
        _controller = SimpleAnimation(timerStage);
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            stopTimer();
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 270,
                child: Column(children: [
                  const SizedBox(
                    height: 170,
                    width: 170,
                    child: RiveAnimation.asset(
                      'assets/animations/rt_boxing.riv',
                    ),
                  ),
                  Text(
                    durationFormat(Duration(seconds: curentTime!)),
                    style: const TextStyle(
                        fontSize: 80, fontWeight: FontWeight.w700),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 3,
                    color: Color(0xFFF4F4F4),
                  ),
                  Text(
                    "$curentRound/${widget.rounds}",
                    style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFA5A5A5)),
                  )
                ]),
              ),
              IconButton(
                  iconSize: 120,
                  tooltip: isPlaying ? 'Pause' : 'Play',
                  onPressed: () {
                    _togglePlay();
                    if (timerState == "stoped") {
                      startTimer(curentTime!);
                    } else {
                      stopTimer();
                    }
                  },
                  icon: Icon(
                    timerState == "stoped"
                        ? RoundTimer.start
                        : RoundTimer.pause,
                    color: timerStage == "boxing"
                        ? Color(0xFFA37495)
                        : timerStage == "rest"
                            ? Color(0xFF74A39D)
                            : Color(0xFF747EA3),
                    size: 120,
                  ))
            ]),
      ),
    );
  }
}
