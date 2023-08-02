//
//  NotificationService.swift
//  NotificationService
//
//  Created by Tejas Narayanaswamy on 01/08/23.
//

import CleverTapSDK
import UserNotifications
import CTNotificationService

class NotificationService: CTNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        let profile: Dictionary<String, Any> = [
                    "Identity": "99012345678"]
        CleverTap.sharedInstance()?.onUserLogin(profile)
                // call to record the Notification viewed
        CleverTap.sharedInstance()?.recordNotificationViewedEvent(withData:request.content.userInfo)
        super.didReceive(request, withContentHandler: contentHandler)
    }

//    override func serviceExtensionTimeWillExpire() {
//        // Called just before the extension will be terminated by the system.
//        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
//        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
//            contentHandler(bestAttemptContent)
//        }
//    }

}
