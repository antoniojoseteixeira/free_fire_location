import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_fire_location/map/view/cubit/map_cubit.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(builder: ((context, state) {
      return MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue),
        home: Scaffold(
          body: SafeArea(
            child: Center(
                child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("MAP"),
                        ElevatedButton(
                            onPressed: () async {
                              BlocProvider.of<MapCubit>(context).getMapInfo();
                            },
                            child: Text('$state')),
                      ],
                    ))),
          ),
        ),
      );
    }));
  }
}
