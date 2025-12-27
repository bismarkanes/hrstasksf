/**
 * Create Lead Request class.
 * Used for the body structure of the HTTP request when creating new lead record.
 */
global with sharing class CreateLeadRequest {
  public String FirstName;
  public String LastName;
  public String Phone;
  public String Email;
  public String Street;
  public String City;
  public String State;
  public String Country;
  public String PostalCode;
  public Double Weight;
  public Double Height;
  public String ExternalId;

  public CreateLeadRequest() {
  }

  /**
   * To validate the request.
   * In case we need some validation before creating the lead record
   */
  public Boolean isValidRequest() {
    return !String.isBlank(LastName);
  }

  /**
   * To map instance data to lead record.
   */
  public void mapToLead(Lead lead) {
    lead.FirstName = FirstName;
    lead.LastName = LastName;
    lead.Phone = Phone;
    lead.Email = Email;
    lead.Street = Street;
    lead.City = City;
    lead.State = State;
    lead.Country = Country;
    lead.PostalCode = PostalCode;
    lead.Weight__c = Weight;
    lead.Height__c = Height;
    lead.ExternalId__c = ExternalId;
  }
}