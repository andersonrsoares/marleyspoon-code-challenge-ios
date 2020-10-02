//
//  ViewController.swift
//  marleyspoon-code-challenge-iOS
//
//  Created by Anderson Soares on 01/10/20.
//  Copyright © 2020 Anderson. All rights reserved.
//

import UIKit
import SDWebImage
import SVProgressHUD


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var recipes = [Recipe]()
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initTableView()
        loadData()
        
    }

    func initTableView(){
          let nib = UINib(nibName: "RecipeTableViewCell", bundle: nil)
        
            tableview.register(nib, forCellReuseIdentifier: "RecipeTableViewCell")
            tableview.dataSource = self
            tableview.delegate =  self
    }
    
    func loadData(){
        SVProgressHUD.show()
        APIService.loadRecipes(parameters: QueryRecipes()) { (response) in
            if let data = response.data {
                self.recipes = data.recipeCollection?.items ?? []
            }else{
                
            }
            SVProgressHUD.dismiss()
            self.tableview.reloadData()
        }
    }

      // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
          // #warning Incomplete implementation, return the number of sections
          return 1
      }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          // #warning Incomplete implementation, return the number of rows
          return recipes.count
      }

 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCell", for: indexPath) as! RecipeTableViewCell

        let item = recipes[indexPath.item]
        
        
        if let  urlString = item.photo?.url, // forced unwrapped
            let url = URL(string: urlString){
            cell.imageview.sd_setImage(with: url, placeholderImage:UIImage(named: "image_placeholder"))
            cell.imageview.contentMode = .scaleAspectFill
        }
    
        cell.labelTitle.text = item.title
          return cell
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        performSegue(withIdentifier: "opendetails", sender: recipes[indexPath.item].sys?.id)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          // Get the new view controller using segue.destination.
          // Pass the selected object to the new view controller.
          
          
          if segue.identifier == "opendetails" {
              let vc = segue.destination as? RecipeTableViewController
              vc?.recipeId = sender as? String ?? ""

        }
        
    }
}

