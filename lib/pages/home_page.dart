import 'package:flutter/material.dart';

import '../components/my_drawer.dart';
import '../service/auth/auth_service.dart';
import '../service/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthService();
    final ChatService chatService = ChatService();
    Future<void> singOut() async {
      await auth.singOut();
    }

    return Scaffold(
      drawer: MyDrawer(
        onTap: () {
          singOut();
        },
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              singOut();
            },
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: chatService.getUsertsStream(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return const Text("ERROR");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Waiting..."));
          } else {
            return ListView(
              children: [
                for (int i = 0; i < snapshot.data.length; i++) ...{
                  Text(snapshot.data[i]["email"])
                }
              ],
            );
          }
        },
      ),
    );
  }
}
