//  Label StoreMAX
//
//  Created by Anthony Gordon.
//  2020, WooSignal Ltd. All rights reserved.
//

//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yugtrend/pages/account_billing_details.dart';
import 'package:yugtrend/pages/account_detail.dart';
import 'package:yugtrend/pages/account_landing.dart';
import 'package:yugtrend/pages/account_order_detail.dart';
import 'package:yugtrend/pages/account_profile_update.dart';
import 'package:yugtrend/pages/account_register.dart';
import 'package:yugtrend/pages/account_shipping_details.dart';
import 'package:yugtrend/pages/error_page.dart';
import 'package:yugtrend/pages/product_image_viewer_page.dart';
import 'package:woosignal/models/response/order.dart';
import 'package:woosignal/models/response/product_category.dart';
import 'package:woosignal/models/response/products.dart';
import 'package:wp_json_api/wp_json_api.dart';
import 'labelconfig.dart';
import 'package:yugtrend/pages/checkout_details.dart';
import 'package:yugtrend/pages/home.dart';
import 'package:yugtrend/pages/about.dart';
import 'package:yugtrend/pages/checkout_confirmation.dart';
import 'package:yugtrend/pages/cart.dart';
import 'package:yugtrend/pages/checkout_status.dart';
import 'package:yugtrend/pages/checkout_payment_type.dart';
import 'package:yugtrend/pages/checkout_shipping_type.dart';
import 'package:yugtrend/pages/product_detail.dart';
import 'package:yugtrend/pages/browse_search.dart';
import 'package:yugtrend/pages/home_menu.dart';
import 'package:yugtrend/pages/home_search.dart';
import 'package:yugtrend/pages/browse_category.dart';
import 'package:flutter/services.dart';
import 'package:yugtrend/helpers/tools.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yugtrend/helpers/app_themes.dart';
import 'package:yugtrend/helpers/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  String initialRoute = "/home";
  if (use_wp_login == true) {
    WPJsonAPI.instance.initWith(
        baseUrl: app_base_url,
        shouldDebug: app_debug,
        wpJsonPath: app_wp_api_path);
  }

  runApp(
    new MaterialApp(
      title: app_name,
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new HomePage(),
        '/cart': (BuildContext context) => new CartPage(),
        '/error': (BuildContext context) => new ErrorPage(),
        '/checkout': (BuildContext context) => new CheckoutConfirmationPage(),
        '/account-register': (BuildContext context) =>
            new AccountRegistrationPage(),
        '/account-detail': (BuildContext context) => new AccountDetailPage(),
        '/account-update': (BuildContext context) =>
            new AccountProfileUpdatePage(),
        '/account-billing-details': (BuildContext context) =>
            new AccountBillingDetailsPage(),
        '/account-shipping-details': (BuildContext context) =>
            new AccountShippingDetailsPage(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/account-landing':
            return PageTransition(
              child: AccountLandingPage(),
              type: PageTransitionType.bottomToTop,
            );

          case '/browse-category':
            if (settings.arguments != null) {
              final ProductCategory category =
                  settings.arguments as ProductCategory;
              return PageTransition(
                child: BrowseCategoryPage(productCategory: category),
                type: PageTransitionType.fade,
              );
            }
            return PageTransition(
              child: ErrorPage(),
              type: PageTransitionType.fade,
            );

          case '/product-search':
            if (settings.arguments != null) {
              final String search = settings.arguments as String;
              return PageTransition(
                child: BrowseSearchPage(search: search),
                type: PageTransitionType.fade,
              );
            }
            return PageTransition(
              child: ErrorPage(),
              type: PageTransitionType.fade,
            );

          case '/product-detail':
            if (settings.arguments != null) {
              final Product product = settings.arguments as Product;
              return PageTransition(
                child: ProductDetailPage(product: product),
                type: PageTransitionType.rightToLeftWithFade,
              );
            }
            return PageTransition(
              child: ErrorPage(),
              type: PageTransitionType.fade,
            );

          case '/product-images':
            if (settings.arguments != null) {
              final Map<String, dynamic> args = settings.arguments;
              return PageTransition(
                  child: ProductImageViewerPage(
                      initialIndex: args["index"], arrImageSrc: args["images"]),
                  type: PageTransitionType.fade);
            }
            return PageTransition(
                child: ErrorPage(), type: PageTransitionType.rightToLeft);

          case '/account-order-detail':
            if (settings.arguments != null) {
              final int orderId = settings.arguments as int;
              return PageTransition(
                child: AccountOrderDetailPage(orderId: orderId),
                type: PageTransitionType.rightToLeftWithFade,
              );
            }
            return PageTransition(
              child: ErrorPage(),
              type: PageTransitionType.fade,
            );

          case '/checkout-status':
            if (settings.arguments != null) {
              final Order order = settings.arguments as Order;
              return PageTransition(
                child: CheckoutStatusPage(order: order),
                type: PageTransitionType.rightToLeftWithFade,
              );
            }
            return PageTransition(
              child: ErrorPage(),
              type: PageTransitionType.fade,
            );

          case '/home-menu':
            return PageTransition(
              child: HomeMenuPage(),
              type: PageTransitionType.leftToRightWithFade,
            );

          case '/checkout-details':
            return PageTransition(
              child: CheckoutDetailsPage(),
              type: PageTransitionType.bottomToTop,
            );

          case '/about':
            return PageTransition(
              child: AboutPage(),
              type: PageTransitionType.leftToRightWithFade,
            );

          case '/checkout-payment-type':
            return PageTransition(
              child: CheckoutPaymentTypePage(),
              type: PageTransitionType.bottomToTop,
            );

          case '/checkout-shipping-type':
            return PageTransition(
              child: CheckoutShippingTypePage(),
              type: PageTransitionType.bottomToTop,
            );

          case '/home-search':
            return PageTransition(
              child: HomeSearchPage(),
              type: PageTransitionType.bottomToTop,
            );
          default:
            return null;
        }
      },
      supportedLocales: app_locales_supported,
      localizationsDelegates: [
        AppLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalMaterialLocalizations.delegate
      ],
      locale: app_locale,
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        return locale;
      },
      theme: ThemeData(
        primaryColor: HexColor("#2f4ffe"),
        backgroundColor: Colors.white,
        buttonTheme: ButtonThemeData(
          hoverColor: Colors.transparent,
          buttonColor: HexColor("#529cda"),
          colorScheme: colorSchemeButton(),
          minWidth: double.infinity,
          height: 70,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: textThemeAppBar(),
          elevation: 0.0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        accentColor: Colors.black,
        accentTextTheme: textThemeAccent(),
        textTheme: textThemeMain(),
        primaryTextTheme: textThemePrimary(),
      ),
    ),
  );
}
