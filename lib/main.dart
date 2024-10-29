// main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'coaching_controller.dart';
import 'coaching_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Coaching Details',
      home: CoachingScreen(),
    );
  }
}

class CoachingScreen extends StatelessWidget {
  final CoachingController coachingController = Get.put(CoachingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Coaching Details')),
      body: Obx(() {
        if (coachingController.coachingResponse.value.payload.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        final coachingDetails = coachingController.coachingResponse.value.payload;

        return ListView.builder(
          itemCount: coachingDetails.length,
          itemBuilder: (context, index) {
            final detail = coachingDetails[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer: ${detail.customerAbbr}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text('Distributor: ${detail.distributorAbbr}'),
                    Text('Visit Date: ${detail.visitDate.toLocal()}'),
                    Text('Check-In Time: ${detail.checkInTime.toLocal()}'),
                    Text('Check-Out Time: ${detail.checkOutTime.toLocal()}'),
                    SizedBox(height: 10),
                    Text('Images:', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: detail.images.length,
                        itemBuilder: (context, imgIndex) {
                          final imageDetail = detail.images[imgIndex];
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CachedNetworkImage(
                              imageUrl: imageDetail.imageSignedUrl,
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: coachingController.fetchCoachingData,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
