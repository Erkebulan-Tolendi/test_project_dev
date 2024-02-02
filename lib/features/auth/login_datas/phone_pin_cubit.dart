import 'package:bloc/bloc.dart';

class PhonePinCubit extends Cubit<bool> {
  PhonePinCubit() : super(false);

  void checkPhonePin(String pin) {
    emit(true);

    Future.delayed(Duration(seconds: 2), () {
      if (pin.isNotEmpty && pin.length == 4) {
        emit(true);
      } else {
        emit(false);
      }
    });
  }
}
