import UIKit

class ContactsTableViewController: UIViewController {
    
    
    @IBOutlet weak var tableView2: UITableView!
    
    let people2 = DataManager.shared.getPeople()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView2.register(UITableViewCell.self, forCellReuseIdentifier: "nameCell")
        tableView2.register(UITableViewCell.self, forCellReuseIdentifier: "phoneCell")
        tableView2.register(UITableViewCell.self, forCellReuseIdentifier: "emailCell")
    }
}

extension ContactsTableViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return people2.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people2[indexPath.section]

        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
            cell.textLabel?.text = "\(person.firstName) \(person.lastName)"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
            cell.textLabel?.textColor = .black
            cell.backgroundColor = .systemGray6
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "phoneCell", for: indexPath)
            cell.textLabel?.text = person.phone
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            cell.imageView?.image = UIImage(systemName: "phone")
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "emailCell", for: indexPath)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            cell.textLabel?.text = person.email
            cell.imageView?.image = UIImage(systemName: "envelope")
            return cell
        default:
            fatalError("Unexpected indexPath row")
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row % 3 == 0 ? 20 : 35 // or another height you prefer
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
