//
//  GamesViewController.swift
//  AppStoreClone
//
//  Created by Kaan Odabaş on 26.08.2023.
//
import UIKit

class GamesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let bgcolor = UIColor(hex: 0xf5f5f5)
    
    
    
    let gamesLabelInTopView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 33, weight: .bold)
        label.text = "Games"
        label.textColor = .black
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = self.bgcolor // self kullanarak özelliğe erişin
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    
    lazy var collectionView2: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = self.bgcolor // self kullanarak özelliğe erişin
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()


    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgcolor
        
       
        
        // Tablo başlık görünümünü oluşturun ve ayarlayın
        let headerView = UIView(frame: CGRect(x: 0, y: 50, width: view.bounds.width, height: 150))
        headerView.backgroundColor = bgcolor
        
        headerView.addSubview(gamesLabelInTopView)
        NSLayoutConstraint.activate([
            gamesLabelInTopView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 20),
            gamesLabelInTopView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20)
        ])
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor.lightGray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(lineView)
        
        let kaanImageView = UIImageView(image: UIImage(named: "kaan"))
        kaanImageView.translatesAutoresizingMaskIntoConstraints = false
        kaanImageView.contentMode = .scaleAspectFit
        headerView.addSubview(kaanImageView)
        
        NSLayoutConstraint.activate([
            kaanImageView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 20),
            kaanImageView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            kaanImageView.widthAnchor.constraint(equalToConstant: 36),
            kaanImageView.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: kaanImageView.bottomAnchor, constant: 15),
            lineView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            lineView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        kaanImageView.layer.cornerRadius = 18
        kaanImageView.layer.masksToBounds = true
        
        // Tablo başlık görünümünü tablo görünümüne ayarlayın
        view.addSubview(headerView)
    
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView2.dataSource = self
        collectionView2.delegate = self
                
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell1")
        collectionView2.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell2")

                
        view.addSubview(collectionView)
        view.addSubview(collectionView2)
                
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: lineView.topAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            collectionView.heightAnchor.constraint(equalToConstant: 200),
            
            collectionView2.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            collectionView2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),

           
        ])
        
        



   }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 2 // Üç hücreli bir koleksiyon oluşturuyoruz.
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath)
            cell.backgroundColor = bgcolor
            
            if indexPath.row == 1 {
                // Etiket oluşturun ve ayarlayın
                let blueLabel = UILabel()
                let blueText = "FOR A LIMITED TIME"
                let attributedBlueText = NSMutableAttributedString(string: blueText)
                let blueRange = (blueText as NSString).range(of: "FOR A LIMITED TIME")
                let blueFont = UIFont.boldSystemFont(ofSize: 13)
                attributedBlueText.addAttribute(.font, value: blueFont, range: blueRange)
                blueLabel.attributedText = attributedBlueText
                blueLabel.textColor = .systemBlue
                blueLabel.translatesAutoresizingMaskIntoConstraints = false
                cell.addSubview(blueLabel)
                            
                            // Siyah yazı
                let blackLabel = UILabel()
                let blackText = "Hill Climb Racing"
                blackLabel.text = blackText
                blackLabel.textColor = .black
                blackLabel.font = UIFont.systemFont(ofSize: 23) // İstediğiniz kalın yazı stili ve boyutunu ayarlayın
                blackLabel.translatesAutoresizingMaskIntoConstraints = false
                cell.addSubview(blackLabel)
                
                let grayLabel = UILabel()
                let grayText = "Fun racing game"
                grayLabel.text = grayText
                grayLabel.textColor = .gray
                grayLabel.font = UIFont.systemFont(ofSize: 20)
                grayLabel.translatesAutoresizingMaskIntoConstraints = false
                cell.addSubview(grayLabel)
                            
                // Etiketlerin pozisyonlarını ayarlayın
                NSLayoutConstraint.activate([
                blueLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0),
                blueLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 4),
                blueLabel.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 20),
                                
                blackLabel.topAnchor.constraint(equalTo: blueLabel.bottomAnchor, constant: 4),
                blackLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 4),
                blackLabel.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 20),
                
                grayLabel.topAnchor.constraint(equalTo: blackLabel.bottomAnchor, constant: 2),
                grayLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 4),
                grayLabel.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 20)
        ])
                        
            
                
            let AppImageView = UIImageView(image: UIImage(named: "hcr")) // Make sure to use the correct image name
            AppImageView.translatesAutoresizingMaskIntoConstraints = false
            AppImageView.contentMode = .scaleAspectFill
            cell.addSubview(AppImageView)
            AppImageView.layer.cornerRadius = 5
            AppImageView.layer.masksToBounds = true
                
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = CGRect(x: 0, y: 150, width: 360, height: 120) // Fotoğrafın altına gelecek şekilde boyutlandırın

            // Gradyan renkleri ayarlayın (örneğin, siyahtan saydam bir beyaza doğru bir geçiş yapalım)
                gradientLayer.colors = [ bgcolor.cgColor, UIColor.clear.cgColor]

                // Gradyanın hangi yönde olduğunu ayarlayın (yukarıdan aşağıya doğru)
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
            // Fotoğrafın üzerine gradyan efektini ekleyin
            AppImageView.layer.addSublayer(gradientLayer)
                
            NSLayoutConstraint.activate([
                AppImageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 85),
                AppImageView.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 20),
                AppImageView.widthAnchor.constraint(equalToConstant: 330), // Adjust the width as needed
                AppImageView.heightAnchor.constraint(equalToConstant: 250) // Adjust the height as needed
            ])
                
            let AppImageView2 = UIImageView(image: UIImage(named: "hcrlogo")) // Make sure to use the correct image name
            AppImageView2.translatesAutoresizingMaskIntoConstraints = false
            AppImageView2.contentMode = .scaleAspectFit
            AppImageView.addSubview(AppImageView2)
            AppImageView2.layer.cornerRadius = 10
            AppImageView2.layer.masksToBounds = true
                
            let blackBorderView = UIView()
            blackBorderView.translatesAutoresizingMaskIntoConstraints = false
            blackBorderView.backgroundColor = .clear // Siyah çerçeve için arka planı şeffaf yapın
            blackBorderView.layer.borderWidth = 0.5 // Çerçeve genişliğini ayarlayın
            blackBorderView.layer.borderColor = UIColor.black.cgColor // Çerçeve rengini siyah yapın
            AppImageView2.addSubview(blackBorderView)
            blackBorderView.layer.cornerRadius = 10
                
            NSLayoutConstraint.activate([
                blackBorderView.topAnchor.constraint(equalTo: AppImageView2.topAnchor),
                blackBorderView.leadingAnchor.constraint(equalTo: AppImageView2.leadingAnchor),
                blackBorderView.trailingAnchor.constraint(equalTo: AppImageView2.trailingAnchor),
                blackBorderView.bottomAnchor.constraint(equalTo: AppImageView2.bottomAnchor)
        ])
                
            NSLayoutConstraint.activate([
                AppImageView2.bottomAnchor.constraint(equalTo: AppImageView.bottomAnchor,constant: -15),
                AppImageView2.leftAnchor.constraint(equalTo: AppImageView.leftAnchor, constant: 10),
                AppImageView2.widthAnchor.constraint(equalToConstant: 40), // Adjust the width as needed
                AppImageView2.heightAnchor.constraint(equalToConstant: 40) // Adjust the height as needed
        ])
                
                let smallblacklabel = UILabel()
                let sblacktext = "HILL CLIMB RACING"
                smallblacklabel.text = sblacktext
                smallblacklabel.textColor = .black
                smallblacklabel.font = UIFont.boldSystemFont(ofSize: 14)
                smallblacklabel.translatesAutoresizingMaskIntoConstraints = false
                AppImageView.addSubview(smallblacklabel)
                
                NSLayoutConstraint.activate([
                smallblacklabel.topAnchor.constraint(equalTo: AppImageView.bottomAnchor, constant: -50),
                smallblacklabel.leadingAnchor.constraint(equalTo: AppImageView.leadingAnchor, constant: 4),
                smallblacklabel.leftAnchor.constraint(equalTo: AppImageView.leftAnchor, constant: 55),
                ])
                
                let smallgraylabel = UILabel()
                let sgraytext = "#Best Mobile Car Game"
                smallgraylabel.text = sgraytext
                smallgraylabel.textColor = .black
                smallgraylabel.font = UIFont.italicSystemFont(ofSize: 12)
                smallgraylabel.translatesAutoresizingMaskIntoConstraints = false
                AppImageView.addSubview(smallgraylabel)
                
                NSLayoutConstraint.activate([
                smallgraylabel.topAnchor.constraint(equalTo: AppImageView.bottomAnchor, constant: -33),
                smallgraylabel.leadingAnchor.constraint(equalTo: AppImageView.leadingAnchor, constant: 4),
                smallgraylabel.leftAnchor.constraint(equalTo: AppImageView.leftAnchor, constant: 55),
                ])
                
                let getButton = UIButton(type: .system)
                getButton.translatesAutoresizingMaskIntoConstraints = false

                // Koyu gri arka plan rengini ayarlayın ve saydamlık ekleyin
                getButton.backgroundColor = UIColor.black.withAlphaComponent(0.2)

                getButton.setTitle("GET", for: .normal)
                getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
                getButton.setTitleColor(.white, for: .normal)
                getButton.layer.cornerRadius = 10 // İstenilen köşe yuvarlama miktarını ayarlayabilirsiniz


                // UIImageView'e butonu ekleyin
                AppImageView.addSubview(getButton)

                // Butonun pozisyonunu ve boyutunu ayarlayın
                NSLayoutConstraint.activate([
                    getButton.bottomAnchor.constraint(equalTo: AppImageView.bottomAnchor, constant: -20),
                    getButton.widthAnchor.constraint(equalToConstant: 80),
                    getButton.heightAnchor.constraint(equalToConstant: 30),
                    getButton.leftAnchor.constraint(equalTo: AppImageView.leftAnchor, constant: 245)
                ])
            } else {
                let blueLabel = UILabel()
                let blueText = "FOR A LIMITED TIME"
                let attributedBlueText = NSMutableAttributedString(string: blueText)
                let blueRange = (blueText as NSString).range(of: "FOR A LIMITED TIME")
                let blueFont = UIFont.boldSystemFont(ofSize: 13)
                attributedBlueText.addAttribute(.font, value: blueFont, range: blueRange)
                blueLabel.attributedText = attributedBlueText
                blueLabel.textColor = .systemBlue
                blueLabel.translatesAutoresizingMaskIntoConstraints = false
                cell.addSubview(blueLabel)
                            
                            // Siyah yazı
                let blackLabel = UILabel()
                let blackText = "FIFA Mobile"
                blackLabel.text = blackText
                blackLabel.textColor = .black
                blackLabel.font = UIFont.systemFont(ofSize: 23) // İstediğiniz kalın yazı stili ve boyutunu ayarlayın
                blackLabel.translatesAutoresizingMaskIntoConstraints = false
                cell.addSubview(blackLabel)
                
                let grayLabel = UILabel()
                let grayText = "Play best football game"
                grayLabel.text = grayText
                grayLabel.textColor = .gray
                grayLabel.font = UIFont.systemFont(ofSize: 20)
                grayLabel.translatesAutoresizingMaskIntoConstraints = false
                cell.addSubview(grayLabel)
                            
                // Etiketlerin pozisyonlarını ayarlayın
                NSLayoutConstraint.activate([
                blueLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0),
                blueLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 4),
                blueLabel.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 20),
                                
                blackLabel.topAnchor.constraint(equalTo: blueLabel.bottomAnchor, constant: 4),
                blackLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 4),
                blackLabel.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 20),
                
                grayLabel.topAnchor.constraint(equalTo: blackLabel.bottomAnchor, constant: 2),
                grayLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 4),
                grayLabel.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 20)
        ])
                        
            
                
            let AppImageView = UIImageView(image: UIImage(named: "fifa")) // Make sure to use the correct image name
            AppImageView.translatesAutoresizingMaskIntoConstraints = false
            AppImageView.contentMode = .scaleAspectFill
            cell.addSubview(AppImageView)
            AppImageView.layer.cornerRadius = 5
            AppImageView.layer.masksToBounds = true
                
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = CGRect(x: 0, y: 150, width: 360, height: 120) // Fotoğrafın altına gelecek şekilde boyutlandırın

            // Gradyan renkleri ayarlayın (örneğin, siyahtan saydam bir beyaza doğru bir geçiş yapalım)
                gradientLayer.colors = [ bgcolor.cgColor, UIColor.clear.cgColor]

                // Gradyanın hangi yönde olduğunu ayarlayın (yukarıdan aşağıya doğru)
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
            // Fotoğrafın üzerine gradyan efektini ekleyin
            AppImageView.layer.addSublayer(gradientLayer)
                
            NSLayoutConstraint.activate([
                AppImageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 85),
                AppImageView.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 20),
                AppImageView.widthAnchor.constraint(equalToConstant: 330), // Adjust the width as needed
                AppImageView.heightAnchor.constraint(equalToConstant: 250) // Adjust the height as needed
            ])
                
            let AppImageView2 = UIImageView(image: UIImage(named: "fifalogo")) // Make sure to use the correct image name
            AppImageView2.translatesAutoresizingMaskIntoConstraints = false
            AppImageView2.contentMode = .scaleAspectFit
            AppImageView.addSubview(AppImageView2)
            AppImageView2.layer.cornerRadius = 10
            AppImageView2.layer.masksToBounds = true
                
            let blackBorderView = UIView()
            blackBorderView.translatesAutoresizingMaskIntoConstraints = false
            blackBorderView.backgroundColor = .clear // Siyah çerçeve için arka planı şeffaf yapın
            blackBorderView.layer.borderWidth = 0.5 // Çerçeve genişliğini ayarlayın
            blackBorderView.layer.borderColor = UIColor.black.cgColor // Çerçeve rengini siyah yapın
            AppImageView2.addSubview(blackBorderView)
            blackBorderView.layer.cornerRadius = 10
                
            NSLayoutConstraint.activate([
                blackBorderView.topAnchor.constraint(equalTo: AppImageView2.topAnchor),
                blackBorderView.leadingAnchor.constraint(equalTo: AppImageView2.leadingAnchor),
                blackBorderView.trailingAnchor.constraint(equalTo: AppImageView2.trailingAnchor),
                blackBorderView.bottomAnchor.constraint(equalTo: AppImageView2.bottomAnchor)
        ])
                
            NSLayoutConstraint.activate([
                AppImageView2.bottomAnchor.constraint(equalTo: AppImageView.bottomAnchor,constant: -15),
                AppImageView2.leftAnchor.constraint(equalTo: AppImageView.leftAnchor, constant: 10),
                AppImageView2.widthAnchor.constraint(equalToConstant: 40), // Adjust the width as needed
                AppImageView2.heightAnchor.constraint(equalToConstant: 40) // Adjust the height as needed
        ])
                
                let smallblacklabel = UILabel()
                let sblacktext = "FIFA MOBILE"
                smallblacklabel.text = sblacktext
                smallblacklabel.textColor = .black
                smallblacklabel.font = UIFont.boldSystemFont(ofSize: 14)
                smallblacklabel.translatesAutoresizingMaskIntoConstraints = false
                AppImageView.addSubview(smallblacklabel)
                
                NSLayoutConstraint.activate([
                smallblacklabel.topAnchor.constraint(equalTo: AppImageView.bottomAnchor, constant: -50),
                smallblacklabel.leadingAnchor.constraint(equalTo: AppImageView.leadingAnchor, constant: 4),
                smallblacklabel.leftAnchor.constraint(equalTo: AppImageView.leftAnchor, constant: 55),
                ])
                
                let smallgraylabel = UILabel()
                let sgraytext = "#Best Mobile Football Game"
                smallgraylabel.text = sgraytext
                smallgraylabel.textColor = .black
                smallgraylabel.font = UIFont.italicSystemFont(ofSize: 12)
                smallgraylabel.translatesAutoresizingMaskIntoConstraints = false
                AppImageView.addSubview(smallgraylabel)
                
                NSLayoutConstraint.activate([
                smallgraylabel.topAnchor.constraint(equalTo: AppImageView.bottomAnchor, constant: -33),
                smallgraylabel.leadingAnchor.constraint(equalTo: AppImageView.leadingAnchor, constant: 4),
                smallgraylabel.leftAnchor.constraint(equalTo: AppImageView.leftAnchor, constant: 55),
                ])
                
                // Buton oluşturun
                // Buton oluşturun
                let getButton = UIButton(type: .system)
                getButton.translatesAutoresizingMaskIntoConstraints = false

                // Koyu gri arka plan rengini ayarlayın ve saydamlık ekleyin
                getButton.backgroundColor = UIColor.black.withAlphaComponent(0.2)

                getButton.setTitle("GET", for: .normal)
                getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
                getButton.setTitleColor(.white, for: .normal)
                getButton.layer.cornerRadius = 10 // İstenilen köşe yuvarlama miktarını ayarlayabilirsiniz


                // UIImageView'e butonu ekleyin
                AppImageView.addSubview(getButton)

                // Butonun pozisyonunu ve boyutunu ayarlayın
                NSLayoutConstraint.activate([
                    getButton.bottomAnchor.constraint(equalTo: AppImageView.bottomAnchor, constant: -20),
                    getButton.widthAnchor.constraint(equalToConstant: 80),
                    getButton.heightAnchor.constraint(equalToConstant: 30),
                    getButton.leftAnchor.constraint(equalTo: AppImageView.leftAnchor, constant: 245)
                ])


                
            }
            
            return cell
        } else {
            let cell = collectionView2.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath)
            if indexPath.row == 0 {
                let frameView = cell
                let AppImageView2 = UIImageView(image: UIImage(named: "fifalogo")) // Make sure to use the correct image name
                AppImageView2.translatesAutoresizingMaskIntoConstraints = false
                AppImageView2.contentMode = .scaleAspectFit
                frameView.addSubview(AppImageView2)
                AppImageView2.layer.cornerRadius = 10
                AppImageView2.layer.masksToBounds = true
                
                // Siyah yazı
              
                let blackLabel = UILabel()
                let blackText = "What we played this week"
                blackLabel.text = blackText
                blackLabel.textColor = .black
                blackLabel.font = UIFont.boldSystemFont(ofSize: 23) // İstediğiniz kalın yazı stili ve boyutunu ayarlayın
                blackLabel.translatesAutoresizingMaskIntoConstraints = false
                cell.addSubview(blackLabel)
                
                NSLayoutConstraint.activate([
                blackLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 4),
                blackLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 4),
                blackLabel.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 20),
                
        ])
                let lineViewX = UIView()
                lineViewX.backgroundColor = UIColor.lightGray// Çizgi rengi gri olarak ayarlandı
                lineViewX.translatesAutoresizingMaskIntoConstraints = false
                cell.addSubview(lineViewX)
                
                let lineView = UIView()
                lineView.backgroundColor = UIColor.lightGray// Çizgi rengi gri olarak ayarlandı
                lineView.translatesAutoresizingMaskIntoConstraints = false
                frameView.addSubview(lineView)
                
                NSLayoutConstraint.activate([
                    lineViewX.topAnchor.constraint(equalTo: cell.topAnchor, constant: 1),
                    lineViewX.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20),
                    lineViewX.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 20),
                    lineViewX.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20),
                    lineViewX.heightAnchor.constraint(equalToConstant: 0.5) // Çizgi yüksekliği
                ])

                // Position the Kaan image in the top right corner
                NSLayoutConstraint.activate([
                    AppImageView2.bottomAnchor.constraint(equalTo: frameView.bottomAnchor,constant: -250),
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
                    label2.text = "FIFA Mobile"
                    label2.textColor = .black
                    return label2
                }()
                    
                let AppIntNameLabel2: UILabel = {
                    let label2 = UILabel()
                    label2.translatesAutoresizingMaskIntoConstraints = false
                    label2.font = UIFont.systemFont(ofSize: 11, weight: .bold)
                    label2.text = "Football game"
                    label2.textColor = .gray
                    return label2
                }()
                
                let button2 = UIButton(type: .system)
                    button2.frame = CGRect(x: 232, y: 135, width: 90, height: 30)
                let buttonText2 = "GET"
                let attributes2: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 17)
                ]
                let attributedButtonText2 = NSAttributedString(string: buttonText2, attributes: attributes2)
                button2.setAttributedTitle(attributedButtonText2, for: .normal)
                button2.layer.cornerRadius = 10
                    button2.clipsToBounds = true
                button2.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)// İstediğiniz rengi burada belirtebilirsiniz
                    
                    frameView.addSubview(button2)

                    frameView.addSubview(AppNameLabel2)
                    NSLayoutConstraint.activate([
                    AppNameLabel2.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -275),
                    AppNameLabel2.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
                ])

                    frameView.addSubview(AppIntNameLabel2)
                    NSLayoutConstraint.activate([
                    AppIntNameLabel2.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -260),
                    AppIntNameLabel2.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
                ])
                
                let AppImageView3 = UIImageView(image: UIImage(named: "hcrlogo")) // Make sure to use the correct image name
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
                        AppImageView3.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -170),
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
                        label3.text = "Hill Climb Racing"
                        label3.textColor = .black
                        return label3
                    }()
                    
                    let AppIntNameLabel3: UILabel = {
                        let label3 = UILabel()
                        label3.translatesAutoresizingMaskIntoConstraints = false
                        label3.font = UIFont.systemFont(ofSize: 11, weight: .bold)
                        label3.text = "A race game"
                        label3.textColor = .gray
                        return label3
                    }()
                
                let button3 = UIButton(type: .system)
                    button3.frame = CGRect(x: 232, y: 55, width: 90, height: 30)
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
                button3.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2) // İstediğiniz rengi burada belirtebilirsiniz
                    
                    frameView.addSubview(button3)

                    frameView.addSubview(AppNameLabel3)
                    NSLayoutConstraint.activate([
                    AppNameLabel3.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -195),
                    AppNameLabel3.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
                ])

                    frameView.addSubview(AppIntNameLabel3)
                    NSLayoutConstraint.activate([
                    AppIntNameLabel3.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -180),
                    AppIntNameLabel3.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
                ])
                
                let AppImageView4 = UIImageView(image: UIImage(named: "mclogo")) // Make sure to use the correct image name
                    AppImageView4.translatesAutoresizingMaskIntoConstraints = false
                    AppImageView4.contentMode = .scaleAspectFit
                    frameView.addSubview(AppImageView4)
                    AppImageView4.layer.cornerRadius = 10
                    AppImageView4.layer.masksToBounds = true
                
            
    

                    // Position the Kaan image in the top right corner
                    NSLayoutConstraint.activate([
                        AppImageView4.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -90),
                        AppImageView4.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 20),
                        AppImageView4.widthAnchor.constraint(equalToConstant: 50), // Adjust the width as needed
                        AppImageView4.heightAnchor.constraint(equalToConstant: 50) // Adjust the height as needed
                    ])
                    
                
                    
                     let AppNameLabel4: UILabel = {
                        let label4 = UILabel()
                        label4.translatesAutoresizingMaskIntoConstraints = false
                        label4.font = UIFont.systemFont(ofSize: 15, weight: .bold)
                        label4.text = "Minecraft"
                        label4.textColor = .black
                        return label4
                    }()
                    
                    let AppIntNameLabel4: UILabel = {
                        let label4 = UILabel()
                        label4.translatesAutoresizingMaskIntoConstraints = false
                        label4.font = UIFont.systemFont(ofSize: 11, weight: .bold)
                        label4.text = "The best game ever"
                        label4.textColor = .gray
                        return label4
                    }()
                
                let button4 = UIButton(type: .system)
                button4.frame = CGRect(x: 232, y: 220, width: 90, height: 30)

                let buttonText = "GET"
                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 17)
                ]
                let attributedButtonText = NSAttributedString(string: buttonText, attributes: attributes)
                button4.setAttributedTitle(attributedButtonText, for: .normal)

                button4.layer.cornerRadius = 10
                button4.clipsToBounds = true
                button4.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
                    
                    frameView.addSubview(button4)

                    frameView.addSubview(AppNameLabel4)
                    NSLayoutConstraint.activate([
                    AppNameLabel4.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -115),
                    AppNameLabel4.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
                ])

                    frameView.addSubview(AppIntNameLabel4)
                    NSLayoutConstraint.activate([
                    AppIntNameLabel4.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -100),
                    AppIntNameLabel4.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
                ])
                
            } else {
                let frameView = cell
                let AppImageView2 = UIImageView(image: UIImage(named: "icardikapak")) // Make sure to use the correct image name
                AppImageView2.translatesAutoresizingMaskIntoConstraints = false
                AppImageView2.contentMode = .scaleAspectFit
                frameView.addSubview(AppImageView2)
                AppImageView2.layer.cornerRadius = 10
                AppImageView2.layer.masksToBounds = true
                
                // Siyah yazı
              
                let blackLabel = UILabel()
                let blackText = "What we played this week"
                blackLabel.text = blackText
                blackLabel.textColor = .black
                blackLabel.font = UIFont.boldSystemFont(ofSize: 23) // İstediğiniz kalın yazı stili ve boyutunu ayarlayın
                blackLabel.translatesAutoresizingMaskIntoConstraints = false
                cell.addSubview(blackLabel)
                
                NSLayoutConstraint.activate([
                blackLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 4),
                blackLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 4),
                blackLabel.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 20),
                
        ])
                let lineViewX = UIView()
                lineViewX.backgroundColor = UIColor.lightGray// Çizgi rengi gri olarak ayarlandı
                lineViewX.translatesAutoresizingMaskIntoConstraints = false
                cell.addSubview(lineViewX)
                
                let lineView = UIView()
                lineView.backgroundColor = UIColor.lightGray// Çizgi rengi gri olarak ayarlandı
                lineView.translatesAutoresizingMaskIntoConstraints = false
                frameView.addSubview(lineView)
                
                NSLayoutConstraint.activate([
                    lineViewX.topAnchor.constraint(equalTo: cell.topAnchor, constant: 1),
                    lineViewX.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20),
                    lineViewX.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 20),
                    lineViewX.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20),
                    lineViewX.heightAnchor.constraint(equalToConstant: 0.5) // Çizgi yüksekliği
                ])

                // Position the Kaan image in the top right corner
                NSLayoutConstraint.activate([
                    AppImageView2.bottomAnchor.constraint(equalTo: frameView.bottomAnchor,constant: -250),
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
                    label2.text = "Championship Road"
                    label2.textColor = .black
                    return label2
                }()
                    
                let AppIntNameLabel2: UILabel = {
                    let label2 = UILabel()
                    label2.translatesAutoresizingMaskIntoConstraints = false
                    label2.font = UIFont.systemFont(ofSize: 11, weight: .bold)
                    label2.text = "Adventure game with İcardi"
                    label2.textColor = .gray
                    return label2
                }()
                
                let button2 = UIButton(type: .system)
                    button2.frame = CGRect(x: 232, y: 135, width: 90, height: 30)
                let buttonText2 = "GET"
                let attributes2: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 17)
                ]
                let attributedButtonText2 = NSAttributedString(string: buttonText2, attributes: attributes2)
                button2.setAttributedTitle(attributedButtonText2, for: .normal)
                button2.layer.cornerRadius = 10
                    button2.clipsToBounds = true
                button2.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)// İstediğiniz rengi burada belirtebilirsiniz
                    
                    frameView.addSubview(button2)

                    frameView.addSubview(AppNameLabel2)
                    NSLayoutConstraint.activate([
                    AppNameLabel2.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -275),
                    AppNameLabel2.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
                ])

                    frameView.addSubview(AppIntNameLabel2)
                    NSLayoutConstraint.activate([
                    AppIntNameLabel2.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -260),
                    AppIntNameLabel2.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
                ])
                
                let AppImageView3 = UIImageView(image: UIImage(named: "alogo")) // Make sure to use the correct image name
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
                        AppImageView3.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -170),
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
                        label3.text = "Angry Birds"
                        label3.textColor = .black
                        return label3
                    }()
                    
                    let AppIntNameLabel3: UILabel = {
                        let label3 = UILabel()
                        label3.translatesAutoresizingMaskIntoConstraints = false
                        label3.font = UIFont.systemFont(ofSize: 11, weight: .bold)
                        label3.text = "Classic angry bird game"
                        label3.textColor = .gray
                        return label3
                    }()
                
                let button3 = UIButton(type: .system)
                    button3.frame = CGRect(x: 232, y: 55, width: 90, height: 30)
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
                button3.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2) // İstediğiniz rengi burada belirtebilirsiniz
                    
                    frameView.addSubview(button3)

                    frameView.addSubview(AppNameLabel3)
                    NSLayoutConstraint.activate([
                    AppNameLabel3.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -195),
                    AppNameLabel3.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
                ])

                    frameView.addSubview(AppIntNameLabel3)
                    NSLayoutConstraint.activate([
                    AppIntNameLabel3.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -180),
                    AppIntNameLabel3.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
                ])
                
                let AppImageView4 = UIImageView(image: UIImage(named: "unologo")) // Make sure to use the correct image name
                    AppImageView4.translatesAutoresizingMaskIntoConstraints = false
                    AppImageView4.contentMode = .scaleAspectFit
                    frameView.addSubview(AppImageView4)
                    AppImageView4.layer.cornerRadius = 10
                    AppImageView4.layer.masksToBounds = true
                
            
    

                    // Position the Kaan image in the top right corner
                    NSLayoutConstraint.activate([
                        AppImageView4.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -90),
                        AppImageView4.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 20),
                        AppImageView4.widthAnchor.constraint(equalToConstant: 50), // Adjust the width as needed
                        AppImageView4.heightAnchor.constraint(equalToConstant: 50) // Adjust the height as needed
                    ])
                    
                
                    
                     let AppNameLabel4: UILabel = {
                        let label4 = UILabel()
                        label4.translatesAutoresizingMaskIntoConstraints = false
                        label4.font = UIFont.systemFont(ofSize: 15, weight: .bold)
                        label4.text = "UNO"
                        label4.textColor = .black
                        return label4
                    }()
                    
                    let AppIntNameLabel4: UILabel = {
                        let label4 = UILabel()
                        label4.translatesAutoresizingMaskIntoConstraints = false
                        label4.font = UIFont.systemFont(ofSize: 11, weight: .bold)
                        label4.text = "The best card game"
                        label4.textColor = .gray
                        return label4
                    }()
                
                let button4 = UIButton(type: .system)
                button4.frame = CGRect(x: 232, y: 220, width: 90, height: 30)

                let buttonText = "GET"
                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 17)
                ]
                let attributedButtonText = NSAttributedString(string: buttonText, attributes: attributes)
                button4.setAttributedTitle(attributedButtonText, for: .normal)

                button4.layer.cornerRadius = 10
                button4.clipsToBounds = true
                button4.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
                    
                    frameView.addSubview(button4)

                    frameView.addSubview(AppNameLabel4)
                    NSLayoutConstraint.activate([
                    AppNameLabel4.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -115),
                    AppNameLabel4.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
                ])

                    frameView.addSubview(AppIntNameLabel4)
                    NSLayoutConstraint.activate([
                    AppIntNameLabel4.bottomAnchor.constraint(equalTo: frameView.bottomAnchor, constant: -100),
                    AppIntNameLabel4.leftAnchor.constraint(equalTo: frameView.leftAnchor, constant: 80)
                ])
                
            }
            cell.backgroundColor = bgcolor
            return cell
        
        }
    }

        // MARK: - UICollectionViewDelegateFlowLayout
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 1.15 // Ekranın yarısı kadar genişlik
        let height = collectionView.frame.height // Koleksiyon görünümünün yüksekliği kadar yükseklik
        return CGSize(width: width, height: height)
    }

        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            // Sağa veya sola kaydırma işlemi bittiğinde burası tetiklenebilir.
            // Hangi hücre görünüyorsa, o hücrenin indeksini alabilirsiniz.
            if let visibleIndexPath = collectionView.indexPathsForVisibleItems.first {
                print("Görünür hücre indeksi: \(visibleIndexPath.item)")
            }
        }
    
    
    

}
