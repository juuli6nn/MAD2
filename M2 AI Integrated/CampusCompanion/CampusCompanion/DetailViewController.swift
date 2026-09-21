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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationStatus = wantsNotifications ? "on" : "off"
        messageLabel.text = "Welcome, \(userName)! (\(userRole))\nNotifications: \(notificationStatus).\nEvent: \(eventDate)\nGuests: \(guestCount)"
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
