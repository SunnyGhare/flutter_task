import 'package:flutter_task/models/AvailabilityModel.dart';
import 'package:flutter_task/models/slots_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../api/api_manager.dart';
import '../repositories/auth_repository.dart';

class SlotController extends GetxController
{

  AuthRepository authRepository = AuthRepository(APIManager());

  RxBool selectedValue = false.obs;
  RxString selectedSlotId = "".obs;

  RxString formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;

  RxList<Slots> slotList = <Slots>[].obs;
  RxList<Availability> availabilityList = <Availability>[].obs;

  Future<bool> getSlotsApi() async {
    try {
      SlotsModel slotsModel = await authRepository.selectSlotApiCall(date:formattedDate.toString());
      if (slotsModel.slots!.isNotEmpty) {
        slotList.clear();
        for (var element in slotsModel.slots!) {
          slotList.add(element);
        }
        return true;
      } else {
        slotList.clear();
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> getAvailabilityApi(String type) async {
    try {
      AvailabilityModel availabilityModel = await authRepository.availabilityApiCall(date:formattedDate.toString(), slotId: selectedSlotId.value, type:type);
      if (availabilityModel.availability!.isNotEmpty) {
        availabilityList.clear();
        for (var element in availabilityModel.availability!) {
          availabilityList.add(element);
        }
        return true;
      } else {
        availabilityList.clear();
        return false;
      }
    } catch (e) {
      return false;
    }
  }

}