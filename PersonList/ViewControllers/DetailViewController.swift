import UIKit

class DetailViewController: UIViewController {
    var person: Person!
    
    
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = person.contact
        
        if let person = person {
            phoneLabel.text = "Phone: \(person.phone)"
            emailLabel.text = "Email: \(person.email)"
        }
    }
    
}
