import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:rentals/neo_widget/nb_drawer.dart';
import '../../neo_widget/nb_container.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  static const routeName = '/test';
  @override
  TestViewState createState() => TestViewState();
}

String? sex = '';
double? test = 0;

class TestViewState extends State {
  @override
  void initState() {
    super.initState();
    _startIncrementing();
  }

  void _startIncrementing() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (test! >= 360) {
        test = 0;
      }
      test = test! + 1;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      backgroundColor: Colors.grey,
      body: Stack(
        alignment: Alignment.centerLeft,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: NeoDrawer(
                borderRadius: BorderRadius.circular(0),
                onDestinationSelected: (index) {
                  debugPrint(index.toString());
                },
                borderStyle: BorderStyle.solid,
                offset: const Offset(4, 4),
                children: List.generate(
                  5,
                  (index) => ListTile(
                    title: Text(
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        'Destination $index'),
                    onTap: () {
                      debugPrint('Destination $index');
                    },
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              NeuSearchBar(
                borderRadius: BorderRadius.circular(5),
                borderWidth: 2,
                shadowBlurRadius: 5,
                borderColor: Colors.black,
                searchBarColor: Colors.white,
                leadingIcon: const Icon(Icons.search),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: NeuTextButton(
                    borderRadius: BorderRadius.circular(5),
                    borderWidth: 2,
                    buttonWidth: 200,
                    buttonHeight: 75,
                    buttonColor: Colors.lightBlueAccent,
                    animationDuration: 200,
                    enableAnimation: true,
                    onPressed: () {},
                    text: const Text(textAlign: TextAlign.center, 'contest')),
              ),
              NeuContainer(
                  borderRadius: BorderRadius.circular(5),
                  borderWidth: 2,
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 200,
                  child: Column(
                    children: [
                      const Text(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                          'test'),
                      Divider(
                        color: Colors.black,
                        thickness: 2,
                        indent: MediaQuery.of(context).size.width * 0.01,
                        endIndent: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              NeuIconButton(
                                  borderRadius: BorderRadius.circular(5),
                                  borderWidth: 2,
                                  buttonWidth: 100,
                                  buttonHeight: 50,
                                  buttonColor: Colors.lightBlueAccent,
                                  animationDuration: 200,
                                  enableAnimation: true,
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    test ??= 0;
                                    test = 0;
                                    debugPrint(test.toString());
                                    setState(() {});
                                  }),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: [
                                  NeuIconButton(
                                      borderRadius: BorderRadius.circular(5),
                                      borderWidth: 2,
                                      buttonWidth: 100,
                                      buttonHeight: 50,
                                      buttonColor: Colors.lightBlueAccent,
                                      animationDuration: 200,
                                      enableAnimation: true,
                                      icon: const Icon(
                                          Icons.exposure_minus_1_sharp),
                                      onPressed: () {
                                        test ??= 0;
                                        test = test! + 45;
                                        debugPrint(test.toString());
                                        setState(() {});
                                      })
                                ]),
                              )
                            ]),
                      ),
                    ],
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NeoContainer(
                      height: 200,
                      width: 200,
                      rotation: test!.toDouble() * pi / 180,
                      child: Text(test.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20)),
                    )
                  ],
                ),
                const Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                    ),
                  ],
                ),
              ]),
              Container(),
            ],
          ),
        ],
      ),
    );
  }
}
