



/*formats the raw AVCaptureOutput metaDataObjects from an AVCaptureSession. This function formats the PDF417 barcode and outputs a dictionary */




func formatScannedData(metadataObjects metadataObjects: [AnyObject]) -> [String: String]{

    var scanDataDictionary = [String:String]()

    for metadata in metadataObjects {
        if let dataString = (metadata as! AVMetadataMachineReadableCodeObject).stringValue {
            let dataArray = dataString.componentsSeparatedByString("\n")
            switch (metadataObjects.count > 0) {
            case dataArray[6] != "DAC":
                let rawFirstName = dataArray.filter({$0.hasPrefix("DAC")}).joinWithSeparator("")
                let firstName = rawFirstName.stringByReplacingOccurrencesOfString("DAC", withString: "")
                scanDataDictionary["firstName"] = firstName.lowercaseString
                fallthrough
            case dataArray[7] != "DAD":
                let rawMiddleName = dataArray.filter({$0.hasPrefix("DAD")}).joinWithSeparator("")
                let middleName = rawMiddleName.stringByReplacingOccurrencesOfString("DAD", withString: "")
                scanDataDictionary["middleName"] = middleName.lowercaseString
                fallthrough
            case dataArray[5] != "DCS":
                let rawLastName = dataArray.filter({$0.hasPrefix("DCS")}).joinWithSeparator("")
                let lastName = rawLastName.stringByReplacingOccurrencesOfString("DCS", withString: "")
                scanDataDictionary["lastName"] = lastName.lowercaseString
                fallthrough
            case dataArray[9] != "DBB":
                let rawDateOfBirth = dataArray.filter({$0.hasPrefix("DBB")}).joinWithSeparator("")
                let dateOfBirth = rawDateOfBirth.stringByReplacingOccurrencesOfString("DBB", withString: "")
                scanDataDictionary["dateOfBirth"] = dateOfBirth.lowercaseString
                fallthrough
            case dataArray[17] != "DAQ":
                let rawLicenseNumber = dataArray.filter({$0.hasPrefix("DAQ")}).joinWithSeparator("")
                let licenseNumber = rawLicenseNumber.stringByReplacingOccurrencesOfString("DAQ", withString: "")
                scanDataDictionary["licenseNumber"] = licenseNumber.lowercaseString
                fallthrough
            case dataArray[13] != "DAG":
                let rawAddress = dataArray.filter({$0.hasPrefix("DAG")}).joinWithSeparator("")
                let address = rawAddress.stringByReplacingOccurrencesOfString("DAG", withString: "")
                scanDataDictionary["address"] = address.lowercaseString
                fallthrough
            case dataArray[14] != "DAI":
                let rawCity = dataArray.filter({$0.hasPrefix("DAI")}).joinWithSeparator("")
                let city = rawCity.stringByReplacingOccurrencesOfString("DAI", withString: "")
                scanDataDictionary["city"] = city.lowercaseString
                fallthrough
            case dataArray[15] != "DAJ":
                let rawState = dataArray.filter({$0.hasPrefix("DAJ")}).joinWithSeparator("")
                let state = rawState.stringByReplacingOccurrencesOfString("DAJ", withString: "")
                scanDataDictionary["state"] = state.lowercaseString
                fallthrough
            case dataArray[16] != "DAK":
                let rawZipcode = dataArray.filter({$0.hasPrefix("DAK")}).joinWithSeparator("")
                let zipcode = rawZipcode.stringByReplacingOccurrencesOfString("DAK", withString: "")
                scanDataDictionary["zipcode"] = zipcode
                fallthrough
            case dataArray[23] != "DAW":
                let rawWeight = dataArray.filter({$0.hasPrefix("DAW")}).joinWithSeparator("")
                let weight = rawWeight.stringByReplacingOccurrencesOfString("DAW", withString: "")
                scanDataDictionary["weight"] = weight
                fallthrough
            case dataArray[12] != "DAU":
                let rawHeight = dataArray.filter({$0.hasPrefix("DAU")}).joinWithSeparator("")
                let height = rawHeight.stringByReplacingOccurrencesOfString("DAU", withString: "")
                scanDataDictionary["height"] = height
                fallthrough
            case dataArray[4] != "DBA":
                let rawlicenseExpirationDate = dataArray.filter({$0.hasPrefix("DBA")}).joinWithSeparator("")
                let licenseExpirationDate = rawlicenseExpirationDate.stringByReplacingOccurrencesOfString("DBA", withString: "")
                scanDataDictionary["licenseExpirationDate"] = licenseExpirationDate
                fallthrough
            case dataArray[11] != "DAY":
                let rawEyeColor = dataArray.filter({$0.hasPrefix("DAY")}).joinWithSeparator("")
                let eyeColor = rawEyeColor.stringByReplacingOccurrencesOfString("DAY", withString: "")
                scanDataDictionary["eyeColor"] = eyeColor.lowercaseString
                fallthrough
            case dataArray[24] != "DAZ":
                let rawHairColor = dataArray.filter({$0.hasPrefix("DAZ")}).joinWithSeparator("")
                let hairColor = rawHairColor.stringByReplacingOccurrencesOfString("DAZ", withString: "")
                scanDataDictionary["hairColor"] = hairColor.lowercaseString
                fallthrough
            case dataArray[10] != "DBH":
                let rawOrganDonor = dataArray.filter({$0.hasPrefix("DBH")}).joinWithSeparator("")
                let organDonor = rawOrganDonor.stringByReplacingOccurrencesOfString("DBH", withString: "")
                if organDonor == "1" {
                    scanDataDictionary["organDonor"] = "true"
                } else if organDonor == "2"{
                    scanDataDictionary["organDonor"] = "false"
                }
                fallthrough
            case dataArray[10] != "DBC":
                let rawSex = dataArray.filter({$0.hasPrefix("DBC")}).joinWithSeparator("")
                let sex = rawSex.stringByReplacingOccurrencesOfString("DBC", withString: "")
                if sex == "1" {
                    scanDataDictionary["sex"] = "male"
                } else if sex == "2"{
                    scanDataDictionary["sex"] = "female"
                }

                fallthrough


            default:
                break;
            }
        }
    }

    return scanDataDictionary
}

}