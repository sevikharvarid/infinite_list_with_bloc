import 'package:equatable/equatable.dart';

import '../models/post.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostLoading extends PostState {
  @override
  List<Object?> get props => [];
}

class PostLoaded extends PostState {
  List<Post>? posts;
  bool? hasReachedMax;

  PostLoaded({
    this.posts,
    this.hasReachedMax,
  });

  PostLoaded copyWith({List<Post>? posts, bool? hasReachedMax}) {
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [posts, hasReachedMax];
}
