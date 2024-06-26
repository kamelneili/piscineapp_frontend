// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ar = {
    "notif": 'اشعارات',
    "help": 'مركز مساعدة',
    "backtohome": 'رجوع للصفحة رئيسية',
    "settings": "الإعدادات",
    "logout": 'خروج',
    "myaccount": 'حسابي',
    "appointement": 'مواعيدي',
    "this_should_be_translated": "يجب ترجمة هذا إلى العربية!",
    "myprofil": "الملف الشخصي",
    "name": "اسم",
    "email": "البريد الإلكتروني",
    "personalInformation": "معلومات شخصية",
    "country": 'بلاد',
    "zip": 'ترقيم بريدي',
    "city": 'مدينة',
    "adress": 'عنوان',
    "language": "تغيير اللغة",
  };
  static const Map<String, dynamic> en = {
    "language": "Change Language",
    "country": 'Country',
    "zip": 'Code Zip',
    "adress": 'Adress',
    "city": 'City',
    "personalInformation": " Personal information",
    "name": "Name",
    "email": "Email",
    "notif": "Notifications",
    "help": "Help center",
    "myprofil": "My Profil",
    "settings": "Settings",
    "logout": 'Log_out',
    "myaccount": "My Account",
    "appointement": 'My appointments',
    "backtohome": ' Home',
    "this_should_be_translated": "This should be translated to Arabic!"
  };
  static const Map<String, dynamic> fr = {
    "language": "Changer la Langue",
    "country": 'Pays',
    "zip": 'Code Zip',
    "adress": 'Adresse',
    "city": 'Ville',
    "personalInformation": " Informations personnelles ",
    "name": "Nom",
    "email": "Email",
    "myprofil": "Mon Profil",
    "notif": "Notifications",
    "help": "Centre d'aide",
    "backtohome": 'accueil',
    "settings": "Parametres",
    "logout": 'Quitter',
    "myaccount": "Mon Compte",
    "appointement": 'Mes rendez-vous',
    "this_should_be_translated": "This should be translated to Arabic!"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": ar,
    "en": en,
    "fr": fr
  };
}
