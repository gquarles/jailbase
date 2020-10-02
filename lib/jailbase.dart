library jailbase;

import 'dart:convert';
import 'package:http/http.dart' as http;

class JailBase {
  ///Get the arrests from a jail with id
  static Future<List<Arrest>> getArrests(String id) async {
    final String url = 'http://www.JailBase.com/api/1/recent/?source_id=$id';
    var response = await http.get(url);

    //Return an empty list if the api fails or an incorrect id is passed
    if (response.statusCode != 200) return List<Arrest>();

    final arrestsJson = json.decode(response.body);

    List<Arrest> arrests = List<Arrest>();

    for (var u in arrestsJson['records']) {
      arrests.add(Arrest.fromJson(u));
    }

    return arrests;
  }

  ///Get a list of jails you can get arrests from
  static Future<List<Jail>> getJails() async {
    final String url = 'http://www.JailBase.com/api/1/sources/';
    var response = await http.get(url);

    if (response.statusCode != 200) return List<Jail>();

    final jailJson = json.decode(response.body);

    List<Jail> jails = List<Jail>();

    for (var u in jailJson['records']) {
      jails.add(Jail.fromJson(u));
    }

    return jails;
  }
}

class Arrest {
  final String dateFormatted;
  final String name;
  final String mugshotUrl;
  final String date;
  final List<dynamic> charges;
  final int id;
  final String url;

  Arrest(
      {this.dateFormatted,
      this.name,
      this.mugshotUrl,
      this.date,
      this.charges,
      this.id,
      this.url});

  Arrest.fromJson(Map<String, dynamic> json)
      : dateFormatted = json['book_date_formatted'],
        name = json['name'],
        mugshotUrl = json['mugshot'],
        date = json['book_date'],
        charges = json['charges'],
        id = json['id'],
        url = json['more_info_url'];

  Map<String, dynamic> toJson() => {
        'book_date_formatted': dateFormatted,
        'name': name,
        'mugshot': mugshotUrl,
        'book_date': date,
        'charges': jsonEncode(charges),
        'id': id,
        'more_info_url': url,
      };
}

class Jail {
  final String city;
  final String name;
  final String state;
  final String address;
  final String jailWebsite;
  final String phone;
  final String county;
  final String stateAbv;
  final String id;
  final String zipCode;
  final String email;
  final bool hasMugshots;

  Jail(
      {this.city,
      this.name,
      this.state,
      this.address,
      this.jailWebsite,
      this.phone,
      this.county,
      this.stateAbv,
      this.id,
      this.zipCode,
      this.email,
      this.hasMugshots});

  Jail.fromJson(Map<String, dynamic> json)
      : city = json['city'],
        name = json['name'],
        state = json['state_full'],
        address = json['address1'],
        jailWebsite = json['source_url'],
        county = json['county'],
        phone = json['phone'],
        stateAbv = json['state'],
        zipCode = json['zip_code'],
        email = json['email'],
        hasMugshots = json['has_mugshots'],
        id = json['source_id'];

  Map<String, dynamic> toJson() => {
        'city': city,
        'name': name,
        'state_full': state,
        'address1': address,
        'source_url': jailWebsite,
        'county': county,
        'phone': phone,
        'state': stateAbv,
        'zip_code': zipCode,
        'email': email,
        'has_mugshots': hasMugshots,
        'source_id': id,
      };
}
