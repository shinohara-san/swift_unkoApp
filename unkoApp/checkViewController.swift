import UIKit
import FirebaseCore
import FirebaseFirestore
import Firebase

class checkViewController: UIViewController {
   
    @IBOutlet weak var textView: UITextView!
    
    var db = Firestore.firestore()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        Firestore.firestore().collection("unkos").order(by: "date", descending: true).getDocuments { (snaps, error) in
            if let error = error {
                   fatalError("\(error)")
               }
               guard let snaps = snaps else { return }
               for document in snaps.documents {
                
                let timestamp: Timestamp = document.get("date") as! Timestamp
                let dateValue = timestamp.dateValue()
                let f = DateFormatter()
                   f.locale = Locale(identifier: "ja_JP")
                   f.dateStyle = .long
                   f.timeStyle = .medium
                   let date = f.string(from: dateValue)
//                   print("date: \(date)")


//                print(document.data()["date"]!)
                self.textView.text += date + (document.data()["result"] as? String ?? "") + "\n" 
//
//
//               }
            }
        }
    }}
