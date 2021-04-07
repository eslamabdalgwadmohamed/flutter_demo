import 'package:mostadam_flutter/constants/TaskConstants.dart';
import 'package:mostadam_flutter/core/base/ApiBlocMixin.dart';
import 'package:mostadam_flutter/core/base/BlocBase.dart';
import 'package:mostadam_flutter/model/ErrorModel.dart';
import 'package:mostadam_flutter/tabs/available/model/AvailableTasksRequest.dart';
import 'package:mostadam_flutter/tabs/available/repo/AvailableTasksRepo.dart';
import 'package:mostadam_flutter/tabs/model/Tasks.dart';
import 'package:rxdart/rxdart.dart';

class CompletedTasksBloc extends BlocBase with APIBlocMixin<Tasks, ErrorModel>{

  BehaviorSubject<bool> viewMapSubject = BehaviorSubject.seeded(false);

  Stream<bool> get viewMapStream => viewMapSubject.stream;
  int sortTypeId = 2;

  getTasks() async {
    AvailableTasksRequest request = AvailableTasksRequest();
    request.pageNumber = 1;
    request.pagesize = 20;
    request.sortTypeId = 2;
    request.requestStatusLst = COMPLETED_STATUS;
    request.requestTypeLst = COMPLETED_TYPE;

    var model = await TasksRepo().getTasks(request.toJson());
    if (model is Tasks) {
      super.successSubject.sink.add(model);
    }else{
      super.errorSubject.sink.addError(model);
    }
  }


  @override
  void dispose() {

  }

}