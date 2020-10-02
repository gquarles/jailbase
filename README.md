
# JailBase

A simple lightweight wrapper for the [JailBase](https://www.jailbase.com/api) API

### GitHub
Please feel free to [contribute](https://github.com/gquarles/jailbase)

## Usage
Please add `jailbase` as a dependency in your pubspec.yaml file


## Get Arrests From a Jail
*Currently you can only get the recent arrests as the JailBase API is broken and their pagination system does not work.*
You can get recent arrests from a jail by just passing the jail ID


```dart
import  'package:jailbase/jailbase.dart';

void main() async {
    List<Arrest> arrests =  await JailBase.getArrests('az-mcso');
	
	for (Arrest arrest in arrests) {
		print(arrest.name);
	}
}
```

## Get Jails
Get the list of all the jails you can gather arrest data from.

```dart

import  'package:jailbase/jailbase.dart';

void main() async {
    List<Jail> jails =  await JailBase.getJails();
	
	for (Jail jail in jails) {
		print(jail.name);
		print(jail.id);
	}
}
```

## TODO:
* Finish the wrapper whenever JailBase fixes their API
* Better documentation