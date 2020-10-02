import 'package:jailbase/jailbase.dart';

void main() async {
  List<Arrest> arrests = await JailBase.getArrests('az-mcso');

  for (Arrest arrest in arrests) {
    print(arrest.name);
  }
}
