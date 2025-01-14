part of 'library_bloc.dart';

abstract class LibraryState extends Equatable {
  const LibraryState();

  @override
  List<Object> get props => [];
}

class LibraryInitial extends LibraryState {}

class LibraryLoaded extends LibraryState {
  final LibStore libStore;
  const LibraryLoaded({required this.libStore});

  @override
  List<Object> get props => [libStore];
}

class LibraryLoading extends LibraryState {
  const LibraryLoading();

  @override
  List<Object> get props => [];
}
