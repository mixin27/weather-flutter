import 'package:geolocator/geolocator.dart';

import '../utilities/app_permissions.dart';

class Location {
  late double lat;
  late double lng;

  Future<void> getCurrentLocation() async {
    if (await AppPermissions.checkLocationPermission()) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
        );
        lat = position.latitude;
        lng = position.longitude;
      } catch (e) {
        print(e);
      }
    } else {
      await Geolocator.requestPermission();
    }
  }
}
