// coaching_model.dart

import 'dart:convert';

// Main model class for the response
class CoachingResponse {
  final List<CoachingDetail> payload;
  final int status;
  final String message;
  final MetaData metaData;

  CoachingResponse({
    required this.payload,
    required this.status,
    required this.message,
    required this.metaData,
  });

  factory CoachingResponse.fromJson(Map<String, dynamic> json) {
    return CoachingResponse(
      payload: List<CoachingDetail>.from(
          json['payload'].map((x) => CoachingDetail.fromJson(x))),
      status: json['status'],
      message: json['message'],
      metaData: MetaData.fromJson(json['metaData']),
    );
  }
}

// Model class for each coaching detail
class CoachingDetail {
  final int detailId;
  final String coachingCode;
  final String distributorCode;
  final String distributorAbbr;
  final String customerCode;
  final String customerAbbr;
  final String customerAddress;
  final DateTime visitDate;
  final DateTime checkInTime;
  final DateTime checkOutTime;
  final String userCode;
  final String userName;
  final List<ImageDetail> images;

  CoachingDetail({
    required this.detailId,
    required this.coachingCode,
    required this.distributorCode,
    required this.distributorAbbr,
    required this.customerCode,
    required this.customerAbbr,
    required this.customerAddress,
    required this.visitDate,
    required this.checkInTime,
    required this.checkOutTime,
    required this.userCode,
    required this.userName,
    required this.images,
  });

  factory CoachingDetail.fromJson(Map<String, dynamic> json) {
    return CoachingDetail(
      detailId: json['detailId'],
      coachingCode: json['coachingCode'],
      distributorCode: json['distributorCode'],
      distributorAbbr: json['distributorAbbr'],
      customerCode: json['customerCode'],
      customerAbbr: json['customerAbbr'],
      customerAddress: json['customerAddress'],
      visitDate: DateTime.parse(json['visitDate']),
      checkInTime: DateTime.parse(json['checkInTime']),
      checkOutTime: DateTime.parse(json['checkOutTime']),
      userCode: json['userCode'],
      userName: json['userName'],
      images: List<ImageDetail>.from(
          json['images'].map((x) => ImageDetail.fromJson(x))),
    );
  }
}

// Model class for image details
class ImageDetail {
  final int id;
  final String originalName;
  final String imageSignedUrl;
  final String note1;
  final String noteType;
  final String noteTypeName;
  final int displayOrder;

  ImageDetail({
    required this.id,
    required this.originalName,
    required this.imageSignedUrl,
    required this.note1,
    required this.noteType,
    required this.noteTypeName,
    required this.displayOrder,
  });

  factory ImageDetail.fromJson(Map<String, dynamic> json) {
    return ImageDetail(
      id: json['id'],
      originalName: json['originalName'],
      imageSignedUrl: json['imageSignedUrl'],
      note1: json['note1'],
      noteType: json['noteType'],
      noteTypeName: json['noteTypeName'],
      displayOrder: json['displayOrder'],
    );
  }
}

// Model class for metadata
class MetaData {
  final int page;
  final int pageSize;
  final int lastPage;
  final int totalItems;
  final String sort;
  final String direction;

  MetaData({
    required this.page,
    required this.pageSize,
    required this.lastPage,
    required this.totalItems,
    required this.sort,
    required this.direction,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      page: json['page'],
      pageSize: json['pageSize'],
      lastPage: json['lastPage'],
      totalItems: json['totalItems'],
      sort: json['sort'],
      direction: json['direction'],
    );
  }
}
