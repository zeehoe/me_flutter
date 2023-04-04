import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import './../services/QuoteOfDay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Quote extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  Map<String, String> quoteOfDay = {};
  bool isLoading = false;

  late QuoteOfDay quote = QuoteOfDay();
  final spinkit = SpinKitWanderingCubes(
    color: Colors.blue[800],
    size: 50.0,
  );

  void getNewQuote() async {
    setState(() {
      isLoading = true;
    });

    Map<String, String> quoteResult = await quote.getOne();
    setState(() {
      isLoading = false;
      quoteOfDay = quoteResult;
    });
  }

  @override
  void initState() {
    super.initState();
    getNewQuote();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote!'),
        backgroundColor: Colors.blue[600],
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.power),
                        Text(
                          "Quote of the Day",
                          style: TextStyle(
                              color: Colors.orangeAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 90),
                        Icon(Icons.power),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: Colors.blueAccent,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
                              child: Stack(children: <Widget>[
                                Column(
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          style: TextStyle(color: Colors.white),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: "${quoteOfDay['quote']}",
                                                style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    )
                                  ],
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Text(
                                    "${quoteOfDay['initiator']}",
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.end,
                                  ),
                                )
                              ]),
                            ),
                          )),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                        color: Colors.blue,
                        onPressed: () {
                          getNewQuote();
                        },
                        iconSize: 64,
                        icon: const Icon(Icons.refresh)),
                  ]),
            ),
            isLoading
                ? Positioned.fill(
                    child: Container(
                        color: Colors.white.withOpacity(0.5),
                        child: Center(
                          child: spinkit,
                        )),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
