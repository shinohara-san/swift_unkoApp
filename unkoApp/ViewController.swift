import UIKit
import FirebaseFirestore
import FirebaseCore

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    let db = Firestore.firestore()
    
    var resultContainer:String = ""
    
    let result = ["結果を選んでください","朝両方した", "朝ちょこ", "朝こつ", "朝両方なし", "朝行けず", "夕両方した", "夕ちょこ", "夕こつ", "夕両方なし", "夕行けず"]
    
    @IBOutlet weak var resultLabel: UILabel!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return result.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        resultContainer = result[row]
        return result[row]
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        resultLabel.text = resultContainer + "?"
    }
    
    
    
    @IBAction func sendButton(_ sender: Any) {
        resultLabel.text = "送信しましたー"
        var ref: DocumentReference?
        ref = db.collection("unkos").addDocument(data: [
            "result": resultContainer,
            "date":Date()
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
    }

}

