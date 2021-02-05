import 'package:flutter/material.dart';
import 'package:fetch_user_jsonplaceholder/models/user.dart';
import 'package:fetch_user_jsonplaceholder/resource/repositories/users_repo.dart';
import 'package:fetch_user_jsonplaceholder/modules/users/blocs/users_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersUI extends StatelessWidget {
  const UsersUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users",
        ),
      ),
      body: BlocProvider<UsersBloc>(
        create: (context) => UsersBloc(usersRepository: UsersRepository())
          ..add(FetchUsersEvent()),
        child: BlocConsumer<UsersBloc, UsersState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.status == UsersStatus.loading)
              return CircularProgressIndicator();
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, i) {
                return userItem(state.users[i]);
              },
            );
          },
        ),
      ),
    );
  }

  Widget userItem(User user) {
    print(user);
    return Container(
        child: Card(
      child: Column(
        children: <Widget>[Text(user.name), Text(user.email)],
      ),
    ));
  }
}
