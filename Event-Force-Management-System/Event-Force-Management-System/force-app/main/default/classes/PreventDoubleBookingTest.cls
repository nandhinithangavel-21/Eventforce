@isTest
private class PreventDoubleBookingTest {

    @isTest
    static void sameVenueSameDateIsBlocked(){
        Venue__c v = new Venue__c(Name='Test Venue', Availability_Status__c='Available');
        insert v;
        Date d = Date.today().addDays(15);
        insert new Event__c(Name='Event 1', Venue__c=v.Id, Event_Date__c=d, Event_Status__c='Planned');

        Boolean blocked = false;
        try {
            insert new Event__c(Name='Event 2', Venue__c=v.Id, Event_Date__c=d, Event_Status__c='Planned');
        } catch(DmlException e){
            blocked = e.getMessage().contains('already booked');
        }
        System.assert(blocked, 'Second booking on the same date should be blocked');
    }

    @isTest
    static void sameVenueDifferentDateIsAllowed(){
        Venue__c v = new Venue__c(Name='Test Venue', Availability_Status__c='Available');
        insert v;
        insert new Event__c(Name='Event 1', Venue__c=v.Id, Event_Date__c=Date.today().addDays(15), Event_Status__c='Planned');
        insert new Event__c(Name='Event 2', Venue__c=v.Id, Event_Date__c=Date.today().addDays(16), Event_Status__c='Planned');
        System.assertEquals(2, [SELECT COUNT() FROM Event__c WHERE Venue__c = :v.Id]);
    }
}
