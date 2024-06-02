import 'dart:developer';

import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:translation_test/common/google_maps_theme.dart';
import 'package:translation_test/common/text_styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 16,
  );
  late List<MarkerData> _customMarkers;
  late List<MarkerData> _customMarkers1;
  bool toggle = false;

  var controller = TextEditingController();
  final locations = const [
    LatLng(37.4279613358066, -122.085749655962),
    LatLng(37.43096133580664, -122.082749655962),
    LatLng(37.42896133580672, -122.083749655962),
    LatLng(37.42996133580680, -122.084749655962),
    LatLng(37.42696133580690, -122.086749655962),
  ];

  @override
  void initState() {
    super.initState();
    _customMarkers = [
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-1'), position: locations[0]),
          child: _customMarker2()),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-5'), position: locations[4]),
          child: _customMarker2()),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-2'), position: locations[1]),
          child: _customMarker2()),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-3'), position: locations[2]),
          child: _customMarker2()),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-4'), position: locations[3]),
          child: _customMarker2()),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-5'), position: locations[4]),
          child: _customMarker2()),
    ];
    _customMarkers1 = [
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-1'), position: locations[0]),
          child: _customMarker3('10.3 mn p')),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-5'), position: locations[4]),
          child: _customMarker3('11.3 mn p')),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-2'), position: locations[1]),
          child: _customMarker3('12.3 mn p')),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-3'), position: locations[2]),
          child: _customMarker3('13.3 mn p')),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-4'), position: locations[3]),
          child: _customMarker3('14.3 mn p')),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-5'), position: locations[4]),
          child: _customMarker3('10.3 mn p')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [googleMap(), topRow(), bottomWidget(context)],
    ));
  }

  Transform bottomWidget(BuildContext context) {
    return Transform.translate(
      offset: Offset(14, MediaQuery.of(context).size.height * 0.75),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(mainAxisSize: MainAxisSize.min, children: [
              GestureDetector(
                onTap: () {
                  showMenuPopup(context);
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.layers,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.near_me_outlined,
                  color: Colors.white,
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(right: 32.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'List of variants',
                      style: TestTheme.setTextStyle(
                          style: TestTheme.w400f14, color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ]),
    );
  }

  Padding topRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 44.0, horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Saint Petersburg',
                    style: TestTheme.setTextStyle(style: TestTheme.w500f14),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: const Icon(Icons.tune),
          )
        ],
      ),
    );
  }

  googleMap() {
    return CustomGoogleMapMarkerBuilder(
      customMarkers: !toggle ? _customMarkers : _customMarkers1,
      builder: (p0, markers) {
        return GoogleMap(
          style: style,
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          markers: markers ?? {},
          zoomControlsEnabled: false,
        );
      },
    );
  }

  _customMarker2() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10)),
      ),
      child: const Center(
          child: Icon(
        Icons.door_front_door,
        color: Colors.white,
      )),
    );
  }

  _customMarker3(String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10)),
      ),
      child: Center(
          child: Text(
        text,
        textAlign: TextAlign.center,
      )),
    );
  }

  void showMenuPopup(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          0, MediaQuery.of(context).size.height * 0.535, 0, 0),
      popUpAnimationStyle: AnimationStyle(
        curve: Easing.emphasizedDecelerate,
        duration: const Duration(seconds: 2),
      ), // Position of the popup relative to the button
      items: const [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.verified_user_outlined),
              SizedBox(width: 6),
              Text('Cosy areas'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Icon(Icons.account_balance_wallet_outlined),
              SizedBox(width: 6),
              Text('Price'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Row(
            children: [
              Icon(Icons.account_balance_wallet_outlined),
              SizedBox(width: 6),
              Text('Infrastructure'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 4,
          child: Row(
            children: [
              Icon(Icons.layers),
              SizedBox(width: 6),
              Text('Without any layer'),
            ],
          ),
        ),
      ],
    ).then((value) {
      // Handle the selected value
      if (value != null) {
        log('Selected option: $value');
        toggle = !toggle;
        setState(() {});
      }
    });
  }
}
