From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 20 Mar 2003 17:01:34 -0700
Subject: cfi_cmdset_0002 better status polling
Message-ID: <1048204894.1224.46.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-4NstdhMTNbQi36IuK3cG
Content-Type: multipart/mixed; boundary="=-iVlaPHu7tRlXsNru9LRf"


--=-iVlaPHu7tRlXsNru9LRf
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I have been investigating the dq5 warning message (Warning: DQ5 raised
while program operation was in progress, however operation completed OK)
for a while now.  This warning is unfortunately an acceptable state that
should not be reported.

Steve Wahl submitted a patch to resolve this:

http://lists.infradead.org/pipermail/linux-mtd/2003-January/006780.html

This patch, however, was never committed to CVS.

A discussion among Steve Wahl, John Burch and myself=20

http://lists.infradead.org/pipermail/linux-mtd/2003-March/007223.html

has come to the conclusion that this patch is mostly correct but still
has some problems.

I have been reading many manufacturers' data sheets and the JESD21-C 3.5
standard and I believe I have uncovered another hole in the status
polling/decoding logic.  The big problem is that everyone forgets that
these devices have an internal state machine and that the internals are
_asynchronous_ to the external bus that communicates with the device.=20
This means that during an erase or write operation the status that is
read back might be at the exact moment that the status is transitioning
to actual data and the internal bits have not settled.  This is why the
standard and manufacturers recommend that once a status change is
detected the status must be read two more times and compared to expected
actual data.  If _both_ read-backs match expected data then the
operation succeeded - otherwise the status bits are valid and can be
decoded.

This double check doesn't need to happen for simple read operations
because the bits aren't (supposed to be) changing - only status polling
for erase/write operations.  Unfortunately the double check is omitted
for erase and write because the asynchronous nature of the chip is not
understood.

The attached patch should fix the problem discovered by Steve Wahl and
also do the extra reads for "spurious error rejection."  Keep in mind
that I do not have interleaved chips and this portion might need some
work.

PS - I'm somewhat bothered that the status polling is duplicated in
three places with minor changes - seems like it should be put into a
function (static inline).  I'll maybe look into that later.


--=20
Thayne Harbaugh
Linux Networx

--=-iVlaPHu7tRlXsNru9LRf
Content-Disposition: attachment; filename=cfi_cmdset_0002-better_status_polling.patch
Content-Type: text/x-patch; name=cfi_cmdset_0002-better_status_polling.patch;
	charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Index: cfi_cmdset_0002.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0002.c,v
retrieving revision 1.64
diff -u -r1.64 cfi_cmdset_0002.c
--- cfi_cmdset_0002.c	17 Feb 2003 20:47:11 -0000	1.64
+++ cfi_cmdset_0002.c	20 Mar 2003 23:24:53 -0000
@@ -509,26 +509,51 @@
 	        cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, =
CFI_DEVICETYPE_X8, NULL);
 	}
=20
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): WRITE 0x%.2x\n", __func__, datum );
 	cfi_write(map, datum, adr);
=20
 	cfi_spin_unlock(chip->mutex);
 	cfi_udelay(chip->word_write_time);
 	cfi_spin_lock(chip->mutex);
=20
-	/* Polling toggle bits instead of reading back many times
-	   This ensures that write operation is really completed,
-	   or tells us why it failed. */       =20
+	/*
+	 * Polling toggle bits instead of reading back many times
+	 * This ensures that write operation is really completed,
+	 * or tells us why it failed.
+	 *
+	 * The polling and decoding of error state appears that it could
+	 * be simplified.  Don't do it unless you really know what you
+	 * are doing.  You must remember that JESD21-C 3.5.3 states that
+	 * the status must be read back an _additional_ two times before
+	 * a failure is determined.  This is because these devices have
+	 * internal state machines that are asynchronous to the external
+	 * LPC bus.  During an erase or write the read-back status of the
+	 * polling bits might be internaling transitioning when the external
+	 * read-back occurs.  This means that the bits aren't in the final
+	 * state and they might appear to report an error as they transition
+	 * and are in a weird state.  This will produce infrequent errors
+	 * that will usually disappear then next time an erase or write
+	 * happens (Try tracking those errors down!).  To ensure that
+	 * the bits are not in transition the location must be read-back
+	 * two more times and compared against what was written - BOTH reads
+	 * MUST match what was written - don't think this can be simplified
+	 * to only the last read matching.  If the comparison fails error
+	 * state can then be decoded with certainty.
+	 *
+	 * - Thayne Harbaugh
+	 */
 	dq6 =3D CMD(1<<6);
 	dq5 =3D CMD(1<<5);
