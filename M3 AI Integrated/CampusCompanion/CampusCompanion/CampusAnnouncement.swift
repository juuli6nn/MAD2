import Foundation

struct CampusAnnouncement {
    let title: String
    let date: String
    let category: String
    let priority: String
    let postedBy: String

    var isUrgent: Bool {
        priority == "Urgent"
    }
}

extension CampusAnnouncement {
    static let sampleAnnouncements: [CampusAnnouncement] = [
        CampusAnnouncement(
            title: "Enrollment Period Extended",
            date: "August 3, 2026",
            category: "Registrar",
            priority: "Urgent",
            postedBy: "Office of the Registrar"
        ),
        CampusAnnouncement(
            title: "Library Orientation Week",
            date: "August 5, 2026",
            category: "Library",
            priority: "Normal",
            postedBy: "University Library"
        ),
        CampusAnnouncement(
            title: "System Maintenance Advisory",
            date: "August 7, 2026",
            category: "Technology",
            priority: "Urgent",
            postedBy: "IT Services"
        ),
        CampusAnnouncement(
            title: "Student Organization Fair",
            date: "August 10, 2026",
            category: "Student Affairs",
            priority: "Normal",
            postedBy: "Office of Student Affairs"
        ),
        CampusAnnouncement(
            title: "Scholarship Application Deadline",
            date: "August 14, 2026",
            category: "Scholarships",
            priority: "Urgent",
            postedBy: "Financial Aid Office"
        ),
        CampusAnnouncement(
            title: "Campus Wellness Seminar",
            date: "August 18, 2026",
            category: "Health",
            priority: "Normal",
            postedBy: "Health Services"
        )
    ]
}
