import UIKit

class AnnouncementCell: UITableViewCell {

    @IBOutlet weak var categoryIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    func configure(with announcement: CampusAnnouncement) {
        let title = announcement.title ?? "Untitled Announcement"
        let category = announcement.category ?? "Uncategorized"
        let date = announcement.date ?? "No date"

        titleLabel.text = title
        dateLabel.text = "\(category) | \(date)"
        categoryIconImageView.image = UIImage(systemName: "megaphone.fill")
        categoryIconImageView.tintColor = .systemTeal
        accessoryType = .none
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
        categoryIconImageView.tintColor = .systemTeal
    }
}
