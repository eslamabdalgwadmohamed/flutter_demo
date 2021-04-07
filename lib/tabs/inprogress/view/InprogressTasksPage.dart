import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mostadam_flutter/constants/AppCorors.dart';
import 'package:mostadam_flutter/constants/AssetsConstants.dart';
import 'package:mostadam_flutter/core/base/BlocBase.dart';
import 'package:mostadam_flutter/tabs/available/bloc/AvailableTasksBloc.dart';
import 'package:mostadam_flutter/tabs/available/view/MapPage.dart';
import 'package:mostadam_flutter/tabs/inprogress/bloc/InprogressTasksBloc.dart';
import 'package:mostadam_flutter/tabs/model/Tasks.dart';

class InProgressTasksPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InProgressTasksState();
}

class InProgressTasksState extends State<InProgressTasksPage> {
  List<Items> list = List();
  InProgressTasksBloc _inProgressTasksBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _inProgressTasksBloc = BlocProvider.of<InProgressTasksBloc>(context);
    _inProgressTasksBloc.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _inProgressTasksBloc.successSubject,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(top: 16, left: 18, right: 18),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Image.asset(
                                IC_FILTER,
                                scale: 3.5,
                              )),
                          SizedBox(
                            width: 8.0,
                          ),
                          InkWell(
                              onTap: () {
                                displayBottomSheet(context);
                              },
                              child: Image.asset(
                                IC_SORT,
                                scale: 3.5,
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                _inProgressTasksBloc.viewMapSubject.sink
                                    .add(true);
                              },
                              child: Image.asset(
                                IC_SMALL_MAP,
                                scale: 3.5,
                              )),
                          SizedBox(
                            width: 8.0,
                          ),
                          InkWell(
                              onTap: () {
                                _inProgressTasksBloc.viewMapSubject.sink
                                    .add(false);
                              },
                              child: Image.asset(
                                IC_LIST,
                                scale: 3.5,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder(
                stream: _inProgressTasksBloc.viewMapStream,
                builder: (context, isViewList) {
                  if (isViewList.hasData && isViewList.data) {
                    return Expanded(child: MapPage(snapshot.data.value.items));
                  } else {
                    return Expanded(
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: ListView.builder(
                            itemCount: snapshot.data.value.items.length,
                            itemBuilder: (context, index) {
                              return cardItem(snapshot.data.value.items[index]);
                            }),
                      ),
                    );
                  }
                },
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Container(
            child: Center(
              child: Text(snapshot.error),
            ),
          );
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: MAIN_COLOR,
              ),
            ),
          );
        }
      },
    );
  }

  Widget cardItem(Items item) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        elevation: 2,
        color: Colors.white,
        shadowColor: Colors.grey.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "رقم الطلب",
                          style: TextStyle(color: MAIN_COLOR, fontSize: 15),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          item.number,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      item.requestTypeName,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "المالك",
                          style: TextStyle(color: MAIN_COLOR, fontSize: 15),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          item.ownerDetails?.fullName,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),

                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Text(
                                "المدينة",
                                style: TextStyle(color: MAIN_COLOR, fontSize: 15),
                              ),

                              SizedBox(width: 8.0),
                              Text(
                                item.getCityName(),
                                style: TextStyle(color: Colors.black, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Text(
                                "الحي",
                                style: TextStyle(color: MAIN_COLOR, fontSize: 15),
                              ),

                              SizedBox(width: 8.0),

                              Text(
                                item.getQuarterName(),
                                style: TextStyle(color: Colors.black, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.0),

                    Row(
                      children: [
                        Text(
                          "الحالة",
                          style: TextStyle(color: MAIN_COLOR, fontSize: 15),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          item.requestStatusName,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    MAP_ICON,
                    scale: 3,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        backgroundColor: MAIN_COLOR,
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlatButton.icon(
                      onPressed: () {},
                      icon: ImageIcon(AssetImage(IC_SORT_TITLE,), color: Colors.white,),
                      label: Text("ترتيب", style: TextStyle(fontSize: 16, color: Colors.white),)),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton.icon(
                        onPressed: () {
                          _inProgressTasksBloc.sortTypeId = 1;
                          _inProgressTasksBloc.getTasks();
                          Navigator.pop(context);
                        },
                        icon: ImageIcon(AssetImage(IC_ARROW_UP,), color: Colors.white,),
                        label: Text("من الأقدم إلي الأحدث", style: TextStyle(fontSize: 16, color: Colors.white),)),
                  ),
                  Divider(
                    color: Colors.white,
                    height: 0.5,
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton.icon(
                        onPressed: () {
                          _inProgressTasksBloc.sortTypeId = 2;
                          _inProgressTasksBloc.getTasks();
                          Navigator.pop(context);
                        },
                        icon: ImageIcon(AssetImage(I_ARROW_DOWN,), color: Colors.white,),
                        label: Text("من الأحدث إلي الأقدم", style: TextStyle(fontSize: 16, color: Colors.white),)),
                  ),
                  Divider(
                    color: Colors.white,
                    height: 0.5,
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton.icon(
                        onPressed: () {
                          _inProgressTasksBloc.sortTypeId = 3;
                          _inProgressTasksBloc.getTasks();
                          Navigator.pop(context);
                        },
                        icon: ImageIcon(AssetImage(IC_SORT_DESC,), color: Colors.white,),
                        label: Text("من الأعلي قيمة للفحص للأقل", style: TextStyle(fontSize: 16, color: Colors.white),)),
                  ),
                  Divider(
                    color: Colors.white,
                    height: 0.5,
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton.icon(
                        onPressed: () {
                          _inProgressTasksBloc.sortTypeId = 4;
                          _inProgressTasksBloc.getTasks();
                          Navigator.pop(context);
                        },
                        icon: ImageIcon(AssetImage(IC_SORT_ASSENDEING,), color: Colors.white,),
                        label: Text("من الأقل قيمة للفحص للأعلي", style: TextStyle(fontSize: 16, color: Colors.white),)),
                  ),
                ],
              ),
            ),
          );
        });
  }

}
