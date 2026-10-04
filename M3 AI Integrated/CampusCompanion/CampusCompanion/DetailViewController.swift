//
//  Type DetailViewController.swift
//  CampusCompanion
//
//  Created by Arianne Julian Cruz on 9/21/26.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    var userName: String = ""
    var wantsNotifications: Bool = false
    var userRole: String = ""
    var eventDate: String = "Oct 15, 2026"
    var guestCount: Int = 1
    var announcement: CampusAnnouncement?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let announcement = announcement {
            title = announcement.category
            messageLabel.text = """
            \(announcement.title)
            Date: \(announcement.date)
            Category: \(announcement.category)
            Priority: \(announcement.priority)
            Posted by: \(announcement.postedBy)
            """
            return
        }

        title = "Campus Events"
        let notificationStatus = wantsNotifications ? "on" : "off"
        messageLabel.text = "Welcome, \(userName)! (\(userRole))\nNotifications: \(notificationStatus).\nEvent: \(eventDate)\nGuests: \(guestCount)"
    }
}
