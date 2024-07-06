package HG_PayloadVault.v1.PayloadVault_Sub;

// -----( IS Java Code Template v1.2

import com.wm.data.*;
import com.wm.util.Values;
import com.wm.app.b2b.server.Service;
import com.wm.app.b2b.server.ServiceException;
// --- <<IS-START-IMPORTS>> ---
import java.nio.charset.StandardCharsets;
import java.text.DecimalFormat;
// --- <<IS-END-IMPORTS>> ---

public final class subService

{
	// ---( internal utility methods )---

	final static subService _instance = new subService();

	static subService _newInstance() { return new subService(); }

	static subService _cast(Object o) { return (subService)o; }

	// ---( server methods )---




	public static final void checkSizeOfString (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(checkSizeOfString)>> ---
		// @sigtype java 3.5
		// [i] field:0:required inString
		// [o] field:0:required sizeInMB
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	inString = IDataUtil.getString( pipelineCursor, "inString" );
		pipelineCursor.destroy();
		
		String sizeInMB=getStringSizeInMB(inString);
		// pipeline
		IDataCursor pipelineCursor_1 = pipeline.getCursor();
		IDataUtil.put( pipelineCursor_1, "sizeInMB", sizeInMB );
		pipelineCursor_1.destroy();
		
			
		// --- <<IS-END>> ---

                
	}

	// --- <<IS-START-SHARED>> ---
	
	public static String getStringSizeInMB(String input) {
	    if (input == null) {
	        return "0.0";
	    }
	
	    // Convert the string to bytes using UTF-8 encoding
	    byte[] byteArray = input.getBytes(StandardCharsets.UTF_8);
	
	    // Calculate the size in bytes
	    int sizeInBytes = byteArray.length;
	
	    // Convert bytes to megabytes (1 MB = 1024 * 1024 bytes)
	    double sizeInMB = (double) sizeInBytes / (1024 * 1024);
	
	    // Use a more precise format
	    DecimalFormat df = new DecimalFormat("#.#####");
	    return df.format(sizeInMB);
	}
		
	// --- <<IS-END-SHARED>> ---
}

