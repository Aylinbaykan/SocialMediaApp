import 'package:flutter/material.dart';
import 'package:socialmedia/UI/Wall/socialwall_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:socialmedia/Static/AppBars/app_bars.dart';
import 'package:socialmedia/Static/TextFields/custom_text_field.dart';
import 'package:socialmedia/UI/RootPage/root_page_view.dart';
import 'package:socialmedia/theme_singleton.dart';
import '../../../Static/Buttons/custom_action_button.dart';
import '../../Static/TakePhoto/custom_profile_photo.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class socialmediaView extends StatelessWidget with RootPage {
  const socialmediaView({Key? key}) : super(key: key);

  @override
  Widget rootWidget(BuildContext context) {
    return ViewModelBuilder<SocialMediaModel>.reactive(
        viewModelBuilder: () => SocialMediaModel(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBars.customAppBarWithTitle(
                context: context, title: "Sosyal Duvar"),
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            body: body(context: context, model: model)));
  }

  //temel widgettir
  SingleChildScrollView body(
      {required BuildContext context, required SocialMediaModel model}) {
    return SingleChildScrollView(
      child: SafeArea(
        maintainBottomViewPadding: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 100,
                left: MediaQuery.of(context).size.width / 15,
              ),
              //kullaniciya ait alanlari iceren satir
              child: Row(
                children: [
                  CustomProfilePhoto(
                    imageUrl: "https://loremflickr.com/640/480/people",
                    borderRadius: 30,
                    width: MediaQuery.of(context).size.width / 8,
                    height: MediaQuery.of(context).size.height / 16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Faruk Topal",
                          style: ThemeTextStyleSingleton.primarytextStyle(
                            context: context,
                            size: CustomFontSize.headline4,
                          ),
                        ),
                        Row(
                          children: [
                            userPostAndCommentNumberRow(
                                context: context,
                                counterNumber: "25",
                                iconName: Icons.send_to_mobile_rounded,
                                text: "Gönderi"),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 15,
                            ),
                            userPostAndCommentNumberRow(
                                context: context,
                                counterNumber: "10",
                                iconName: Icons.add_comment_outlined,
                                text: "Yorum")
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 3,
              color: Colors.yellow,
            ),
            //yeni post eklemek istenilen alani temsil eden widget
            Column(
              children: [
                CustomTextField(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  maxlines: MediaQuery.of(context).size.height ~/ 5,
                  limit: 100,
                  controller: model.descriptionText,
                  hint:
                      'Paylaşmak istediğiniz konu hakkında bir gönderi yazınız.',
                  borderColor: Colors.white,
                  radius: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomActionButton(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: CustomActionButtonHeight.low,
                        textSize: CustomFontSize.headline7,
                        buttonText: 'Fotoğraf/Video Ekle',
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        borderColor: Colors.grey,
                        isActive: true,
                        onTap: () {}),
                    CustomActionButton(
                        width: MediaQuery.of(context).size.width / 4,
                        height: CustomActionButtonHeight.low,
                        textSize: CustomFontSize.headline7,
                        buttonText: 'Paylaş',
                        backgroundColor: Colors.yellow,
                        textColor: Colors.black,
                        onTap: () {}),
                  ],
                ),

                //apiden gelen postlarin listelendigi widget
                //apiden gelen veri yavasladigi zaman ekranda hatali bir goruntu
                //olusmamasi adina bos stack yapisi gorunmektedir
                for (int i = 0; i < 42; i++)
                  context.watch<SocialMediaModel>().state == PostState.BUSY
                      ? buildLoadingWidget()
                      : context.watch<SocialMediaModel>().state ==
                              PostState.ERROR
                          ? buildErrorWidget()
                          : postExample(
                              context: context, model: model, index: 0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Center buildErrorWidget() => Center(child: Stack());

  Center buildLoadingWidget() => Center(child: Stack());

  //Kullaniciya ait olan gonderi ve yorum sayisini gosteren widget
  Row userPostAndCommentNumberRow(
      {required BuildContext context,
      required IconData iconName,
      required text,
      required counterNumber}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          iconName,
          color: Colors.yellow,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 80,
        ),
        Text(
          text,
          style: ThemeTextStyleSingleton.primarytextStyle(
            context: context,
            size: CustomFontSize.headline7,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 80,
        ),
        Text(
          counterNumber,
          style: ThemeTextStyleSingleton.primarytextStyle(
            context: context,
            size: CustomFontSize.headline7,
          ),
        ),
      ],
    );
  }

  //Bir postun genel wigdetidir

  Column postExample({
    required BuildContext context,
    required SocialMediaModel model,
    String? photoUrlText,
    String? senderName,
    String? postDate,
    String? descriptionText,
    String? mediaUrl,
    String? likeCount,
    String? disLikeCount,
    required int index,
  }) {
    final job = context.read<SocialMediaModel>().jobList[index];

    SocialMediaModel.count = job.id.toString();

    var formatter = new DateFormat('dd/MM/yyyy');
    String formattedDate = formatter.format(job.createdAt!);

    senderName = job.authorName.toString();
    postDate = formattedDate.toString();
    descriptionText = job.description.toString();
    photoUrlText = job.authorProfileImage.toString();
    mediaUrl = job.media.toString();
    likeCount = job.likeCount.toString();
    disLikeCount = job.disLikeCount.toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          thickness: 3,
          color: Colors.yellow,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 100,
            left: MediaQuery.of(context).size.width / 15,
          ),
          child: Row(
            children: [
              CustomProfilePhoto(
                imageUrl: photoUrlText,
                borderRadius: 30,
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.height / 16,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 10,
                  //right: MediaQuery.of(context).size.width / 10
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      senderName,
                      style: ThemeTextStyleSingleton.primarytextStyle(
                        context: context,
                        size: CustomFontSize.headline4,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: CustomFontSize.headline7.fontSize,
                        ),
                        Text(
                          postDate,
                          style: ThemeTextStyleSingleton.primarytextStyle(
                            context: context,
                            size: CustomFontSize.headline8,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 80,
              left: MediaQuery.of(context).size.width / 15,
              bottom: MediaQuery.of(context).size.height / 100,
              right: MediaQuery.of(context).size.width / 15),
          child: Text(
            descriptionText.toString(),
            style: ThemeTextStyleSingleton.primarytextStyle(
              context: context,
              size: CustomFontSize.headline6,
            ),
          ),
        ),
        CustomProfilePhoto(
          imageUrl: mediaUrl,
          borderRadius: 1,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 5,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 15,
          ),
          child: Row(
            children: [
              iconButton(
                context: context,
                counterNumber: likeCount,
                iconName: Icons.tag_faces,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
              iconButton(
                context: context,
                counterNumber: disLikeCount,
                iconName: Icons.sentiment_very_dissatisfied_outlined,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
              iconButton(
                context: context,
                counterNumber: "10",
                iconName: Icons.comment,
              ),
            ],
          ),
        ),

        ///yorum silindiginde hata vermemsi icin bos stack tanimlanistir
        context.watch<SocialMediaModel>().state == PostState.BUSY
            ? Stack()
            : context.watch<SocialMediaModel>().state == PostState.ERROR
                ? Stack()
                : Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 15,
                        right: MediaQuery.of(context).size.width / 15,
                        top: MediaQuery.of(context).size.width / 15),
                    child: commentLine(context: context)),
        Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 15,
              right: MediaQuery.of(context).size.width / 15,
            ),
            child: textButton(
                buttonTextName: "diğer yorumları görünüz ...",
                context: context)),
        Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 15,
              right: MediaQuery.of(context).size.width / 15,
            ),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 7,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 60,
                        right: MediaQuery.of(context).size.width / 15,
                      ),
                      child: CustomProfilePhoto(
                        imageUrl: photoUrlText,
                        borderRadius: 50,
                        height: MediaQuery.of(context).size.height / 20,
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                    ),
                    CustomTextField(
                      controller: model.commentDescriptionText,
                      hint: "Konu hakkında bir şeyler yazınız",
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      maxlines: 1,
                      borderColor: Colors.white,
                      radius: 100,
                    ),
                  ],
                ))),
      ],
    );
  }

  //tum ikon butonlari olustururken tekrar edilmemesi icin temel ikon buton widgeti olusturuldu

  Column iconButton(
      {required BuildContext context,
      required IconData iconName,
      required String counterNumber}) {
    return Column(
      children: [
        IconButton(
          iconSize: MediaQuery.of(context).size.height / 40,
          icon: Icon(
            iconName,
          ),
          color: Colors.yellow,
          onPressed: () {},
        ),
        Text(
          counterNumber,
          style: ThemeTextStyleSingleton.primarytextStyle(
            context: context,
            size: CustomFontSize.headline7,
          ),
        ),
      ],
    );
  }

  //posta ait yorumlari listeleyen widget
  Row commentLine({
    required BuildContext context,
    String? authorProfileImage,
    String? authorName,
    String? description,
    int? likeCount,
    int? disLikeCount,
  }) {
    final comment = context.read<SocialMediaModel>().commentList[0];
    authorProfileImage = comment.authorProfileImage;
    authorName = comment.authorName;
    description = comment.description;
    likeCount = comment.likeCount;
    disLikeCount = comment.disLikeCount;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomProfilePhoto(
          imageUrl: authorProfileImage,
          borderRadius: 30,
          width: MediaQuery.of(context).size.width / 8,
          height: MediaQuery.of(context).size.height / 16,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  authorName,
                  style: ThemeTextStyleSingleton.primarytextStyle(
                    context: context,
                    size: CustomFontSize.headline4,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                ),
                iconButton(
                    context: context, iconName: Icons.delete, counterNumber: "")
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                description,
                style: ThemeTextStyleSingleton.primarytextStyle(
                  context: context,
                  size: CustomFontSize.headline6,
                ),
              ),
            ),
            Row(
              children: [
                iconButton(
                  context: context,
                  counterNumber: likeCount.toString(),
                  iconName: Icons.tag_faces,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 30,
                ),
                iconButton(
                  context: context,
                  counterNumber: disLikeCount.toString(),
                  iconName: Icons.sentiment_very_dissatisfied_outlined,
                ),
              ],
            )
          ],
        ),
        //Text(Post.)
        //buildListItem1(context: context, index: 1)
      ],
    );
  }

  //temel textbuttonlar icin olan widgettir
  TextButton textButton(
      {required BuildContext context, required String buttonTextName}) {
    return TextButton(
      onPressed: () {},
      child: Text(
        buttonTextName,
        style: ThemeTextStyleSingleton.primarytextStyle(
          context: context,
          size: CustomFontSize.headline7,
        ),
      ),
    );
  }
}
