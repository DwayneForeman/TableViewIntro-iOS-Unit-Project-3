//
//  ExpensesViewController.swift
//  DMTableViewIntro
//
//  Created by David Ruvinskiy on 4/4/23.
//

import UIKit

/**
 1. Create the user interface. See the provided screenshot for how the UI should look. Feel free to customize the colors, font, etc.
 */
class ExpensesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // How many rows/cells do you want in your tableView?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Remember our TableViews name is exspenseTableView
        return expenses.count
    }
    
    // This method is asking us for a UITableView cell that it should display for every row in our table view
    // This method will loop/run (NO FOR LOOP NEEDED!) however many number of times the method above gets in return from it's return stataent above (return expenses.count) in this case
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // We'd need to create one reusable cell and return it to the table view
        // withIdentifier:  Will equal the name we gave our cell in the identifier text field option
        // for: will equal the current position which is exactly the "indexPath" that the functon gives us as a parameter name
        let cell = exspenseTableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        // Now, since we have our cell we can set things to each cell like the title/data it should display
        // breakdown of this line: expenses[indexPath.row]
        // The above allows us the access the value of each index on the expenses array by row. All .row does is simply tap in the value of the index for that particular row. IT IS VERY SIMPLE
        // AND WE KNOW!!! In order to get a value out of an array we must list the array name followed by brackets which should contain whicever paramaeter and keyword we need to extract the value
        cell.textLabel?.text = expenses[indexPath.row]
        // Now we need to return the cell we just created
        return cell
    }
    
    
    /**
     2 Connect the UITableView to the code.
     */
    @IBOutlet weak var exspenseTableView: UITableView!
    
    /**
     You will be displaying these expenses in the UITableView. You do not need to modify this code.
     */
    let expenses = ["Rent", "Groceries", "Utilities", "Transportation", "Entertainment", "Clothing", "Eating Out", "Travel", "Insurance", "Phone Bill"]

    /**
     3. This function will get called automatically as soon as the screen loads. Call the `configureTableView` function.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        
    }
    
    /**
     4. Have the `ExpensesViewController` conform to the `UITableViewDelegate` and `UITableViewDataSource` protocols. Set the `tableView`'s `delegate` and `dataSource` to self. The number of rows in section should be the number of expenses we have. Each cell should display the expense at the corresponding index in the `expenses` array.
     
        REFRESHER on Delegates and DataSource for TablewViews:
     
    1)  Delegate: The delegate is like a helper or assistant for the table view. Setting ouR tableView's delegate property to our current ViewController means that our current ViewController will handle certain tasks or events on behalf of the table view. The delegate is the one who is in control. We hand off the burgen of the TableView to our ViewController. It will receive notifications or callbacks from the table view when specific events occur, such as when a row is selected or when the table view needs information to display.
     
     2) DataSource: The data source is responsible for providing the necessary data that the table view needs to display its content. Setting ouR tableView's dataSource property to our current ViewController means that our current ViewController will supply the data for the table view. It will implement methods that the table view will call to get the number of sections, number of rows in each section, and the actual content to display in each cell. In other words
     
     
     
     */
    
    
    
    // Why are we setting our dlegate and datasource to self in this particular function out of all the other functions?
    // Aswer: This is simply because this is the function we are caling in viewDidLoad. it means we want to set up the table view and its behavior right after the view has been loaded.
    
    func configureTableView() {
        
        // The delegate property of our UITableView that we named exspenseTableView is being set to self, meaning that our current class ExpensesViewController that we are inside of RIGHT NOW will be responsible for handling the delegate method of the/OUR exspenseTableView.
        // In laymans terms we are saying: The delegate property of this table view will be equal to this current ViewController we're inside of. Therefore, this current ViewController has the reponsiblity of it (delegate property)
        exspenseTableView.delegate = self
        // The dataSource property of our UITableView that we named exspenseTableView is being set to self, meaning that our current class ExpensesViewController that we are inside of RIGHT NOW will be responsible for handling the dataSource method of the/OUR exspenseTableView.
        // In laymans terms we are saying: The dataSource property of this table view will be equal to this current ViewController we're inside of. Therefore, this current ViewController has the reponsiblity of it (dataSource property)
        exspenseTableView.dataSource = self
    }
}
