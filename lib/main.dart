import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:sticky_header_list/sticky_header_list.dart';
import 'package:simple_moment/simple_moment.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;
import 'dart:convert';
import 'dart:async';
import 'globals.dart' as globals;

void main() => runApp(new ShuttleApp());

class ShuttleApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ShuttleState();
  }
}

class LiveBus {
  String busState = "default";
  String callName;
}

class ArrivalEstimates {
  final String routeId;
  final String arrivalAt;
  final String stopId;
  ArrivalEstimates(this.routeId, this.arrivalAt, this.stopId);
}

class StopInfo {
  final String stopId;
  final String translocStopId;
  final String stopName;
  final String stopDesc;
  final String directionId;
  StopInfo(this.stopId, this.translocStopId, this.stopName, this.stopDesc, this.directionId);
}

class ShortLocaleEn extends LocaleEn {
  String get seconds => 'ARR';

  String get aMinute => '%im';
  String get minutes => '%im';

  String get anHour => '1h';
  String get hours => '%ih';

  String get aDay => '%id';
  String get days => '%id';

  IdentifierPosition get futurePosition => IdentifierPosition.dontDisplay;
}

class ShuttleState extends State<ShuttleApp> {

//  String busState = "default";

//  final busList


  @override
  void initState() {
    super.initState();
//    _fetchData();
//    const fiveSec = const Duration(seconds: 5);
//    new Timer.periodic(fiveSec, (Timer t) {
//      _fetchData();
//    });
  }



  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "BU Shuttle",
//      theme: new ThemeData.dark(),
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

class HomeState extends State<HomeScreen> {

  var _isLoading = true;

  void initState() {
    super.initState();
    _fetchData();
    const fiveSec = const Duration(seconds: 5);
    new Timer.periodic(fiveSec, (Timer t) {
      _fetchData();
//      _buildAllEstimates();
//      print('built');
    });
  }

//  stackexchange sol -----------------
//  HomeState() {
//    _fetchData().then((val) => setState(() {
//      arrivalsList = val;
//      _isLoading = false;
//    }));
//  }

  var arrivalsList = new List<ArrivalEstimates>();
  var stopsList = new List<StopInfo>();

//  Future<List<ArrivalEstimates>> _fetchData() async {
  _fetchData() async {
//    arrivalsList.clear();
//    stopsList.clear();
    final busUrl = "http://www-devl.bu.edu/nisdev/php5/bu-mobile-backend-demo/bu-mobile-backend/rpc/bus/livebus.json.php";
    print("Fetching: " + busUrl);
    final busResponse = await http.get(busUrl);
    final busesJson = json.decode(busResponse.body);
//    print(busesJson);
    if (busesJson["service_id"] == null) {
      globals.serviceActive = false;
    } else {
      final newArrivalsList = new List<ArrivalEstimates>();
      busesJson["ResultSet"]["Result"].forEach((busJson) {
        if (busJson["arrival_estimates"] != null) {
          busJson["arrival_estimates"].forEach((arrivalJson) {
            globals.serviceActive = true;
            final arrivalEstimate = new ArrivalEstimates(
                arrivalJson["route_id"], arrivalJson["arrival_at"], arrivalJson["stop_id"]
            );
            newArrivalsList.add(arrivalEstimate);
//            print(arrivalJson);
          });
        }
      });
      setState(() {
        arrivalsList = newArrivalsList;
      });
//      print(arrivalsList);
//      print(newArrivalsList);
//      return arrivalsList;
    }
//    print(globals.serviceActive);

//  stops data ---------
    final stopUrl = "http://www-devl.bu.edu/nisdev/php5/bu-mobile-backend-demo/bu-mobile-backend/rpc/bus/stops.json.php";
    print("Fetching: " + stopUrl);
    final stopResponse = await http.get(stopUrl);
    final stopsJson = json.decode(stopResponse.body);
    stopsJson["ResultSet"]["Result"].forEach((stopJson) {
      if (stopJson["transloc_stop_id"] != null) {
        final stop = new StopInfo(
            stopJson["stop_id"], stopJson["transloc_stop_id"],
            stopJson["stop_name"], stopJson["stop_desc"],
            stopJson["direction_id"]);
        stopsList.add(stop);
      }
    });
    setState(() {
      _isLoading = false;
    });
  }

