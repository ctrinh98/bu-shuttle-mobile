import 'package:flutter/material.dart';
import 'package:simple_moment/simple_moment.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:http/http.dart' as http;
import 'globals.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:ui' as ui;

void main() => runApp(new ShuttleApp());

class ShuttleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "BU Shuttle",
      theme: new ThemeData(brightness: Brightness.dark, fontFamily: 'Avenir'),
      home: new HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class ArrivalEstimates {
  final String routeId;
  final String arrivalAt;
  final String stopId;
  ArrivalEstimates(this.routeId, this.arrivalAt, this.stopId);
}

class Stops {
  final String stopId;
  final String translocStopId;
  final String stopName;
  final String stopDesc;
  final String stopLat;
  final String stopLon;
  final String directionId;
//  final List<String> times;
  Stops(this.stopId, this.translocStopId, this.stopName, this.stopDesc, this.stopLat, this.stopLon, this.directionId, );
}

class ShortLocaleEn extends LocaleEn {
  String get seconds => 'ARR';

  String get aMinute => '1m';
  String get minutes => '%im';

  String get anHour => '1h';
  String get hours => '%ih';

  String get aDay => '%id';
  String get days => '%id';

  IdentifierPosition get futurePosition => IdentifierPosition.dontDisplay;
}

class HomeState extends State<HomeScreen> {
  bool _isLoading = true;
  var moment;
  var arrivalsList = new List<ArrivalEstimates>();

