// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:last_minute/app/modules/homepage/controller/homepage_controller.dart';
import 'package:last_minute/utils/colors.dart';
import 'package:last_minute/utils/dimensions.dart';
import 'package:last_minute/widgets/big_text.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../helper/snackbar.dart';

class Homepage extends GetView<HomepageController> {
  Completer<GoogleMapController> mapController = Completer();

  static const route = '/homepage';
  Homepage({super.key});
  static launch() => Get.toNamed(route);
  final panelController = PanelController();

  void _onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
              child: Column(
        children: [
          Expanded(child: renderMap()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width40,vertical: Dimensions.height40),
              width: double.maxFinite,
              height: Dimensions.height40 * 5,
              decoration: const BoxDecoration(
                  color: AppColors.white),
              child:
                  Obx(() => BigText(text: 'Location: ${controller.selectedAddress!.value}',maxLines: 5,)),
            ),
          )
        ],
      ))),
    );
  }

  Widget renderMap() {
    return Obx((() => (controller.isLoading.value)
        ? const Center(
            child: CircularProgressIndicator(color: AppColors.pink),
          )
        : SizedBox(child: GetBuilder<HomepageController>(
            builder: (_) {
              return GoogleMap(
                onCameraIdle: controller.onCameraIdle,
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(controller.currentLocation!.latitude!,
                      controller.currentLocation!.longitude!),
                  zoom: 13.5,
                ),
                onCameraMove: (positioned) {
                  controller.latLng.add(positioned.target);
                },
                markers: {
                  Marker(
                    onTap: () {
                      snackbar('Your Location');
                    },
                    markerId: const MarkerId('patientLocation'),
                    position: LatLng(controller.currentLocation!.latitude!,
                        controller.currentLocation!.longitude!),
                  )
                },
              );
            },
          ))));
  }
}
