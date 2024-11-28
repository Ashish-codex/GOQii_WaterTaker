//
//  NotificationManager.swift
//  WaterIntake
//
//  Created by Ashish Prajapati on 27/11/24.
//

import Foundation
import UserNotifications


class NotificationManager {
    static let shared = NotificationManager()

    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
            if granted {
                print("Notifications allowed")
            }
        }
    }

    func scheduleReminder(hour: Int, minute: Int) {
        let content = UNMutableNotificationContent()
        content.title = "Hydration Reminder"
        content.body = "Time to drink water!"
        content.sound = .default

        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
}
