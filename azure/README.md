# Azure Practical  

This document contains hands-on tasks performed on Azure Virtual Machines, along with the related concepts learned.  

---

## 1. Creating an Azure VM  

- **Task:** Created an **Azure VM** and logged into the server using **SSH**.  
- **Concept Learned:** A VM is a virtualized compute resource in Azure. You can access it via SSH (Linux) or RDP (Windows).  

![Azure VM Creation](image1.png)  
![Azure VM Login](image2.png)  

---

## 2. Installing and Accessing Nginx  

- **Task:** Installed **Nginx** and accessed it on **port 80** in the browser using the public IP.  
- **Concept Learned:** Demonstrates hosting a basic web server on Azure and accessing it via public IP + security rules.  

![Nginx Setup](image3.png)  

---

## 3. Attaching and Mounting an Additional Volume  

- **Task:** Attached an additional volume to **VM1** and mounted it on Ubuntu to access storage.  
- **Concept Learned:** Azure Disks provide persistent storage. Volumes can be attached/detached and mounted for expansion.  

![Attach Volume](image4.png)  
![Disk Mount](image5.png)  
![Storage Access](image6.png)  
![Mount Confirmation](image7.png)  
![Final Volume Mounted](image8.png)  

---

## 4. Creating a Snapshot and Restoring Data  

- **Task:**  
  - Created a **snapshot** of the extra volume attached to **VM1**.  
  - Created a **new volume** from that snapshot.  
  - Attached the new volume to another VM (**VM2**).  
  - Verified that **data created in VM1 was accessible in VM2**.  
- **Concept Learned:** Snapshots provide point-in-time backup of disks, which can be used to create new volumes or restore data.  

![Snapshot Step](image9.png)  
![Volume Creation](image10.png)  
![Attach to VM2](image11.png)  
![Data Verified](image12.png)  

---

## 5. Creating and Using VM Images  

- **Task:** Created a **standard image** from **VM1** and used it to create other VMs with:  
  - **Custom script**  
  - **Placement Group**  

- **Concept Learned:**  
  - **Generalized VM Image** → Reusable, requires hostname/user reconfiguration. Useful for team-wide templates (e.g., with Java preinstalled).  
  - **Specialized VM Image** → Exact replica of a VM (apps, hostname, and credentials intact). Useful for cloning environments.  

---

## 6. Availability Options in Azure  

### Proximity Placement Group (PPG)  

- **Concept Learned:** Keeps VMs physically close within the same datacenter → useful for **low-latency applications** like trading, analytics, or database+app workloads.  

![Proximity Placement Group](images/ppg.png)  

---

### Availability Set  

- **Concept Learned:** Ensures **high availability** by spreading VMs across **fault domains** (racks/power/network paths) and **update domains** (maintenance groups). Prevents all VMs from failing at once.  
- **Use Case Example:** Multiple web servers in an availability set ensure one stays up during maintenance or failure.  

---
