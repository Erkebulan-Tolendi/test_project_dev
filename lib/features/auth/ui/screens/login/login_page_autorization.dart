import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_it_dev/features/auth/login_datas/phone_number_cubit.dart';
import 'package:test_project_it_dev/features/auth/ui/screens/login/login_page_registration.dart';
import 'package:test_project_it_dev/features/auth/ui/screens/login/mask_text_fild.dart';

class LoginPageAutorization extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneNumberCubit(),
      child: BlocBuilder<PhoneNumberCubit, bool>(
        builder: (context, isCheckingPhoneNumber) {
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
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SafeArea(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 80.0, bottom: 4.0),
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
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
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
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 170),
                          child: MaskedTextField(
                            controller: textController,
                            mask: "+7 (###) ###-##-##",
                            hintText: "+7 (___) ___-__-__",
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final phoneNumber = textController.text;
                            BlocProvider.of<PhoneNumberCubit>(context)
                                .checkPhoneNumber(phoneNumber);
                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPageRegistration(
                                    phonenumber: phoneNumber,
                                  ),
                                ),
                              );
                            });
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                if (isCheckingPhoneNumber)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
