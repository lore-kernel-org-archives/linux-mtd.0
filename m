Received: from mail.brecis.com ([64.168.228.202])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Yr02-0003z3-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 Jan 2003 17:06:46 +0000
Received: from solar.brecis.com (mailhost [64.168.228.209])
	by mail.brecis.com (8.9.3+Sun/8.9.3) with ESMTP id JAA04334
	for <linux-mtd@lists.infradead.org>; Wed, 15 Jan 2003 09:34:02 -0800 (PST)
Date: Wed, 15 Jan 2003 11:37:05 -0600
From: Steve Wahl <swahl@brecis.com>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: About flash chip writing/erasing, reading chip status.
Message-ID: <20030115113705.P1589@brecis.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm trying to place MTD and JFFS2 on our board, and I'm getting
occasional messages like "Warning: DQ5 raised while erase operation
was in progress, but erase completed OK" messages.

I think the general method for polling the status of the chips is just
a bit wrong, or in other words, this warning is NORMAL operation and
should not be printed.

If I understand things correctly, you start an operation like erasing
a block, then you get the status by performing a read to that block.
If the operation is in progress, data bit 6 toggles, and data bit 5
stays 0.  If the operation succeeds, data bits 6 and 5 return the data
at that address (bit 6 stops toggling).  If the operation fails, bit 6
keeps toggling and bit 5 goes to 1.

The general algorithm used in mtd (recent CVS, cfi_cmdset_0002.c,v
1.61 2002/11/17 13:10:34 spse) goes something like this (timeout
condition left out of the loop for brevity)

------------------------------------------------------------
	/* oldstatus and status are two reads from the same address */
	/* in each place it occurs in this code */

	read oldstatus;
	read status;

	while ( ((status & bit6) != (oldstatus & bit6))
		&& ((status & bit5) == 0) )
	{
		read oldstatus;
		read status;
	}

	if ( (status & bit6) != (oldstatus & bit6) )
	{
		/* still toggling, but exited loop. Why? */

		if ( status & bit5 != 0 )
		{
			/* bit5 went high. */
			/* are we still toggling? */
			read oldstatus;
			read status;
			
			if (status == oldstatus)
			{
				/* no longer toggling, operation done */
				printk("Warning: DQ5 raised while ...") ;
			}	
			else
			{
				/* DQ5 went active, reset the chip */
				...
			}
		}

	}
------------------------------------------------------------

[ In the real code, there are some extra reads in the while loop that
make the condition I'm about to describe less likely, but it can still
happen.  ]

Let's say we're looking at an erase operation (the one I seem to run
into).  Say we manage to just get lucky, and within the while loop,
the read of oldstatus returns the last status register value, and
status gets the actual data because the chip has returned to read
mode.  Status's value will be 0xFF, the erased value.  Furthermore,
suppose we get lucky and the toggle bit's value in the read of
oldstatus was a '0' (so in binary, oldstatus would have been
'x00x-xxxx').  So the toggle bit is seen as still toggling in the
while loop, but bit5 suddenly goes from 0 to 1.

This will end up printing the warning message erroneously.

I think the "correct" thing to do would be to examine bit 5 from
oldstatus, so you're only looking at bit 5 from an earlier read, where
you know bit 6 has since toggled.  Like this:

	read oldstatus;
	read status;

	while ( ((status & bit6) != (oldstatus & bit6))
		&& ((oldstatus & bit5) == 0) )
	{
		read oldstatus;
		read status;
	}

	if ( (status & bit6) != (oldstatus & bit6) )
	{
		/* still toggling, but exited loop. Why? */

		if ( oldstatus & bit5 != 0 )
		{
			/* bit5 went high. */
			/* NOTE: NO NEED TO CHECK IF WE'RE STILL TOGGLING. */
			/* we know we are, because we checked bit5 in the */
			/* previous read, and a read after it had bit6 */
			/* different. */
				/* DQ5 went active, reset the chip */
				...
		}

	}

I also think there's another error in the original code.  The original
code sets

 	dq5 = CMD(1<<5);

which, if I understand things, sets up a word the correct width, with
a bit in EACH bit 5 position if you have interleaved chips.  Yet the
check for bit 5 being set (not being set in this case) is stated as

	((status & dq5) != dq5)

which will only trigger when ALL bit5's are set.  I think it should
instead be

	((status & dq5) == 0)

which triggers when ANY bit5 gets set.  Similarly, tests for 

	((status & dq5) == dq5)

should instead be

	((status & dq5) != 0)

I've attached a patch file that changes both these things.  Please let
me know what you think.

--> Steve Wahl,  Brecis Communications.



--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cfi_cmdset_0002.c.patch"

