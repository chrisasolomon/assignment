//
//  DetailViewController.swift
//  Assignment
//
//  Created by Chris Solomon on 2017-12-14.
//  Copyright © 2017 Chris Solomon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

//	var person: Person
	var _fullName = ""
	var _id = ""
	var _description = ""

	@IBOutlet weak var fullName: UILabel!
	@IBOutlet weak var id: UILabel!
	@IBOutlet weak var desc: UILabel!
	@IBOutlet weak var picture: UIImageView!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		fullName.text = _fullName
		id.text = _id
		desc.text = _description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func dismiss(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
