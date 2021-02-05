import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:fetch_user_jsonplaceholder/models/user.dart';
import 'package:fetch_user_jsonplaceholder/resource/repositories/users_repo.dart';

part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepository usersRepository;

  UsersBloc({
    @required this.usersRepository,
  }) : assert(usersRepository != null);

  @override
  UsersState get initialState => UsersState(status: UsersStatus.loading);

  @override
  Stream<UsersState> mapEventToState(UsersEvent event) async* {
    if (event is FetchUsersEvent) {
      yield* mapFetchUserEventsToState(event);
    }
  }

  Stream<UsersState> mapFetchUserEventsToState(FetchUsersEvent event) async* {
    try {
      final users = await usersRepository.getUsers();
      yield state.copyWith(users: users, status: UsersStatus.success);
    } catch (e) {
      yield state.copyWith(
          status: UsersStatus.failure, failureMsg: "Error fetching users");
    }
  }
}
