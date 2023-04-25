// ignore_for_file: avoid_init_to_null

import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomepageController extends GetxController {
  RxBool isLoading = true.obs;
  Location location = Location();
  LocationData? currentLocation;
  late bool _serviceEnabled;
 // late LatLng selectedLatLng;
  late StreamController<LatLng> latLng = StreamController.broadcast();
  late List<geocoding.Placemark> placemarks;
  RxString? selectedAddress = "Loading".obs;
  onChangedselectedAddress(String addressLocation) {
    selectedAddress!(addressLocation);
  }

  @override
  void onInit() {
    getpermission();
    getCurrentLocation();
    super.onInit();
  }

  onCameraIdle() async {
    print("Getting placemarks");
    placemarks = await geocoding.placemarkFromCoordinates(
        currentLocation!.latitude!, currentLocation!.longitude!);
    onChangedselectedAddress(
        "${placemarks[1].name!}, ${placemarks[2].name!}, ${placemarks[3].name!}, ${placemarks.first.name!}");
  }

  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
          (location) async {
        currentLocation = location;
        latLng.add(LatLng(currentLocation!.latitude!,currentLocation!.longitude!));
        log("Got Current Location");
        isLoading.value = false;
      },
    );
    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
     update();
    });
  }

  void getpermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        debugPrint('Location Denied once');
      }
    }
  }
}
