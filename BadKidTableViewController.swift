import UIKit
import AVFoundation
class BadKidTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    var spanishDelegateBad = String()
    func didChangeSpanishBad(inString: String)
    {
        self.spanishDelegateBad = inString
    }
    let BadKidTableContent = ["Not wearing Seatbelt","not wearing a bicycle helmet"," not wearing a life jacket"," not behaving / mall police"," not behaving / store police","not behaving / restuarent","not behaving at school","not doing homework ","not telling truth"," not eating your food","not sleeping in your bed","not picking up toys"," not cleaning you room"]
     let audio2 = ["English_Bad_NotWearingSeatbelt","English_Bad_NotWearingBicycleHelmet","English_Bad_NotWearingLifeJacket","English_Bad_NotBehavingMallPolice","English_Bad_NotBehavingStorePolice","English_Bad_NotBehavingRestaurant","English_Bad_NotBehavingSchool","English_Bad_NotWearingSeatbelt","English_Bad_NotWearingBicycleHelmet","English_Bad_NotWearingLifeJacket","English_Bad_NotBehavingMallPolice","English_Bad_NotBehavingStorePolice","English_Bad_NotBehavingRestaurant"]
    let spanishAudioBad = ["Spanish_Bad_NotWearingSeatbelt","Spanish_Bad_NotWearingBicycleHelmet","Spanish_Bad_NotWearingLifeJacket","Spanish_Bad_NotBehavingMallPolice","Spanish_Bad_NotBehavingStorePolice","Spanish_Bad_NotBehavingRestaurant","Spanish_Bad_NotBehavingSchool","Spanish_Bad_NotWearingSeatbelt","Spanish_Bad_NotWearingBicycleHelmet","Spanish_Bad_NotWearingLifeJacket","Spanish_Bad_NotBehavingMallPolice","Spanish_Bad_NotBehavingStorePolice","Spanish_Bad_NotBehavingRestaurant","Spanish_Bad_NotBehavingSchool"]
        var audioPlayer2 = AVAudioPlayer()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return BadKidTableContent.count
    }
    @IBOutlet weak var imgViewCellBackground2: UIImageView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "BadKidTableViewCell", for: indexPath) as! BadKidTableViewCell
        cell2.imgViewBackground2.image = UIImage( named : "boxArrow-1.png")
        cell2.Vc4LabelOutlet.text = BadKidTableContent[indexPath.row]
    return cell2
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BadKidDetailsScreenViewController") as! BadKidDetailsScreenViewController
        if(spanishDelegateBad == "spanish")
        {
              vc.selectedAudio2 = spanishAudioBad[indexPath.row]
        }
        else
        {
  vc.selectedAudio2 = audio2[indexPath.row]
        }
          self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func homeButton2(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
  override func viewDidLoad()
  {
        super.viewDidLoad()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    if(appDelegate.spanishValueGood != nil)
    {
        self.spanishDelegateBad = appDelegate.spanishValueGood!
    }
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
