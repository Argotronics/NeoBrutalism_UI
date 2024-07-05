import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:rentals/neo_widget/nb_drawer.dart';
import '../../neo_widget/nb_container.dart';
import '../../neo_widget/nb_clippers.dart';

class TestView extends StatefulWidget {
  TestView({super.key});

  static const routeName = '/test';
  @override
  _TestViewState createState() => _TestViewState();
}

String? sex = '';
double? test = 0;

class _TestViewState extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      backgroundColor: Colors.grey,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 500,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: const NBDrawer(
                  children: [
                    Text(
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        'test'),
                    Text('test'),
                    Text('test'),
                    Text('test')
                  ],
                  boxShape: BoxShape.rectangle,
                  borderStyle: BorderStyle.solid,
                  offset: const Offset(4, 4)),
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
                    onPressed: () {
                      sex = 'True he is';
                    },
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
                                  onPressed: () {}),
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
                                        test = test! + 1;
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
                      borderRadius: BorderRadius.circular(10),
                      height: 150,
                      width: 150,
                      rotation: test!.toDouble(),
                      child: Text(test.toString()),
                    )
                  ],
                ),
                Column(
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
