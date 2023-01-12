// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:stacked/stacked.dart';

// Project imports:
import 'package:socialmedia/UI/RootPage/root_page_view_model.dart';

mixin RootPage<Page extends BasePage> {
  Widget build(BuildContext context) {
    return ViewModelBuilder<RootPageViewModel>.reactive(
      viewModelBuilder: () => RootPageViewModel(),
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          model.closeKeyboard();
          //model.newActivity();
        },
        onPanDown: (_) {
          //model.newActivity();
        },
        onScaleStart: (_) {
          // model.newActivity();
        },
        child: rootWidget(context),
      ),
    );
  }

  Widget rootWidget(BuildContext context);
}

abstract class BasePage extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);
}
