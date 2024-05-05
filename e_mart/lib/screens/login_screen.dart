import 'package:country_picker/country_picker.dart';
import 'package:e_mart/components/my_text.dart';
import 'package:e_mart/components/my_text_field.dart';
import 'package:e_mart/utils/image_url.dart';
import 'package:e_mart/utils/my_theme.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _countryCountroller = TextEditingController();
  final TextEditingController _phoneCountroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ///Top Image static
            Image.asset(
              ImageUrl.parcel,
              height: size.height * 0.3,
              width: double.maxFinite,
            ),
            const SizedBox(
              height: 20,
            ),

            ///Text Your Phone Number
            const MyText(
              'Your Phone Number',
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                  color: MyTheme.primary, fontSize: 22, fontFamily: "Roboto"),
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: _countryCountroller,
              label: 'Country/Region',
              isReadOnly: true,
              suffixWidget: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: MyTheme.primary,
                ),
              ),
              onTap: () {
                showCountryPicker(
                  context: context,
                  countryListTheme: CountryListThemeData(
                      flagSize: 30, bottomSheetHeight: size.height * 0.8),
                  showPhoneCode:
                      true, // optional. Shows phone code before the country name.
                  onSelect: (Country country) {
                    print('Select country: ${country.displayName}');
                    _countryCountroller.text =
                        "${country.name}(+${country.phoneCode})";
                  },
                );
              },
            ),
            MyTextField(
              controller: _phoneCountroller,
              label: 'Enter Phone Number',
              textInputType: TextInputType.number,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
