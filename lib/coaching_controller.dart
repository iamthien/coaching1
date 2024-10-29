// coaching_controller.dart

import 'dart:convert';

import 'package:get/get.dart';
import 'coaching_model.dart';

class CoachingController extends GetxController {
  var coachingResponse = CoachingResponse(
    payload: [],
    status: 0,
    message: '',
    metaData: MetaData(
      page: 0,
      pageSize: 0,
      lastPage: 0,
      totalItems: 0,
      sort: '',
      direction: '',
    ),
  ).obs;

  Future<void> fetchCoachingData() async {
    // Simulating an API response with a sample JSON string
    String jsonString =
        '{"payload":[{"detailId":657123,"coachingCode":"C0074740","distributorCode":"20001564","distributorAbbr":"Cty Cường Phú Vĩnh Long","customerCode":"1000031533","customerAbbr":"Quán Ngọc Tuyền","customerAddress":"00, 1, Xã Hựu Thành, Huyện Trà Ôn, Vĩnh Long","visitDate":"2024-10-15","checkInTime":"2024-10-15T09:33:34","checkOutTime":"2024-10-15T09:33:52.659682","userCode":"1000085","userName":"Châu Quốc Trường Sơn","images":[{"id":125667,"originalName":"1728984821740.jpg","imageSignedUrl":"https://smartsales-s3-prod.s3.ap-southeast-1.amazonaws.com/coachings/C0074740/1728984820980_1728984821762.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20241029T031329Z&X-Amz-SignedHeaders=host&X-Amz-Expires=43200&X-Amz-Credential=AKIA6NPFIZPQK6UH2JKP%2F20241029%2Fap-southeast-1%2Fs3%2Faws4_request&X-Amz-Signature=005e1b8f052f20d8d5f32510f309cc491158ef330df9311c3cfba435edd21691","note1":"Shop không nhập hàng ","noteType":"01","noteTypeName":"Sản Phẩm","displayOrder":1}]}],"status":200,"message":"info.success","metaData":{"page":1,"pageSize":16,"lastPage":1,"totalItems":1,"sort":"","direction":""}}';

    // Parse the JSON response
    coachingResponse.value = CoachingResponse.fromJson(json.decode(jsonString));
  }
}
