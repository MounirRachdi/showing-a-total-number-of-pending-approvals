public with sharing class GetPendingApproval {
    @AuraEnabled(cacheable=true) 
    public static String getName()
    {
      return UserInfo.getFirstName();

    }
    @AuraEnabled(cacheable=true) 
    public static String getPendingList() {
     Integer num=0;
        for (ProcessInstance pi: [SELECT Id, Status,
                (SELECT Id, ActorId, OriginalActorId, StepStatus FROM StepsAndWorkitems WHERE ActorId=:UserInfo.getUserId() AND StepStatus =: 'Pending') 
                FROM ProcessInstance WHERE Status =: 'Pending']) {

                   for (ProcessInstanceHistory pih : pi.StepsAndWorkItems) {
                       num++;
                       }          
                   }
 
                   return String.valueOf(num);
    }
}
