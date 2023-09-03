//
//  ViewController.swift
//  AppStoreClone
//
//  Created by Kaan Odabaş on 26.08.2023.
//

import UIKit


class TodayViewController: UIViewController, UIViewControllerTransitioningDelegate {
    private var tableView: UITableView!

    let bgcolor = UIColor(hex: 0xf5f5f5)
    let transitionManager = CardTransitionManager()
    
    let todayLabelInTopView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 33, weight: .bold)
        label.text = "Today"
        label.textColor = .black
        return label
    }()

    let dateLabelInTopView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.text = "Wednesday, 30 August"
        label.textColor = .lightGray
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.text = "TUESDAY, OCTOBER 13"
        label.textColor = .lightGray
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true // Örnek bir yükseklik değeri
        return label
    }()
    
    lazy var todayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        label.text = "Today"
        label.textColor = .black
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true // Örnek bir yükseklik değeri
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgcolor
        
        
        // Sağdan ve soldan 20 birim boşluk bırakarak tableView'nın genişliğini ayarlayın
        let tableViewFrame = CGRect(x: 0, y: -40, width: view.bounds.width, height: view.bounds.height)
        tableView = UITableView(frame: tableViewFrame, style: .plain)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: todayLabelInTopView.frame.maxY + 50, left: 0, bottom: 0, right: 0)

        tableView.scrollIndicatorInsets = UIEdgeInsets(top: todayLabelInTopView.frame.maxY + 50, left: 0, bottom: 0, right: tableView.bounds.width + 10)
        tableView.alwaysBounceVertical = true
        
        tableView.backgroundColor = bgcolor
        // Set the background color of the view controller's main view
           
        view.backgroundColor = bgcolor
        view.addSubview(tableView)
        
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .red// Renk değiştirebilirsiniz
        
        
        let headerView = UIView(frame: CGRect(x: 0, y: -200, width: view.bounds.width, height: 10))


        headerView.backgroundColor = bgcolor

      
        
        headerView.addSubview(todayLabelInTopView)
        NSLayoutConstraint.activate([
        todayLabelInTopView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: -15),
        todayLabelInTopView.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 20)
    ])

        headerView.addSubview(dateLabelInTopView)
        NSLayoutConstraint.activate([
        dateLabelInTopView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: -40),
        dateLabelInTopView.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 20)
    ])

        
    let kaanImageView = UIImageView(image: UIImage(named: "kaan")) // Make sure to use the correct image name
    kaanImageView.translatesAutoresizingMaskIntoConstraints = false
    kaanImageView.contentMode = .scaleAspectFit
    headerView.addSubview(kaanImageView)

    // Position the Kaan image in the top right corner
    NSLayoutConstraint.activate([
        kaanImageView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: -10),
        kaanImageView.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -20),
        kaanImageView.widthAnchor.constraint(equalToConstant: 36), // Adjust the width as needed
        kaanImageView.heightAnchor.constraint(equalToConstant: 36) // Adjust the height as needed
    ])
        
    kaanImageView.layer.cornerRadius = 18 // Adjust the value as needed
    kaanImageView.layer.masksToBounds = true
        
    tableView.tableHeaderView = headerView
        
        
    }
    
    

}
    
        



extension TodayViewController: UITableViewDataSource, UITableViewDelegate {
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Geri döneceğiniz hücre sayısını döndürün.
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CellIdentifier"
        
