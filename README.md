Here's your **README.md** in simple and clear language:  

---

# **SamEnum - Active Directory Enumeration Script**  

## **Overview**  
SamEnum is a PowerShell script that helps **gather information about an Active Directory environment** without needing admin rights. It collects details about **domains, users, groups, computers, logged-in users, and network shares** using built-in Windows commands.  

---

## **Features**  
- Works **without admin privileges**  
- Retrieves **domain name and domain controllers**  
- Lists **users, groups, and computers** in the domain  
- Finds **currently logged-in users**  
- Detects **network shares** in the domain  
- Uses **built-in Windows tools** to stay undetected  

---

## **How It Works**  

### **1. Get-DomainInfo**  
Gets the **domain name** and **domain controllers**.  

### **2. Get-DomainUsers**  
Lists all **user accounts** in the domain.  

### **3. Get-DomainGroups**  
Shows all **security and distribution groups**.  

### **4. Get-DomainComputers**  
Finds all **computers** in the domain.  

### **5. Get-LoggedInUsers**  
Checks for **currently logged-in users** on the machine.  

### **6. Get-NetworkShares**  
Lists **shared network resources** available in the domain.  

---

## **Usage**  
1. Open PowerShell and run the script:  
   ```powershell
   .\SamEnum.ps1
   ```
2. The script will run automatically and show the results.  
3. No admin access is needed.  

---

## **Notes**  
- This script **does not make any changes** to the system.  
- It is useful for **security assessments and network audits**.  
- Results can help identify **users, devices, and resources** in an AD environment.  

---

## **Disclaimer**  
This script is meant for **ethical use** only. Do not run it on networks **without permission**, as it may violate policies or laws.  

---

