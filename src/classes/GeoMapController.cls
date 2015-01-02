public class GeoMapController {
    
    Territory2 territory;
    
    public GeoMapController(ApexPages.StandardController controller) {        
        territory = (Territory2) controller.getRecord();
        territory = [SELECT Name,Territory2ModelId from Territory2 WHERE Id=:territory.Id];
    }
    
    public List<Account> getAssignedAccounts() {
        List<Account> ret = [SELECT Id, Name, AnnualRevenue, BillingCity, BillingState,
                             Location__Latitude__s, Location__Longitude__s
                             FROM Account WHERE Id IN 
                             (SELECT ObjectId FROM ObjectTerritory2Association
                              WHERE Territory2Id=:territory.Id)];
        return ret;
    }

}