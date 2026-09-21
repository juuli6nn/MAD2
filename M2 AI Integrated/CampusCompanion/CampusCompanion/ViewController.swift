//
//  ViewController.swift
//  CampusCompanion
//
//  Created by Arianne Julian Cruz on 9/21/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var notifySwitch: UISwitch!
    @IBOutlet weak var roleSegmentedControl: UISegmentedControl!
    @IBOutlet weak var eventDatePicker: UIDatePicker!
    @IBOutlet weak var guestStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func getStartedTapped(_ sender: UIButton) {
        subtitleLabel.text = "Let's get started!"
    }

    @IBAction func exploreButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "ShowDetailSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue" {
            if let destinationVC = segue.destination as? DetailViewController {
                destinationVC.userName = nameTextField.text ?? "Guest"
                destinationVC.wantsNotifications = notifySwitch.isOn
                if roleSegmentedControl.selectedSegmentIndex == 0 {
                    destinationVC.userRole = "Student"
                } else {
                    destinationVC.userRole = "Faculty"
                }
                // Format the date picker value
                let formatter = DateFormatter()
                formatter.dateStyle = .medium
                destinationVC.eventDate = formatter.string(from: eventDatePicker.date)

                // Pass the stepper value
                destinationVC.guestCount = Int(guestStepper.value)
            }
        }
    }
}
        // Do any additional setup after loading the view.
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

