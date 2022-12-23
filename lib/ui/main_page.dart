import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:infinite_list_with_bloc/bloc/post_bloc.dart';
import 'package:infinite_list_with_bloc/bloc/post_event.dart';
import 'package:infinite_list_with_bloc/bloc/post_state.dart';
import 'package:infinite_list_with_bloc/ui/post_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController controller = ScrollController();
  PostBloc? bloc;

  onScoll() {
    double maxScroll = controller.position.maxScrollExtent;
    double currentScroll = controller.position.pixels;

    if (currentScroll == maxScroll) {
      bloc!.add(PostStarted());
    }
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<PostBloc>(context);
    controller.addListener(onScoll);
    return Scaffold(
      appBar: AppBar(
        title: const Text("tutorial infinite list"),
      ),
      body: Container(
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            print("the State is : $state");
            if (state is PostLoading) {
              return const Center(
                child: SizedBox(
                  width: 20,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              PostLoaded postLoaded = state as PostLoaded;
              return ListView.builder(
                controller: controller,
                itemCount: (postLoaded.hasReachedMax!)
                    ? postLoaded.posts!.length
                    : postLoaded.posts!.length + 1,
                itemBuilder: (context, index) =>
                    (index < postLoaded.posts!.length)
                        ? PostItem(postLoaded.posts![index])
                        : const SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(),
                          ),
              );
            }
          },
        ),
      ),
    );
  }
}
