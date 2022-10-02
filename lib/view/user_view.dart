import 'package:camera_app/service/user_service.dart';
import 'package:flutter/material.dart';

import '../model/users_model.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final UserService _service = UserService();
  bool? isLoading;
  List<Data> user = [];
  @override
  void initState() {
    super.initState();
    _service.fetchUsers().then((value) {
      if (value != null) {
        setState(() {
          user = value.data!;
          isLoading = true;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("User List"),
        ),
        body: isLoading == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  return isLoading == true
                      ? ListTile(
                          subtitle: Text(user[index].firstName!),
                          title: Text(user[index].firstName!),
                          leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(user[index].avatar!)),
                        )
                      : const Center(child: Text("datas is not come"));
                },
                itemCount: user.length,
              ));
  }
}
