import UIKit

protocol BackTransition: class {
    func back()
}

class PushViewController: UIViewController, BackTransition {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        button.addTarget(self, action: #selector(didTapPushButton), for: .touchUpInside)
        view.addSubview(button)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = view.bounds // レイアウト調整
    }
    
    @objc func didTapPushButton() {
        guard let navigationController = navigationController else { return }
        let commonViewController = CommonViewController()
        commonViewController.delegate = self
        navigationController.pushViewController(commonViewController, animated: true)
    }
    
    func back() {
        navigationController?.popViewController(animated: true)
    }
}

class PresentViewController: UIViewController, BackTransition {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        button.frame = view.bounds
        button.addTarget(self, action: #selector(didTapPresentButton), for: .touchUpInside)
        view.addSubview(button)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = view.bounds // レイアウト調整
    }
    
    @objc func didTapPresentButton() {
        let commonViewController = CommonViewController()
        commonViewController.delegate = self
        present(commonViewController, animated: true, completion: nil)
    }
    
    func back() {
        dismiss(animated: true, completion: nil)
    }
}

class CommonViewController: UIViewController {
    
    weak var delegate: BackTransition?
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        view.addSubview(button)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = view.bounds // レイアウト調整
    }
    
    @objc func didTapBackButton() {
        delegate?.back()
    }
}

