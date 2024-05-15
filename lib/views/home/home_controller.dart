import 'dart:convert';
import 'package:get/get.dart';
import 'package:tourism_app/base/base_controller.dart';
import 'package:tourism_app/models/destinations.dart';
import 'package:tourism_app/models/screen_arguments.dart';
import 'package:tourism_app/routes/index.dart';

class HomeController extends BaseController {
  Destinations? destinations;
  List<Datum> mainList = [];
  List<Datum> destinationList = [];
  List<Datum> denpasarList = [];
  List<Datum> karangasemList = [];
  List<Datum> bulelengList = [];

  Future<Destinations> loadDestinations() async {
    String jsonString = await rootBundle.loadString('assets/jsons/data.json');

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    Destinations destinations = Destinations.fromJson(jsonMap);

    return destinations;
  }

  @override
  onInit() async {
    destinations = await loadDestinations();
    mainList = destinations?.data ?? [];
    super.onInit();
  }

  mapping() {
    destinationList = mainList;
    for (int i = 0; i < destinationList.length; i++) {
      Datum destination = destinationList[i];

      if (destination.location == "Denpasar") {
        denpasarList.add(destination);
      }
      if (destination.location == "Karangasem") {
        karangasemList.add(destination);
      }
      if (destination.location == "Buleleng") {
        bulelengList.add(destination);
      }
    }
  }

  @override
  onReady() async {
    isLoading = true;
    update();

    //next cod
    mapping();

    isLoading = false;
    update();
    super.onReady();
  }

  @override
  onClose() async {
    super.onClose();
  }

  onGoBack() {
    Get.back();
  }

  dontKnow() {}

  void tapCard(Datum destination) {
    Get.toNamed(AppRoutes.detailRoute, arguments: ScreenArguments(dynamicData: destination));
  }

  void filterSearch(String value) {
    if (value.toLowerCase() == "denpasar") {
      mapping();
      karangasemList.clear();
      bulelengList.clear();
      update();
    } else if (value.toLowerCase() == "karangasem") {
      mapping();
      denpasarList.clear();
      bulelengList.clear();
      update();
    } else if (value.toLowerCase() == "buleleng") {
      mapping();
      denpasarList.clear();
      karangasemList.clear();
      update();
    } else {
      mappingFilter(value);
      update();
    }
  }

  void mappingFilter(String value) {
    denpasarList.clear();
    karangasemList.clear();
    bulelengList.clear();
    destinationList = mainList.where((destination) => destination.name.toLowerCase().contains(value.toLowerCase())).toList();
    for (int i = 0; i < destinationList.length; i++) {
      Datum destination = destinationList[i];

      if (destination.location == "Denpasar") {
        denpasarList.add(destination);
      }
      if (destination.location == "Karangasem") {
        karangasemList.add(destination);
      }
      if (destination.location == "Buleleng") {
        bulelengList.add(destination);
      }
    }
    update();
  }
}
