part of 'map_cubit.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapSuccess extends MapState {
  final fireInfo;
  MapSuccess({required this.fireInfo});
}

class MapError extends MapState {}
