
import 'package:flutter/material.dart';
import 'package:to_kok/domain/entities/video_post.dart';
import 'package:to_kok/infrastructure/models/local_video_model.dart';
import 'package:to_kok/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {

  //TODO: Repository, DataSource

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {

    //await Future.delayed(const Duration(seconds: 3));

    final List<VideoPost> newVideos = videoPosts.map(
        (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    ).toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}