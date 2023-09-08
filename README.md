A very simple dialog to enter text:

```dart
final result = await InputDialog.show(
  context: context,
  title: 'Enter Text',
);
```

![Demo](https://raw.githubusercontent.com/alexeyinkin/flutter-input-dialog/main/doc/images/demo.png)

It is not customizable except for the title and the text on the buttons.
It is good for prototyping and some internal software where functionality and speed
are more important than custom design.
