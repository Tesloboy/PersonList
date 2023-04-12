//
//  PersonListViewControllerV2TableViewController.swift
//  PersonList
//
//  Created by Viktor Teslenko on 11.04.2023.
//

import UIKit

class PersonListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let people = DataManager.shared.getPeople()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    


    // MARK: - Table view data source

}
extension PersonListViewController: UITableViewDataSource, UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! DetailViewController
        //передадим значение трека из выделенной ячейки
        // 1) получим индекс выбранной ячейки, сразу же его развернув(для безопасности)
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        viewController.person = people[indexPath.row]
    }
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
}

 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let person = people[indexPath.row]
    cell.textLabel?.text = "\(person.firstName) \(person.lastName)"
     cell.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            return cell
}

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
