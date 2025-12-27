/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 *
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class CreateLeadTest {
  @isTest
  static void TestRequestValidation() {
    CreateLeadRequest clr = new CreateLeadRequest();
    Assert.isFalse(clr.isValidRequest());

    clr.LastName = 'hello';
    Assert.isTrue(clr.isValidRequest());
  }

  @isTest
  static void TestNewLeadIncompleteName() {
    CreateLeadRequest clr = new CreateLeadRequest();
    clr.City = 'Jakarta';
    clr.State = 'DKI Jakarta';
    clr.Country = 'Indonesia';
    clr.PostalCode = '163432';
    clr.Street = 'Road Cluster No. 3';
    clr.Email = 'foo@example.com';
    clr.Phone = '+6281313235412';
    clr.Height = 170;
    clr.Weight = 65;
    clr.ExternalId = '123456';

    Assert.isFalse(CreateLead.CreateLead(clr));
  }

  @isTest
  static void TestNewLeadComplete() {
    CreateLeadRequest clr = new CreateLeadRequest();
    clr.FirstName = 'julian';
    clr.LastName = 'best';
    clr.City = 'Jakarta';
    clr.State = 'DKI Jakarta';
    clr.Country = 'Indonesia';
    clr.PostalCode = '163432';
    clr.Street = 'Road Cluster No. 3';
    clr.Email = 'foo@example.com';
    clr.Phone = '+6281313235412';
    clr.Height = 170;
    clr.Weight = 65;
    clr.ExternalId = '123456';

    Assert.isTrue(CreateLead.CreateLead(clr));
  }
}