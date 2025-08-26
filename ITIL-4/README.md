# ITIL 4 Notes

---

## Table of Contents
- [1. Introduction to Service Management](#1-introduction-to-service-management)
  - [Roles](#roles)
  - [Products, Services, and Offerings](#products-services--offerings)
  - [Value and Co-Creation](#value--co-creation)
  - [Service Relationships](#service-relationships)
  - [Value Components](#value-components)
- [2. Four Dimensions of Service Management](#2-four-dimensions-of-service-management)
- [3. ITIL Service Value System (SVS)](#3-itil-service-value-system-svs)
  - [Guiding Principles](#guiding-principles)
  - [Governance](#governance)
  - [Service Value Chain (SVC)](#service-value-chain-svc)
  - [Continual Improvement Model](#continual-improvement-model)
- [4. ITIL Management Practices](#4-itil-management-practices)
  - [Detailed Practices](#detailed-practices-must-know)
  - [High-Level Practices](#high-level-practices-know-purpose)
- [5. Quick Comparison: Incident vs Request vs Problem](#5-quick-comparison-incident-vs-request-vs-problem)
- [6. Interview Starters](#6-interview-starters)
- [7. Key Terms (Cheat Sheet)](#7-key-terms-cheat-sheet)


---

## 1. Introduction to Service Management

**Service** -> *A way of delivering value to customers by helping them achieve outcomes without the customer managing the specific costs and risks.*  
*Example: A cloud email service lets you send emails without managing servers.*

**Service Management** -> *An organized approach to managing services so they consistently deliver value.*

### Roles
- **Customer** -> Defines the desired outcomes.
- **User** -> Uses the service.
- **Sponsor** -> Funds/pays for the service.

### Products, Services & Offerings
- **Products & Services** -> What the provider offers (software, hardware, support, etc.).
- **Service Offering** -> A packaged combination of products, access, and actions delivered to customers.

### Value & Co-Creation
- **Value** -> The perceived benefits, usefulness, and importance of something.
- **Co-creation** -> Value is created *together* by provider and consumer.  
  

### Service Relationships
- **Service Provision** -> Provider delivers the service.
- **Service Consumption** -> Customer uses the service.
- **Service Relationship Management** -> Activities that nurture and maintain the relationship.

### Value Components
- **Outcomes** -> Final results desired by the customer (e.g., “fast online payment completed”).
- **Outputs** -> Tangible deliverables (e.g., app, receipt).
- **Costs** -> Money/resources spent to deliver the service.
- **Risks** -> Potential events that could impact value.
- **Utility** (“fit for purpose”) -> *What* the service does.
- **Warranty** (“fit for use”) -> *How well* it performs (reliable, secure, available, performant).

---

## 2. Four Dimensions of Service Management
1. **Organizations & People** -> Roles, responsibilities, skills, culture, structure.
2. **Information & Technology** -> Data, information, and technology (cloud, AI, automation) required by the service.
3. **Partners & Suppliers** -> External parties providing components/capabilities; contracts and SIAM (supplier integration).
4. **Value Streams & Processes** -> End‑to‑end flow from idea -> value; repeatable, structured activities (processes).

>  Balance all four dimensions to avoid blind spots and ensure resilient service design.

---

## 3. ITIL Service Value System (SVS)

**Goal:** Turn **demand/opportunities** into **value** via integrated components (guiding principles, governance, SVC, practices, continual improvement).

### Guiding Principles
1. **Focus on value**
2. **Start where you are**
3. **Progress iteratively with feedback**
4. **Collaborate and promote visibility**
5. **Think and work holistically**
6. **Keep it simple and practical**
7. **Optimize and automate**

### Governance
How the organization is directed and controlled: policies, decision‑making, oversight, and performance evaluation.

### Service Value Chain (SVC)
Core activities that convert demand -> value:
- **Plan** -> Strategy, vision, policies, direction.
- **Improve** -> Continuous improvement across all activities.
- **Engage** -> Understanding needs; managing stakeholders and relationships.
- **Design & Transition** -> Designing/building services that meet needs and quality expectations.
- **Obtain/Build** -> Sourcing and building components/resources.
- **Deliver & Support** -> Day‑to‑day operations and user support.

### Continual Improvement Model
**Vision -> Current state -> Target state -> Improvement actions -> Execute -> Evaluate results -> Repeat**

---

## 4. ITIL Management Practices

### Detailed Practices (must know)
- **Continual Improvement** -> Embed improvement everywhere using the CI model.
- **Change Enablement** -> Balance value/risk of changes (add/modify/remove service or component).
- **Incident Management** -> Restore service ASAP after unplanned interruption or degradation.
- **Problem Management** -> Identify root causes to prevent incidents; use **workarounds**; register **known errors**.
- **Service Desk** -> Single point of contact (phone/email/chat); communication + empathy are key.
- **Service Level Management (SLM)** -> Define/monitor **SLAs** (e.g., uptime %, response time).
- **Service Request Management** -> Handle standard requests (info/password reset).  
  *Remember:* **Incident** = broken; **Request** = ask for something helpful/new.

### High-Level Practices (know purpose)
- **Information Security Management** -> Protect **CIA** (Confidentiality, Integrity, Availability).
- **Relationship Management** -> Maintain strong stakeholder relationships.
- **Supplier Management** -> Get value from suppliers; manage contracts and performance.
- **IT Asset Management (ITAM)** -> Track assets throughout lifecycle for value, cost, and risk control.
- **Monitoring & Event Management** -> Detect and act on events/alerts early.
- **Release Management** -> Ensure new/changed services are ready for use.
- **Service Configuration Management** -> Maintain accurate **CMDB**/**CIs** and relationships.
- **Deployment Management** -> Move components into live environments safely and repeatedly.

---

## 5. Quick Comparison: Incident vs Request vs Problem

| Topic     | Trigger | Goal | Example |
|----------|--------|------|---------|
| **Incident** | Unplanned outage/degradation | Restore service quickly | API latency spike; website down |
| **Request**  | User asks for something standard | Fulfill efficiently | Password reset; add access |
| **Problem**  | One/many incidents indicate cause | Remove root cause; prevent recurrence | Memory leak causing frequent crashes |

---

## 6. Interview Starters
- Explain **utility vs warranty** with a real service you’ve used.
- Walk through how you’d handle a **P1 incident** end‑to‑end.
- How do **change enablement** and **release/deployment** interact in your team?
- Give an example of **progress iteratively with feedback** from your last project.
- What data/metrics would you include in an **SLA & SLR** pack for an API?

---

## 7. Key Terms (Cheat Sheet)
- **Outcome**: Desired result for a stakeholder.  
- **Output**: Tangible deliverable produced.  
- **Workaround**: Temporary solution to reduce impact of an incident/problem.  
- **Known Error**: A problem with a documented root cause and workaround.  
- **SLA**: Service Level Agreement—targets and responsibilities between provider & consumer.  
- **CI/CMDB**: Configuration Item / Configuration Management Database.  
- **SIAM**: Service Integration and Management for multi-supplier environments.

---


