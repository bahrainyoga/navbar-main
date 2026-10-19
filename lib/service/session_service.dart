import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  // simpan session
  // static untuk bisa mengakses method dari luar
  static Future<void> login(String username) async {
    //membuat objek shared preference
    final presf = await SharedPreferences.getInstance();
    // mengatur user sudah login
    await presf.setBool('isLogin', true);
    // dipake nanti untuk menentukan login (islogin ? home : login)
    // menyimpan akun
    await presf.setString('username', username);
  }

  // cek apakah sudah login
  static Future<bool> isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin') ?? false;
  }

  // sek sudah login apa belom
  static Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? '';
  }

  // Logout - hapus semua data sesi
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    //hapus data session
    await prefs.remove('islogin');
    await prefs.remove('username');
  }

  //ambil username
}
