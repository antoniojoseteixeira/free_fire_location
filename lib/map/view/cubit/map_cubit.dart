import 'package:bloc/bloc.dart';
import 'package:free_fire_location/map/data/repositories/map_repository.dart';
import 'package:meta/meta.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final _mapRepository = MapRepository();
  MapCubit() : super(MapInitial());

  void getMapInfo() async {
    emit.call(MapLoading());
    try {
      final fireInfo = await _mapRepository.getFireLocations();
      emit.call(MapSuccess(fireInfo: fireInfo));
    } catch (e) {
      emit.call(MapError());
    }
  }
}
