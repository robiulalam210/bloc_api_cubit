import 'package:bloc_api_cubit/cubit/user_cubit.dart';
import 'package:bloc_api_cubit/model/user_information_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/user_cubit_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<UserCubit>().getAllUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UserCubit, UserCubitState>(
        builder: (context, state) {
          if (state is UserCubitLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserCubitError) {
            return Center(
              child: Text(
                state.message.toString(),
                style: TextStyle(fontSize: 44),
              ),
            );
          } else if (state is UserCubitDataLoaded) {
            return ListView.builder(
                itemCount: state.userList!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {

                  UserInformation information=state.userList![index];
                  return ListTile(leading: Text(information.title.toString()),);
                });
          }else{
            return SizedBox();
          }
        },
      ),
    );
  }
}
