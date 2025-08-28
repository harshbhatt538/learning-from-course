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

![Snapshot Step](image13.png)  
![Volume Creation](image14.png) 

---

## 6. Availability Options in Azure  

### Proximity Placement Group (PPG)  

- **Concept Learned:** Keeps VMs physically close within the same datacenter → useful for **low-latency applications** like trading, analytics, or database+app workloads.  



---

### Availability Set  

- **Concept Learned:** Ensures **high availability** by spreading VMs across **fault domains** (racks/power/network paths) and **update domains** (maintenance groups). Prevents all VMs from failing at once.  
- **Use Case Example:** Multiple web servers in an availability set ensure one stays up during maintenance or failure.  

---

# Azure vs AWS – Public IPs, Private Subnets, and NAT Gateways

This document explains how **Azure** and **AWS** handle Public IPs and outbound Internet access for VMs/EC2 instances inside private subnets.

---

## Azure

- When you create a VM, you can **choose to assign a Public IP**, even if the VM is in a “private subnet.”
- **If a Public IP is assigned:**
  - Outbound Internet access works directly through that Public IP (no NAT Gateway needed).
  - Inbound traffic from the Internet is possible (if NSG/firewall allows).
- **If no Public IP is assigned:**
  - Outbound traffic still works by default.
  - Azure provides a **system route** → `0.0.0.0/0 → Internet`.
  - Azure uses **default SNAT** behind the scenes with shared Azure IPs.
  - This is fine for light traffic, but not scalable or controllable.

For production:
- Use a **NAT Gateway** so outbound traffic:
  - Has a **predictable Public IP** (your NAT Gateway’s IP).
  - Avoids **SNAT port exhaustion issues**.

---

## AWS

- If an instance is in a **private subnet**:
  - It **cannot** be assigned a Public IP (by design).
- To enable **outbound Internet**:
  - You must use a **NAT Gateway**.
- To allow **inbound Internet traffic**:
  - Place the instance in a **public subnet** and attach a Public IP.

---

##  Summary

- **Azure** is more flexible:  
  - You can assign a Public IP to a VM even in a private subnet.  
- **AWS** is stricter:  
  - Private subnet means **no Public IP**.  

### Best Practice (for both Azure & AWS):
- Use **Private Subnet + No Public IP + NAT Gateway** for outbound-only Internet access.

---

## 7. Connecting via Bastion
- **Task:** Connected to a VM via **Azure Bastion**, which was in a private subnet without a public IP.  
- **Concept Learned:**  
  Azure Bastion provides secure and seamless RDP/SSH connectivity to VMs directly through the Azure portal — no need for public IPs.  

![Screenshot](image15.png)
![Screenshot](image16.png)


## 8. VNet Peering and Private SSH Access
- **Task:** Peered two VNets and accessed a VM in another subnet using its **private IP** from the vm in different VNet.  
- **Concept Learned:**  
  VNet peering connects two Azure VNets, enabling traffic between them with low latency and high bandwidth.  

![Screenshot](image17.png)
![Screenshot](image18.png)


---

## 9. Working with VM Scale Sets (VMSS) and Load Balancer
- **Task:**  
  - Encountered error: *"ApplicationGatewaySubnetCannotBeUsedByOtherResources"*.  
  - Fixed it by creating a NIC in a different subnet.  
  - Created a VMSS and an Application Load Balancer.  
  - Installed Nginx on one VM and accessed it through the Load Balancer.  

- **Concept Learned:**  
  - A subnet used by Application Gateway cannot host other resources.  
  - VM Scale Sets allow autoscaling of VMs.  
  - Load Balancer distributes traffic across VMs.  

![Screenshot](image19.png)
![Screenshot](image20.png)
![Screenshot](image21.png)
![Screenshot](image22.png)
![Screenshot](image23.png)
