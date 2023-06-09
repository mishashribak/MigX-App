// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:federated_plugin/federated_plugin.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Federated Plugin Test', () {
    const batteryLevel = 34;

    testWidgets('getBatteryLevel method test', (tester) async {
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel('battery'),
        (call) async {
          if (call.method == 'getBatteryLevel') {
            return batteryLevel;
          }
          return 0;
        },
      );
      final result = await getBatteryLevel();
      expect(result, batteryLevel);
    });
  });
}
