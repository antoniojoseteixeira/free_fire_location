import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_fire_location/map/view/cubit/map_cubit.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        body: BlocBuilder<MapCubit, MapState>(
          builder: ((context, state) {
            if (state is MapLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is MapError) {
              return const Center(
                child: Text('Error'),
              );
            }

            if (state is MapSuccess) {
              return Center(
                  child: ListView.builder(
                itemCount: state.fireInfo.coordinatesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            state.fireInfo.coordinatesList[index].latitude
                                .toString(),
                          ),
                          Text(state.fireInfo.coordinatesList[index].longitude
                              .toString()),
                          Text(state
                              .fireInfo.coordinatesList[index].satelliteName
                              .toString()),
                          Text(state.fireInfo.coordinatesList[index].date
                              .toString()),
                        ],
                      )
                    ],
                  );
                },
              ));
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ),
      ),
    );
  }
}
