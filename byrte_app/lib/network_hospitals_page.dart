import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NetworkHospitalsPage extends StatefulWidget {
  const NetworkHospitalsPage({super.key});

  @override
  State<NetworkHospitalsPage> createState() => _NetworkHospitalsPageState();
}

class _NetworkHospitalsPageState extends State<NetworkHospitalsPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(
    17.3850,
    78.4867,
  ); // Example: Hyderabad center

  final List<Map<String, dynamic>> _hospitals = [
    {"name": "Apollo Hospital", "lat": 17.411, "lng": 78.438},
    {"name": "KIMS Hospital", "lat": 17.448, "lng": 78.390},
    {"name": "Rainbow Hospital", "lat": 17.414, "lng": 78.457},
    {"name": "Yashoda Hospital", "lat": 17.437, "lng": 78.499},
  ];

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    for (var hospital in _hospitals) {
      _markers.add(
        Marker(
          markerId: MarkerId(hospital["name"]),
          position: LatLng(hospital["lat"], hospital["lng"]),
          infoWindow: InfoWindow(title: hospital["name"]),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFFF6600);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Network Hospitals',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _center, zoom: 12.0),
            onMapCreated: (controller) {
              mapController = controller;
            },
            markers: _markers,
            zoomControlsEnabled: false,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
          ),

          // Search Bar
          Positioned(
            top: 10,
            left: 12,
            right: 12,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),

          // Bottom Map/List Toggle (optional)
          Positioned(
            bottom: 20,
            left: 50,
            right: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBottomButton(Icons.map, "Map"),
                _buildBottomButton(Icons.list, "List"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFF6600),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.green.shade800, size: 22),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.green.shade800,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
