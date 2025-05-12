import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit():super(LayoutInitialState());
  static LayoutCubit get(context)=> BlocProvider.of(context);
  int index=0;
  List<BottomNavigationBarItem>bottonNavItems= const [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label:"Home",
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.apps),
        label:"Categories"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label:"Favorite"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label:"Settings"
    ),
  ];
  void changeBottomNavIndex(int newIndex) {
    index = newIndex;
    emit(ChangeBottomNavState()); // Emit inside Cubit
  }

}