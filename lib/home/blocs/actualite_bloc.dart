import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:piscine_app/home/blocs/actualite_event.dart';
import 'package:piscine_app/home/blocs/actualite_state.dart';
import 'package:piscine_app/home/models/actualite_model.dart';
import 'package:piscine_app/home/repositories/actualite_repository.dart';

class ActualiteBloc extends Bloc<ActualiteEvent, ActualiteState> {
  final ActualiteRepository _actualiteRepository;
  ActualiteBloc({
    required ActualiteRepository actualiteRepository,
  })  : _actualiteRepository = actualiteRepository,
        super(ActualiteLoading()) {
    on<LoadActualite>(_onLoadActualite);
  }
  //
  Future<void> _onLoadActualite(
    LoadActualite event,
    Emitter<ActualiteState> emit,
  ) async {
    // emit(AppointmentLoading());

    //Appointment appointment = new Appointment();
    try {
      final List<Actualite> actualites =
          await _actualiteRepository.getAllActualites().first;

      print('srv:');
      print(actualites);

      emit(ActualiteLoaded(actualites: actualites));
    } catch (_) {}
  }
  //
}
