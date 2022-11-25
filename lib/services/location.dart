import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';


class Location{
  late double latitude;
  late double longitude;
  late Position currentPosition;


  Future<void> locatePosition() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      currentPosition=position;
      latitude=currentPosition.latitude;
      longitude=currentPosition.longitude;
      }catch(e){
      print(e);

    }
  }
  // Ask permission from device
  Future<void> requestPermission() async {
    dynamic permission;
    await permission.location.request();
  }
}

