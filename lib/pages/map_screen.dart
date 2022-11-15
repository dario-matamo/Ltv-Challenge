import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ltv_flutter_challenge/services/map_services.dart';

import '../widgets/drawer_list.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController googleMapController;
  //Initial position is the Empire State Building
  final CameraPosition _initialCameraPosition =
      const CameraPosition(target: LatLng(40.748817, -73.985428), zoom: 16);
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
        centerTitle: true,
      ),
      drawer: const Drawer(
        child: ListViewDrawer(),
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        markers: markers,
        mapToolbarEnabled: false,
        mapType: MapType.terrain,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      //Button to load user location
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Position position = await MapServices.determinePosition();
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 16),
            ),
          );
          markers.add(
            Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude),
            ),
          );
          //Load the map with the current location
          setState(() {});
        },
        child: const Icon(Icons.location_searching_rounded),
      ),
    );
  }
}
