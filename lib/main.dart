import 'package:abash_app/database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");

  final database = AppDatabase();

  await database.into(database.noticeItems).insert(
        NoticeItemsCompanion.insert(
          title: message.notification?.title ?? 'title is empty',
          descriptions: message.notification?.body ?? 'body is empty',
        ),
      );
}

void main() async {
  // firebase初期化
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(provisional: false);

  // iOSの場合は[getAPNSToken]の呼び出しが必要
  // XCode > Capability からPush Notificationsを有効にすることを忘れないこと
  final apnsToken = await messaging.getAPNSToken();
  if (apnsToken != null) {
    // APNS token is available, make FCM plugin API requests...
    final token = await messaging.getToken();
    print("FCM Token: $token");
  }

  // バックグランド状態でPush通知を受け取る
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // iOSファアグランド時のpush通知処理
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final Future<List<NoticeItem>> _future;

  @override
  void initState() {
    super.initState();
    _future = _getDatabaseTexts();
    _setupInteractedMessage();
  }

  Future<List<NoticeItem>> _getDatabaseTexts() async {
    final database = AppDatabase();
    await Future.delayed(const Duration(milliseconds: 500));
    return await database.select(database.noticeItems).get();
  }

  Future<void> _setupInteractedMessage() async {
    // フォアグランド時の処理
    FirebaseMessaging.onMessage.listen(_handleMessageFromForeground);
    // kill状態からpush通知をタップして起動した場合の処理
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageFromTerminated(initialMessage);
    }
    // バックグラウンド状態からpush通知をタップしてフォアグランドに戻った場合の処理
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageFromBackgorund);
  }

  void _handleMessageFromForeground(RemoteMessage message) {
    print("handle message forground");
    print("title: ${message.notification?.title}");
    message.data.keys.toList().map((key) => print(key));
    message.data.forEach((key, value) {
      print("$key: $value");
    });
    // final database = AppDatabase();
    // database.into(database.noticeItems).insert(
    //       NoticeItemsCompanion.insert(
    //         title: "open from terminated",
    //         descriptions: "open from terminated",
    //       ),
    //     );
  }

  void _handleMessageFromTerminated(RemoteMessage message) {
    print("handle message");
    final database = AppDatabase();
    database.into(database.noticeItems).insert(
          NoticeItemsCompanion.insert(
            title: "open from terminated",
            descriptions: "open from terminated",
          ),
        );
  }

  void _handleMessageFromBackgorund(RemoteMessage message) {
    print("handle message");
    final database = AppDatabase();
    database.into(database.noticeItems).insert(
          NoticeItemsCompanion.insert(
            title: "open from background",
            descriptions: "open from background",
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<NoticeItem>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            print("is loading");
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final noticeItems = snapshot.data!;
          print("has value ${noticeItems.length}");

          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  noticeItems.length,
                  (index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: Column(
                        children: [
                          Text("title: ${noticeItems[index].title}"),
                          Text("body: ${noticeItems[index].descriptions}"),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: IconButton(
        onPressed: () async {
          final database = AppDatabase();

          await database.into(database.noticeItems).insert(
                NoticeItemsCompanion.insert(
                  title: "manual notice title",
                  descriptions: "manual notice body",
                ),
              );
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
