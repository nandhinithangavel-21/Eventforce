# EventForce Management System

## Salesforce-Based Event Management System

EventForce Management System is a Salesforce-based CRM application developed to manage events, clients, vendors, venues, and feedback in a centralized system.

The project demonstrates how Salesforce can be used to organize event-related information, automate business processes, maintain data quality, manage approvals, and generate reports.

---

## Project Overview

Event management involves handling multiple activities such as client management, vendor coordination, venue management, event scheduling, and feedback collection.

The EventForce Management System provides a centralized Salesforce solution to manage these activities efficiently.

The system was developed and tested using a Salesforce Developer Edition Org for academic purposes.

---

## Objectives

The main objectives of the EventForce Management System are:

- Manage event information in a centralized system.
- Maintain client details.
- Manage vendor information and services.
- Maintain venue information and availability.
- Connect vendors with events.
- Collect and manage client feedback.
- Automate business processes using Salesforce Flows.
- Implement approval processes for event cancellation.
- Maintain data accuracy using validation rules.
- Apply Salesforce security and sharing settings.
- Generate reports for event management and analysis.
- Monitor automation and system configuration.

---

## Technology Used

- Salesforce
- Salesforce Lightning Experience
- Salesforce Objects
- Salesforce Flow
- Apex
- Apex Triggers
- Approval Processes
- Validation Rules
- Sharing Rules
- Reports
- Salesforce Developer Edition

---

## Main Salesforce Objects

The system contains the following main objects:

### Event

Stores information about events such as:

- Event Name
- Event Type
- Event Date
- Event Status
- Event Budget
- Client
- Venue

### Client

Stores client-related information including:

- Client Name
- Email
- Phone
- Address
- City
- Country

### Vendor

Stores vendor information including:

- Vendor Name
- Service Type
- Email
- Phone
- Status

### Venue

Stores venue information including:

- Venue Name
- Address
- Location URL
- Capacity
- Availability Status

### Event Vendor

A junction object used to associate events with vendors.

This allows an event to have multiple vendors and a vendor to participate in multiple events.

### Feedback

Stores feedback provided for completed events.

It includes:

- Event
- Client
- Rating
- Comments

---

## Relationships

The major relationships in the system include:

- Event → Client
- Event → Venue
- Event → Event Vendor
- Vendor → Event Vendor
- Feedback → Event
- Feedback → Client

The Event Vendor junction object provides the relationship between Events and Vendors.

---

## Automation

Salesforce automation is used to reduce manual work and improve consistency.

### Salesforce Flows

Flows are used to automate business processes such as client reminders and other event-related activities.

Example:

**Client Reminder - 3 Days Before - V1**

This flow supports automated client reminder processing.

---

## Apex

Apex is used for custom business logic that requires programmatic processing.

The project includes Apex components such as:

- BatchCompleteEvents
- EventTrigger13
- PreventDoubleBooking

These components support event processing and business rules.

---

## Approval Process

An Event Cancellation Approval Process was configured.

### Event Cancellation Process

The approval process is triggered when:

```text
Event Status = Pending Cancellation
