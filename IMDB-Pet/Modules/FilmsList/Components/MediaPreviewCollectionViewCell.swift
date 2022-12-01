//
//  MediaPreviewCollectionViewCell.swift
//  IMDB-Pet
//
//  Created by Henadzi on 29/11/2022.
//

import UIKit

class MediaPreviewCollectionViewCell: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(hexString: "1F84C7")
        return view
    }()
        
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override var isHighlighted: Bool{
        didSet {
            shrink(tapped: isHighlighted)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
    }
    
    func setup(with media: MediaInfo, and bgColor: UIColor) {
        setupConstraints()
        
        nameLabel.text = "\(media.sortPopularity ?? 0). " + (media.name ?? "")
        imageView.load(from: media.posterImage?.url)
    }
    
    private func setupConstraints() {
        contentView.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        containerView.addSubview(imageView)
        containerView.addSubview(nameLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -4),
            imageView.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -8),
        ])
        
    }
    
    private func shrink(tapped: Bool) {
        UIView.animate(withDuration: tapped ? 0.3 : 0.5) {
            self.containerView.transform = tapped ? CGAffineTransform(scaleX: 0.95, y: 0.95) : .identity
        }
    }
}
