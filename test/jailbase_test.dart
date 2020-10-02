import 'package:flutter_test/flutter_test.dart';

import 'package:jailbase/jailbase.dart';

void main() {
  test('json conversions', () async {
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
}