--- cfi_cmdset_0002.c.orig	Wed Jan 15 11:13:11 2003
+++ cfi_cmdset_0002.c	Wed Jan 15 11:25:29 2003
@@ -520,7 +520,7 @@
 	status = cfi_read(map, adr);
 
 	while( (status & dq6) != (oldstatus & dq6) && 
-	       (status & dq5) != dq5 &&
+	       (oldstatus & dq5) == 0 &&
 	       !time_after(jiffies, timeo) ) {
 
 		if (need_resched()) {
@@ -536,20 +536,17 @@
 	
 	if( (status & dq6) != (oldstatus & dq6) ) {
 		/* The erasing didn't stop?? */
-		if( (status & dq5) == dq5 ) {
-			/* When DQ5 raises, we must check once again
-			   if DQ6 is toggling.  If not, the erase has been
-			   completed OK.  If not, reset chip. */
-			oldstatus = cfi_read(map, adr);
-			status = cfi_read(map, adr);
-		    
-			if ( (oldstatus & 0x00FF) == (status & 0x00FF) ) {
-				printk(KERN_WARNING "Warning: DQ5 raised while program operation was in progress, however operation completed OK\n" );
-			} else { 
-				/* DQ5 is active so we can do a reset and stop the erase */
-				cfi_write(map, CMD(0xF0), chip->start);
-				printk(KERN_WARNING "Internal flash device timeout occurred or write operation was performed while flash was programming.\n" );
-			}
+		if( (status & dq5) != 0 ) {
+
+			/* one or more bit5's set. */
+
+			/* no need to re-check if bit 6 is toggling, as */
+			/* we've already seen bit 6 toggle after bit 5 */
+			/* was set. */
+			
+			/* DQ5 is active so we can do a reset and stop the erase */
+			cfi_write(map, CMD(0xF0), chip->start);
+			printk(KERN_WARNING "Internal flash device timeout occurred or write operation was performed while flash was programming.\n" );
 		} else {
 			printk(KERN_WARNING "Waiting for write to complete timed out in do_write_oneword.");        
 			
@@ -773,7 +770,7 @@
 	oldstatus = cfi_read(map, adr);
 	status = cfi_read(map, adr);
 	while( ((status & dq6) != (oldstatus & dq6)) && 
-		((status & dq5) != dq5) &&
+		((oldstatus & dq5) == 0) &&
 		!time_after(jiffies, timeo)) {
 		int wait_reps;
 
@@ -805,7 +802,7 @@
 		for(wait_reps = 0;
 		    	(wait_reps < 100) &&
 			((status & dq6) != (oldstatus & dq6)) && 
-			((status & dq5) != dq5);
+			((oldstatus & dq5) == 0);
 			wait_reps++) {
 			
 			/* Latency issues. Drop the lock, wait a while and retry */
@@ -822,7 +819,7 @@
 	}
 	if ((status & dq6) != (oldstatus & dq6)) {
 		/* The erasing didn't stop?? */
-		if ((status & dq5) == dq5) {
+		if ((oldstatus & dq5) != 0) {
 			/* dq5 is active so we can do a reset and stop the erase */
 			cfi_write(map, CMD(0xF0), chip->start);
 		}
@@ -897,7 +894,7 @@
 	oldstatus = cfi_read(map, adr);
 	status = cfi_read(map, adr);
 	while( ((status & dq6) != (oldstatus & dq6)) && 
-		((status & dq5) != dq5) &&
+		((oldstatus & dq5) == 0) &&
 		!time_after(jiffies, timeo)) {
 		int wait_reps;
 
@@ -929,7 +926,7 @@
 		for(wait_reps = 0;
 		    	(wait_reps < 100) &&
 			((status & dq6) != (oldstatus & dq6)) && 
-			((status & dq5) != dq5);
+			((oldstatus & dq5) == 0);
 			wait_reps++) {
 			
 			/* Latency issues. Drop the lock, wait a while and retry */
@@ -947,34 +944,28 @@
 	if( (status & dq6) != (oldstatus & dq6) ) 
 	{                                       
 		/* The erasing didn't stop?? */
-		if( ( status & dq5 ) == dq5 ) 
+		if( ( oldstatus & dq5 ) != 0 ) 
 		{   			
-			/* When DQ5 raises, we must check once again if DQ6 is toggling.
-               If not, the erase has been completed OK.  If not, reset chip. */
-		    oldstatus   = cfi_read( map, adr );
-		    status      = cfi_read( map, adr );
-		    
-		    if( ( oldstatus & 0x00FF ) == ( status & 0x00FF ) )
-		    {
-                printk( "Warning: DQ5 raised while erase operation was in progress, but erase completed OK\n" ); 		    
-		    } 			
-			else
-            {
-			    /* DQ5 is active so we can do a reset and stop the erase */
-				cfi_write(map, CMD(0xF0), chip->start);
-                printk( KERN_WARNING "Internal flash device timeout occured or write operation was performed while flash was erasing\n" );
-			}
+			/* one or more bit5's set. */
+
+			/* no need to re-check if bit 6 is toggling, as */
+			/* we've already seen bit 6 toggle after bit 5 */
+			/* was set. */
+			
+			/* DQ5 is active so we can do a reset and stop the erase */
+			cfi_write(map, CMD(0xF0), chip->start);
+			printk( KERN_WARNING "Internal flash device timeout occured or write operation was performed while flash was erasing\n" );
 		}
-        else
-        {
-		    printk( "Waiting for erase to complete timed out in do_erase_oneblock.");        
+		else
+		{
+			printk( "Waiting for erase to complete timed out in do_erase_oneblock.");        
 		    
-		chip->state = FL_READY;
-		wake_up(&chip->wq);
-		cfi_spin_unlock(chip->mutex);
-		DISABLE_VPP(map);
-		return -EIO;
-	}
+			chip->state = FL_READY;
+			wake_up(&chip->wq);
+			cfi_spin_unlock(chip->mutex);
+			DISABLE_VPP(map);
+			return -EIO;
+		}
 	}
 
 	DISABLE_VPP(map);

--a8Wt8u1KmwUX3Y2C--
