# EventForce Management System

A Salesforce CRM solution for event planning: clients, events, venues, vendors, feedback, automated reminders, cancellation approvals, and reports.

Built and tested in a Salesforce Developer Edition org. Production deployment was not performed.

## Apex in this repository
| Component | Type | Purpose |
|---|---|---|
| `VenueStatusHelper` | Class | Sets venue to Reserved when an event is Confirmed, Available when Canceled |
| `EventTrigger13` | Trigger | Calls `VenueStatusHelper` after insert/update on `Event__c` |
| `PreventDoubleBooking` | Trigger | Blocks two events on the same venue and date |
| `BatchCompleteEvents` | Batch class | Marks past events as Completed |
| `ScheduleCompleteEvents` | Schedulable | Runs the batch on a schedule |
| `*Test` classes | Tests | Cover the helper, the trigger and the batch |

## Prerequisites
- Salesforce CLI (`sf`) and VS Code with the Salesforce Extension Pack
- The custom objects and fields (`Event__c`, `Venue__c`, and their fields) must already exist in the target org. This repository contains Apex only.

## Commands
```bash
sf org login web --alias eventforce
sf project deploy start --source-dir force-app --target-org eventforce
sf apex run test --target-org eventforce --code-coverage --result-format human --wait 10
```

To pull metadata from your org:
```bash
sf project retrieve start --metadata ApexClass ApexTrigger --target-org eventforce
```

## Git
```bash
git init
git add .
git commit -m "Initial EventForce Apex project"
git remote add origin <your-repo-url>
git push -u origin main
```
