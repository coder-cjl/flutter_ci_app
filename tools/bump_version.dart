import 'dart:io';

void main() {
  final pubspec = File('pubspec.yaml');
  if (!pubspec.existsSync()) {
    print('pubspec.yaml not found.');
    return;
  }

  final content = pubspec.readAsStringSync();
  final versionPattern = RegExp(r'version:\s*(\d+\.\d+\.\d+)(?:\+(\d+))?');
  final match = versionPattern.firstMatch(content);
  if (match == null) {
    print('Version not found in pubspec.yaml.');
    return;
  }

  final version = match.group(1);
  final buildNumber = match.group(2) ?? '0';
  final versionParts = version.split('.');
  if (versionParts.length != 3) {
    print('Invalid version format in pubspec.yaml.');
    return;
  }

  final major = int.parse(versionParts[0]);
  final minor = int.parse(versionParts[1]);
  final patch = int.parse(versionParts[2]);
  final newPatch = patch + 1;
  final newVersion = '$major.$minor.$newPatch';
  final newBuildNumber = (int.parse(buildNumber) + 1).toString();
  final newContent = content.replaceFirst(
    versionPattern,
    'version: $newVersion+$newBuildNumber',
  );
  pubspec.writeAsStringSync(newContent);
  print(
      'Updated version to $newVersion and build number to $newBuildNumber in pubspec.yaml.');
}
