import 'package:equatable/equatable.dart';
import 'package:piscine_app/home/models/actualite_model.dart';

abstract class ActualiteState extends Equatable {
  const ActualiteState();

  @override
  List<Object> get props => [];
}

class ActualiteLoading extends ActualiteState {}

class ActualiteLoaded extends ActualiteState {
  final List<Actualite> actualites;

  const ActualiteLoaded({this.actualites = const <Actualite>[]});

  @override
  List<Object> get props => [actualites];
}
