import UIKit

var theme = UIColor.black
let defaults = UserDefaults.standard
var imageborder = false
class HomeViewController: UIViewController {

    @IBOutlet var HomeButtons: [UIButton]!
    @IBOutlet weak var quoteimgview: UIImageView!
    var imagearray = ["1","2","3","4","5"]
    var indexarray = 1
    
    @IBAction func backbu(_ sender: UIButton) {
        if indexarray > 0 {
            indexarray -= 1
            let imageName = imagearray[indexarray]
            let quoteimage = UIImage(named:imageName)
            quoteimgview.image = quoteimage
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let themevalue = defaults.integer(forKey: "theme")
        if themevalue == 0 {
            view.backgroundColor = UIColor.black
            setButtonsBorders(color: .white)
        }else{
            view.backgroundColor = UIColor.white
            setButtonsBorders(color: .black)
        }
        view.backgroundColor = theme
        if imageborder {
            quoteimgview.layer.borderColor = UIColor.green.cgColor
            quoteimgview.layer.borderWidth = 5.0
        }else{
            quoteimgview.layer.borderWidth = 0
        }
        quoteimgview.layer.cornerRadius = 5.0
    }
    
    @IBAction func nextbu(_ sender: UIButton) {
        if indexarray < imagearray.count-1 {
            indexarray += 1
            let imageName = imagearray[indexarray]
            let quoteimage = UIImage(named:imageName)
            quoteimgview.image = quoteimage
        }
    }
    
    @IBAction func favoritebu(_ sender: UIButton) {
        defaults.set(indexarray+1, forKey: "favOne")
    }
    
    func setButtonsBorders(color:UIColor){
        for button in HomeButtons{
            button.layer.borderWidth = 3.5
            button.layer.borderColor = color.cgColor
            button.layer.cornerRadius = 25
        }
    }
}
