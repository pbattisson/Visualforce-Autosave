@isTest
private class AutosaveActionServiceTest
{
	
	@isTest static void testSaveString()
	{
		Account acc = new Account();
		acc.Name = 'Test Autosave';

		insert acc;

		AutosaveActionService.updateFieldValue(acc.Id, 'Name', 'Test Autosave 1');

		Account updatedAcc = [SELECT Name, Id FROM Account WHERE Id = :acc.Id];

		System.assertEquals('Test Autosave 1', updatedAcc.Name);
	}

	@isTest static void testSaveDate()
	{
		Contact con = new Contact();
		con.LastName = 'Battisson';
		con.BirthDate = Date.today();
		insert con;

		AutosaveActionService.updateFieldValue(con.Id, 'BirthDate', Date.newInstance(1980, 12, 31));

		Contact updatedCon = [SELECT Id, BirthDate FROM Contact WHERE Id = :con.Id];

		System.assertEquals(Date.newInstance(1980, 12, 31), updatedCon.BirthDate);
	}
}