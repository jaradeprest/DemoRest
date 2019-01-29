//
//  PostParser.swift
//  DemoRest
//
//  Created by mobapp04 on 29/01/2019.
//  Copyright © 2019 mobapp04. All rights reserved.
//

import Foundation

class PostParser {
    
    static func getAllPosts() -> [UserPost]{
        //op welk adres staat de data? Deze variabele zal de uri voorstellen (url voor internet)
        let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts")!
        //starten met lege array
        var posts = [UserPost]()
        //fouten voorzien (geen verbinding met internet, verkeerde data...) en opvangen:
        do{
            //ruwe data van url binnen halen
            let data = try Data.init(contentsOf: url)
            //voorlopige test, om te zien of er iets binnenkomt
            print(data)
            //test is ok, dus JSON ARRAY eruit halen. Data omzetten naar array van objecten.
            let jsonArray = try JSONSerialization.jsonObject(with: data) as! [NSObject] /*data omzetten met serialization*/
            //array overlopen met for loop
            for item in jsonArray {
                //value voor key. Geeft generiek object terug, dus moeten we nog casten
                let id = item.value(forKey: "id") as! Int
                let userID = item.value(forKey: "userId") as! Int
                let title = item.value(forKey: "title") as! String
                let body = item.value(forKey: "body") as! String
                
                let currentPost = UserPost.init(id: id, userID: userID, title: title, body: body)
                posts.append(currentPost)
            }
        }catch{
            print("het werkt niet")
        }
        return posts
    }
    
}
