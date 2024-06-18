import 'dart:convert';

ResponseApi responseApiFromJson(String str) => ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
  String? message;
  String? error;
  bool? success;
  dynamic? data;

  ResponseApi({
    this.message,
    this.error,
    this.success,
    this.data
  });

  factory ResponseApi.fromJson(Map<String, dynamic> json) {
    return ResponseApi(
      success: json["success"],
      message: json["message"],
      error: json["error"],
      data: json["data"]

    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
    "success": success,
    "data": data
  };
}