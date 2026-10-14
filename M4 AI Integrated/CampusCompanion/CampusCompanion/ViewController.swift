//
//  ViewController.swift
//  CampusCompanion
//
//  Created by Arianne Julian Cruz on 9/21/26.
//

import UIKit

private enum DefaultsKey {
    static let studentName = "studentName"
    static let notificationsEnabled = "notificationsEnabled"
    static let selectedRoleIndex = "selectedRoleIndex"
}

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

        nameTextField.text = UserDefaults.standard.string(forKey: DefaultsKey.studentName) ?? ""
        notifySwitch.isOn = UserDefaults.standard.bool(forKey: DefaultsKey.notificationsEnabled)
        roleSegmentedControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: DefaultsKey.selectedRoleIndex)
    }

    @IBAction func getStartedTapped(_ sender: UIButton) {
        subtitleLabel.text = "Let's get started!"
    }

    @IBAction func exploreButtonTapped(_ sender: Any) {
        nameTextField.resignFirstResponder()
        UserDefaults.standard.set(nameTextField.text ?? "", forKey: DefaultsKey.studentName)
        UserDefaults.standard.set(notifySwitch.isOn, forKey: DefaultsKey.notificationsEnabled)
        UserDefaults.standard.set(roleSegmentedControl.selectedSegmentIndex, forKey: DefaultsKey.selectedRoleIndex)
        performSegue(withIdentifier: "ShowDetailSegue", sender: self)
    }

    @IBAction func resetPreferencesTapped(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: DefaultsKey.studentName)
        UserDefaults.standard.removeObject(forKey: DefaultsKey.notificationsEnabled)
        UserDefaults.standard.removeObject(forKey: DefaultsKey.selectedRoleIndex)

        nameTextField.text = ""
        notifySwitch.isOn = false
        roleSegmentedControl.selectedSegmentIndex = 0
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