        if indexPath.row == 0 {
            let cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
            cell.backgroundColor = bgcolor
            cell.selectionStyle = .none
           
            let frameView = UIView(frame: CGRect(x: 25, y: 0, width: tableView.bounds.width - 50, height: 440))
            frameView.layer.borderColor = UIColor.black.cgColor
            frameView.layer.borderWidth = 0.01
            frameView.layer.cornerRadius = 12
            frameView.layer.backgroundColor = UIColor.white.cgColor
            
            frameView.layer.shadowColor = UIColor.black.cgColor
            frameView.layer.shadowOpacity = 0.20
            frameView.layer.shadowOffset = CGSize(width: -1, height: 2)
            frameView.layer.shadowRadius = 5
            
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frameView.bounds.width, height: 350))
            imageView.image = UIImage(named: "nikeappbig")
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 12
            frameView.addSubview(imageView)
            
            let titleLabel = UILabel(frame: CGRect(x: 20, y: 13, width: tableView.bounds.width - 50, height: 30))
            titleLabel.text = "Popular Now"
            titleLabel.textColor = .white
            titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
            titleLabel.clipsToBounds = true
            imageView.addSubview(titleLabel)
            
            let AppImageView = UIImageView(image: UIImage(named: "nike")) // Make sure to use the correct image name
                AppImageView.translatesAutoresizingMaskIntoConstraints = false
                AppImageView.contentMode = .scaleAspectFit
                frameView.addSubview(AppImageView)

                // Position the Kaan image in the top right corner
                NSLayoutConstraint.activate([
                    AppImageView.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -20),
                    AppImageView.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 20),
                    AppImageView.widthAnchor.constraint(equalToConstant: 50), // Adjust the width as needed
                    AppImageView.heightAnchor.constraint(equalToConstant: 50) // Adjust the height as needed
                ])
                
                
                 let AppNameLabel: UILabel = {
                    let label = UILabel()
                    label.translatesAutoresizingMaskIntoConstraints = false
                    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
                    label.text = "Nike SNKRS"
                    label.textColor = .black
                    return label
                }()
                
                let AppIntNameLabel: UILabel = {
                    let label = UILabel()
                    label.translatesAutoresizingMaskIntoConstraints = false
                    label.font = UIFont.systemFont(ofSize: 11, weight: .bold)
                    label.text = "Shoe Shopping"
                    label.textColor = .gray
                    return label
                }()
            
            let button = UIButton(type: .system)
                button.frame = CGRect(x: 232, y: 380, width: 90, height: 30)
            let buttonText = "GET"
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.boldSystemFont(ofSize: 17)
            ]
            let attributedButtonText = NSAttributedString(string: buttonText, attributes: attributes)
            button.setAttributedTitle(attributedButtonText, for: .normal)

                button.layer.cornerRadius = 10 // Kenar yuvarlatma yarıçapı
                button.clipsToBounds = true
                // Düğmeye tıklanınca çalışacak metod
                //button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

                // Tint rengini ayarlayın
                button.backgroundColor = bgcolor// İstediğiniz rengi burada belirtebilirsiniz
                
                frameView.addSubview(button)

                frameView.addSubview(AppNameLabel)
                NSLayoutConstraint.activate([
                AppNameLabel.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -45),
                AppNameLabel.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
            ])

                frameView.addSubview(AppIntNameLabel)
                NSLayoutConstraint.activate([
                AppIntNameLabel.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -28),
                AppIntNameLabel.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
            ])
            cell.contentView.addSubview(frameView)
            
            return cell
            
        } else if indexPath.row == 1 {
            let spacingCell = UITableViewCell(style: .default, reuseIdentifier: "SpacingCell")
            spacingCell.backgroundColor = bgcolor
            spacingCell.contentView.backgroundColor = bgcolor
            spacingCell.selectionStyle = .none
            spacingCell.contentView.heightAnchor.constraint(equalToConstant: 1).isActive = true
            return spacingCell
            
        } else if indexPath.row == 2 {
            let cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
            cell.backgroundColor = bgcolor
            cell.selectionStyle = .none
        
            
            let frameView = UIView(frame: CGRect(x: 25, y: 0, width: tableView.bounds.width - 50, height: 440))
            frameView.layer.borderColor = UIColor.black.cgColor
            frameView.layer.borderWidth = 0.01
            frameView.layer.cornerRadius = 12
            frameView.layer.backgroundColor = UIColor.white.cgColor
            
            frameView.layer.shadowColor = UIColor.black.cgColor
            frameView.layer.shadowOpacity = 0.20
            frameView.layer.shadowOffset = CGSize(width: -1, height: 2)
            frameView.layer.shadowRadius = 5
            
            
            // Çizgi konumunu ve boyutunu ayarlamak için NSLayoutConstraint'lar
    
            
            let titleLabel = UILabel(frame: CGRect(x: 20, y: 40, width: tableView.bounds.width - 50, height: 30))
            titleLabel.text = "4 most popular apps"
            titleLabel.textColor = .black
            titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
            titleLabel.clipsToBounds = true
            frameView.addSubview(titleLabel)
            
            let titleLabel3 = UILabel(frame: CGRect(x: 20, y: 70, width: tableView.bounds.width - 50, height: 30))
            titleLabel3.text = "in USA"
            titleLabel3.textColor = .black
            titleLabel3.font = UIFont.boldSystemFont(ofSize: 28)
            titleLabel3.clipsToBounds = true
            frameView.addSubview(titleLabel3)
            
            let titleLabel2 = UILabel(frame: CGRect(x: 20, y: 13, width: tableView.bounds.width - 50, height: 20))
            titleLabel2.text = "Popular in USA"
            titleLabel2.textColor = .gray
            titleLabel2.font = UIFont.boldSystemFont(ofSize: 20)
            titleLabel2.clipsToBounds = true
            frameView.addSubview(titleLabel2)
            
            
            let AppImageView = UIImageView(image: UIImage(named: "facebook")) // Make sure to use the correct image name
                AppImageView.translatesAutoresizingMaskIntoConstraints = false
                AppImageView.contentMode = .scaleAspectFit
                frameView.addSubview(AppImageView)
                AppImageView.layer.cornerRadius = 10
                AppImageView.layer.masksToBounds = true

           

                // Position the Kaan image in the top right corner
                NSLayoutConstraint.activate([
                    AppImageView.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -30),
                    AppImageView.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 20),
                    AppImageView.widthAnchor.constraint(equalToConstant: 50), // Adjust the width as needed
                    AppImageView.heightAnchor.constraint(equalToConstant: 50) // Adjust the height as needed
                ])
                
            
           
                
                 let AppNameLabel: UILabel = {
                    let label = UILabel()
                    label.translatesAutoresizingMaskIntoConstraints = false
                    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
                    label.text = "Facebook"
                    label.textColor = .black
                    return label
                }()
                
                let AppIntNameLabel: UILabel = {
                    let label = UILabel()
                    label.translatesAutoresizingMaskIntoConstraints = false
                    label.font = UIFont.systemFont(ofSize: 11, weight: .bold)
                    label.text = "Open your World"
                    label.textColor = .gray
                    return label
                }()
            
            let button = UIButton(type: .system)
                button.frame = CGRect(x: 232, y: 370, width: 90, height: 30)
            let buttonText1 = "GET"
            let attributes1: [NSAttributedString.Key: Any] = [
                .font: UIFont.boldSystemFont(ofSize: 17)
            ]
            let attributedButtonText1 = NSAttributedString(string: buttonText1, attributes: attributes1)
            button.setAttributedTitle(attributedButtonText1, for: .normal)

                button.layer.cornerRadius = 10 // Kenar yuvarlatma yarıçapı
                button.clipsToBounds = true
                // Düğmeye tıklanınca çalışacak metod
                //button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

                // Tint rengini ayarlayın
                button.backgroundColor = bgcolor// İstediğiniz rengi burada belirtebilirsiniz
                
                frameView.addSubview(button)

                frameView.addSubview(AppNameLabel)
                NSLayoutConstraint.activate([
                AppNameLabel.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -55),
                AppNameLabel.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
            ])

                frameView.addSubview(AppIntNameLabel)
                NSLayoutConstraint.activate([
                AppIntNameLabel.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -40),
                AppIntNameLabel.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
            ])
            
           
            
            let AppImageView2 = UIImageView(image: UIImage(named: "tiktok")) // Make sure to use the correct image name
            AppImageView2.translatesAutoresizingMaskIntoConstraints = false
            AppImageView2.contentMode = .scaleAspectFit
            frameView.addSubview(AppImageView2)
            AppImageView2.layer.cornerRadius = 10
            AppImageView2.layer.masksToBounds = true
            
            
            let lineView = UIView()
            lineView.backgroundColor = UIColor.lightGray// Çizgi rengi gri olarak ayarlandı
            lineView.translatesAutoresizingMaskIntoConstraints = false
            frameView.addSubview(lineView)

            // Position the Kaan image in the top right corner
            NSLayoutConstraint.activate([
                AppImageView2.bottomAnchor.constraint(equalTo: frameView.bottomAnchor,constant: -270),
                AppImageView2.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 20),
                AppImageView2.widthAnchor.constraint(equalToConstant: 50), // Adjust the width as needed
                AppImageView2.heightAnchor.constraint(equalToConstant: 50) // Adjust the height as needed
            ])
                
            NSLayoutConstraint.activate([
                lineView.topAnchor.constraint(equalTo: AppImageView2.bottomAnchor, constant: 15),
                lineView.leadingAnchor.constraint(equalTo: frameView.leadingAnchor, constant: 20),
                lineView.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80),
                lineView.trailingAnchor.constraint(equalTo: frameView.trailingAnchor, constant: -20),
                lineView.heightAnchor.constraint(equalToConstant: 0.5) // Çizgi yüksekliği
            ])

                
            let AppNameLabel2: UILabel = {
                let label2 = UILabel()
                label2.translatesAutoresizingMaskIntoConstraints = false
                label2.font = UIFont.systemFont(ofSize: 15, weight: .bold)
                label2.text = "Tiktok"
                label2.textColor = .black
                return label2
            }()
                
            let AppIntNameLabel2: UILabel = {
                let label2 = UILabel()
                label2.translatesAutoresizingMaskIntoConstraints = false
                label2.font = UIFont.systemFont(ofSize: 11, weight: .bold)
                label2.text = "Short videos for you"
                label2.textColor = .gray
                return label2
            }()
            
            let button2 = UIButton(type: .system)
                button2.frame = CGRect(x: 232, y: 130, width: 90, height: 30)
            let buttonText2 = "GET"
            let attributes2: [NSAttributedString.Key: Any] = [
                .font: UIFont.boldSystemFont(ofSize: 17)
            ]
            let attributedButtonText2 = NSAttributedString(string: buttonText2, attributes: attributes2)
            button2.setAttributedTitle(attributedButtonText2, for: .normal)
            button2.layer.cornerRadius = 10
                button2.clipsToBounds = true
                button2.backgroundColor = bgcolor// İstediğiniz rengi burada belirtebilirsiniz
                
                frameView.addSubview(button2)

                frameView.addSubview(AppNameLabel2)
                NSLayoutConstraint.activate([
                AppNameLabel2.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -295),
                AppNameLabel2.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
            ])

                frameView.addSubview(AppIntNameLabel2)
                NSLayoutConstraint.activate([
                AppIntNameLabel2.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -280),
                AppIntNameLabel2.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
            ])
            
            let AppImageView3 = UIImageView(image: UIImage(named: "instagram")) // Make sure to use the correct image name
                AppImageView3.translatesAutoresizingMaskIntoConstraints = false
                AppImageView3.contentMode = .scaleAspectFit
                frameView.addSubview(AppImageView3)
                AppImageView3.layer.cornerRadius = 10
                AppImageView3.layer.masksToBounds = true
            
            
            let lineView2 = UIView()
            lineView2.backgroundColor = UIColor.lightGray// Çizgi rengi gri olarak ayarlandı
            lineView2.translatesAutoresizingMaskIntoConstraints = false
            frameView.addSubview(lineView2)

                // Position the Kaan image in the top right corner
                NSLayoutConstraint.activate([
                    AppImageView3.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -190),
                    AppImageView3.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 20),
                    AppImageView3.widthAnchor.constraint(equalToConstant: 50), // Adjust the width as needed
                    AppImageView3.heightAnchor.constraint(equalToConstant: 50) // Adjust the height as needed
                ])
            
            NSLayoutConstraint.activate([
                lineView2.topAnchor.constraint(equalTo: AppImageView3.bottomAnchor, constant: 15),
                lineView2.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80),
                lineView2.leadingAnchor.constraint(equalTo: frameView.leadingAnchor, constant: 20),
                lineView2.trailingAnchor.constraint(equalTo: frameView.trailingAnchor, constant: -20),
                lineView2.heightAnchor.constraint(equalToConstant: 0.5) // Çizgi yüksekliği
            ])
                
                
                 let AppNameLabel3: UILabel = {
                    let label3 = UILabel()
                    label3.translatesAutoresizingMaskIntoConstraints = false
                    label3.font = UIFont.systemFont(ofSize: 15, weight: .bold)
                    label3.text = "Instagram"
                    label3.textColor = .black
                    return label3
                }()
                
                let AppIntNameLabel3: UILabel = {
                    let label3 = UILabel()
                    label3.translatesAutoresizingMaskIntoConstraints = false
                    label3.font = UIFont.systemFont(ofSize: 11, weight: .bold)
                    label3.text = "A Meta App"
                    label3.textColor = .gray
                    return label3
                }()
            
            let button3 = UIButton(type: .system)
                button3.frame = CGRect(x: 232, y: 210, width: 90, height: 30)
            let buttonText3 = "GET"
            let attributes3: [NSAttributedString.Key: Any] = [
                .font: UIFont.boldSystemFont(ofSize: 17)
            ]
            let attributedButtonText3 = NSAttributedString(string: buttonText3, attributes: attributes3)
            button3.setAttributedTitle(attributedButtonText3, for: .normal)

                button3.layer.cornerRadius = 10 // Kenar yuvarlatma yarıçapı
                button3.clipsToBounds = true
                // Düğmeye tıklanınca çalışacak metod
                //button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

                // Tint rengini ayarlayın
                button3.backgroundColor = bgcolor// İstediğiniz rengi burada belirtebilirsiniz
                
                frameView.addSubview(button3)

                frameView.addSubview(AppNameLabel3)
                NSLayoutConstraint.activate([
                AppNameLabel3.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -215),
                AppNameLabel3.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
            ])

                frameView.addSubview(AppIntNameLabel3)
                NSLayoutConstraint.activate([
                AppIntNameLabel3.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -200),
                AppIntNameLabel3.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
            ])
            
            let AppImageView4 = UIImageView(image: UIImage(named: "netflix")) // Make sure to use the correct image name
                AppImageView4.translatesAutoresizingMaskIntoConstraints = false
                AppImageView4.contentMode = .scaleAspectFit
                frameView.addSubview(AppImageView4)
                AppImageView4.layer.cornerRadius = 10
                AppImageView4.layer.masksToBounds = true
            
            let lineView3 = UIView()
            lineView3.backgroundColor = UIColor.lightGray// Çizgi rengi gri olarak ayarlandı
            lineView3.translatesAutoresizingMaskIntoConstraints = false
            frameView.addSubview(lineView3)
            
            

                // Position the Kaan image in the top right corner
                NSLayoutConstraint.activate([
                    AppImageView4.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -110),
                    AppImageView4.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 20),
                    AppImageView4.widthAnchor.constraint(equalToConstant: 50), // Adjust the width as needed
                    AppImageView4.heightAnchor.constraint(equalToConstant: 50) // Adjust the height as needed
                ])
                
            
            NSLayoutConstraint.activate([
                lineView3.topAnchor.constraint(equalTo: AppImageView4.bottomAnchor, constant: 15),
                lineView3.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80),
                lineView3.leadingAnchor.constraint(equalTo: frameView.leadingAnchor, constant: 20),
                lineView3.trailingAnchor.constraint(equalTo: frameView.trailingAnchor, constant: -20),
                lineView3.heightAnchor.constraint(equalToConstant: 0.5) // Çizgi yüksekliği
            ])
                
                 let AppNameLabel4: UILabel = {
                    let label4 = UILabel()
                    label4.translatesAutoresizingMaskIntoConstraints = false
                    label4.font = UIFont.systemFont(ofSize: 15, weight: .bold)
                    label4.text = "Netflix"
                    label4.textColor = .black
                    return label4
                }()
                
                let AppIntNameLabel4: UILabel = {
                    let label4 = UILabel()
                    label4.translatesAutoresizingMaskIntoConstraints = false
                    label4.font = UIFont.systemFont(ofSize: 11, weight: .bold)
                    label4.text = "Watch series"
                    label4.textColor = .gray
                    return label4
                }()
            
            let button4 = UIButton(type: .system)
            button4.frame = CGRect(x: 232, y: 290, width: 90, height: 30)

            let buttonText = "GET"
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.boldSystemFont(ofSize: 17)
            ]
            let attributedButtonText = NSAttributedString(string: buttonText, attributes: attributes)
            button4.setAttributedTitle(attributedButtonText, for: .normal)

            button4.layer.cornerRadius = 10
            button4.clipsToBounds = true
            button4.backgroundColor = bgcolor
                
                frameView.addSubview(button4)

                frameView.addSubview(AppNameLabel4)
                NSLayoutConstraint.activate([
                AppNameLabel4.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -135),
                AppNameLabel4.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
            ])

                frameView.addSubview(AppIntNameLabel4)
                NSLayoutConstraint.activate([
                AppIntNameLabel4.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -120),
                AppIntNameLabel4.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
            ])
            
            
            // ... Customize the content for the third row
            
            cell.contentView.addSubview(frameView)
            
            return cell
        }
        
        return UITableViewCell()
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellIdentifier = "CellIdentifier"
        if indexPath.row % 2 != 0 {
            return 15
        } else {
            return 455
                    }
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }

        cell?.backgroundColor = bgcolor
        
        cell?.layer.cornerRadius = 40
        cell?.layer.masksToBounds = true // Bu satırı ekleyin
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
        headerView.backgroundColor = .clear
            return headerView
        }
    
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 2// Üst boşluğu belirtin
        }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            let footerView = UIView()
            footerView.backgroundColor = .clear
            return footerView
        }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 2 // Alt boşluğu belirtin
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Hücrenin arkaplan rengini değiştir
        // cell.backgroundColor = bgcolor // Bu satırı kaldırın
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex >> 16) & 0xFF) / 255.0,
            green: CGFloat((hex >> 8) & 0xFF) / 255.0,
            blue: CGFloat(hex & 0xFF) / 255.0,
            alpha: alpha
        )
    }
    
   
    
    
}

