// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pincode _$PincodeFromJson(Map<String, dynamic> json) => Pincode(
      json['Message'] as String,
      json['Status'] as String,
      (json['PostOffice'] as List<dynamic>)
          .map((e) => PostOffice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PincodeToJson(Pincode instance) => <String, dynamic>{
      'Message': instance.message,
      'Status': instance.status,
      'PostOffice': instance.postOffice,
    };

PostOffice _$PostOfficeFromJson(Map<String, dynamic> json) => PostOffice(
      json['Name'] as String,
      json['Description'] as String?,
      json['BranchType'] as String,
      json['DeliveryStatus'] as String,
      json['Circle'] as String,
      json['District'] as String,
      json['Division'] as String,
      json['Region'] as String,
      json['Block'] as String,
      json['State'] as String,
      json['Country'] as String,
      json['Pincode'] as String,
    );

Map<String, dynamic> _$PostOfficeToJson(PostOffice instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Description': instance.description,
      'BranchType': instance.branchType,
      'DeliveryStatus': instance.deliveryStatus,
      'Circle': instance.circle,
      'District': instance.district,
      'Division': instance.division,
      'Region': instance.region,
      'Block': instance.block,
      'State': instance.state,
      'Country': instance.country,
      'Pincode': instance.pincode,
    };
