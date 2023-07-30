import 'dart:convert';

SeoulAirdata seoulAirdataFromJson(String str) => SeoulAirdata.fromJson(json.decode(str));

String seoulAirdataToJson(SeoulAirdata data) => json.encode(data.toJson());

class SeoulAirdata {
  SeoulAirdata({
    required this.realtimeCityAir,
  });

  RealtimeCityAir realtimeCityAir;

  factory SeoulAirdata.fromJson(Map<String, dynamic> json) => SeoulAirdata(
    realtimeCityAir: RealtimeCityAir.fromJson(json["RealtimeCityAir"]),
  );

  Map<String, dynamic> toJson() => {
    "RealtimeCityAir": realtimeCityAir.toJson(),
  };
}

class RealtimeCityAir {
  RealtimeCityAir({
    required this.listTotalCount,
    required this.result,
    required this.row,
  });

  int listTotalCount;
  Result result;
  List<Row> row;

  factory RealtimeCityAir.fromJson(Map<String, dynamic> json) => RealtimeCityAir(
    listTotalCount: json["list_total_count"],
    result: Result.fromJson(json["RESULT"]),
    row: List<Row>.from(json["row"].map((x) => Row.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "list_total_count": listTotalCount,
    "RESULT": result.toJson(),
    "row": List<dynamic>.from(row.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.code,
    required this.message,
  });

  String code;
  String message;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    code: json["CODE"],
    message: json["MESSAGE"],
  );

  Map<String, dynamic> toJson() => {
    "CODE": code,
    "MESSAGE": message,
  };
}

class Row {
  Row({
    required this.msrdt,
    required this.msrrgnNm,
    required this.msrsteNm,
    required this.pm10,
    required this.pm25,
    required this.o3,
    required this.no2,
    required this.co,
    required this.so2,
    required this.idexNm,
    required this.idexMvl,
    required this.arpltMain,
  });

  String msrdt;
  String msrrgnNm;
  String msrsteNm;
  int pm10;
  int pm25;
  double o3;
  double no2;
  double co;
  double so2;
  String idexNm;
  int idexMvl;
  String arpltMain;

  factory Row.fromJson(Map<String, dynamic> json) => Row(
    msrdt: json["MSRDT"],
    msrrgnNm: json["MSRRGN_NM"],
    msrsteNm: json["MSRSTE_NM"],
    pm10: json["PM10"],
    pm25: json["PM25"],
    o3: json["O3"]?.toDouble(),
    no2: json["NO2"]?.toDouble(),
    co: json["CO"]?.toDouble(),
    so2: json["SO2"]?.toDouble(),
    idexNm: json["IDEX_NM"],
    idexMvl: json["IDEX_MVL"],
    arpltMain: json["ARPLT_MAIN"],
  );

  Map<String, dynamic> toJson() => {
    "MSRDT": msrdt,
    "MSRRGN_NM": msrrgnNm,
    "MSRSTE_NM": msrsteNm,
    "PM10": pm10,
    "PM25": pm25,
    "O3": o3,
    "NO2": no2,
    "CO": co,
    "SO2": so2,
    "IDEX_NM": idexNm,
    "IDEX_MVL": idexMvl,
    "ARPLT_MAIN": arpltMain,
  };
}
