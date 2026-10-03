@isTest
private class BatchCompleteEventsTest {

    @isTest
    static void pastEventsAreMarkedCompleted(){
        insert new Event__c(Name='Past Event', Event_Date__c=Date.today().addDays(-5), Event_Status__c='Confirmed');

        Test.startTest();
        Database.executeBatch(new BatchCompleteEvents(), 200);
        Test.stopTest();

        System.assertEquals('Completed',
            [SELECT Event_Status__c FROM Event__c WHERE Name = 'Past Event'].Event_Status__c);
    }

    @isTest
    static void schedulerStartsBatch(){
        Test.startTest();
        String jobId = System.schedule('Test Complete Events', '0 0 1 * * ?', new ScheduleCompleteEvents());
        Test.stopTest();
        System.assertNotEquals(null, jobId);
    }
}
