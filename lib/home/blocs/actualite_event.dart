import 'package:equatable/equatable.dart';
import 'package:piscine_app/home/models/actualite_model.dart';

abstract class ActualiteEvent extends Equatable {
  const ActualiteEvent();

  @override
  List<Object> get props => [];
}

class LoadActualite extends ActualiteEvent {
  final List<Actualite> actualites;

  const LoadActualite({
    this.actualites = const <Actualite>[],
  });

  @override
  List<Object> get props => [actualites];
}


//


