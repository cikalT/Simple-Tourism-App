import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/base/base_controller.dart';
import 'package:tourism_app/models/destinations.dart';

class DetailController extends BaseController {
  Datum? destinations;

  bool isLiked = false;

  @override
  onInit() async {
    // init here
    super.onInit();
  }

  @override
  onReady() async {
    isLoading = true;
    update();

    //next cod
    destinations = screenArguments?.dynamicData;
    checkSavedFavorite(destinations);

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

  void saveFavorite(Datum? destinations) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('destination', destinations?.name ?? '');

    checkSavedFavorite(destinations);
  }

  void checkSavedFavorite(Datum? destinations) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? fav = prefs.getString('destination');

    if (fav == destinations?.name) {
      isLiked = true;
    }
    update();
  }

  void removeFavorite(Datum? destinations) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('destination');
    isLiked = false;
    update();
  }
}
