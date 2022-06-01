import 'package:geolocator/geolocator.dart';
class Location{
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async{
    bool serviceEnabled;
    LocationPermission locationPermission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error("Location service is not enabled");
    }
    var permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error("Location permission is denied");
      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error("Location permission permanently disabled");
    }
    var currentPosition = await Geolocator.getCurrentPosition();
    latitude = currentPosition.latitude;
    longitude = currentPosition.longitude;
  }
}