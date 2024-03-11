import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:apidash/widgets/buttons.dart';
import 'package:apidash/consts.dart';
import '../test_consts.dart';

void main() {
  String copyText = 'This is a sample response generated by ';
  testWidgets('Testing for copy button', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Copy Button',
        home: Scaffold(
          body: CopyButton(toCopy: copyText),
        ),
      ),
    );

    expect(find.byIcon(Icons.content_copy), findsOneWidget);
    expect(find.text(kLabelCopy), findsOneWidget);
    final textButton1 = find.byType(TextButton);
    expect(textButton1, findsOneWidget);
    await tester.tap(textButton1);

    //TODO: The below test works for `flutter run` but not for `flutter test`
    //var data = await Clipboard.getData('text/plain');
    //expect(data?.text, copyText);
  });

  testWidgets('Testing for Send Request button', (tester) async {
    dynamic changedValue;
    await tester.pumpWidget(
      MaterialApp(
        title: 'Send Request button',
        theme: kThemeDataLight,
        home: Scaffold(
          body: SendRequestButton(
            isWorking: false,
            onTap: () {
              changedValue = 'Send';
            },
            cancel: (){},
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.send), findsOneWidget);
    expect(find.text(kLabelSend), findsOneWidget);
    final button1 = find.byType(FilledButton);
    expect(button1, findsOneWidget);

    await tester.tap(button1);
    expect(changedValue, 'Send');
  });

  testWidgets(
      'Testing for Send Request button when RequestModel is viewed and is waiting for response',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Send Request button',
        theme: kThemeDataLight,
        home: Scaffold(
          body: SendRequestButton(
            isWorking: true,
            onTap: () {},
            cancel: (){},
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.send), findsNothing);
    expect(find.text(kLabelSending), findsOneWidget);
    final button1 = find.byType(FilledButton);
    expect(button1, findsOneWidget);

    expect(tester.widget<FilledButton>(button1).enabled, isFalse);
  });

  testWidgets('Testing for Save in Downloads button', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Save in Downloads button',
        theme: kThemeDataLight,
        home: const Scaffold(
          body: SaveInDownloadsButton(),
        ),
      ),
    );

    expect(find.byIcon(Icons.download), findsOneWidget);
    expect(find.text("Download"), findsOneWidget);

    final button1 = find.byType(TextButton);
    expect(button1, findsOneWidget);

    expect(tester.widget<TextButton>(button1).enabled, isFalse);
  });

  testWidgets('Testing for Save in Downloads button 2', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Save in Downloads button',
        theme: kThemeDataLight,
        home: Scaffold(
          body: SaveInDownloadsButton(
            content: Uint8List.fromList([1]),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.download), findsOneWidget);
    expect(find.text("Download"), findsOneWidget);

    final button1 = find.byType(TextButton);
    expect(button1, findsOneWidget);

    expect(tester.widget<TextButton>(button1).enabled, isTrue);
  });

  testWidgets('Testing for Repo button', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Repo button',
        theme: kThemeDataLight,
        home: const Scaffold(
          body: RepoButton(
            icon: Icons.code,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.code), findsOneWidget);
    expect(find.text("GitHub"), findsOneWidget);
  });

  testWidgets('Testing for Repo button icon = null', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Repo button',
        theme: kThemeDataLight,
        home: const Scaffold(
          body: RepoButton(),
        ),
      ),
    );

    expect(find.byIcon(Icons.code), findsNothing);
    expect(find.text("GitHub"), findsOneWidget);

    final button1 = find.byType(FilledButton);
    expect(button1, findsOneWidget);

    expect(tester.widget<FilledButton>(button1).enabled, isTrue);
  });

  testWidgets('Testing for Discord button', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Discord button',
        theme: kThemeDataLight,
        home: const Scaffold(
          body: DiscordButton(),
        ),
      ),
    );

    expect(find.byIcon(Icons.discord), findsOneWidget);
    expect(find.text("Discord Server"), findsOneWidget);
  });

  testWidgets('Testing for Save button', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Save button',
        theme: kThemeDataLight,
        home: const Scaffold(
          body: SaveButton(),
        ),
      ),
    );

    expect(find.byIcon(Icons.save), findsOneWidget);
    expect(find.text("Save"), findsOneWidget);
  });
}
