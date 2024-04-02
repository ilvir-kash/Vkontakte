//
//  LikeControll.swift
//  Vkontakte
//
//  Created by Ильвир Кашаев on 27.03.2024.
//

import UIKit

final class LikeControl: UIView {
    
    private lazy var gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapControl))
    
    var imageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = UIColor.red
        view.image = UIImage(systemName: "heart")
        view.isUserInteractionEnabled = true
        return view
    }()
    var likeCountLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.red
        return view
    }()
    var likeCounter = 10
    var isLike: Bool = false
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setLike(count: Int) {
        likeCounter = count
        setLikeCounterLabel()
    }
    
    func setLikeCounterLabel(){
        let likeString: String?
        
        switch likeCounter {
        case 0..<1000:
            likeString = String(self.likeCounter)
        case 1000..<1_000_000:
            likeString = String(self.likeCounter/1000) + "K"
        default:
            likeString = "-"
        }
        
        UIView.transition(with: likeCountLabel,
                           duration: 0.3,
                           animations: {[unowned self] in
            self.likeCountLabel.text = String(likeString!)
        })
    }
    
    @objc func tapControl(){
        isLike.toggle()
        if isLike{
            imageView.image = UIImage(systemName: "heart.fill")
            likeCounter += 1
            setLikeCounterLabel()
        } else{
            imageView.image = UIImage(systemName: "heart")
            likeCounter -= 1
            setLikeCounterLabel()
        }
    }
    
    func configureLayout() {
        addSubview(likeCountLabel)
        addSubview(imageView)
        
        likeCountLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        likeCountLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        likeCountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        likeCountLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        imageView.leftAnchor.constraint(equalTo: likeCountLabel.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }
}
