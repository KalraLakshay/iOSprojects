import UIKit
class HomeScreenViewController: UIViewController
{
    @IBAction func settingButton(_ sender: UIButton)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SettingScreenViewController") as! SettingScreenViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func boyButton(_ sender: UIButton)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BadKidTableViewController") as! BadKidTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func girlButton(_ sender: UIButton)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GoodKidTableViewController") as! GoodKidTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad()
    {
    super.viewDidLoad()
    }
}
