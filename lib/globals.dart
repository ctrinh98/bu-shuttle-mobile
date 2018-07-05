library bu_shuttle.globals;

class Stops {
  final String stopId;
  final String translocStopId;
  final String stopName;
  final String stopDesc;
  final String stopLat;
  final String stopLon;
  final String directionId;
  final List<dynamic> times;
  Stops(this.stopId, this.translocStopId, this.stopName, this.stopDesc, this.stopLat, this.stopLon, this.directionId, this.times);
}

bool serviceActive;
var stopsList = new List<Stops>();

var estimateMatchesM1 = new List<String>();
var estimateMatchesM2 = new List<String>();
var estimateMatchesM3 = new List<String>();
var estimateMatchesM4 = new List<String>();
var estimateMatchesM5 = new List<String>();
var estimateMatchesM6 = new List<String>();
var estimateMatchesM7 = new List<String>();
var estimateMatchesC1 = new List<String>();
var estimateMatchesC2 = new List<String>();
var estimateMatchesC3 = new List<String>();
var estimateMatchesC4 = new List<String>();
var estimateMatchesC5 = new List<String>();
var estimateMatchesC6 = new List<String>();
var estimateMatchesC7 = new List<String>();