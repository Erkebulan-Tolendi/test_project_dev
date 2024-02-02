import 'package:flutter/material.dart';
import 'package:test_project_it_dev/features/auth/ui/screens/login/pinput.dart';

class LoginPageRegistration extends StatefulWidget {
  @override
  _LoginPageRegistrationState createState() => _LoginPageRegistrationState();
}

class _LoginPageRegistrationState extends State<LoginPageRegistration> {
  final TextEditingController textController = TextEditingController();
  String phonePin = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Регистрация"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0, bottom: 4.0),
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
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  "на номер +3445345345",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 120.0),
                child: PinputExample(
                  onPinEntered: (pin) {
                    phonePin = pin;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(phonePin);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 140.0),
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
                          width: 110,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ), // Place the icon after the text
                      ],
                    ),
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
