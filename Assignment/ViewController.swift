//
//  ViewController.swift
//  Assignment
//
//  Created by Chris Solomon on 2017-12-13.
//  Copyright © 2017 Chris Solomon. All rights reserved.
//

import UIKit

struct JSONRoot: Decodable {
	let List: [Person]
}

struct Person: Decodable {
	let ID: String?
	let FirstName: String?
	let LastName: String?
	let Portrait: String?
	let BadgeColor: String?
	let description: String?
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	let JSONURL = "https://s3.amazonaws.com/sapi.aminheidari.com/tmp/list.json"
	var personList = [Person]()
	
	var selection = 0

	override func awakeFromNib() {
		loadJSON()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
//		loadJSON()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func loadJSON()
	{
		print(JSONURL)
		guard let url = URL(string: JSONURL) else
		{ return }
		
		URLSession.shared.dataTask(with: url) {(data, response, err) in
			
			do {
				let root = try JSONDecoder().decode(JSONRoot.self, from: data!)
				self.personList = root.List
				
//				print(self.personList.count)
//
//				for person in self.personList
//				{
//					print (person.LastName!)
//				}
			}
			catch
			{
				print("JSON parse error")
			}
		
		}.resume()
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
	{
		return self.personList.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
		
		cell.id.text = personList[indexPath.item].ID
		cell.fullName.text = personList[indexPath.item].FirstName! + " " + personList[indexPath.item].LastName!
		
//		Portrait
//		BadgeColor
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print(indexPath.item)
//		self.selection = indexPath.item
		
		let person = personList[indexPath.item]
		performSegue(withIdentifier: "detailSegue", sender: person)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "detailSegue"
		{
			let detailController = segue.destination as! DetailViewController
//			detailController.desc.text = personList[selection].description
			if let person = sender as? Person
			{
//				detailController.id.text = person.ID!
				detailController._id = person.ID!
				detailController._fullName = person.FirstName! + " " + person.LastName!
				detailController._description = person.description!
			}
		}
//
	}
}

