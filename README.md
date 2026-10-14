# RFC6265 - HTTP State Management Mechanism in Dart

This Dart package implement the
[RFC6265](https://www.rfc-editor.org/info/rfc6265/),
offering all functions necessary to encode, decode and validate cookies.

# FAQ

## Why this project?

While collecting cookies on one of my project with `webview_flutter`, I 
discovered only a small part of the cookies (key/value) was supported. Other
attributes, like expires, were not part of the data collected.

see:
  - [`webview_flutter/webview_flutter/lib/src/legacy/webview.dart`](https://github.com/flutter/packages/blob/ac2db9cfeaf69c5064739e0d477ef8cb9c19cd35/packages/webview_flutter/webview_flutter/lib/src/legacy/webview.dart#L763)
  - [Is there a way to show more cookies fields from webview_flutter's WebViewCookieManager](https://stackoverflow.com/questions/80009751/is-there-a-way-to-show-more-cookies-fields-from-webview-flutters-webviewcookiem)

# References and Resources

- https://www.rfc-editor.org/info/rfc6265/
- https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie
- 
