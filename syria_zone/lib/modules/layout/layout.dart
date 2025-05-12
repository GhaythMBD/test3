import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_zone/modules/layout/cubit/layout_cubit.dart';
import 'package:syria_zone/modules/layout/cubit/layout_states.dart';
import 'package:syria_zone/shared/styles/colors.dart';

class Layout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>LayoutCubit(),
      child: BlocConsumer<LayoutCubit,LayoutStates >(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title:Text("SyriaZone",),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.search)),
              ],
            ),

            bottomNavigationBar: BottomNavigationBar(
              currentIndex:cubit.index ,
              onTap: (index){
                cubit.changeBottomNavIndex(index);
              },

              selectedItemColor: midColor,
                unselectedItemColor: Colors.grey,
                items:cubit.bottonNavItems
            ),
          );
        },

      ),
    );
  }
}