-    /* See comment above for timeout value. */
-    timeo =3D jiffies + uWriteTimeout;=20
+	/* See comment above for timeout value. */
+	timeo =3D jiffies + uWriteTimeout;=20
 	=09
 	oldstatus =3D cfi_read(map, adr);
 	status =3D cfi_read(map, adr);
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.2x 0x%.2x\n", __func__, old=
status, status );
=20
-	while( (status & dq6) !=3D (oldstatus & dq6) &&=20
-	       (status & dq5) !=3D dq5 &&
-	       !time_after(jiffies, timeo) ) {
+	while( ( ( status ^ oldstatus ) & dq6 )
+	       && ! ( status & dq5 )
+	       && ! time_after(jiffies, timeo) ) {
=20
 		if (need_resched()) {
 			cfi_spin_unlock(chip->mutex);
@@ -539,28 +564,60 @@
=20
 		oldstatus =3D cfi_read( map, adr );
 		status =3D cfi_read( map, adr );
+		DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.2x 0x%.2x\n", __func__, ol=
dstatus, status );
 	}
-=09
-	if( (status & dq6) !=3D (oldstatus & dq6) ) {
-		/* The erasing didn't stop?? */
-		if( (status & dq5) =3D=3D dq5 ) {
-			/* When DQ5 raises, we must check once again if DQ6 is toggling.
-               If not, the erase has been completed OK.  Then, we must res=
et
-               the chip. */
-			oldstatus =3D cfi_read(map, adr);
-			status =3D cfi_read(map, adr);
-		   =20
-		    if( (status & dq6) =3D=3D (oldstatus & dq6) ) {
-				printk(KERN_WARNING "Warning: DQ5 raised while program operation was i=
n progress, however operation completed OK\n" );
-			} else {
-				printk(KERN_WARNING "Internal flash device timeout occured or write op=
eration was performed while flash was programming.\n" );
-			}
=20
-	        /* When DQ5 raises, we must do a reset. */
-	        cfi_write( map, CMD(0xF0), chip->start );
+	if ( ( ( status ^ oldstatus ) & dq6 )
+	       && ! ( status & dq5 ) ) {
+		/* dq6 still toggling and dq5 still low - must be timeout */
+		printk( KERN_WARNING
+			"MTD %s(): Timed out while waiting for write to complete.\n",
+			__func__ );       =20
+		/* reset */
+		cfi_write( map, CMD(0xF0), chip->start );
+		ret =3D -EIO;
+	} else {
+		/*
+		 * Either dq5 went high or dq6 finish toggling.  For
+		 * the correct completion of certain types of writes
+		 * dq5 might _appear_ to go high while dq6 might
+		 * _appear_ to still be toggling - it depends on the
+		 * last state of the toggle was in and what the final
+		 * state will be with true data.  We alread know that
+		 * something changed state with the last set of reads.
+		 * We will read two more times and use this to either
+		 * verify that the write completed successfully or
+		 * that something really went wrong.  BOTH reads
+		 * must match what was written - this certifies that
+		 * the dq6 is not still toggling and have the status
+		 * bits erroneously match the datum that was written.
+		 */
+		/*
+		 * Be optimistic and check success first - then decode any
+		 * failures.
+		 */
+		oldstatus =3D cfi_read(map, adr);
+		status =3D cfi_read(map, adr);
+
+		if ( oldstatus =3D=3D datum && status =3D=3D datum ) {
+			/* success - do nothing */
 		} else {
-		    printk( "Waiting for write to complete timed out in do_write_oneword=
.");       =20
+			/* something has failed */
+			if ( ( ( status ^ oldstatus ) & dq6 )
+			     && ( status & dq5 ) ) {
+				printk(KERN_WARNING "MTD %s(): Internal flash device timeout occured.\=
n", __func__ );
+			} else {
+				/*
+				 * This state means that the write did not succeed
+				 * and that the usual error state of toggling dq6
+				 * while dq5 goes high did not happen.  Something
+				 * is seriously wacky!
+				 */
+				printk(KERN_WARNING "MTD %s(): Wacky!  Unable to decode failure status=
\n", __func__ );
+			}
 			ret =3D -EIO;
+			/* reset on all failures. */
+			cfi_write( map, CMD(0xF0), chip->start );
 		}
 	}
=20
@@ -609,7 +666,7 @@
 		}
=20
 		ret =3D do_write_oneword(map, &cfi->chips[chipnum],=20
-				bus_ofs, datum, 0);
+				       bus_ofs, datum, 0);
 		if (ret)=20
 			return ret;
 	=09
@@ -724,6 +781,7 @@
 	unsigned long timeo =3D jiffies + HZ;
 	unsigned int adr;
 	struct cfi_private *cfi =3D map->fldrv_priv;
+	int ret =3D 0;
 	DECLARE_WAITQUEUE(wait, current);
=20
  retry:
@@ -762,22 +820,23 @@
 	adr =3D cfi->addr_unlock1;
=20
 	/* Wait for the end of programing/erasure by using the toggle method.
-	 * As long as there is a programming procedure going on, bit 6 of the las=
t
-	 * written byte is toggling it's state with each consectuve read.
+	 * As long as there is a programming procedure going on, bit 6
+	 * is toggling it's state with each consecutive read.
 	 * The toggling stops as soon as the procedure is completed.
 	 *
 	 * If the process has gone on for too long on the chip bit 5 gets.
 	 * After bit5 is set you can kill the operation by sending a reset
 	 * command to the chip.
 	 */
+	/* see comments in do_write_oneword */
 	dq6 =3D CMD(1<<6);
 	dq5 =3D CMD(1<<5);
=20
 	oldstatus =3D cfi_read(map, adr);
 	status =3D cfi_read(map, adr);
-	while( ((status & dq6) !=3D (oldstatus & dq6)) &&=20
-		((status & dq5) !=3D dq5) &&
-		!time_after(jiffies, timeo)) {
+	while( ( ( status ^ oldstatus ) & dq6 )
+	       && ! ( status & dq5 )
+	       && ! time_after(jiffies, timeo) ) {
 		int wait_reps;
=20
 		/* an initial short sleep */
@@ -806,16 +865,16 @@
=20
 		/* Busy wait for 1/10 of a milisecond */
 		for(wait_reps =3D 0;
-		    	(wait_reps < 100) &&
-			((status & dq6) !=3D (oldstatus & dq6)) &&=20
-			((status & dq5) !=3D dq5);
-			wait_reps++) {
+		    (wait_reps < 100)
+			    && ( ( status ^ oldstatus ) & dq6 )
+			    && ! ( status & dq5 );
+		    wait_reps++) {
 		=09
 			/* Latency issues. Drop the lock, wait a while and retry */
 			cfi_spin_unlock(chip->mutex);
-		=09
+
 			cfi_udelay(1);
-	=09
+
 			cfi_spin_lock(chip->mutex);
 			oldstatus =3D cfi_read(map, adr);
 			status =3D cfi_read(map, adr);
@@ -823,25 +882,64 @@
 		oldstatus =3D cfi_read(map, adr);
 		status =3D cfi_read(map, adr);
 	}
-	if ((status & dq6) !=3D (oldstatus & dq6)) {
-		/* The erasing didn't stop?? */
-		if ((status & dq5) =3D=3D dq5) {
-			/* dq5 is active so we can do a reset and stop the erase */
-			cfi_write(map, CMD(0xF0), chip->start);
+
+	if ( ( ( status ^ oldstatus ) & dq6 )
+	       && ! ( status & dq5 ) ) {
+		/* dq6 still toggling and dq5 still low - must be timeout */
+		printk( KERN_WARNING
+			"MTD %s(): Timed out while waiting for erase to complete.\n",
+			__func__ );       =20
+		/* reset */
+		cfi_write( map, CMD(0xF0), chip->start );
+		ret =3D -EIO;
+	} else {
+		__u32 ones =3D 0;
+/*
+		 * Be optimistic and check success first - then decode any
+		 * failures.
+		 */
+		oldstatus =3D cfi_read(map, adr);
+		status =3D cfi_read(map, adr);
+	=09
+		switch( CFIDEV_BUSWIDTH ) {
+		case 1:
+			ones =3D (__u8)~0;
+			break;
+		case 2:
+			ones =3D (__u16)~0;
+			break;
+		case 4:
+			ones =3D (__u32)~0;
+			break;
+		}
+=09
+		if ( oldstatus =3D=3D ones && status =3D=3D ones ) {
+			/* success - do nothing */
+		} else {
+			/* something has failed */
+			if ( ( ( status ^ oldstatus ) & dq6 )
+			     && ( status & dq5 ) ) {
+				printk(KERN_WARNING "MTD %s(): Internal flash device timeout occured.\=
n", __func__ );
+			} else {
+				/*
+				 * This state means that the erase did not succeed
+				 * and that the usual error state of toggling dq6
+				 * while dq5 goes high did not happen.  Something
+				 * is seriously wacky!
+				 */
+				printk(KERN_WARNING "MTD %s(): Wacky!  Unable to decode failure status=
\n", __func__ );
+			}
+			ret =3D -EIO;
+			/* reset on all failures. */
+			cfi_write( map, CMD(0xF0), chip->start );
 		}
-		chip->state =3D FL_READY;
-		wake_up(&chip->wq);
-		cfi_spin_unlock(chip->mutex);
-		printk("waiting for erase to complete timed out.");
-		DISABLE_VPP(map);
-		return -EIO;
 	}
+
 	DISABLE_VPP(map);
 	chip->state =3D FL_READY;
 	wake_up(&chip->wq);
 	cfi_spin_unlock(chip->mutex);
-
-	return 0;
+	return ret;
 }
=20
 static inline int do_erase_oneblock(struct map_info *map, struct flchip *c=
hip, unsigned long adr)
@@ -850,6 +948,7 @@
 	unsigned int dq6, dq5;
 	unsigned long timeo =3D jiffies + HZ;
 	struct cfi_private *cfi =3D map->fldrv_priv;
+	int ret =3D 0;
 	DECLARE_WAITQUEUE(wait, current);
=20
  retry:
@@ -886,22 +985,23 @@
 	timeo =3D jiffies + (HZ*20);
=20
 	/* Wait for the end of programing/erasure by using the toggle method.
-	 * As long as there is a programming procedure going on, bit 6 of the las=
t
-	 * written byte is toggling it's state with each consectuve read.
+	 * As long as there is a programming procedure going on, bit 6
+	 * is toggling it's state with each consecutive read.
 	 * The toggling stops as soon as the procedure is completed.
 	 *
 	 * If the process has gone on for too long on the chip bit 5 gets.
 	 * After bit5 is set you can kill the operation by sending a reset
 	 * command to the chip.
 	 */
+	/* see comments in do_write_oneword */
 	dq6 =3D CMD(1<<6);
 	dq5 =3D CMD(1<<5);
=20
 	oldstatus =3D cfi_read(map, adr);
 	status =3D cfi_read(map, adr);
-	while( ((status & dq6) !=3D (oldstatus & dq6)) &&=20
-		((status & dq5) !=3D dq5) &&
-		!time_after(jiffies, timeo)) {
+	while( ( ( status ^ oldstatus ) & dq6 )
+	       && ! ( status & dq5 )
+	       && ! time_after(jiffies, timeo) ) {
 		int wait_reps;
=20
 		/* an initial short sleep */
@@ -930,10 +1030,10 @@
=20
 		/* Busy wait for 1/10 of a milisecond */
 		for(wait_reps =3D 0;
-		    	(wait_reps < 100) &&
-			((status & dq6) !=3D (oldstatus & dq6)) &&=20
-			((status & dq5) !=3D dq5);
-			wait_reps++) {
+		    (wait_reps < 100)
+			    && ( ( status ^ oldstatus ) & dq6 )
+			    && ! ( status & dq5 );
+		    wait_reps++) {
 		=09
 			/* Latency issues. Drop the lock, wait a while and retry */
 			cfi_spin_unlock(chip->mutex);
@@ -947,44 +1047,65 @@
 		oldstatus =3D cfi_read(map, adr);
 		status =3D cfi_read(map, adr);
 	}
-	if( (status & dq6) !=3D (oldstatus & dq6) )=20
-	{                                      =20
-		/* The erasing didn't stop?? */
-		if( ( status & dq5 ) =3D=3D dq5 )=20
-		{   		=09
-			/* When DQ5 raises, we must check once again if DQ6 is toggling.
-               If not, the erase has been completed OK.  If not, reset chi=
p. */
-		    oldstatus   =3D cfi_read( map, adr );
-		    status      =3D cfi_read( map, adr );
-		   =20
-		    if( ( oldstatus & 0x00FF ) =3D=3D ( status & 0x00FF ) )
-		    {
-                printk( "Warning: DQ5 raised while erase operation was in =
progress, but erase completed OK\n" ); 		   =20
-		    } 		=09
-			else
-            {
-			    /* DQ5 is active so we can do a reset and stop the erase */
-				cfi_write(map, CMD(0xF0), chip->start);
-                printk( KERN_WARNING "Internal flash device timeout occure=
d or write operation was performed while flash was erasing\n" );
+
+	if ( ( ( status ^ oldstatus ) & dq6 )
+	       && ! ( status & dq5 ) ) {
+		/* dq6 still toggling and dq5 still low - must be timeout */
+		printk( KERN_WARNING
+			"MTD %s(): Timed out while waiting for erase to complete.\n",
+			__func__ );       =20
+		/* reset */
+		cfi_write( map, CMD(0xF0), chip->start );
+		ret =3D -EIO;
+	} else {
+		__u32 ones =3D 0;
+
+		/*
+		 * Be optimistic and check success first - then decode any
+		 * failures.
+		 */
+		oldstatus =3D cfi_read(map, adr);
+		status =3D cfi_read(map, adr);
+
+		switch( CFIDEV_BUSWIDTH ) {
+		case 1:
+			ones =3D (__u8)~0;
+			break;
+		case 2:
+			ones =3D (__u16)~0;
+			break;
+		case 4:
+			ones =3D (__u32)~0;
+			break;
+		}
+=09
+		if ( oldstatus =3D=3D ones && status =3D=3D ones ) {
+			/* success - do nothing */
+		} else {
+			/* something has failed */
+			if ( ( ( status ^ oldstatus ) & dq6 )
+			     && ( status & dq5 ) ) {
+				printk(KERN_WARNING "MTD %s(): Internal flash device timeout occured.\=
n", __func__ );
+			} else {
+				/*
+				 * This state means that the erase did not succeed
+				 * and that the usual error state of toggling dq6
+				 * while dq5 goes high did not happen.  Something
+				 * is seriously wacky!
+				 */
+				printk(KERN_WARNING "MTD %s(): Wacky!  Unable to decode failure status=
\n", __func__ );
 			}
+			ret =3D -EIO;
+			/* reset on all failures. */
+			cfi_write( map, CMD(0xF0), chip->start );
 		}
-        else
-        {
-		    printk( "Waiting for erase to complete timed out in do_erase_onebloc=
k.");       =20
-		   =20
-		chip->state =3D FL_READY;
-		wake_up(&chip->wq);
-		cfi_spin_unlock(chip->mutex);
-		DISABLE_VPP(map);
-		return -EIO;
-	}
 	}
=20
 	DISABLE_VPP(map);
 	chip->state =3D FL_READY;
 	wake_up(&chip->wq);
 	cfi_spin_unlock(chip->mutex);
-	return 0;
+	return ret;
 }
=20
 static int cfi_amdstd_erase_varsize(struct mtd_info *mtd, struct erase_inf=
o *instr)

--=-iVlaPHu7tRlXsNru9LRf--

--=-4NstdhMTNbQi36IuK3cG
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+elZefsBPTKE6HMkRAheUAJ9TdxaGkwYDz8SGGzk4ZOAeaqAc9QCeJyZD
tP7w/whkvy2JvpAFEpoK7fE=
=7Eht
-----END PGP SIGNATURE-----

--=-4NstdhMTNbQi36IuK3cG--
