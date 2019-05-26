//
//  ViewController.swift
//  TableView

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView()

    view.addSubview(tableView)

    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      ])

    let nib = UINib(nibName: "TableCell", bundle: Bundle.main)
    tableView.register(nib, forCellReuseIdentifier: "CellID")

    tableView.dataSource = self

    tableView.delegate = self

  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 100
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! TableCell
    cell.label.text = "Row \(indexPath.row)"

    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
    showToast(message: "Row \(indexPath.row)", seconds: 3)
  }
}

extension ViewController {
  func showToast(message : String, seconds: Double) {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    alert.view.backgroundColor = UIColor.black
    alert.view.alpha = 0.6
    alert.view.layer.cornerRadius = 15

    self.present(alert, animated: true)

    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
      alert.dismiss(animated: true)
    }
  }
}
