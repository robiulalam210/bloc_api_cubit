import 'package:bloc_api_cubit/cubit/user_cubit_state.dart';
import 'package:bloc_api_cubit/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user_information_model.dart';

class UserCubit extends Cubit<UserCubitState> {
  UserCubit({required this.apiServices}) : super(UserCubitInit());
  List<UserInformation> list = [];
  ApiServices apiServices;

  void getAllUserList() async {

    try {
      emit(UserCubitLoading());

      list=(await apiServices.getData())!;
      emit(UserCubitDataLoaded(userList: list));

    } catch (e) {
      emit(UserCubitError(message: e.toString()));
    }
  }
}
