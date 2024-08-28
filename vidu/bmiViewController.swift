//
//  bmiViewController.swift
//  vidu
//
//  Created by apple on 2024/08/28.
//

import UIKit

class bmiViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var Pickerview_cannang: UIPickerView!
    @IBOutlet weak var tbl_chieucao: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var gioitinh:String = "Male"
    var mangcannang:[Int]!
    var mangtuoi:[Int]!
    var tcannang:Int = 55
    var ttuoi:Int = 30
    override func viewDidLoad() {
        super.viewDidLoad()
    
        mangcannang = []
        mangtuoi = []
        
        cannang()
        tuoi()
        
        Pickerview_cannang.delegate = self
        Pickerview_cannang.dataSource = self
        Pickerview_cannang.selectRow(mangcannang.count/2, inComponent: 0, animated: true)
        Pickerview_cannang.selectRow(mangtuoi.count/2, inComponent: 1, animated: true)
        
    }
    
    @IBAction func BmiNu(_ sender: Any) {
        gioitinh = "Female"
        print(gioitinh)
    }
    
    @IBAction func BmiNam(_ sender: Any) {
        gioitinh = "Male"
        print(gioitinh)
    }
    
    @IBAction func Slider_value(_ sender: Any) {
        let chuyendoi = String(format: "%.0f", slider.value)
        tbl_chieucao.text = chuyendoi
        print(chuyendoi)
    }
    
    
    func cannang() {
        for i in 2...95{
            mangcannang.append(Int(i))
        }
    }
    func tuoi() {
        for i in 0...100{
            mangtuoi.append(Int(i))
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0
        {
            return mangcannang.count
        }
        else
        {
            return mangtuoi.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0
        {
            return String(mangcannang[row]) + " Kg"
        }
        else
        {
            return String(mangtuoi[row]) + " Tuổi"
        }
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return CGFloat(30)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0
        {
            tcannang = mangcannang[row]
        }
        else
        {
            ttuoi = mangtuoi[row]
        }
    }
    
    @IBAction func Btn_KetQua(_ sender: Any) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let Bmi = st.instantiateViewController(withIdentifier: "bmiketqua") as! bmiketquaViewController
        Bmi.gioitinhBmi = gioitinh
        Bmi.chieucaoBmi = Int(tbl_chieucao.text!)
        Bmi.cannangBmi = tcannang
        Bmi.tuoiBmi = ttuoi
        self.navigationController?.pushViewController(Bmi, animated: true)
    }
    
}
