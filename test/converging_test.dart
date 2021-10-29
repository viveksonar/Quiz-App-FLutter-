import 'dart:convert';
import 'dart:io';
import 'package:webdriver/io.dart';

main() async {
  // Start the ChromeDriver process
  Process chromeDriverProcess = await Process
      .start('chromedriver', ['--port=4444', '--url-base=wd/hub']);

  await for (String browserOut in const LineSplitter()
      .bind(UTF8.decoder.bind(chromeDriverProcess.stdout))) {
    if (browserOut.contains('Starting ChromeDriver')) {
      break;
    }
  }

  // Connect to it with the webdriver package
  WebDriver driver = await createDriver(
      uri: Uri.parse('http://localhost:4444/wd/hub/'),
      desired: Capabilities.chrome);

  // Go to your page
  await driver.get('http://stackoverflow.com');

  //TODO: write your tests
  print(await driver.execute('return navigator.userAgent', []));

  // Take a simple screenshot
  String screenshot = await driver.captureScreenshotAsBase64();
  new File('stackoverflow.png').writeAsBytesSync(BASE64.decode(screenshot));

  driver.quit();
  chromeDriverProcess.kill();
}