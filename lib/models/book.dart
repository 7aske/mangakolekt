import 'package:flutter/material.dart';
import 'package:mangakolekt/models/util.dart';

enum BookReadStatus { read, unread }

abstract class DbBookEntety {
  late String name;
  late String path;
}

class BookCover {
  String name = '';
  String path = '';
  String bookPath = '';
  BookCover({required this.name, required this.path, required this.bookPath});

  String get mapString => "$name;$path;$bookPath";
  // return BookCover(name: bookName, path: out, bookPath: path);

  BookCover.formString(String s) {
    final stringArr = s.split(';');
    name = stringArr[0];
    path = stringArr[1];
    bookPath = stringArr[2];
  }
}

class PageEntry {
  final String name;
  final Image image;
  PageEntry({required this.name, required this.image});
}

class OldBook {
  final int pageNumber;
  final String name;
  final List<PageEntry> pages;

  OldBook({required this.name, required this.pageNumber, required this.pages});
}

class BookView {
  bool? isDoublePageView = false;
  bool? isRightToLeftMode = false;
  final focusNode = FocusNode();
  bool keyPressed = false;
  ScaleTo scaleTo = ScaleTo.height;
  ReaderView readerView = ReaderView.single;

  BookView({
    required this.isDoublePageView,
    required this.isRightToLeftMode,
    required this.scaleTo,
    required this.readerView,
    required bool keyPressed,
  });

  BookView.init({
    isDoublePageView = false,
    this.isRightToLeftMode = false,
    this.scaleTo = ScaleTo.height,
    this.readerView = ReaderView.single,
    bool keyPressed = false,
  });

  BookView copyWith({
    bool? isDoublePageView,
    bool? isRightToLeftMode,
    bool? keyPressed,
    ScaleTo? scaleTo,
    ReaderView? readerView,
  }) {
    return BookView(
      isDoublePageView: isDoublePageView ?? this.isDoublePageView,
      isRightToLeftMode: isRightToLeftMode ?? this.isRightToLeftMode,
      keyPressed: keyPressed ?? this.keyPressed,
      scaleTo: scaleTo ?? this.scaleTo,
      readerView: readerView ?? this.readerView,
    );
  }
}

class BookPage {
  PageEntry entry;
  int index;
  BookPage({required this.entry, required this.index});
}
