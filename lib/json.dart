// ignore_for_file: avoid_function_literals_in_foreach_calls, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'json.g.dart';

List<Pincode> getPincodeList(List<dynamic> list) {
  List<Pincode> result = [];
  list.forEach((item) {
    result.add(Pincode.fromJson(item));
  });
  return result;
}

@JsonSerializable()
class Pincode extends Object {
  @JsonKey(name: 'Message')
  String message;

  @JsonKey(name: 'Status')
  String status;

  @JsonKey(name: 'PostOffice')
  List<PostOffice> postOffice;

  Pincode(
    this.message,
    this.status,
    this.postOffice,
  );

  factory Pincode.fromJson(Map<String, dynamic> srcJson) =>
      _$PincodeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PincodeToJson(this);
}

@JsonSerializable()
class PostOffice extends Object {
  @JsonKey(name: 'Name')
  String name;

  @JsonKey(name: 'Description')
  String? description;

  @JsonKey(name: 'BranchType')
  String branchType;

  @JsonKey(name: 'DeliveryStatus')
  String deliveryStatus;

  @JsonKey(name: 'Circle')
  String circle;

  @JsonKey(name: 'District')
  String district;

  @JsonKey(name: 'Division')
  String division;

  @JsonKey(name: 'Region')
  String region;

  @JsonKey(name: 'Block')
  String block;

  @JsonKey(name: 'State')
  String state;

  @JsonKey(name: 'Country')
  String country;

  @JsonKey(name: 'Pincode')
  String pincode;

  PostOffice(
    this.name,
    this.description,
    this.branchType,
    this.deliveryStatus,
    this.circle,
    this.district,
    this.division,
    this.region,
    this.block,
    this.state,
    this.country,
    this.pincode,
  );

  factory PostOffice.fromJson(Map<String, dynamic> srcJson) =>
      _$PostOfficeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PostOfficeToJson(this);
}
