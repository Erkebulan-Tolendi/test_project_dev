import 'package:flutter/material.dart';
import 'package:test_project_it_dev/features/auth/ui/screens/login/mask_text_fild.dart';

class LoginPageAutorization extends StatefulWidget {
  @override
  _LoginPageAutorizationState createState() => _LoginPageAutorizationState();
}

class _LoginPageAutorizationState extends State<LoginPageAutorization> {
  final TextEditingController textController = TextEditingController();
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Авторизация"),
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
                  "Введите номер \n мобильного телефона",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  "Вам придет 4-значный код для \n подтверждения номера",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 170),
                child: MaskedTextField(
                  controller: textController,
                  mask: "+7 (###) ###-##-##",
                  hintText: "+7 (___) ___-__-__",
                  keyboardType: TextInputType.phone,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    phoneNumber = textController.text;
                    print('Phone number: $phoneNumber');
                  });
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