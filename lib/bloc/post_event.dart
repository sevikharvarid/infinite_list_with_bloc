import 'package:equatable/equatable.dart';
import 'package:infinite_list_with_bloc/models/post.dart';

abstract class PostEvent extends Equatable {
  const PostEvent() : super();
}

class PostStarted extends PostEvent {
  @override
  List<Object?> get props => [];
}
