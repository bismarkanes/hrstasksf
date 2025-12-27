trigger ConvertLeadToAccountTrigger on Lead(after insert, after update) {
  if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
    Lead[] leads = Trigger.new;
    for (Lead lead : leads) {
      if (
        !String.isBlank(lead.Phone) &&
        (!String.isBlank(lead.Email)) &&
        (lead.Weight__c != null) &&
        (lead.Height__c != null) &&
        (!String.isBlank(lead.ExternalId__c))
      ) {
        // switcher for validating existing account record by using phone (optionally email etc)
        Boolean checkExistingRecord = false;

        if (checkExistingRecord) {
          Account acct = [
            SELECT Id, Phone
            FROM Account
            WHERE Phone = :lead.Phone
            LIMIT 1
          ];
          if (acct != null) {
            System.debug('valid account is already exist.');
            return;
          }
        }

        Account acct = new Account();
        acct.Name = lead.FirstName + lead.LastName;
        acct.Phone = lead.Phone;
        insert acct;
        System.debug('creating valid account success.');
      }
    }
  }
}