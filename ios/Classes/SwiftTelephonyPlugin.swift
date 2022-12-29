import Flutter
import UIKit
import CoreTelephony

public class SwiftTelephonyPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugins.shounakmulay.com/foreground_sms_channel", binaryMessenger: registrar.messenger())
    let instance = SwiftTelephonyPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "getSimOperatorName") {
        let networkInfo = CTTelephonyNetworkInfo()
        if let carrier = networkInfo.subscriberCellularProvider {
            result(carrier.carrierName)
        } else {
            result("iOS")
        }
    } else {
        result("iOS")
    }
  }
}
