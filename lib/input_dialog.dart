import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const _defaultCancelText = 'Cancel';
const _defaultOkText = 'OK';
const _defaultTitle = 'Enter Text';

/// A widget to prompt user for a string.
class InputDialog extends StatefulWidget {
  /// The text for the button to close the dialog without returning the text.
  final String cancelText;

  /// The text for the button to close the dialog and return the text.
  final String okText;

  /// The dialog title.
  final String title;

  ///
  const InputDialog({
    super.key,
    this.cancelText = _defaultCancelText,
    this.okText = _defaultOkText,
    this.title = _defaultTitle,
  });

  /// Shows the dialog and returns the input string or `null` on cancel.
  static Future<String?> show({
    required BuildContext context,
    String cancelText = _defaultCancelText,
    String okText = _defaultOkText,
    String title = _defaultTitle,
  }) async {
    return showDialog(
      context: context,
      builder: (_) => InputDialog(
        cancelText: cancelText,
        okText: okText,
        title: title,
      ),
    );
  }

  @override
  State<InputDialog> createState() => _InputDialogState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('cancelText', cancelText));
    properties.add(StringProperty('okText', okText));
    properties.add(StringProperty('title', title));
  }
}

class _InputDialogState extends State<InputDialog> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        controller: _controller,
        autofocus: true,
        onSubmitted: (_) => _ok(),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: Text(widget.cancelText),
        ),
        ElevatedButton(
          onPressed: _ok,
          child: Text(widget.okText),
        ),
      ],
    );
  }

  void _ok() {
    Navigator.pop(context, _controller.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
