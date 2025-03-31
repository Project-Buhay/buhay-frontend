import 'package:buhay/system_ui/controller/constituent/map_interactive_search.dart';
import 'package:buhay/system_ui/controller/constituent/map_manual_search_controller.dart';
// import 'package:buhay/system_ui/models.dart';
import 'package:flutter/material.dart';

class OnTheWayPage extends StatefulWidget {
  final int requestId;
  final MapManualSearchController? mapManualSearchController;
  final MapInteractiveSearchController? mapInteractiveSearchController;
  final Map<String, dynamic> response;
  const OnTheWayPage({
    super.key,
    required this.requestId,
    this.mapManualSearchController,
    this.mapInteractiveSearchController,
    required this.response,
  });
  @override
  State<OnTheWayPage> createState() => _OnTheWayPageState();
}

class _OnTheWayPageState extends State<OnTheWayPage> {
  late int requestId;
  late MapManualSearchController? mapManualSearchController;
  late MapInteractiveSearchController? mapInteractiveSearchController;

  @override
  void initState() {
    super.initState();

    requestId = widget.requestId;
    mapManualSearchController = widget.mapManualSearchController;
    mapInteractiveSearchController = widget.mapInteractiveSearchController;

    print(widget.response);
    print(widget.response["locations"]);

    if (mapManualSearchController != null) {
      sendDataUsingManual();
    } else {
      sendDataUsingInteractive();
    }
  }

  void sendDataUsingManual() async {
    var request = await mapManualSearchController!.saveRouteParsing(requestId);
    await mapManualSearchController!.mapResultsController.mapResultsApi
        .saveRouteRequest(request);
  }

  void sendDataUsingInteractive() async {
    var request =
        await mapInteractiveSearchController!.saveRouteParsing(requestId);
    await mapInteractiveSearchController!.mapResultsController.mapResultsApi
        .saveRouteRequest(request);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Request Summary'),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black)),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                  child: Text(
                "Request ID: ${widget.requestId}",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              )),
              Center(
                  child: Text(
                "Rescuer is on the Way!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              )),
              if (widget.response["locations"] != null)
                ...List<Widget>.from(
                    widget.response["locations"].asMap().entries.map((entry) {
                  int index = entry.key;
                  var location = entry.value;
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location ${index + 1}:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          location.toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  );
                })),
            ],
          ),
        ),
      ),
    );
  }
}
