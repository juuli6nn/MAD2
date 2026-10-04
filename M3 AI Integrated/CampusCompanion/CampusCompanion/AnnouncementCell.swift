import UIKit

class AnnouncementCell: UITableViewCell {

    @IBOutlet weak var categoryIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    func configure(with announcement: CampusAnnouncement) {
        titleLabel.text = announcement.title
        dateLabel.text = "\(announcement.category) | \(announcement.date) | \(announcement.postedBy)"

        if announcement.isUrgent {
            categoryIconImageView.image = UIImage(systemName: "exclamationmark.triangle.fill")
            categoryIconImageView.tintColor = .systemRed
            accessoryType = .detailButton
        } else {
            categoryIconImageView.image = UIImage(systemName: "megaphone.fill")
            categoryIconImageView.tintColor = .systemTeal
            accessoryType = .none
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
        categoryIconImageView.tintColor = .systemTeal
    }
}
