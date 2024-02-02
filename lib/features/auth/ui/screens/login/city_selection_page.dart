import 'package:flutter/material.dart';

class CitySelectionPage extends StatefulWidget {
  @override
  _CitySelectionPageState createState() => _CitySelectionPageState();
}

class _CitySelectionPageState extends State<CitySelectionPage> {
  String? _selectedCity;
  final List<String> _cities = ['Алматы', 'Нур-Султан', 'Шымкент', 'Тараз'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Регистрация"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                'Выберите ваш город',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 120),
              Container(
                width: 500,
                child: DropdownButton<String>(
                  value: _selectedCity,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCity = newValue;
                    });
                  },
                  items: _cities.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 160),
              ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
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
