part of 'users_bloc.dart';

enum UsersStatus {
  loading,
  success,
  failure,
}

class UsersState extends Equatable {
  final List<User> users;
  final UsersStatus status;
  final String failureMsg;

  const UsersState({this.users, this.status, this.failureMsg});

  @override
  List<Object> get props => [users, status, failureMsg];

  UsersState copyWith({
    List<User> users,
    UsersStatus status,
    String failureMsg,
  }) =>
      UsersState(
        users: users ?? this.users,
        status: status ?? this.status,
        failureMsg: failureMsg ?? this.failureMsg,
      );
}
