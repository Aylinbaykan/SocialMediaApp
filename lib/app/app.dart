import "package:socialmedia/UI/Wall/socialwall_view.dart";
import "package:socialmedia/service/theme_service.dart";
import "package:stacked/stacked_annotations.dart";
import "package:stacked_services/stacked_services.dart";

import "../main.dart";

@StackedApp(
    routes: [
/* Bu kısım sizin routelarınızın bulunacağı yerdir. Örnek bir route ekledim isterseniz CupertinoRoute da kullanabilirsiniz. */
      MaterialRoute(page: MainClass, initial: true),
      MaterialRoute(page: socialmediaView),
    ],
/*Servisler dependencies kısmına eklenmektedir. Başlangıçta NavigationService'in geçişleri kontrol etmek için eklenmesi gerekmektedir.*/
    dependencies: [
      LazySingleton(classType: NavigationService),
      LazySingleton(classType: ThemeService),
    ],
    logger: StackedLogger())
class App {}
