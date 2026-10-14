import 'package:rfc6265/rfc6265.dart';
import 'package:rfc6265/src/date.dart';
import 'package:test/test.dart';

void main() {
  test('encoding/decoding date', () async {
    final string1 = 'Wed, 14 Oct 2026 07:52:00 GMT';
    final datetime1 = DateTime(
      2026,
      10,
      14,
      7,
      52,
      00,
    );
    expect(decode(string1), datetime1);
    expect(encode(datetime1), string1);
  });
}


