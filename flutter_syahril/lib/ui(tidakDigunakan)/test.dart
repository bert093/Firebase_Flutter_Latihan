// import 'dart:ffi';
// import 'dart:js_util';
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class UserProfileForm extends StatefulWidget {
//   const UserProfileForm({super.key});

//   @override
//   _UserProfileFormState createState() => _UserProfileFormState();
// }

// class _UserProfileFormState extends State<UserProfileForm> {
//   // Controllers for text fields
//   final TextEditingController _namaController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _tlpnController = TextEditingController();
//   final TextEditingController _kota2Controller = TextEditingController();
//   final TextEditingController _pswdController = TextEditingController();

//   // Variables for other inputs
//   String _jenisKelamin = '';
//   String _pilihKota = '<pilih>';
//   bool _setuju = false;

//   @override
//   void dispose() {
//     // Clean up the controllers when the widget is disposed
//     _namaController.dispose();
//     _emailController.dispose();
//     _tlpnController.dispose();
//     _kota2Controller.dispose();
//     _pswdController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Form Pendaftaran'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             // Nama input
//             TextField(
//                 decoration: InputDecoration(labelText: 'Nama'),
//                 controller: _namaController,
//                 keyboardType: TextInputType.name),
//             // Email input
//             TextField(
//               decoration: InputDecoration(labelText: 'Email'),
//               controller: _emailController,
//               keyboardType: TextInputType.emailAddress,
//             ),
//             // Telepon input
//             TextField(
//               decoration: InputDecoration(labelText: 'Telepon'),
//               controller: _tlpnController,
//               keyboardType: TextInputType.phone,
//             ),
//             const SizedBox(height: 20),
//             // Jenis Kelamin selection
//             const Text('Jenis Kelamin',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             ListTile(
//               title: const Text('Pria'),
//               leading: Radio<String>(
//                 value: 'Pria',
//                 groupValue: _jenisKelamin,
//                 onChanged: (String? value) {
//                   setState(() {
//                     _jenisKelamin = value!;
//                   });
//                 },
//               ),
//             ),
//             ListTile(
//               title: const Text('Wanita'),
//               leading: Radio<String>(
//                 value: 'Wanita',
//                 groupValue: _jenisKelamin,
//                 onChanged: (String? value) {
//                   setState(() {
//                     _jenisKelamin = value!;
//                   });
//                 },
//               ),
//             ),
//             // Kota Terdekat selection
//             const Text('Kota Terdekat Tempat Tinggal',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             DropdownButton<String>(
//               value: _pilihKota,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _pilihKota = newValue!;
//                 });
//               },
//               items: <String>[
//                 '<pilih>',
//                 'Mataram',
//                 'Peraya',
//                 'Selong',
//                 'Tanjung',
//                 'Sumbawa',
//                 'Dompu',
//                 'Bima',
//                 'Di Luar NTB'
//               ].map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             // Telepon kota2
//             //const SizedBox(height: 20),
//             TextField(
//               controller: _kota2Controller,
//               decoration: InputDecoration(labelText: 'Tulis Kota diluar NTB'),
//             ),
//             const SizedBox(height: 20),
//             // Subscription checkbox
//             CheckboxListTile(
//               title: const Text('Saya setuju dengan peraturan yang berlaku'),
//               value: _setuju,
//               onChanged: (bool? value) {
//                 setState(() {
//                   _setuju = value!;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             // Submit button
//             ElevatedButton(
//               onPressed: () {
//                 // Handle form submission
//                 String nama = _namaController.text;
//                 String email = _emailController.text;
//                 String tlpn = _tlpnController.text;
//                 String jenisKel = _jenisKelamin;
//                 String kota = _pilihKota;
//                 String kota2 = _kota2Controller.text;
//                 bool setuju = _setuju;

//                 // data yang dimasukan, akan dicetak pada terminal untuk pengecekan
//                 print('Nama: $nama');
//                 print('Email: $email');
//                 print('Telepon: $tlpn');
//                 print('Jenis Kelamin: $jenisKel');
//                 print('Kota Terdekat: $kota');
//                 print('Kota Luar NTB: $kota2');
//                 print('Persetujuan: $setuju');

//                 // kita dapat tambahkan logika pada form  di dalam sini
//                 // pada contoh ini kita menampilkan data pada Dialog
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text('Profile Data'),
//                       content: SingleChildScrollView(
//                         child: ListBody(
//                           children: <Widget>[
//                             Text('Name: $nama'),
//                             Text('Email: $email'),
//                             Text('Telepon: $tlpn'),
//                             Text('Gender: $jenisKel'),
//                             Text('Kota Terdekat: $kota'),
//                             Text('Kota Luar NTB: $kota2'),
//                             Text('Persetujuan: $setuju'),
//                           ],
//                         ),
//                       ),
//                       actions: <Widget>[
//                         TextButton(
//                           child: Text('OK'),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }