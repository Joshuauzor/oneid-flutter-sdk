# oneid-flutter-sdk

## OneID SDK Flutter

This library that gives you access to OneID SSO services [OneID] into your Flutter application. Official Flutter SDK for [OneID](https://oneidtech.com).

## Installation

- To start using this package, simply add the following to project `pubspec.yaml`

```yaml
---
dependencies:
  oneid: <version>
```

## Usage

### 1. Permissions

To use this package, your android app must declare internet permission. Add the following code to the application level of your AndroidManifest.xml.

```xml
	<uses-permission android:name="android.permission.INTERNET" />
```

### 2. Initializing SDK

    To use [OneID] SDK, you need to first initialize it by using the `OneIDPlugin` class.

```dart

OneIDPlugin oneIDPlugin =  OneIDPlugin(
    apiKey:  'apiKey',
);

```

Ensure to perform this instantiation in the `initState` method of your Widget.

```dart
OneIDPlugin oneIDPlugin;

@override
void  initState() {
oneIdPlugin = const OneIDPlugin(apiKey: 'apiKey');

super.initState();
}
```

### 3. Login User

User login can be initiated with the `oneId` method:

## Parameters

- `BuildContext` current buildcontext of your app.

```dart
final res = await oneIdPlugin!.oneId(context: context);
```

After login is successful, a user response to returned to proceed with.

you can check out the example on [this link](https://github.com/Joshuauzor/oneid-flutter-sdk/tree/master/example)

# Contribution

I highly encourage the community to step forward and improve this
library further. You can fix any reported bug, propose or implement new
features, write tests, etc.

Here is a quick list of things to remember

- Check the open issues before creating a new one,
- Help me in reducing the number of open issues by fixing any existing
  bugs,
- Check the roadmap to see if you can help in implementing any new
  feature,
- You can contribute by writing unit and integration tests for this
  library,
- If you have any new idea that aligns with the goal of this library,
  feel free to raise a feature request and discuss it.

# Author

This OneID package for Flutter is developed by [Joshua Uzor](https://github.com/Joshuauzor)

Also, as always, please give us a star to help!
