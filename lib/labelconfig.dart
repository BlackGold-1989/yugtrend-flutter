import 'dart:ui';

const app_name = "YUG TREND";

const app_key =
    "app_7cb70950b5a8bba76e1b1aa1e3b6c48e020b035fca988e7c8000d92d7812";

const app_logo_url =
    "https://www.yugtrend.com/wp-content/uploads/2020/08/Yug-Trend-Trim-150x150.png";

const app_terms_url = "https://www.yugtrend.com/terms-conditions/";
const app_privacy_url = "https://www.yugtrend.com/privacy-policy/";
/*<! ------ APP SETTINGS ------!>*/

const app_currency_symbol = "\₹";
const app_currency_iso = "inr";
const Locale app_locale = Locale('en');
const List<Locale> app_locales_supported = [Locale('en')];
// If you want to localize the app, add the locale above
// then create a new lang json file using keys from en.json
// e.g. lang/es.json

/*<! ------ PAYMENT GATEWAYS ------!>*/

// Available: "Stripe", "CashOnDelivery", "RazorPay"
// Add the method to the array below e.g. ["Stripe", "CashOnDelivery"]

const app_payment_methods = ["CashOnDelivery"];

/*<! ------ STRIPE (OPTIONAL) ------!>*/

// Your StripeAccount key from WooSignal
// link: https://woosignal.com/dashboard

const app_stripe_account = "Your Stripe Key from WooSignal";

const app_stripe_live_mode = false;

const use_wp_login = true;
const app_base_url = "https://www.yugtrend.com"; // change to website url
const app_forgot_password_url =
    "https://www.yugtrend.com/my-account/lost-password/"; // change to your forgot password url
const app_wp_api_path = "/wp-json"; // By default "/wp-json" should work

/*<! ------ Razor Pay (OPTIONAL) ------!>*/
// https://razorpay.com/

const app_razor_id = "Your Razor ID from RazorPay";

/*<! ------ DEBUGGER ENABLED ------!>*/

const app_debug = true;
