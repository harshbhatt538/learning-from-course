# Kubernetes Basics 

This document covers fundamental concepts of Kubernetes (K8s) in a simple, practical way.

---

## Table of Contents
1. [Why Kubernetes?](#why-kubernetes)
2. [Kubernetes Structure (High-Level Architecture)](#kubernetes-structure-high-level-architecture)
   - [Control Plane Components](#control-plane-components-master-node)
   - [Worker Node Components](#worker-node-components)
   - [How They Work Together](#how-they-work-together-quick-example)
3. [Advantage of Running Multiple Containers in One Pod](#advantage-of-running-multiple-containers-in-one-pod)
4. [Pod vs Container vs ReplicaSet vs Deployment](#pod-vs-container-vs-replicaset-vs-deployment)
5. [Services in Kubernetes](#services-in-kubernetes)

---

## 1. Why Kubernetes?

Modern applications often run as **containers**. Managing containers at scale manually is painful.

Kubernetes (K8s) is an open-source container orchestration tool that automates:

- Deployment  
- Scaling  
- Load balancing  
- Self-healing (restart failed containers)  
- Rollouts & rollbacks  

In short, Kubernetes gives **production-grade reliability** and **flexibility** for running containerized applications.

---

## 2. Kubernetes Structure (High-Level Architecture)

Kubernetes has two main parts:

- **Control Plane (Master Node)** → makes all the decisions for the cluster.  
- **Worker Nodes** → actually run the workloads (Pods/Containers).  

---

###   Control Plane Components (Master Node)

**API Server**  
- The **front door of Kubernetes**.  
- All commands (`kubectl get pods`, `kubectl apply -f ...`) hit the API server first.  
- Exposes REST APIs for both humans (`kubectl`) and internal components.  

**Scheduler**  
- Decides **which node runs a Pod**.  
- Checks resources, taints, affinity rules, etc.  

**Controller Manager**  
- The **automation brain**.  
- Runs controllers (replication, jobs, nodes).  
- Ensures **desired state = actual state**.  

**etcd**  
- A reliable **key-value store** for cluster state.  
- Stores: pods, configs, secrets, service info, etc.  
- Must be backed up in production.

---

### Worker Node Components

**kubelet**  
- Agent on each worker node.  
- Talks to API server & runs instructed Pods.  

**kube-proxy**  
- Manages cluster networking.  
- Assigns Pod IPs & handles load balancing across Pods.  

**Container Runtime**  
- Actual engine that runs containers (Docker, containerd, CRI-O).  

---

###   How They Work Together (Quick Example)

```shell
kubectl apply -f nginx.yaml
```

1. API Server → receives request & stores in `etcd`.  
2. Scheduler → picks the best worker node.  
3. Controller Manager → ensures replicas run.  
4. Worker Node:  
   - `kubelet` asks API Server → gets pod spec.  
   - Runtime starts container.  
   - `kube-proxy` updates networking.  

---

## 3. Advantage of Running Multiple Containers in One Pod

- **Pods** = smallest deployable unit in Kubernetes.  
- A Pod can run **one or more containers** that share:
  - Same **network namespace** (localhost).  
  - Same **storage volumes**.  

Benefits:  
- Tight coupling of helper containers (e.g., sidecar for logging).  
- Faster communication (localhost vs network).  
- Easier deployment for multi-process apps.  

---

## 4. Pod vs Container vs ReplicaSet vs Deployment

###   Container
- Smallest runnable unit.  
- Runs one app (e.g., `nginx`).  
- Kubernetes wraps containers into Pods.

###   Pod
- Smallest deployable unit in Kubernetes.  
- Can hold 1 or more containers.  
- Shares network + storage.  

Example:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-nginx
spec:
  containers:
    - name: nginx
      image: nginx:latest
      ports:
        - containerPort: 80
```

###   ReplicaSet
- Ensures a specific number of identical Pods.  
- Rarely created directly (Deployments manage them).  

Example:
```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: nginx-rs
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:latest
```

###   Deployment
- Higher-level abstraction over ReplicaSets.  
- Supports rolling updates & rollbacks.  
- Most common object for apps.  

Example:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deploy
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:1.25
          ports:
            - containerPort: 80
```

Summary:  
- **Container** → app itself.  
- **Pod** → wrapper around container(s).  
- **ReplicaSet** → ensures desired number of Pods.  
- **Deployment** → manages ReplicaSets (production use).  

---

## 5. Services in Kubernetes

Pods are ephemeral (can die, restart, get new IPs). Services provide **stable networking**.

###   ClusterIP (default)
- Internal access only.  
- Example:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx
  ports:
    - port: 80
      targetPort: 80
  type: ClusterIP
```

###   NodePort
- Exposes app on `<NodeIP>:<NodePort>`.  
- Used in dev/test.  

###   LoadBalancer
- Cloud-managed public IP.  
- Used in production.  

###   ExternalName
- Maps service to external DNS.  

---

Practical Notes:
- **ClusterIP** → internal comms.  
- **NodePort** → quick external access.  
- **LoadBalancer** → production, public-facing.  
- **ExternalName** → connect external services.  
