import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_it_dev/features/auth/login_datas/phone_pin_cubit.dart';
import 'package:test_project_it_dev/features/auth/ui/screens/login/city_selection_page.dart';
import 'package:test_project_it_dev/features/auth/ui/screens/login/pinput.dart';

class LoginPageRegistration extends StatelessWidget {
  final String phonenumber;

  LoginPageRegistration({required this.phonenumber});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhonePinCubit(),
      child: _LoginPageRegistrationView(phonenumber: phonenumber),
    );
  }
}

class _LoginPageRegistrationView extends StatefulWidget {
  final String phonenumber;

  _LoginPageRegistrationView({required this.phonenumber});

  @override
  _LoginPageRegistrationViewState createState() =>
      _LoginPageRegistrationViewState();
}

class _LoginPageRegistrationViewState
    extends State<_LoginPageRegistrationView> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Регистрация"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0, bottom: 4.0),
                    child: Text(
                      "Мы отправили Вам 4 значный \n код введите его в поле",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "на номер ",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          widget.phonenumber,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.orange,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 110.0),
                    child: PinputExample(
                      onPinEntered: (pin) {
                        context.read<PhonePinCubit>().checkPhonePin(pin);
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final pin = textController.text;
                      context.read<PhonePinCubit>().checkPhonePin(pin);
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CitySelectionPage(),
                            ),
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 180.0),
                        child: Row(
                          children: [
                            Text(
                              'Далее',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.orange.shade100,
                              ),
                            ),
                            const SizedBox(
                              width: 150,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<PhonePinCubit, bool>(
            builder: (context, isCheckingPin) {
              if (isCheckingPin) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
