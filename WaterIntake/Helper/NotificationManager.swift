//
//  NotificationManager.swift
//  WaterIntake
//
//  Created by Ashish Prajapati on 27/11/24.
//

import Foundation
import UserNotifications


class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    static let shared = NotificationManager()

    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
            if granted {
                print("Notifications allowed")
            }
        }
    }

    func notifyCompleteDailyTarget() {
        
        requestAuthorization()
        
        let content = UNMutableNotificationContent()
        content.title = "Hydration Reminder"
        content.body = "You have completed your daily hydration target!.."
        content.sound = .default
        

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
    
    func notifyAfterDailyTarget() {
        let content = UNMutableNotificationContent()
        content.title = "Hydration Reminder"
        content.body = "You are on right track, now drinking more than daily target!.."
        content.sound = .default
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }
    
}
