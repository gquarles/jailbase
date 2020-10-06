import 'package:flutter_test/flutter_test.dart';

import 'package:jailbase/jailbase.dart';

void main() {
  test('jail json conversions', () async {
    Jail test = Jail.fromJson({
      "city": "Bay Minette",
      "name": "Baldwin County Sheriff's Office",
      "state_full": "Alabama",
      "address1": "200 Hand Ave",
      "source_url": "http://www.sheriffofbaldwin.com/",
      "county": "Baldwin County",
      "phone": "(251) 937-0202",
      "state": "AL",
      "source_id": "al-bcso",
      "zip_code": "36507",
      "email": "",
      "has_mugshots": true
    });

    expect(test.city, 'Bay Minette');
    expect(test.name, 'Baldwin County Sheriff\'s Office');
    expect(test.state, 'Alabama');
    expect(test.address, '200 Hand Ave');
    expect(test.jailWebsite, 'http://www.sheriffofbaldwin.com/');
    expect(test.county, 'Baldwin County');
    expect(test.phone, '(251) 937-0202');
    expect(test.stateAbv, 'AL');
    expect(test.zipCode, '36507');
    expect(test.email, '');
    expect(test.hasMugshots, true);
  });

  test('arrest json conversions', () async {
    Arrest test = Arrest.fromJson({
      "book_date_formatted": "Oct 02, 2020",
      "name": "Peter Paul Konieczny",
      "mugshot":
          "https://imgstore.jailbase.com/small/arrested/az-mcso/2020-10-02/peter-paul-konieczny-t657352.pic1.jpg",
      "book_date": "2020-10-02",
      "charges": ["(001) Count of ASSAULT-INTENT/RECKLESS/INJURE"],
      "id": 32177547,
      "more_info_url":
          "http://www.jailbase.com/en/az-mcsopeter-paul-konieczny-32177547"
    });

    expect(test.name, 'Peter Paul Konieczny');
    expect(test.dateFormatted, 'Oct 02, 2020');
    expect(test.mugshotUrl,
        'https://imgstore.jailbase.com/small/arrested/az-mcso/2020-10-02/peter-paul-konieczny-t657352.pic1.jpg');
    expect(test.date, '2020-10-02');
    expect(test.id, 32177547);
    expect(test.url,
        'http://www.jailbase.com/en/az-mcsopeter-paul-konieczny-32177547');
    expect(test.charges.length, 1);
    expect(test.charges[0], '(001) Count of ASSAULT-INTENT/RECKLESS/INJURE');
  });

  test('arrest get large url', () async {
    Arrest test = Arrest.fromJson({
      "book_date_formatted": "Oct 02, 2020",
      "name": "Peter Paul Konieczny",
      "mugshot":
          "https://imgstore.jailbase.com/small/arrested/az-mcso/2020-10-02/peter-paul-konieczny-t657352.pic1.jpg",
      "book_date": "2020-10-02",
      "charges": ["(001) Count of ASSAULT-INTENT/RECKLESS/INJURE"],
      "id": 32177547,
      "more_info_url":
          "http://www.jailbase.com/en/az-mcsopeter-paul-konieczny-32177547"
    });

    expect(test.mugshotUrlLarge,
        'https://imgstore.jailbase.com/arrested/az-mcso/2020-10-02/peter-paul-konieczny-t657352.pic1.jpg');
  });
}
