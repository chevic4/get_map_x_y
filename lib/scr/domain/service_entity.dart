import 'dart:math';
import 'entity.dart';

const polUrl =
    'https://core-carparks-renderer-lots.maps.yandex.net/maps-rdr-carparks/tiles?l=carparks&';

class ServiceEntity {
  final ModelEntity _modelEntity = ModelEntity(
      latitude: '55.750626',
      longitude: '37.597664',
      x: '',
      y: '',
      url: '$polUrl=316898&y=164368&z=19&scale=1&lang=ru_RU');
  int _zoom = 19;

  set zoom(int value) => _zoom = _chekZoom(value);
  set latitude(String value) => _modelEntity.latitude = value;
  set longitude(String value) => _modelEntity.longitude = value;
  int get zoom => _zoom;
  String get x => _modelEntity.x;
  String get y => _modelEntity.y;
  String get latitude => _modelEntity.latitude;
  String get longitude => _modelEntity.longitude;
  String get url => _modelEntity.url;

  int _chekZoom(int value) {
    if (value < 10) {
      return 10;
    }
    if (value > 25) {
      return 25;
    } else {
      return value;
    }
  }

  void _upDateUrlXY() {
    double latitude = double.parse(_modelEntity.latitude);
    double longitude = double.parse(_modelEntity.longitude);

    String ur =
        _computeUrlXY(funclat: latitude, funclon: longitude, zoom: zoom);
    _modelEntity.url = '$polUrl$ur';
  }

  bool updateData() {
    double dataLatitude = double.parse(latitude);
    double dataLongitude = double.parse(longitude);

    if (dataLatitude < -90 ||
        dataLatitude > 90 ||
        dataLongitude < -180 ||
        dataLongitude > 180) {
      return false;
    } else {
      _upDateUrlXY();
      return true;
    }
  }

  String _computeUrlXY(
      {required double funclat, required double funclon, required int zoom}) {
    const double eFunc = 0.0818191908426;
    double pFunc = pow(2, zoom + 8) / 2;
    double bFunc = pi * funclat / 180;
    double yFunc = (1 - eFunc * sin(bFunc)) / (1 + eFunc * sin(bFunc));
    double oFunc = tan((pi / 4) + (bFunc / 2)) * pow(yFunc, eFunc / 2);
    double cacheX = (pFunc * (1 + (funclon / 180))) / 256;
    int resX = cacheX.floor();
    double cacheY = (pFunc * (1 - (log(oFunc) / pi))) / 256;
    int resY = cacheY.floor();
    _modelEntity.x = resX.toString();
    _modelEntity.y = resY.toString();
    String getU = 'x=$resX&y=$resY&z=$zoom&scale=1&lang=ru_RU';
    return '$polUrl$getU';
  }
}
