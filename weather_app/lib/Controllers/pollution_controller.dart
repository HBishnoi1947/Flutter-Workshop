import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weather_app/Helpers/http_helper.dart';

const pollutionAPIUrl = "http://api.openweathermap.org/data/2.5/air_pollution";

class PollutionController extends GetxController{

  RxBool isLoading = true.obs;



  RxDouble co = 0.0.obs;
  RxDouble no = 0.0.obs;
  RxDouble so2 = 0.0.obs;
  RxDouble nh3 = 0.0.obs;
  RxDouble aqi = 0.0.obs;


  @override
  void onInit()async{
    super.onInit();
    getLocationPollution(22.7196, 75.8577);
  }

  @override
  void onClose(){}

  Future<dynamic> getLocationPollution(double latitude, double longitude) async{
    NetworkData networkData = NetworkData('$pollutionAPIUrl?lat=$latitude&lon=$longitude&appid=d0e0fa5f0eb8a3a8c5f9dff40be3747e&units=metric');
    
    var pollutionData = await networkData.getData();
    // print(pollutionData);

    aqi.value = pollutionData['list'][0]['main']['aqi']+ 0.0;
    co.value = pollutionData['list'][0]['components']['co'] + 0.0;
    no.value = pollutionData['list'][0]['components']['no'] +0.0;
    so2.value = pollutionData['list'][0]['components']['so2'] +0.0;
    nh3.value = pollutionData['list'][0]['components']['nh3'] +0.0;


  }



}