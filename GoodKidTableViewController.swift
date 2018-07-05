import UIKit
import AVFoundation
class GoodKidTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    var spanishDelegateGood = String()
    func didChangeSpanishGood(inString: String)
    {
        self.spanishDelegateGood = inString
    }
    let goodKidTableContent = [" wearing seatbelt","wearing bicycle helmet"," wearing a life jacket"," behaving / mall police","behaving  /store police"," behaving / resturent"," behaving / school","homework","  general","telling the truth","eating your food","sleeping in your bed "," picking up toys","cleaning up room "]
    let audio1 = ["English_Good_WearingSeatBuckle","English_Good_WearingBicycleHelmet","English_Good_WearingLifeJacket","English_Good_BehavingMallPolice","English_Good_BehavingStorePolice","English_Good_BehavingRestaurant","English_Good_BehavingSchool","English_Good_WearingSeatBuckle","English_Good_WearingBicycleHelmet","English_Good_WearingLifeJacket","English_Good_BehavingMallPolice","English_Good_BehavingStorePolice","English_Good_BehavingRestaurant","English_Good_BehavingSchool"]   
    let spanishAudioGood = ["Spanish_Good_WearingSeatBuckle","Spanish_Good_WearingBicycleHelmet","Spanish_Good_WearingLifeJacket","Spanish_Good_BehavingMallPolice","Spanish_Good_BehavingStorePolice","Spanish_Good_BehavingRestaurant","Spanish_Good_BehavingSchool","Spanish_Good_WearingSeatBuckle","Spanish_Good_WearingBicycleHelmet","Spanish_Good_WearingLifeJacket","Spanish_Good_BehavingMallPolice","Spanish_Good_BehavingStorePolice","Spanish_Good_BehavingRestaurant","Spanish_Good_BehavingSchool"]
     var audioPlayer = AVAudioPlayer ()
      let appDelegate = UIApplication.shared.delegate as! AppDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return goodKidTableContent.count
    }
    @IBOutlet weak var imgViewCellBackground: UIImageView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "GoodKidTableViewCell", for: indexPath) as! GoodKidTableViewCell
        cell1.imgViewBacground.image = UIImage( named : "boxArrow-1.png")
              cell1.VC3LabelOutlet.text = spanishAudioGood[indexPath.row]
            cell1.VC3LabelOutlet.text = goodKidTableContent[indexPath.row]
        return cell1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GoodKidDetailsScreenViewController") as! GoodKidDetailsScreenViewController
        if(spanishDelegateGood == "spanish")
        {
            vc.selectedAudioInput = spanishAudioGood[indexPath.row]
        }
        else
        {
            vc.selectedAudioInput = audio1[indexPath.row]
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func homeButton1(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if(appDelegate.spanishValueGood != nil)
        {
            self.spanishDelegateGood = appDelegate.spanishValueGood!
        }
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
