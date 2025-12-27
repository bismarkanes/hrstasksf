@RestResource(urlMapping='/createlead')
global with sharing class CreateLead {
  @HttpPost
  global static Boolean CreateLead(CreateLeadRequest data) {
    try {
      Lead lead = new Lead();
      data.mapToLead(lead);

      /**
       * On the org, the Company field is mandatory on object Lead.
       * So it is set default to 'Personal' for the purpose of demo.
       */
      lead.Company = 'Personal';

      insert lead;
    } catch (Exception ex) {
      return false;
    }

    return true;
  }
}