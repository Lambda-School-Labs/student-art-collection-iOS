//
//  ArtDetailViewController.swift
//  Artco
//
//  Created by Alex Rhodes on 12/19/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class SArtDetailViewController: UIViewController {

    // MARK: - Properties and outlets
    
    @IBOutlet weak var artImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var listing: Listing? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - View lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: Methods and functions
    
    public func convertDataToImage(_ data: Data) -> UIImage {
        guard let image = UIImage(data: data) else { return UIImage() }
        return image
    }
    
    func updateViews() {
        guard isViewLoaded,
            let listing = listing else { return }
        
        artImageView.image = convertDataToImage(listing.images ?? Data())
        artistNameLabel.text = listing.artistName
        titleLabel.text = listing.title
        priceLabel.text = listing.price.currencyOutputFormatting()
        categoryLabel.text = "\(listing.category)"
        descriptionTextView.text = listing.description
    }
    
    @IBAction func addToCartButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