  Widget _buildAllEstimates() {
    if (globals.serviceActive == false) {
      _buildEstimateNull();
    } else {
      _buildEstimateM1();
//      _buildEstimateM2();
    }
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
            border: Border.all(color: const Color(0xFF41414c),
            ),
          ),
          margin: const EdgeInsets.only(left: 65.0, top: 6.0),
          padding: const EdgeInsets.only(bottom: 22.0),
          child: new Center(
            child: new Text("..N",
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

//  _fetchM1() async {
//    await _fetchData();
//    final String translocStopId = "4160714";
//    final estimateMatches = new List<String>();
//    print(arrivalsList);
//    arrivalsList.forEach((arrival) {
//      print(arrival.stopId);
//      print("hi");
//      if (arrival.stopId == translocStopId) {
//        estimateMatches.add(arrival.arrivalAt);
//      }
//    });
//    print(estimateMatches);
//    estimateMatches.sort();
//    print(estimateMatches);
//  }

  Widget _buildEstimateM1() {
    if (globals.serviceActive == false) {
      print('serviceNotActive');
      _buildEstimateNull();
    } else {

      final String translocStopId = "4160714";
      final estimateMatches = new List<String>();
//      print(arrivalsList);
      arrivalsList.forEach((arrival) {
//        print(arrival.stopId);
//        print("hi");
        if (arrival.stopId == translocStopId) {
          estimateMatches.add(arrival.arrivalAt);
        }
      });
//      print(estimateMatches);
      estimateMatches.sort();
      print(estimateMatches);
      var moment = new Moment.now().locale(new ShortLocaleEn());
      if (estimateMatches.length == 0) {
        print("zero");
        return _buildEstimateNull();
      } else if (estimateMatches.length == 1) {
        print("one");
        print(moment.from(DateTime.parse(estimateMatches[0])));
        return new Stack(
          children: <Widget>[
            new Container(
              width: 65.0,
              height: 65.0,
              decoration: BoxDecoration(
                color: const Color(0xFF171717),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF41414c),
                ),
              ),
              margin: const EdgeInsets.only(left: 65.0, top: 6.0),
              padding: const EdgeInsets.only(bottom: 22.0),
              child: new Center(
                child: new Text("..1",
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
                ),
              ),
              //          margin: const EdgeInsets.only(right: 16.0),
              padding: const EdgeInsets.only(bottom: 22.0),
              child: new Center(
                child: new Text(moment.from(DateTime.parse(estimateMatches[0])),
                  style: new TextStyle(
                    color: const Color(0xFF41414c),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        );
      } else {
        print("two+");
        print(moment.from(DateTime.parse(estimateMatches[0])));
        print(moment.from(DateTime.parse(estimateMatches[1])));
        print(_isLoading);
        return new Stack(
          children: <Widget>[
            new Container(
              width: 65.0,
              height: 65.0,
              decoration: BoxDecoration(
                color: const Color(0xFF171717),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF41414c),
                ),
              ),
              margin: const EdgeInsets.only(left: 65.0, top: 6.0),
              padding: const EdgeInsets.only(bottom: 22.0),
              child: new Center(
//                child: new Text(moment.from(DateTime.parse(estimateMatches[1])),
                child: new Text("..2",
                  style: new TextStyle(
                    color: Colors.blue,
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
                ),
              ),
              //          margin: const EdgeInsets.only(right: 16.0),
              padding: const EdgeInsets.only(bottom: 22.0),
              child: new Center(
                child: new Text(moment.from(DateTime.parse(estimateMatches[0])),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: const Color(0xFF171717),
        appBar: new AppBar(
//          backgroundColor: const Color(0xFFC2232C),
          backgroundColor: const Color(0xFF171717),
          elevation: 0.0,
//          title: new Text("BU Shuttle",
//            style: new TextStyle(
//              color: Colors.white,
//            ),
//          ),
          title: new Image.asset(
            'assets/home/signature.png',
            fit: BoxFit.cover,
          ),
        ),
        body: new DefaultTextStyle(
//          style: Theme.of(context).textTheme.body1,
          style: new TextStyle(color: const Color(0xFFaaaaaa),),
          child: new StickyList(
//            padding: new EdgeInsets.all(16.0),
            children: <StickyListRow>[
              new HeaderRow(
                child: new Container(
                  child: new Text("Inbound to Medical Campus",
                    style: new TextStyle(
                      color: Colors.white,
//                    fontWeight: FontWeight.w500,
                      fontSize: 21.0,
                      fontFamily: 'Avenir',
                    ),
                  ),
                  padding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  color: const Color(0xFF333333),
                ),
              ),
              new RegularRow(
                child: new ListTile(
                  title: new Text('M1: Student Village 2',
                      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                  subtitle: new Text('33 Harry Agganis Way'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _buildEstimateM1(),
                ),
              ),
              new RegularRow(
                child: new ListTile(
                  title: new Text('M2: Amory St.',
                      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                  subtitle: new Text('Comm. Ave. & Amory St.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _buildEstimateNull(),
                ),
              ),
              new RegularRow(
                child: new ListTile(
                  title: new Text('M3: St. Mary\'s St.',
                      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                  subtitle: new Text('Comm. Ave. & St. Mary\'s St.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _buildEstimateNull(),
                ),
              ),
              new RegularRow(
                child: new ListTile(
                  title: new Text('M4: Blandford Street',
                      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                  subtitle: new Text('Comm. Ave. & Blandford St.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _buildEstimateNull(),
                ),
              ),
              new RegularRow(
                child: new ListTile(
                  title: new Text('M5: Hotel Commonwealth',
                      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                  subtitle: new Text('500 Commonwealth Ave.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _buildEstimateNull(),
                ),
              ),
              new RegularRow(
                child: new ListTile(
                  title: new Text('M6: Huntington Ave.',
                      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                  subtitle: new Text('Mass. Ave. & Huntington Ave.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _buildEstimateNull(),
                ),
              ),
              new RegularRow(
                child: new ListTile(
                  title: new Text('M7: 710 Albany St.',
                      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                  subtitle: new Text('710 Albany Street'),
                  contentPadding: new EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 16.0,
                    bottom: 32.0,
                  ),
                  trailing: _buildEstimateNull(),
                ),
              ),
              new HeaderRow(
                child: new Container(
                  child: new Text("Outbound to Charles River Campus",
                    style: new TextStyle(
                      color: Colors.white,
//                    fontWeight: FontWeight.w500,
                      fontSize: 21.0,
                      fontFamily: 'Avenir',
                    ),
                  ),
                  padding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  color: const Color(0xFF333333),
                ),
              ),
              new RegularRow(
                child: new ListTile(
                  title: new Text('C1: 710 Albany St.',
                      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                  subtitle: new Text('710 Albany Street'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _buildEstimateNull(),
                ),
              ),
              new RegularRow(
                child: new ListTile(
                  title: new Text('C2: Huntington Ave.',
                      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                  subtitle: new Text('Mass. Ave. & Huntington Ave.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _buildEstimateNull(),
                ),
              ),
              new RegularRow(
                child: new ListTile(
                  title: new Text('C3: Danielsen Hall',
                      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                  subtitle: new Text('512 Beacon St.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _buildEstimateNull(),
                ),
              ),
              new RegularRow(
                child: new ListTile(
                  title: new Text('C4: Myles Standish',
                      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                  subtitle: new Text('610 Beacon St.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _buildEstimateNull(),
                ),
              ),
              new RegularRow(
                child: new ListTile(
                  title: new Text('C5: Silber Way',
                      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                  subtitle: new Text('Comm. Ave. & Silber Way'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _buildEstimateNull(),
                ),
              ),
              new RegularRow(
                child: new ListTile(
                  title: new Text('C6: Marsh Plaza',
                      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                  subtitle: new Text('735 Commonwealth Ave.'),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0
                  ),
                  trailing: _buildEstimateNull(),
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
              ),
              new RegularRow(
                child: new ListTile(
                  title: new Text('C7: College of Fine Arts',
                      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
                  subtitle: new Text('855 Commonwealth Ave.'),
                  contentPadding: new EdgeInsets.only(
                    top: 16.0,
                    left: 16.0,
                    right: 16.0,
                    bottom: 32.0,
                  ),
                  trailing: _buildEstimateNull(),
                ),
              ),
            ],
          ),
        )
    );
  }

//  Widget _buildEstimate {
//    return Container(
//      width: 100.0,
//      height: 100.0,
//    );
////    color: 41414c
//  }
}

class StopDetails {
  StopDetails({
    @required this.name,
    @required this.stopId,
    @required this.avatar,
    @required this.backdrop,
    @required this.location,
    @required this.description,
//    @required this.stops,
  });

  final String name;
  final String stopId;
  final String avatar;
  final String backdrop;
  final String location;
  final String description;
//  final List<StopEstimates> stops;
}

class StopEstimates {

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
//          _buildVideoScroller(),
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
          top: 64.0,
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

  Widget _buildVideoScroller() {

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new AnimatedBuilder(
        animation: animation.controller,
        builder: _buildAnimation,
      ),
    );
  }
}

//class VideoCard extends StatelessWidget {
//
//}

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