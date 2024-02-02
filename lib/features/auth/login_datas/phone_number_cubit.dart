import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneNumberCubit extends Cubit<bool> {
  PhoneNumberCubit() : super(false);

  Future<void> checkPhoneNumber(String phoneNumber) async {
    emit(true);
    await Future.delayed(Duration(seconds: 2));
    if (phoneNumber.isNotEmpty) {
      emit(false);
    } else {
      print('Phone number is not valid');
    }
  }
}
