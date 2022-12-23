import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:infinite_list_with_bloc/bloc/post_event.dart';
import 'package:infinite_list_with_bloc/bloc/post_state.dart';

import '../models/post.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<Post>? posts;

  PostBloc() : super(PostLoading()) {
    on<PostStarted>(initPost);
  }

  FutureOr<void> initPost(PostStarted event, Emitter<PostState> emit) async {
    posts = await Post.connectToAPI(0, 120);
    emit(
      PostLoaded(
        posts: posts,
        hasReachedMax: false,
      ),
    );
  }
}

// import 'package:bloc/bloc.dart';
//
// import '../models/post.dart';
//
// class PostEvent {}
//
// abstract class PostState {}
//
// class PostUninitialized extends PostState {}
//
// class PostLoaded extends PostState {
//   List<Post>? posts;
//   bool? hasReachedMax;
//   PostLoaded({
//     this.posts,
//     this.hasReachedMax,
//   });
//   PostLoaded copyWith({List<Post>? posts, bool? hasReacedMax}) {
//     return PostLoaded(
//       posts: posts ?? this.posts,
//       hasReachedMax: hasReachedMax ?? this.hasReachedMax,
//     );
//   }
// }
//
// class PostBloc extends Bloc<PostEvent, PostState> {
//   @override
//   PostState get initialState => PostUninitialized();
//
//   on<PostEvent>((event,emit){
//
//   })
//
//   @override
//   Stream<PostState> mapEventToState(PostState event) async* {
//     List<Post> posts;
//     if (state is PostUninitialized) {
//       posts = await Post.connectToAPI(0, 120);
//       yield PostLoaded(posts: posts, hasReachedMax: false);
//     } else {
//       PostLoaded postLoaded = state as PostLoaded;
//       posts = await Post.connectToAPI(postLoaded.posts!.length, 10);
//       yield (posts.isEmpty)
//           ? postLoaded.copyWith(hasReacedMax: true)
//           : PostLoaded(posts: postLoaded.posts! + posts, hasReachedMax: false);
//     }
//   }
// }