  _fetchData() async {
    final busUrl = "http://www-devl.bu.edu/nisdev/php5/bu-mobile-backend-demo/bu-mobile-backend/rpc/bus/livebus.json.php";
    print("Fetching: " + busUrl);
    final busResponse = await http.get(busUrl);
    final busesJson = json.decode(busResponse.body);
    if (busesJson["service_id"] == null) {
      print("service_false");
    } else {
      final newArrivalsList = new List<ArrivalEstimates>();
      busesJson["ResultSet"]["Result"].forEach((busJson) {
        if (busJson["arrival_estimates"] != null) {
          busJson["arrival_estimates"].forEach((arrivalJson) {
            final arrivalEstimate = new ArrivalEstimates(
                arrivalJson["route_id"], arrivalJson["arrival_at"],
                arrivalJson["stop_id"]
            );
            newArrivalsList.add(arrivalEstimate);
          });
        }
      });

      final newEstimateMatchesM1 = new List<String>();
      newArrivalsList.forEach((arrival) {
        if (arrival.stopId == '4160714') {
          newEstimateMatchesM1.add(arrival.arrivalAt);
        }
      });
//      print(estimateMatchesM1);
      newEstimateMatchesM1.sort();
      print(newEstimateMatchesM1);

      final newEstimateMatchesM2 = new List<String>();
      newArrivalsList.forEach((arrival) {
        if (arrival.stopId == '4114006') {
          newEstimateMatchesM2.add(arrival.arrivalAt);
        }
      });
      newEstimateMatchesM2.sort();
      print(newEstimateMatchesM2);

      final newEstimateMatchesM3 = new List<String>();
      newArrivalsList.forEach((arrival) {
        if (arrival.stopId == '4149154') {
          newEstimateMatchesM3.add(arrival.arrivalAt);
        }
      });
      newEstimateMatchesM3.sort();
      print(newEstimateMatchesM3);

      final newEstimateMatchesM4 = new List<String>();
      newArrivalsList.forEach((arrival) {
        if (arrival.stopId == '4068466') {
          newEstimateMatchesM4.add(arrival.arrivalAt);
        }
      });
      newEstimateMatchesM4.sort();
      print(newEstimateMatchesM4);

      final newEstimateMatchesM5 = new List<String>();
      newArrivalsList.forEach((arrival) {
        if (arrival.stopId == '4068470') {
          newEstimateMatchesM5.add(arrival.arrivalAt);
        }
      });
      newEstimateMatchesM5.sort();
      print(newEstimateMatchesM5);

      final newEstimateMatchesM6 = new List<String>();
      newArrivalsList.forEach((arrival) {
        if (arrival.stopId == '4110206') {
          newEstimateMatchesM6.add(arrival.arrivalAt);
        }
      });
      newEstimateMatchesM6.sort();
      print(newEstimateMatchesM6);

      final newEstimateMatchesM7 = new List<String>();
      newArrivalsList.forEach((arrival) {
        if (arrival.stopId == '4068482') {
          newEstimateMatchesM7.add(arrival.arrivalAt);
        }
      });
      newEstimateMatchesM7.sort();
      print(newEstimateMatchesM7);

      final newEstimateMatchesC1 = new List<String>();
      newArrivalsList.forEach((arrival) {
        if (arrival.stopId == '4068482') {
          newEstimateMatchesC1.add(arrival.arrivalAt);
        }
      });
      newEstimateMatchesC1.sort();
      print(newEstimateMatchesC1);

      final newEstimateMatchesC2 = new List<String>();
      newArrivalsList.forEach((arrival) {
        if (arrival.stopId == '4160718') {
          newEstimateMatchesC2.add(arrival.arrivalAt);
        }
      });
      newEstimateMatchesC2.sort();
      print(newEstimateMatchesC2);

      final newEstimateMatchesC3 = new List<String>();
      newArrivalsList.forEach((arrival) {
        if (arrival.stopId == '4160722') {
          newEstimateMatchesC3.add(arrival.arrivalAt);
        }
      });
      newEstimateMatchesC3.sort();
      print(newEstimateMatchesC3);

      final newEstimateMatchesC4 = new List<String>();
      newArrivalsList.forEach((arrival) {
        if (arrival.stopId == '4160726') {
          newEstimateMatchesC4.add(arrival.arrivalAt);
        }
      });
      newEstimateMatchesC4.sort();
      print(newEstimateMatchesC4);

      final newEstimateMatchesC5 = new List<String>();
      newArrivalsList.forEach((arrival) {
        if (arrival.stopId == '4160730') {
          newEstimateMatchesC5.add(arrival.arrivalAt);
        }
      });
      newEstimateMatchesC5.sort();
      print(newEstimateMatchesC5);

      final newEstimateMatchesC6 = new List<String>();
      newArrivalsList.forEach((arrival) {
        if (arrival.stopId == '4160734') {
          newEstimateMatchesC6.add(arrival.arrivalAt);
        }
      });
      newEstimateMatchesC6.sort();
      print(newEstimateMatchesC6);

      final newEstimateMatchesC7 = new List<String>();
      newArrivalsList.forEach((arrival) {
        if (arrival.stopId == '4160738') {
          newEstimateMatchesC7.add(arrival.arrivalAt);
        }
      });
      newEstimateMatchesC7.sort();
      print(newEstimateMatchesC7);


      var newMoment = new Moment.now().locale(new ShortLocaleEn());
      setState(() {
        arrivalsList = newArrivalsList;
        estimateMatchesM1 = newEstimateMatchesM1;
        estimateMatchesM2 = newEstimateMatchesM2;
        estimateMatchesM3 = newEstimateMatchesM3;
        estimateMatchesM4 = newEstimateMatchesM4;
        estimateMatchesM5 = newEstimateMatchesM5;
        estimateMatchesM6 = newEstimateMatchesM6;
        estimateMatchesM7 = newEstimateMatchesM7;
        estimateMatchesC1 = newEstimateMatchesC1;
        estimateMatchesC2 = newEstimateMatchesC2;
        estimateMatchesC3 = newEstimateMatchesC3;
        estimateMatchesC4 = newEstimateMatchesC4;
        estimateMatchesC5 = newEstimateMatchesC5;
        estimateMatchesC6 = newEstimateMatchesC6;
        estimateMatchesC7 = newEstimateMatchesC7;
        moment = newMoment;
        _isLoading = false;
      });
    }
    final stopsUrl = "http://www-devl.bu.edu/nisdev/php5/bu-mobile-backend-demo/bu-mobile-backend/rpc/bus/stops.json.php";
    print("Fetching: " + stopsUrl);
    final stopsResponse = await http.get(stopsUrl);
    final stopsJson = json.decode(stopsResponse.body);
    if (stopsJson["service_id"] == null) {
      print("service_false");
    } else {
      final newArrivalsList = new List<ArrivalEstimates>();
      stopsJson["ResultSet"]["Result"].forEach((stopJson) {
        if (stopJson["translocStopId"] != null) {
          final stops = new Stops(
            stopJson["stopId"],
            stopJson["translocStopId"],
            stopJson["stopName"],
            stopJson["stopDesc"],
            stopJson["stopLat"],
            stopJson["stopLon"],
            stopJson["directionId"],
          );
          print(stops);
        }
     });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
    const fiveSec = const Duration(seconds: 5);
    new Timer.periodic(fiveSec, (Timer t) {
      _fetchData();
    });
  }

  Widget _buildEstimateNull() {
    return new Stack(
      children: <Widget>[
        new Container(
          width: 65.0,
          height: 65.0,
          decoration: BoxDecoration(
            color: const Color(0xFF171717),
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF41414c),
              width: 2.0,
            ),
          ),
          margin: const EdgeInsets.only(left: 65.0, top: 6.0),
          padding: const EdgeInsets.only(bottom: 22.0),
          child: new Center(
            child: new Text("...",
              style: new TextStyle(
                color: const Color(0xFF41414c),
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
              ),
            ),
          ),
        ),
        new Container(
          width: 75.0,
          height: 75.0,
          decoration: BoxDecoration(
            color: const Color(0xFF171717),
//                          color: const Color(0xFFC2232C),
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF41414c),
              width: 2.0,
            ),
          ),
//          margin: const EdgeInsets.only(right: 16.0),
          padding: const EdgeInsets.only(bottom: 22.0),
          child: new Center(
            child: new Text("...",
              style: new TextStyle(
                color: const Color(0xFF41414c),
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEstimateM1() {
    if (estimateMatchesM1.length == 0) {
//      print("zero");
      return _buildEstimateNull();
    } else if (estimateMatchesM1.length == 1) {
//      print("one");
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 65.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 22.0),
            child: new Center(
              child: new Text("...",
                style: new TextStyle(
                  color: const Color(0xFF41414c),
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF4a8fb0),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM1[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    } else {
//      print("two+");
//      print(_isLoading);
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 67.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM1[1])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: moment.from(DateTime.parse(estimateMatchesM1[0])) == "ARR" ? const Color(0xFFbe3930): (moment.from(DateTime.parse(estimateMatchesM1[0])) == "1m" ? const Color(0xFFe48f34) : const Color(0xFF4a8fb0)),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM1[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildEstimateM2() {
    if (estimateMatchesM2.length == 0) {
//      print("zero");
      return _buildEstimateNull();
    } else if (estimateMatchesM2.length == 1) {
//      print("one");
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 65.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 22.0),
            child: new Center(
              child: new Text("...",
                style: new TextStyle(
                  color: const Color(0xFF41414c),
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF4a8fb0),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM2[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    } else {
//      print("two+");
//      print(_isLoading);
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 67.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM2[1])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: moment.from(DateTime.parse(estimateMatchesM2[0])) == "ARR" ? const Color(0xFFbe3930): (moment.from(DateTime.parse(estimateMatchesM2[0])) == "1m" ? const Color(0xFFe48f34) : const Color(0xFF4a8fb0)),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM2[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildEstimateM3() {
    if (estimateMatchesM3.length == 0) {
//      print("zero");
      return _buildEstimateNull();
    } else if (estimateMatchesM3.length == 1) {
//      print("one");
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 65.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 22.0),
            child: new Center(
              child: new Text("...",
                style: new TextStyle(
                  color: const Color(0xFF41414c),
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF4a8fb0),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM3[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    } else {
//      print("two+");
//      print(_isLoading);
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 67.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM3[1])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: moment.from(DateTime.parse(estimateMatchesM3[0])) == "ARR" ? const Color(0xFFbe3930): (moment.from(DateTime.parse(estimateMatchesM3[0])) == "1m" ? const Color(0xFFe48f34) : const Color(0xFF4a8fb0)),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM3[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildEstimateM4() {
    if (estimateMatchesM4.length == 0) {
//      print("zero");
      return _buildEstimateNull();
    } else if (estimateMatchesM4.length == 1) {
//      print("one");
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 65.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 22.0),
            child: new Center(
              child: new Text("...",
                style: new TextStyle(
                  color: const Color(0xFF41414c),
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF4a8fb0),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM4[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    } else {
//      print("two+");
//      print(_isLoading);
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 67.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM4[1])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: moment.from(DateTime.parse(estimateMatchesM4[0])) == "ARR" ? const Color(0xFFbe3930): (moment.from(DateTime.parse(estimateMatchesM4[0])) == "1m" ? const Color(0xFFe48f34) : const Color(0xFF4a8fb0)),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM4[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildEstimateM5() {
    if (estimateMatchesM5.length == 0) {
//      print("zero");
      return _buildEstimateNull();
    } else if (estimateMatchesM5.length == 1) {
//      print("one");
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 65.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 22.0),
            child: new Center(
              child: new Text("...",
                style: new TextStyle(
                  color: const Color(0xFF41414c),
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF4a8fb0),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM5[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    } else {
//      print("two+");
//      print(_isLoading);
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 67.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM5[1])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: moment.from(DateTime.parse(estimateMatchesM5[0])) == "ARR" ? const Color(0xFFbe3930): (moment.from(DateTime.parse(estimateMatchesM5[0])) == "1m" ? const Color(0xFFe48f34) : const Color(0xFF4a8fb0)),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM5[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildEstimateM6() {
    if (estimateMatchesM6.length == 0) {
//      print("zero");
      return _buildEstimateNull();
    } else if (estimateMatchesM6.length == 1) {
//      print("one");
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 65.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 22.0),
            child: new Center(
              child: new Text("...",
                style: new TextStyle(
                  color: const Color(0xFF41414c),
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF4a8fb0),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM6[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    } else {
//      print("two+");
//      print(_isLoading);
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 67.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM6[1])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: moment.from(DateTime.parse(estimateMatchesM6[0])) == "ARR" ? const Color(0xFFbe3930): (moment.from(DateTime.parse(estimateMatchesM6[0])) == "1m" ? const Color(0xFFe48f34) : const Color(0xFF4a8fb0)),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM6[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildEstimateM7() {
    if (estimateMatchesM7.length == 0) {
//      print("zero");
      return _buildEstimateNull();
    } else if (estimateMatchesM7.length == 1) {
//      print("one");
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 65.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 22.0),
            child: new Center(
              child: new Text("...",
                style: new TextStyle(
                  color: const Color(0xFF41414c),
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF4a8fb0),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM7[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    } else {
//      print("two+");
//      print(_isLoading);
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 67.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM7[1])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: moment.from(DateTime.parse(estimateMatchesM7[0])) == "ARR" ? const Color(0xFFbe3930): (moment.from(DateTime.parse(estimateMatchesM7[0])) == "1m" ? const Color(0xFFe48f34) : const Color(0xFF4a8fb0)),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesM7[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildEstimateC1() {
    if (estimateMatchesC1.length == 0) {
//      print("zero");
      return _buildEstimateNull();
    } else if (estimateMatchesC1.length == 1) {
//      print("one");
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 65.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 22.0),
            child: new Center(
              child: new Text("...",
                style: new TextStyle(
                  color: const Color(0xFF41414c),
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF4a8fb0),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC1[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    } else {
//      print("two+");
//      print(_isLoading);
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 67.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC1[1])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: moment.from(DateTime.parse(estimateMatchesC1[0])) == "ARR" ? const Color(0xFFbe3930): (moment.from(DateTime.parse(estimateMatchesC1[0])) == "1m" ? const Color(0xFFe48f34) : const Color(0xFF4a8fb0)),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC1[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildEstimateC2() {
    if (estimateMatchesC2.length == 0) {
//      print("zero");
      return _buildEstimateNull();
    } else if (estimateMatchesC2.length == 1) {
//      print("one");
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 65.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 22.0),
            child: new Center(
              child: new Text("...",
                style: new TextStyle(
                  color: const Color(0xFF41414c),
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF4a8fb0),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC2[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    } else {
//      print("two+");
//      print(_isLoading);
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 67.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC2[1])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: moment.from(DateTime.parse(estimateMatchesC2[0])) == "ARR" ? const Color(0xFFbe3930): (moment.from(DateTime.parse(estimateMatchesC2[0])) == "1m" ? const Color(0xFFe48f34) : const Color(0xFF4a8fb0)),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC2[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildEstimateC3() {
    if (estimateMatchesC3.length == 0) {
//      print("zero");
      return _buildEstimateNull();
    } else if (estimateMatchesC3.length == 1) {
//      print("one");
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 65.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 22.0),
            child: new Center(
              child: new Text("...",
                style: new TextStyle(
                  color: const Color(0xFF41414c),
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF4a8fb0),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC3[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    } else {
//      print("two+");
//      print(_isLoading);
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 67.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC3[1])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: moment.from(DateTime.parse(estimateMatchesC3[0])) == "ARR" ? const Color(0xFFbe3930): (moment.from(DateTime.parse(estimateMatchesC3[0])) == "1m" ? const Color(0xFFe48f34) : const Color(0xFF4a8fb0)),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC3[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildEstimateC4() {
    if (estimateMatchesC4.length == 0) {
//      print("zero");
      return _buildEstimateNull();
    } else if (estimateMatchesC4.length == 1) {
//      print("one");
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 65.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 22.0),
            child: new Center(
              child: new Text("...",
                style: new TextStyle(
                  color: const Color(0xFF41414c),
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF4a8fb0),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC4[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    } else {
//      print("two+");
//      print(_isLoading);
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 67.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC4[1])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: moment.from(DateTime.parse(estimateMatchesC4[0])) == "ARR" ? const Color(0xFFbe3930): (moment.from(DateTime.parse(estimateMatchesC4[0])) == "1m" ? const Color(0xFFe48f34) : const Color(0xFF4a8fb0)),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC4[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildEstimateC5() {
    if (estimateMatchesC5.length == 0) {
//      print("zero");
      return _buildEstimateNull();
    } else if (estimateMatchesC5.length == 1) {
//      print("one");
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 65.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 22.0),
            child: new Center(
              child: new Text("...",
                style: new TextStyle(
                  color: const Color(0xFF41414c),
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF4a8fb0),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC5[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    } else {
//      print("two+");
//      print(_isLoading);
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 67.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC5[1])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: moment.from(DateTime.parse(estimateMatchesC5[0])) == "ARR" ? const Color(0xFFbe3930): (moment.from(DateTime.parse(estimateMatchesC5[0])) == "1m" ? const Color(0xFFe48f34) : const Color(0xFF4a8fb0)),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC5[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildEstimateC6() {
    if (estimateMatchesC6.length == 0) {
//      print("zero");
      return _buildEstimateNull();
    } else if (estimateMatchesC6.length == 1) {
//      print("one");
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 65.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 22.0),
            child: new Center(
              child: new Text("...",
                style: new TextStyle(
                  color: const Color(0xFF41414c),
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF4a8fb0),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC6[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    } else {
//      print("two+");
//      print(_isLoading);
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 67.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC6[1])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: moment.from(DateTime.parse(estimateMatchesC6[0])) == "ARR" ? const Color(0xFFbe3930): (moment.from(DateTime.parse(estimateMatchesC6[0])) == "1m" ? const Color(0xFFe48f34) : const Color(0xFF4a8fb0)),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC6[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildEstimateC7() {
    if (estimateMatchesC7.length == 0) {
//      print("zero");
      return _buildEstimateNull();
    } else if (estimateMatchesC7.length == 1) {
//      print("one");
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 65.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 22.0),
            child: new Center(
              child: new Text("...",
                style: new TextStyle(
                  color: const Color(0xFF41414c),
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF4a8fb0),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC7[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    } else {
//      print("two+");
//      print(_isLoading);
      return new Stack(
        children: <Widget>[
          new Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF41414c),
                width: 2.0,
              ),
            ),
            margin: const EdgeInsets.only(left: 67.0, top: 6.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC7[1])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
          new Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              //                          color: const Color(0xFFC2232C),
              shape: BoxShape.circle,
              border: Border.all(
                color: moment.from(DateTime.parse(estimateMatchesC7[0])) == "ARR" ? const Color(0xFFbe3930): (moment.from(DateTime.parse(estimateMatchesC7[0])) == "1m" ? const Color(0xFFe48f34) : const Color(0xFF4a8fb0)),
                width: 2.0,
              ),
            ),
            //          margin: const EdgeInsets.only(right: 16.0),
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Center(
              child: new Text(moment.from(DateTime.parse(estimateMatchesC7[0])),
                style: new TextStyle(
                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: const Color(0xFF171717),
      appBar: new AppBar(
        backgroundColor: const Color(0xFF171717),
        elevation: 0.0,
        title: new Image.asset(
          'assets/home/signature.png',
          fit: BoxFit.cover,
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new StickyHeader(
            header: new Container(
              child: new Text("Inbound to Medical Campus",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 21.0,
                  fontFamily: 'Avenir',
                ),
              ),
              padding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              alignment: Alignment.centerLeft,
              color: const Color(0xFF333333),
            ), 
            content: new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text('M1: Student Village 2',
                    style: new TextStyle(fontSize: 20.0)
                  ),
                  subtitle: new Text('33 Harry Agganis Way'),
                  contentPadding: new EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0
                  ),
                  trailing: _isLoading ? _buildEstimateNull() : _buildEstimateM1(),
                ),
                new ListTile(
                  title: new Text('M2: Amory St.',
                      style: new TextStyle(fontSize: 20.0)
                  ),
                  subtitle: new Text('Comm. Ave. & Amory St.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _isLoading ? _buildEstimateNull() : _buildEstimateM2(),
                ),
                new ListTile(
                  title: new Text('M3: St. Mary\'s St.',
                      style: new TextStyle(fontSize: 20.0)
                  ),
                  subtitle: new Text('Comm. Ave. & St. Mary\'s St.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _isLoading ? _buildEstimateNull() : _buildEstimateM3(),
                ),
                new ListTile(
                  title: new Text('M4: Blandford Street',
                      style: new TextStyle(fontSize: 20.0)
                  ),
                  subtitle: new Text('Comm. Ave. & Blandford St.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _isLoading ? _buildEstimateNull() : _buildEstimateM4(),
                ),
                new ListTile(
                  title: new Text('M5: Hotel Commonwealth',
                      style: new TextStyle(fontSize: 20.0)
                  ),
                  subtitle: new Text('500 Commonwealth Ave.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _isLoading ? _buildEstimateNull() : _buildEstimateM5(),
                ),
                new ListTile(
                  title: new Text('M6: Huntington Ave.',
                      style: new TextStyle(fontSize: 20.0)
                  ),
                  subtitle: new Text('Mass. Ave. & Huntington Ave.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _isLoading ? _buildEstimateNull() : _buildEstimateM6(),
                ),
                new ListTile(
                  title: new Text('M7: 710 Albany St.',
                      style: new TextStyle(fontSize: 20.0)
                  ),
                  subtitle: new Text('710 Albany Street'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _isLoading ? _buildEstimateNull() : _buildEstimateM7(),
                ),
              ],
            ),
          ),
          new StickyHeader(
            header: new Container(
              child: new Text("Outbound to Charles River Campus",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 21.0,
                  fontFamily: 'Avenir',
                ),
              ),
              padding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              alignment: Alignment.centerLeft,
              color: const Color(0xFF333333),
            ),
            content: new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text('C1: 710 Albany St.',
                      style: new TextStyle(fontSize: 20.0)
                  ),
                  subtitle: new Text('710 Albany Street'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _isLoading ? _buildEstimateNull() : _buildEstimateC1(),
                ),
                new ListTile(
                  title: new Text('C2: Huntington Ave.',
                      style: new TextStyle(fontSize: 20.0)
                  ),
                  subtitle: new Text('Mass. Ave. & Huntington Ave.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _isLoading ? _buildEstimateNull() : _buildEstimateC2(),
                ),
                new ListTile(
                  title: new Text('C3: Danielsen Hall',
                      style: new TextStyle(fontSize: 20.0)
                  ),
                  subtitle: new Text('512 Beacon St.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _isLoading ? _buildEstimateNull() : _buildEstimateC3(),
                ),
                new ListTile(
                  title: new Text('C4: Myles Standish',
                      style: new TextStyle(fontSize: 20.0)
                  ),
                  subtitle: new Text('610 Beacon St.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _isLoading ? _buildEstimateNull() : _buildEstimateC4(),
                ),
                new ListTile(
                  title: new Text('C5: Silber Way',
                      style: new TextStyle(fontSize: 20.0)
                  ),
                  subtitle: new Text('Comm. Ave. & Silber Way'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _isLoading ? _buildEstimateNull() : _buildEstimateC5(),
                ),
                new ListTile(
                  title: new Text('C6: Marsh Plaza',
                      style: new TextStyle(fontSize: 20.0)
                  ),
                  subtitle: new Text('735 Commonwealth Ave.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _isLoading ? _buildEstimateNull() : _buildEstimateC6(),
                  onTap: () {
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (context) =>
//                      new StopDetailsPage("C6"),
                          new Scaffold(
                            body: new StopDetailsAnimator("c6"),
                          )
                      ),
                    );
                  },
                ),
                new ListTile(
                  title: new Text('C7: College of Fine Arts',
                      style: new TextStyle(fontSize: 20.0)
                  ),
                  subtitle: new Text('855 Commonwealth Ave.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _isLoading ? _buildEstimateNull() : _buildEstimateC7(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StopDetails {
  StopDetails({
    @required this.name,
    @required this.stopId,
    @required this.avatar,
    @required this.backdrop,
    @required this.location,
    @required this.description,
  });

  final String name;
  final String stopId;
  final String avatar;
  final String backdrop;
  final String location;
  final String description;
}

class StopDetailsData {
  static final StopDetails m1 = new StopDetails(
    name: "Student Village 2",
    stopId: "4160714",
    avatar: null,
    backdrop: null,
    location: "33 Harry Agganis Way",
    description: "This stop is the best way to get to any part of West Campus. "
        'Whether you\'re headed to Agganis Arena, FitRec, or Raising Cane\'s, or '
        'wheather you\'re coming from Sleeper, Rich, or Claflin Hall, this stop '
        'remains busy all day long. Notably, this stop is also important for '
        'serving as the beginning and end of the BU Shuttle route. You\'re more '
        'likely to find a bus here than anywhere else on campus.',
  );
  static final StopDetails m2 = new StopDetails(
    name: "Amory St.",
    stopId: "4114006",
    avatar: null,
    backdrop: null,
    location: "Commonwealth Avenue & Amory Street",
    description: 'Located conveniently in front of the BU IT Help Center, this stop\'s '
        'a great place to get off at if you\'re headed to Sunset Cantina or Target. '
        'It\'s also located right across the street from CGS or CFA, so a ride back to '
        'the rest of campus after a long class is never too far away.',
  );
  static final StopDetails m3 = new StopDetails(
    name: "St. Mary's St.",
    stopId: "4149154",
    avatar: null,
    backdrop: null,
    location: "Commonwealth Avenue & St. Mary's Street",
    description: 'If you\'re riding the bus into campus for morning classes, this '
        'is where you\'ll probably get off. It\'s located right across the street '
        'from CAS, and it\'s also right next to the BUild Lab and the bridge to '
        'South Campus. A good all-around stop to get to where you need to go.',
  );
  static final StopDetails c6 = new StopDetails(
    name: "Marsh Plaza",
    stopId: "4160734",
    avatar: "assets/c6/avatar.png",
    backdrop: "assets/c6/backdrop.png",
    location: "735 Commonwealth Avenue",
    description: 'A popular stop for BU students, Marsh Plaza is universally known '
        'as the center of campus. Located right next to GSU, CAS, and the '
        'titular Marsh Chapel from which Marsh Plaza lends its name from, there\'s '
        'not much that students can\'t get here.',
  );
}

class StopDetailsAnimator extends StatefulWidget {
  final String stopName;
  StopDetailsAnimator(this.stopName);
  @override
  _StopDetailsAnimator createState() => new _StopDetailsAnimator(stopName);
}

class _StopDetailsAnimator extends State<StopDetailsAnimator>
    with SingleTickerProviderStateMixin {

  final String stopName;
  _StopDetailsAnimator(this.stopName);
  AnimationController _controller;

  @override
  void initState() {
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 2200),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StopDetailsPage(
      stopName: StopDetailsData.c6,
      controller: _controller,
    );
  }
}

class StopDetailsPage extends StatelessWidget {
  StopDetailsPage({
    @required this.stopName,
    @required AnimationController controller,
  }) : animation = new StopDetailsEnterAnimation(controller);

  final StopDetails stopName;
  final StopDetailsEnterAnimation animation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Opacity(
          opacity: animation.backdropOpacity.value,
          child: new Image.asset(
            stopName.backdrop,
            fit: BoxFit.cover,
          ),
        ),
        new BackdropFilter(
          filter: new ui.ImageFilter.blur(
            sigmaX: animation.backdropBlur.value,
            sigmaY: animation.backdropBlur.value,
          ),
          child: new Container(
            color: Colors.black.withOpacity(0.5),
            child: _buildContent(),
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return new SingleChildScrollView(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAvatar(),
          _buildInfo(),
          _buildStopScroller(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return new Transform(
      transform: new Matrix4.diagonal3Values(
        animation.avatarSize.value,
        animation.avatarSize.value,
        1.0,
      ),
      alignment: Alignment.center,
      child: new Container(
        width: 110.0,
        height: 110.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          border: new Border.all(
            color: Colors.white30,
          ),
        ),
        margin: const EdgeInsets.only(
          top: 16.0,
          left: 16.0,
        ),
        padding: const EdgeInsets.all(3.0),
        child: new ClipOval(
          child: new Image.asset(
            stopName.avatar,
          ),
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return new Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            stopName.name,
            style: new TextStyle(
              color: Colors.white.withOpacity(animation.nameOpacity.value),
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          new Text(
            stopName.location,
            style: new TextStyle(
              color: Colors.white.withOpacity(animation.locationOpacity.value),
              fontWeight: FontWeight.w500,
            ),
          ),
          new Container(
            color: Colors.white.withOpacity(0.85),
            margin: const EdgeInsets.symmetric(
              vertical: 16.0,
            ),
            width: animation.dividerWidth.value,
            height: 1.0,
          ),
          new Text(
            stopName.description,
            style: new TextStyle(
              color: Colors.white.withOpacity(animation.descriptionOpacity.value),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStopScroller() {
    return new Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: new Transform(
        transform: new Matrix4.translationValues(
          animation.stopScrollerXTranslation.value,
          0.0,
          0.0,
        ),
        child: new Opacity(
          opacity: animation.stopScrollerOpacity.value,
          child: new SizedBox.fromSize(
            size: new Size.fromHeight(245.0),
            child: new ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              itemCount: estimateMatchesC6.length,
              itemBuilder: (BuildContext context, int index) {
                var stop = estimateMatchesC6[index];
                return new StopCard(stop);
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: new Color(0x000000),
        elevation: 0.0,
      ),
      body: new AnimatedBuilder(
        animation: animation.controller,
        builder: _buildAnimation,
      ),
    );
  }
}

class StopCard extends StatelessWidget {
  StopCard(this.stop);
  String stop;

  BoxDecoration _buildShadowAndRoundedCorners() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.4),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
          spreadRadius: 2.0,
          blurRadius: 10.0,
          color: Colors.black26,
        ),
      ],
    );
  }

  var moment = new Moment.now().locale(new ShortLocaleEn());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175.0,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      decoration: _buildShadowAndRoundedCorners(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Center(
            child: new Text(moment.from(DateTime.parse(stop)),
              style: new TextStyle(
                fontSize: 50.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StopDetailsEnterAnimation {
  StopDetailsEnterAnimation(this.controller)
      : backdropOpacity = new Tween(begin: 0.5, end: 1.0).animate(
      new CurvedAnimation(
        parent: controller,
        curve: new Interval(
          0.000,
          0.500,
          curve: Curves.ease,
        ),
      )
  ),
        backdropBlur = new Tween(begin: 0.0, end: 5.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.000,
              0.800,
              curve: Curves.ease,
            ),
          ),
        ),
        avatarSize = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.100,
              0.400,
              curve: Curves.elasticOut,
            ),
          ),
        ),
        nameOpacity = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.350,
              0.450,
              curve: Curves.easeIn,
            ),
          ),
        ),
        locationOpacity = new Tween(begin: 0.0, end: 0.85).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.500,
              0.600,
              curve: Curves.easeIn,
            ),
          ),
        ),
        dividerWidth = new Tween(begin: 0.0, end: 225.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.650,
              0.750,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        descriptionOpacity = new Tween(begin: 0.0, end: 0.85).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.750,
              0.900,
              curve: Curves.easeIn,
            ),
          ),
        ),
        stopScrollerXTranslation = new Tween(begin: 60.0, end: 0.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.830,
              1.000,
              curve: Curves.ease,
            ),
          ),
        ),
        stopScrollerOpacity = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.830,
              1.000,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        );

  final AnimationController controller;
  final Animation<double> backdropOpacity;
  final Animation<double> backdropBlur;
  final Animation<double> avatarSize;
  final Animation<double> nameOpacity;
  final Animation<double> locationOpacity;
  final Animation<double> dividerWidth;
  final Animation<double> descriptionOpacity;
  final Animation<double> stopScrollerXTranslation;
  final Animation<double> stopScrollerOpacity;
}