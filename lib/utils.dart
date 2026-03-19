import 'package:url_launcher/url_launcher.dart'; //

// A single function to handle all your link clicks
Future<void> openLink(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}
