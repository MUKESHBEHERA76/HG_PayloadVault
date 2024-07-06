package HG_PayloadVault.v1.UI;

// -----( IS Java Code Template v1.2

import com.wm.data.*;
import com.wm.util.Values;
import com.wm.app.b2b.server.Service;
import com.wm.app.b2b.server.ServiceException;
// --- <<IS-START-IMPORTS>> ---
// --- <<IS-END-IMPORTS>> ---

public final class subService

{
	// ---( internal utility methods )---

	final static subService _instance = new subService();

	static subService _newInstance() { return new subService(); }

	static subService _cast(Object o) { return (subService)o; }

	// ---( server methods )---




	public static final void createSQLStatement (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(createSQLStatement)>> ---
		// @sigtype java 3.5
		// [i] field:0:required source
		// [i] field:0:required target
		// [i] field:0:required interfaceId
		// [i] field:0:required interfaceName
		// [i] field:0:required identifierType
		// [i] field:0:required identifierInput
		// [i] field:0:required transactionBefore
		// [i] field:0:required transactionAfter
		// [o] field:0:required sqlStatement
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	source = IDataUtil.getString( pipelineCursor, "source" );
			String	target = IDataUtil.getString( pipelineCursor, "target" );
			String	interfaceId = IDataUtil.getString( pipelineCursor, "interfaceId" );
			String	interfaceName = IDataUtil.getString( pipelineCursor, "interfaceName" );
			String	identifierType = IDataUtil.getString( pipelineCursor, "identifierType" );
			String	identifierInput = IDataUtil.getString( pipelineCursor, "identifierInput" );
			String	transactionBefore = IDataUtil.getString( pipelineCursor, "transactionBefore" );
			String	transactionAfter = IDataUtil.getString( pipelineCursor, "transactionAfter" );
		pipelineCursor.destroy();
		Boolean variableExist=false;
		String tempSqlStatement="";
		if(source != null && !source.trim().isEmpty())
		{
			tempSqlStatement=tempSqlStatement.concat("SOURCE= \"" + source + "\""+" ");
			variableExist=true;
		}
		if(target != null && !target.trim().isEmpty())
		{
			if(variableExist)
			{
				tempSqlStatement=tempSqlStatement.concat("AND"+" "+"TARGET= \"" + target + "\""+" ");
			}
			else{
				tempSqlStatement=tempSqlStatement.concat("TARGET= \"" + target + "\""+ "");
				variableExist=true;
			}
			
		}
		if(interfaceId != null && !interfaceId.trim().isEmpty())
		{
			if(variableExist)
			{
				tempSqlStatement=tempSqlStatement.concat("AND"+" "+"INTERFACE_ID= \"" + interfaceId + "\""+" ");
			}
			else{
				tempSqlStatement=tempSqlStatement.concat("INTERFACE_ID= \"" + interfaceId + "\""+" ");
				variableExist=true;
			}
			
		}
		if(interfaceName != null && !interfaceName.trim().isEmpty())
		{
			if(variableExist)
			{
				tempSqlStatement=tempSqlStatement.concat("AND"+" "+"INTERFACE_NAME= \"" + interfaceName + "\""+" ");
			}
			else{
				tempSqlStatement=tempSqlStatement.concat("INTERFACE_NAME= \"" + interfaceName + "\""+" ");
				variableExist=true;
			}
			
		}
		if("trackingId".equals(identifierType))
		{
			if(identifierInput != null && !identifierInput.trim().isEmpty())
			{
				if(variableExist)
				{
					tempSqlStatement=tempSqlStatement.concat("AND"+" "+"TRACKING_ID= \"" + identifierInput + "\""+" ");
				}
				else{
					tempSqlStatement=tempSqlStatement.concat("TRACKING_ID= \"" + identifierInput + "\""+" ");
					variableExist=true;
				}
				
			}
		}
		if("transactionId".equals(identifierType)){
			if(identifierInput != null && !identifierInput.trim().isEmpty())
			{
				if(variableExist)
				{
					tempSqlStatement=tempSqlStatement.concat("AND"+" "+"TRANSACTION_ID= \"" + identifierInput + "\""+" ");
				}
				else{
					tempSqlStatement=tempSqlStatement.concat("TRANSACTION_ID= \"" + identifierInput + "\""+" ");
					variableExist=true;
				}
				
			}
		}
		if(transactionBefore != null && !transactionBefore.trim().isEmpty())
		{
			if(variableExist)
			{
				tempSqlStatement=tempSqlStatement.concat("AND"+" "+"INSERTED_DATE < \"" + transactionBefore + "\""+" ");
			}
			else{
				tempSqlStatement=tempSqlStatement.concat("INSERTED_DATE < \"" + transactionBefore + "\""+ "");
				variableExist=true;
			}
			
		}
		if(transactionAfter != null && !transactionAfter.trim().isEmpty())
		{
			if(variableExist)
			{
				tempSqlStatement=tempSqlStatement.concat("AND"+" "+"INSERTED_DATE > \"" + transactionAfter + "\""+" ");
			}
			else{
				tempSqlStatement=tempSqlStatement.concat("INSERTED_DATE > \"" + transactionAfter + "\""+ "");
				variableExist=true;
			}
			
		}
		
		
		
		// pipeline
		IDataCursor pipelineCursor_1 = pipeline.getCursor();
		IDataUtil.put( pipelineCursor_1, "sqlStatement", tempSqlStatement );
		pipelineCursor_1.destroy();
		
			
		// --- <<IS-END>> ---

                
	}
}

