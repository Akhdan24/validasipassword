import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(home: validasipassword()));
}

class validasipassword extends StatefulWidget {
  const validasipassword({Key? key}) : super(key: key);

  @override
  State<validasipassword> createState() => _validasipasswordState();
}

class _validasipasswordState extends State<validasipassword> {
  final formKey = GlobalKey<FormState>();
  String password = '';
  String konfirmasiPassword = '';
  bool _obscureText = true;
  bool _obscureText1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          alignment: Alignment.topLeft,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildPassword(),
              SizedBox(height: 15),
              buildkonfirmasiPassword(),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPassword() => TextFormField(
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle:
              GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w400),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            password = value!;
          });
        },
        obscureText: _obscureText,
      );

  Widget buildkonfirmasiPassword() => TextFormField(
        obscureText: _obscureText1,
        autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          hintText: 'Konfirmasi Password',
          hintStyle:
              GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w400),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText1 = !_obscureText1;
              });
            },
            child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          ),
        ),
        // onSaved: (String? value){
        //   setState(() {
        //     password = value!;
        //   });
        // },
        validator: (String? konfirmasiPassword) {
          return (password != konfirmasiPassword)
              ? 'Password tidak sama'
              : null;
        },
      );
}
