import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mostadam_flutter/constants/AppCorors.dart';
import 'package:mostadam_flutter/constants/AssetsConstants.dart';
import 'package:mostadam_flutter/tabs/available/bloc/AvailableTasksBloc.dart';
import 'package:mostadam_flutter/tabs/model/Tasks.dart';

class MapPage extends StatefulWidget {
  List<Items> tasks;

  MapPage(this.tasks);

  @override
  State<StatefulWidget> createState() => MapState();
}

class MapState extends State<MapPage> {
  Set<Marker> _markers = {};
  BitmapDescriptor _mapMarker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCustomMarker();
  }

  void displayBottomSheet(BuildContext context, Items item) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        backgroundColor: MAIN_COLOR,
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height / 2.5,
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.requestTypeName,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          flex: 4,
                          child: Text(
                            "رقم الطلب",
                            style: TextStyle(fontSize: 16,color: Colors.white),
                          )),
                      Expanded(
                          flex: 6,
                          child: Text(item.number,
                              style: TextStyle(fontSize:16 ,color: Colors.white)))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.white,
                    height: 0.5,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          flex: 4,
                          child: Text("تكلفة الطلب",
                              style: TextStyle(color: Colors.white))),
                      Expanded(
                          flex: 6,
                          child: Text("${item.getCost()}رس  ",
                              style: TextStyle(color: Colors.white)))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.white,
                    height: 0.5,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  btnDetails(),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers,
          scrollGesturesEnabled: true,
          initialCameraPosition: CameraPosition(
              target: LatLng(
                  widget.tasks.first.getLat(), widget.tasks.first.getLang()),
              zoom: 15),
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      widget.tasks.forEach((e) {
        _markers.add(Marker(
          markerId: MarkerId("${e.number}"),
          position: LatLng(e.getLat(), e.getLang()),
          icon: _mapMarker,
          onTap: () => displayBottomSheet(context, e),
        ));
      });
    });
  }

  void setCustomMarker() async {
    _mapMarker =
        await BitmapDescriptor.fromAssetImage(ImageConfiguration(), IC_MARKER);
  }

  Widget btnDetails(){
    return TextButton(
        child: Text(
            "تفاصيل الطلب",
            style: TextStyle(fontSize: 16, color: Colors.white)
        ),
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 80, right: 80, top: 10, bottom: 10)),
            foregroundColor: MaterialStateProperty.all<Color>(MAIN_DARK_COLOR),
            backgroundColor: MaterialStateProperty.all<Color>(MAIN_DARK_COLOR),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(width: 0,color: Colors.transparent)
                )
            )
        ),
        onPressed: () => null
    );
  }
}
