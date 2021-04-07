import 'package:flutter/material.dart';
import 'package:mostadam_flutter/constants/AppCorors.dart';
import 'package:mostadam_flutter/tabs/available/view/AvailableTasksPage.dart';
import 'package:mostadam_flutter/tabs/completed/view/CompletedTasksPage.dart';
import 'package:mostadam_flutter/tabs/inprogress/view/InprogressTasksPage.dart';

class TabPage extends StatefulWidget {
  static final String tabPageRoute = "/SplashToTabPage";
  int index = 0;

  @override
  State<StatefulWidget> createState() => TabState();
}

class TabState extends State<TabPage> with SingleTickerProviderStateMixin {
  TabController tabController;

  BorderRadius rightRadius, leftRadius, centerRadius;
  BorderRadius selectedRadius;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);

    rightRadius = BorderRadius.only(
        topRight: Radius.circular(15), bottomRight: Radius.circular(15));

    leftRadius = BorderRadius.only(
        topLeft: Radius.circular(15), bottomLeft: Radius.circular(15));

    centerRadius = BorderRadius.only(
        topLeft: Radius.circular(0), bottomLeft: Radius.circular(0));

    selectedRadius = rightRadius;

    tabController.addListener(() {
      widget.index = tabController.index;

      if (widget.index == 0) {
        setState(() {
          selectedRadius = rightRadius;
        });
      } else if (widget.index == 1) {
        setState(() {
          selectedRadius = centerRadius;
        });
      } else if (widget.index == 2) {
        setState(() {
          selectedRadius = leftRadius;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MAIN_COLOR,
        title: Text("الطلبات"),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: widget.index,
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Padding(
                padding: const EdgeInsets.only(left:16.0, right: 16.0),
                child: AppBar(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(15), right: Radius.circular(15)),
                    ),
                    elevation: 2,

                    bottom: TabBar(
                      controller: tabController,
                      unselectedLabelColor: MAIN_DARK_COLOR,
                      labelColor: Colors.white,
                      indicatorColor: Colors.transparent,
                      labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      indicator: ShapeDecoration(
                          shape:
                              RoundedRectangleBorder(borderRadius: selectedRadius),
                          color: MAIN_DARK_COLOR),
                      tabs: [
                        Tab(
                          child: Text(
                            "المتاحة",
                          ),
                        ),
                        Tab(
                          child: Text("قيد العمل"),
                        ),
                        Tab(
                          child: Text("المكتملة"),
                        ),
                      ],
                    )),
              ),
            ),
            body: TabBarView(
              controller: tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                AvailableTasksPage(),
                InProgressTasksPage(),
                CompletedTasksPage()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
