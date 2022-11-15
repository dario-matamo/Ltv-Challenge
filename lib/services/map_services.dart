import 'package:geolocator/geolocator.dart';

class MapServices {
  static Future<Position> determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  
}
