import 'package:flutter/material.dart';
import 'package:mysample/service/session_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // cek sesi yang tersimpan
  Future<void> checkSession() async {
    await Future.delayed(Duration(seconds: 3));

    // buat variabel untuk data status login
    final isLogin = await SessionService.isLogin();
    if (!mounted) return;

    // cek apakah sudah login atau belum
    if (isLogin) {
      // jika sudah login, pindah ke halaman home
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // jika belum login, pindah ke halaman login
      Navigator.pushReplacementNamed(context, '/login');
    }
  }


  @override
  void initState() {
    super.initState();
    checkSession();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.network(
              width: 100,
              height: 100,
              'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
