import 'package:flutter/material.dart';
import 'package:round_timer/screens/timer_screen.dart';
import 'package:round_timer/widgets/round_timer_icons.dart';
import 'package:round_timer/widgets/text20b.dart';

import '../functions/formating.dart';
import '../widgets/underlined_row.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int roundLength = 180;
  int rest = 60;
  int prepearing = 10;
  int rounds = 12;
  int trainingLength = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Round timer'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              UnderlinedRow(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text20b(durationFormat(Duration(seconds: roundLength))
                          .toString()),
                      const Text('Round length')
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              roundLength += 30;
                            });
                          },
                          icon: const Icon(RoundTimer.plus)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (roundLength > 30) {
                                roundLength -= 30;
                              }
                            });
                          },
                          icon: const Icon(RoundTimer.minus))
                    ],
                  )
                ],
              ),
              UnderlinedRow(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text20b(
                          durationFormat(Duration(seconds: rest)).toString()),
                      const Text('Rest')
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              rest += 10;
                            });
                          },
                          icon: const Icon(RoundTimer.plus)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (rest > 10) {
                                rest -= 10;
                              }
                            });
                          },
                          icon: const Icon(RoundTimer.minus))
                    ],
                  )
                ],
              ),
              UnderlinedRow(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text20b(durationFormat(Duration(seconds: prepearing))
                          .toString()),
                      const Text('Prepearing')
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              prepearing += 5;
                            });
                          },
                          icon: const Icon(RoundTimer.plus)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (prepearing >= 5) {
                                prepearing -= 5;
                              }
                            });
                          },
                          icon: const Icon(RoundTimer.minus))
                    ],
                  )
                ],
              ),
              UnderlinedRow(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text20b(rounds.toString()),
                      const Text('Rounds')
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              rounds += 1;
                            });
                          },
                          icon: const Icon(RoundTimer.plus)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (rounds > 1) {
                                rounds -= 1;
                              }
                            });
                          },
                          icon: const Icon(RoundTimer.minus))
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 330,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Training length'),
                      SizedBox(
                        width: 95,
                        child: Center(
                          child: Text(
                            durationFormat(Duration(
                                    seconds: (trainingLength =
                                        rounds * (roundLength + rest))))
                                .toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    backgroundColor: const Color(0xFF747EA3),
                    fixedSize: const Size(145, 60)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TimerScreen(
                              prepearing: prepearing,
                              rest: rest,
                              roundLength: roundLength,
                              rounds: rounds,
                            )),
                  );
                },
                child: const Text(
                  'Start',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ]),
      ),
    );
  }
}
