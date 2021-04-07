import 'package:mostadam_flutter/core/base/BaseModel.dart';
import 'package:mostadam_flutter/core/network/api_constants.dart';
import 'package:mostadam_flutter/core/network/network.dart';
import 'package:mostadam_flutter/model/ErrorModel.dart';
import 'package:mostadam_flutter/tabs/model/Tasks.dart';

class TasksRepo{

  Future<BaseModel> getTasks(Map<String, dynamic> parms) async {
    try {
      var response =
      await Network().performRequest(AVAILABLE_TASKS, parms, ServerMethods.POST);
      return Tasks.fromJson(response.data);
    } catch (e) {
      return ErrorModel.fromJson(e);
    }
  }
}
