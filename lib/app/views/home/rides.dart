import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class RidesScreen extends StatefulWidget {
  const RidesScreen({super.key});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(17.43651663473276, 78.36680391051878),
    zoom: 15,
  );

  GoogleMapController? _mapController;

  Marker? _origin;
  Marker? _destination;

  final Set<Polyline> _polylines = {};

  // Put your restricted API key here
  static const String apiKey = 'AIzaSyDxt6Eb89DpAcAEyCya4bt_-vlTyR2WsDs';

  Future<void> _getDirections() async {
    if (_origin == null || _destination == null) return;

    final polylinePoints = PolylinePoints(apiKey: apiKey);

    final result = await polylinePoints.getRouteBetweenCoordinates(
      request: PolylineRequest(
        origin: PointLatLng(
          _origin!.position.latitude,
          _origin!.position.longitude,
        ),
        destination: PointLatLng(
          _destination!.position.latitude,
          _destination!.position.longitude,
        ),
        mode: TravelMode.driving,
      ),
    );

    debugPrint('Status: ${result.status}');
    debugPrint('Error: ${result.errorMessage}');
    debugPrint('Points: ${result.points.length}');

    if (result.points.isEmpty) return;

    final routePoints = result.points
        .map((e) => LatLng(e.latitude, e.longitude))
        .toList();

    setState(() {
      _polylines.clear();

      _polylines.add(
        Polyline(
          polylineId: const PolylineId('route'),
          points: routePoints,
          width: 6,
          color: Colors.blue,
        ),
      );
    });
  }

  void _setMarker(LatLng position) {
    setState(() {
      if (_origin == null || _destination != null) {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          position: position,
          infoWindow: const InfoWindow(title: 'Origin'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        );

        _destination = null;
        _polylines.clear();
      } else {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          position: position,
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        );

        _getDirections();
      }
    });
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: true,
        onMapCreated: (controller) {
          _mapController = controller;
        },
        onLongPress: _setMarker,
        markers: {
          if (_origin != null) _origin!,
          if (_destination != null) _destination!,
        },
        polylines: _polylines,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mapController?.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition),
          );
        },
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
