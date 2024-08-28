//
//  bmiketquaViewController.swift
//  vidu
//
//  Created by apple on 2024/08/28.
//

import UIKit

class bmiketquaViewController: UIViewController {

    @IBOutlet weak var txttieude: UILabel!
    @IBOutlet weak var txtkhuyencao: UILabel!
    @IBOutlet weak var txtketquabmi: UILabel!
    @IBOutlet weak var txttuoi: UILabel!
    @IBOutlet weak var txtcannang: UILabel!
    @IBOutlet weak var txtchieucao: UILabel!
    @IBOutlet weak var txtgioitinh: UILabel!
    var gioitinhBmi:String!
    var chieucaoBmi:Int!
    var cannangBmi:Int!
    var tuoiBmi:Int!
    var ketqua:Float!
    var quydoi:Float!
    var ngaythang:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "kk")!)
        view.scalesLargeContentImage = true
        let kkk:String = layngaythangnam()
        txttieude.text = "Bảng Kết Quả Đo BMI " + kkk
        txtgioitinh.text = gioitinhBmi
        txtchieucao.text = String(chieucaoBmi) + " Cm"
        txtcannang.text = String(cannangBmi) + " Kg"
        txttuoi.text = String(tuoiBmi) + " Tuổi"
        quydoi = Float(chieucaoBmi)/100
        ketqua = Float(cannangBmi) / (quydoi * quydoi)
        let chuyendoi = String(format: "%.2f", ketqua)
        txtketquabmi.text = chuyendoi
        
        if ketqua < 18.5{
            txtkhuyencao.text = "Nhẹ Cân"
            txtkhuyencao.textColor = UIColor.white
            txtkhuyencao.backgroundColor = UIColor.red
        }
        else if ketqua > 18.5 && ketqua < 24.9 {
            txtkhuyencao.backgroundColor = UIColor.white
            txtkhuyencao.textColor = UIColor.red
            txtkhuyencao.textColor = UIColor.black
            txtkhuyencao.text = "Cân Nặng Bình Thường"
        }
        else if ketqua >= 25 && ketqua <= 29.9 {
            txtkhuyencao.backgroundColor = UIColor.white
            txtkhuyencao.textColor = UIColor.orange
            txtkhuyencao.text = "Thừa Cân"
        }
        else if ketqua >= 30 && ketqua <= 34.9 {
            txtkhuyencao.textColor = UIColor.white
            txtkhuyencao.backgroundColor = UIColor.red
            txtkhuyencao.text = "Béo Phì Độ I"
        }
        else if ketqua >= 35 && ketqua <= 39.9 {
            txtkhuyencao.textColor = UIColor.white
            txtkhuyencao.backgroundColor = UIColor.red
            txtkhuyencao.text = "Béo Phì Độ II"
        }
        else{
            txtkhuyencao.textColor = UIColor.white
            txtkhuyencao.backgroundColor = UIColor.red
            txtkhuyencao.text = "Béo Phì Độ III"
        }
    }

    func layngaythangnam() -> String {
        let dateCurrent = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: dateCurrent)
        ngaythang = "\(components.day!)/\(components.month!)/\(components.year!)"
        return ngaythang
    }
}
