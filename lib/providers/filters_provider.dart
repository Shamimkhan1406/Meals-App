import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class filtersNotifier extends StateNotifier<Map<Filter,bool>>{
  filtersNotifier() : super({
    Filter.glutenFree : false,
    Filter.lactoseFree : false,
    Filter.vegetarian : false,
    Filter.vegan : false,
  });

  void setFilters(Map<Filter,bool> choosenFilter){
    state = choosenFilter;
  }

  void setFilter(Filter filter,bool isActive)
  {
    state = {
      ...state,
      filter : isActive,
    };
  }

}

final filterProvider = StateNotifierProvider<filtersNotifier,Map<Filter,bool>>((ref) => filtersNotifier());