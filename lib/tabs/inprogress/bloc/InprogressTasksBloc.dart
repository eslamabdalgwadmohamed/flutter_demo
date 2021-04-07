import 'package:mostadam_flutter/constants/TaskConstants.dart';
import 'package:mostadam_flutter/core/base/ApiBlocMixin.dart';
import 'package:mostadam_flutter/core/base/BlocBase.dart';
import 'package:mostadam_flutter/model/ErrorModel.dart';
import 'package:mostadam_flutter/tabs/available/model/AvailableTasksRequest.dart';
import 'package:mostadam_flutter/tabs/available/repo/AvailableTasksRepo.dart';
import 'package:mostadam_flutter/tabs/model/Tasks.dart';
import 'package:rxdart/rxdart.dart';

class InProgressTasksBloc extends BlocBase with APIBlocMixin<Tasks, ErrorModel>{

  BehaviorSubject<bool> viewMapSubject = BehaviorSubject.seeded(false);
  Stream<bool> get viewMapStream => viewMapSubject.stream;
  int sortTypeId = 2;

  getTasks() async {
    AvailableTasksRequest request = AvailableTasksRequest();
    request.pageNumber = 1;
    request.pagesize = 20;
    request.sortTypeId = this.sortTypeId;
    request.requestStatusLst = IN_PROGRESS_STATUS;
    request.requestTypeLst = IN_PROGRESS_TYPE;

    var model = await TasksRepo().getTasks(request.toJson());
    if (model is Tasks) {
      super.successSubject.sink.add(model);
    }else{
      super.successSubject.sink.addError(model);
      super.errorSubject.sink.addError(model);
    }
  }


  @override
  void dispose() {

  }

}