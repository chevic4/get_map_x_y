import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/service_entity.dart';
import 'maps_screen_state.dart';

class ModelCubit extends Cubit<ModelState> {
  final _serviceModel = ServiceEntity();
  ModelCubit()
      : super(ModelState(
            okData: false, x: '', y: '', url: '', zoom: 19, zoomActive: false));

  Future<void> setLatitude(String valueX) async {
    _serviceModel.latitude = valueX;
  }

  Future<void> setLongitude(String valueY) async {
    _serviceModel.longitude = valueY;
  }

  void setZoom(double valueZoom) {
    _serviceModel.zoom = valueZoom.toInt();
    getStateForInfo();
  }

  double getZoom() {
    return _serviceModel.zoom.toDouble();
  }

  void getStateForInfo() {
    bool updateGood = _serviceModel.updateData();
    var newState = ModelState(
      okData: updateGood,
      x: _serviceModel.x,
      y: _serviceModel.y,
      url: _serviceModel.url,
      zoom: _serviceModel.zoom,
      zoomActive: true,
    );
    emit(newState);
  }
}
