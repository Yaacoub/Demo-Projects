import UIKit
import PlaygroundSupport



//MARK:- View Controller

class CollectionViewController: UICollectionViewController {
    
    
    
    //MARK:- Override Methods
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemPink
        cell.layer.cornerRadius = 25
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState, animations: {
            cell?.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState, animations: {
            cell?.transform = .identity
        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    
    //MARK:- Private Methods
    
    private func setup() {
        collectionView.backgroundColor = .white
        collectionView.delaysContentTouches = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
}



//MARK:- Extensions

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (Int(collectionView.frame.width) - 10) / 3 - 2 * 10
        return CGSize(width: size, height: size)
    }
    
}



//MARK:- Live View

PlaygroundPage.current.liveView = CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
