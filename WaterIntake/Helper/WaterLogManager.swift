//
//  WaterLogManager.swift
//  WaterIntake
//
//  Created by Ashish Prajapati on 27/11/24.
//

import Foundation
import CoreData


class WaterLogManager {
    static let shared = WaterLogManager()
    private let context = PersistenceController.shared.container.viewContext
    
    func addWaterLog(quantity: String, unit: String) {
        let newLog = WaterLog(context: context)
        newLog.id = UUID()
        newLog.date = Date()
        newLog.quantity = quantity
        newLog.unit = unit
        saveContext()
    }
    
//    func fetchLogs(for date: Date) -> [WaterLog] {
//        let fetchRequest: NSFetchRequest<WaterLog> = WaterLog.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "date >= %@ AND date < %@", date.startOfDay as NSDate, date.endOfDay as NSDate)
//        return (try? context.fetch(fetchRequest)) ?? []
//    }
    
    func updateLog(log: WaterLog, quantity: String, unit: String) {
        log.quantity = quantity
        log.unit = unit
        saveContext()
    }
    
    func deleteLog(log: WaterLog) {
        context.delete(log)
        saveContext()
    }
    
    private func saveContext() {
        if context.hasChanges {
            try? context.save()
        }
    }
}
