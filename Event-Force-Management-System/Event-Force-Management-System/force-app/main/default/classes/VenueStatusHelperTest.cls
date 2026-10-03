@isTest
private class VenueStatusHelperTest {

    @isTest
    static void confirmedEventReservesVenue(){
        Venue__c v = new Venue__c(Name='Test Venue', Availability_Status__c='Available');
        insert v;

        Test.startTest();
        insert new Event__c(Name='Test Event', Venue__c=v.Id,
                            Event_Date__c=Date.today().addDays(10),
                            Event_Status__c='Confirmed');
        Test.stopTest();

        System.assertEquals('Reserved',
            [SELECT Availability_Status__c FROM Venue__c WHERE Id = :v.Id].Availability_Status__c);
    }

    @isTest
    static void canceledEventFreesVenue(){
        Venue__c v = new Venue__c(Name='Test Venue', Availability_Status__c='Reserved');
        insert v;
        Event__c ev = new Event__c(Name='Test Event', Venue__c=v.Id,
                                   Event_Date__c=Date.today().addDays(10),
                                   Event_Status__c='Confirmed');
        insert ev;

        Test.startTest();
        ev.Event_Status__c = 'Canceled';
        update ev;
        Test.stopTest();

        System.assertEquals('Available',
            [SELECT Availability_Status__c FROM Venue__c WHERE Id = :v.Id].Availability_Status__c);
    }
}
