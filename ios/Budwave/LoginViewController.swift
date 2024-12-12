import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func loginViewControllerDidLogin(_ loginViewController: LoginViewController)
}

class LoginViewController: UIViewController {
    
    weak var delegate: LoginViewControllerDelegate?
    
    private let googleLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login with Google", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(googleLoginButton)
        
        NSLayoutConstraint.activate([
            googleLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            googleLoginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        googleLoginButton.addTarget(self, action: #selector(googleLoginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func googleLoginButtonTapped() {
        // TODO: Implement Google login
        delegate?.loginViewControllerDidLogin(self)
    }
}
