Received: from dmzraw2.extranet.tce.com ([157.254.234.138])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19psxj-0001js-5G
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2003 18:11:07 +0100
Message-ID: <2C1BAF8F8E1DD611862B0002A5D4C3FC01BC05FE@renexch3.rennes.thmulti.com>
From: Fillod Stephane <stephane.fillod@thomson.net>
To: linux-mtd@lists.infradead.org
Date: Thu, 21 Aug 2003 19:07:49 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C36806.BFAAA530"
cc: "'tharbaugh@lnxi.com'" <tharbaugh@lnxi.com>
Subject: [PATCH] cfi_cmdset_0002.c support for buffered mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C36806.BFAAA530
Content-Type: text/plain;
	charset="iso-8859-1"

Dave,

Here is the patch for buffered mode write on Amd chips.
I've Cc'd Thayne if anyone of you cares to commit to cvs.

Jon,
My patch has no support for the CFI three byte ID. In fact,
there's no need to ID the chip since the BufWriteTimeoutTyp 
attribute will tell you if buffered mode is supported.

Testing has been done on Am29LV128MH, and regression on Am29LV641DH
using a modified version of checkfs (it was not portable to different
endianess).


Pre-requisite patchs:

* Stefano's patch on "erase/write on the same AMD chip with not 
aligned words". A clean patch "unaligned-write.patch" is also attached.
 http://lists.infradead.org/pipermail/linux-mtd/2003-August/008385.html

* My patch on oops fixup (obvious)
 http://lists.infradead.org/pipermail/linux-mtd/2003-August/008399.html


The patch of interest is "buffered-mode.patch". Please let me know 
how it works for you.


Regards,
Stephane


------_=_NextPart_000_01C36806.BFAAA530
Content-Type: application/octet-stream;
	name="unaligned-write.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="unaligned-write.patch"

diff -u -r1.2 -r1.3=0A=
--- cfi_cmdset_0002.c	12 Aug 2003 14:53:11 -0000	1.2=0A=
+++ cfi_cmdset_0002.c	13 Aug 2003 15:28:17 -0000	1.3=0A=
@@ -311,7 +311,7 @@=0A=
 		break;=0A=
 =0A=
 	default:=0A=
-	        printk(KERN_WARNING "Unsupported buswidth\n");=0A=
+	        printk(KERN_WARNING "Unsupported buswidth =
%d\n",CFIDEV_BUSWIDTH);=0A=
 		goto setup_err;=0A=
 		break;=0A=
 	}=0A=
@@ -541,8 +541,8 @@=0A=
 static int do_write_oneword(struct map_info *map, struct flchip *chip, =
unsigned long adr, cfi_word datum, int fast)=0A=
 {=0A=
 	unsigned long timeo =3D jiffies + HZ;=0A=
-	unsigned int oldstatus, status, prev_oldstatus, prev_status;=0A=
-	unsigned int dq6;=0A=
+	cfi_word oldstatus, status, prev_oldstatus, prev_status;=0A=
+	cfi_word dq6;=0A=
 	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
     /* We use a 1ms + 1 jiffies generic timeout for writes (most =
devices have=0A=
        a max write time of a few hundreds usec). However, we should =
use the=0A=
@@ -556,7 +556,7 @@=0A=
 	DECLARE_WAITQUEUE(wait, current);=0A=
 	int ret =3D 0;=0A=
 	int ta =3D 0;=0A=
-=0A=
+        =0A=
  retry:=0A=
 	cfi_spin_lock(chip->mutex);=0A=
 =0A=
@@ -584,7 +584,12 @@=0A=
 	chip->state =3D FL_WRITING;=0A=
 =0A=
 	adr +=3D chip->start;=0A=
-	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): WRITE 0x%.8lx(0x%.8x)\n",=0A=
+        status =3D cfi_read(map, adr);=0A=
+        =0A=
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): READ 0x%.8lx(0x%.8x)\n",=0A=
+	       __func__, adr, status );=0A=
+=0A=
+      	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): WRITE =
0x%.8lx(0x%.8x)\n",=0A=
 	       __func__, adr, datum );=0A=
 =0A=
 	ENABLE_VPP(map);=0A=
@@ -629,6 +634,7 @@=0A=
 	 * - Thayne Harbaugh=0A=
 	 */=0A=
 	dq6 =3D CMD(1<<6);=0A=
+=0A=
 	/* See comment above for timeout value. */=0A=
 	timeo =3D jiffies + uWriteTimeout; =0A=
 		=0A=
@@ -663,6 +669,7 @@=0A=
 		} else =0A=
 			udelay(1);=0A=
 =0A=
+=0A=
 		oldstatus =3D cfi_read( map, adr );=0A=
 		status =3D cfi_read( map, adr );=0A=
 		DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",=0A=
@@ -695,13 +702,13 @@=0A=
 	}=0A=
 =0A=
 	if ( ta ) {=0A=
-		int dq5mask =3D ( ( status ^ oldstatus ) & dq6 ) >> 1;=0A=
+		cfi_word dq5mask =3D ( ( status ^ oldstatus ) & dq6 ) >> 1;=0A=
 		if ( status & dq5mask ) {=0A=
 			/* dq5 asserted - decode interleave chips */=0A=
 			printk( KERN_WARNING=0A=
-				"MTD %s(): FLASH internal timeout: 0x%.8x\n",=0A=
+				"MTD %s(): FLASH internal timeout: 0x%.8x 0x%.8x 0x%.8x\n",=0A=
 				__func__,=0A=
-				status & dq5mask );=0A=
+				status & dq5mask, status, datum );=0A=
 		} else {=0A=
 			printk( KERN_WARNING=0A=
 				"MTD %s(): Software timed out during write.\n",=0A=
@@ -747,6 +754,7 @@=0A=
 	int ret =3D 0;=0A=
 	int chipnum;=0A=
 	unsigned long ofs, chipstart;=0A=
+	DECLARE_WAITQUEUE(wait, current);=0A=
 =0A=
 	*retlen =3D 0;=0A=
 	if (!len)=0A=
@@ -755,7 +763,7 @@=0A=
 	chipnum =3D to >> cfi->chipshift;=0A=
 	ofs =3D to  - (chipnum << cfi->chipshift);=0A=
 	chipstart =3D cfi->chips[chipnum].start;=0A=
-=0A=
+        =0A=
 	/* If it's not bus-aligned, do the first byte write */=0A=
 	if (ofs & (CFIDEV_BUSWIDTH-1)) {=0A=
 		unsigned long bus_ofs =3D ofs & ~(CFIDEV_BUSWIDTH-1);=0A=
@@ -764,9 +772,36 @@=0A=
 		u_char tmp_buf[8];=0A=
 		cfi_word datum;=0A=
 =0A=
+ retry:=0A=
+	cfi_spin_lock(cfi->chips[chipnum].mutex);=0A=
+=0A=
+	if (cfi->chips[chipnum].state !=3D FL_READY) {=0A=
+#if 0=0A=
+	        printk(KERN_DEBUG "Waiting for chip to write, status =3D =
%d\n", cfi->chips[chipnum].state);=0A=
+#endif=0A=
+		set_current_state(TASK_UNINTERRUPTIBLE);=0A=
+		add_wait_queue(&cfi->chips[chipnum].wq, &wait);=0A=
+=0A=
+		cfi_spin_unlock(cfi->chips[chipnum].mutex);=0A=
+=0A=
+		schedule();=0A=
+		remove_wait_queue(&cfi->chips[chipnum].wq, &wait);=0A=
+#if 0=0A=
+		printk(KERN_DEBUG "Wake up to write:\n");=0A=
+		if(signal_pending(current))=0A=
+			return -EINTR;=0A=
+#endif=0A=
+		goto retry;=0A=
+	}=0A=
+=0A=
 		map_copy_from(map, tmp_buf, bus_ofs + cfi->chips[chipnum].start, =
CFIDEV_BUSWIDTH);=0A=
-		while (len && i < CFIDEV_BUSWIDTH)=0A=
-			tmp_buf[i++] =3D buf[n++], len--;=0A=
+=0A=
+		cfi_spin_unlock(cfi->chips[chipnum].mutex);=0A=
+                =0A=
+		while (len && i < CFIDEV_BUSWIDTH) {=0A=
+			tmp_buf[i++] =3D buf[n++];=0A=
+                       len--;=0A=
+         }=0A=
 =0A=
 		if (cfi_buswidth_is_2()) {=0A=
 			datum =3D *(__u16*)tmp_buf;=0A=
@@ -862,7 +897,32 @@=0A=
 		u_char tmp_buf[8];=0A=
 		cfi_word datum;=0A=
 =0A=
+ retry1:=0A=
+	cfi_spin_lock(cfi->chips[chipnum].mutex);=0A=
+=0A=
+	if (cfi->chips[chipnum].state !=3D FL_READY) {=0A=
+#if 0=0A=
+	        printk(KERN_DEBUG "Waiting for chip to write, status =3D =
%d\n", cfi->chips[chipnum].state);=0A=
+#endif=0A=
+		set_current_state(TASK_UNINTERRUPTIBLE);=0A=
+		add_wait_queue(&cfi->chips[chipnum].wq, &wait);=0A=
+                =0A=
+		cfi_spin_unlock(cfi->chips[chipnum].mutex);=0A=
+=0A=
+		schedule();=0A=
+		remove_wait_queue(&cfi->chips[chipnum].wq, &wait);=0A=
+#if 0=0A=
+		printk(KERN_DEBUG "Wake up to write:\n");=0A=
+		if(signal_pending(current))=0A=
+			return -EINTR;=0A=
+#endif=0A=
+		goto retry1;=0A=
+	}=0A=
+=0A=
 		map_copy_from(map, tmp_buf, ofs + cfi->chips[chipnum].start, =
CFIDEV_BUSWIDTH);=0A=
+=0A=
+		cfi_spin_unlock(cfi->chips[chipnum].mutex);=0A=
+=0A=
 		while (len--)=0A=
 			tmp_buf[i++] =3D buf[n++];=0A=
 =0A=
@@ -887,16 +947,17 @@=0A=
 =0A=
 static inline int do_erase_chip(struct map_info *map, struct flchip =
*chip)=0A=
 {=0A=
-	unsigned int oldstatus, status, prev_oldstatus, prev_status;=0A=
-	unsigned int dq6;=0A=
 	unsigned long timeo =3D jiffies + HZ;=0A=
 	unsigned long int adr;=0A=
 	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
 	DECLARE_WAITQUEUE(wait, current);=0A=
 	int ret =3D 0;=0A=
 	int ta =3D 0;=0A=
-	cfi_word ones =3D 0;=0A=
 =0A=
+	cfi_word status, prev_status;=0A=
+	cfi_word dq7, dq5;=0A=
+	cfi_word ones =3D 0;=0A=
+        =0A=
  retry:=0A=
 	cfi_spin_lock(chip->mutex);=0A=
 =0A=
@@ -944,15 +1005,14 @@=0A=
 	 * command to the chip.=0A=
 	 */=0A=
 	/* see comments in do_write_oneword */=0A=
-	dq6 =3D CMD(1<<6);=0A=
+	dq7 =3D CMD(1<<7);=0A=
+	dq5 =3D CMD(1<<5);=0A=
 =0A=
-	oldstatus =3D cfi_read(map, adr);=0A=
 	status =3D cfi_read(map, adr);=0A=
-	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",=0A=
-	       __func__, oldstatus, status );=0A=
-=0A=
-	while( ( ( status ^ oldstatus ) & dq6 )=0A=
-	       && ! ( ta =3D time_after(jiffies, timeo) ) ) {=0A=
+        =0A=
+	while( ((status & dq7) !=3D dq7) && =0A=
+	       ((status & dq5) !=3D dq5) &&=0A=
+	       ! ( ta =3D time_after(jiffies, timeo) ) ) {=0A=
 		int wait_reps;=0A=
 =0A=
 		/* an initial short sleep */=0A=
@@ -981,8 +1041,9 @@=0A=
 =0A=
 		/* Busy wait for 1/10 of a milisecond */=0A=
 		for(wait_reps =3D 0;=0A=
-		    (wait_reps < 100)=0A=
-			    && ( ( status ^ oldstatus ) & dq6 );=0A=
+		    (wait_reps < 100) &&=0A=
+		    ((status & dq7) !=3D dq7) && =0A=
+		    ((status & dq5) !=3D dq5);=0A=
 		    wait_reps++) {=0A=
 			=0A=
 			/* Latency issues. Drop the lock, wait a while and retry */=0A=
@@ -991,23 +1052,17 @@=0A=
 			cfi_udelay(1);=0A=
 =0A=
 			cfi_spin_lock(chip->mutex);=0A=
-			oldstatus =3D cfi_read(map, adr);=0A=
 			status =3D cfi_read(map, adr);=0A=
-			DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",=0A=
-			       __func__, oldstatus, status );=0A=
 		}=0A=
-		oldstatus =3D cfi_read(map, adr);=0A=
 		status =3D cfi_read(map, adr);=0A=
 		DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",=0A=
-		       __func__, oldstatus, status );=0A=
+		       __func__, status );=0A=
 	}=0A=
 =0A=
-	prev_oldstatus =3D oldstatus;=0A=
 	prev_status =3D status;=0A=
-	oldstatus =3D cfi_read(map, adr);=0A=
 	status =3D cfi_read(map, adr);=0A=
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",=0A=
-	       __func__, oldstatus, status );=0A=
+	       __func__, status );=0A=
 =0A=
 	if ( cfi_buswidth_is_1() ) {=0A=
 		ones =3D  (__u8)~0;=0A=
@@ -1015,18 +1070,20 @@=0A=
 		ones =3D (__u16)~0;=0A=
 	} else if ( cfi_buswidth_is_4() ) {=0A=
 		ones =3D (__u32)~0;=0A=
+        } else if ( cfi_buswidth_is_8() ) {=0A=
+	        ones =3D (__u64)~0;=0A=
 	} else {=0A=
-		printk(KERN_WARNING "Unsupported buswidth\n");=0A=
+		printk(KERN_WARNING "Unsupported buswidth %d\n",CFIDEV_BUSWIDTH);=0A=
 		goto erase_failed;=0A=
 	}=0A=
 	=0A=
-	if ( oldstatus =3D=3D ones && status =3D=3D ones ) {=0A=
+	if ( prev_status =3D=3D ones && status =3D=3D ones ) {=0A=
 		/* success - do nothing */=0A=
 		goto erase_done;=0A=
 	}=0A=
 =0A=
 	if ( ta ) {=0A=
-		int dq5mask =3D ( ( status ^ oldstatus ) & dq6 ) >> 1;=0A=
+		cfi_word dq5mask =3D ( ( status ^ prev_status ) & dq7 ) >> 2;=0A=
 		if ( status & dq5mask ) {=0A=
 			/* dq5 asserted - decode interleave chips */=0A=
 			printk( KERN_WARNING=0A=
@@ -1046,10 +1103,9 @@=0A=
 	       __func__ );=0A=
 =0A=
 	printk(KERN_WARNING=0A=
-	       "MTD %s(): 0x%.8lx(0x%.8x): 0x%.8x 0x%.8x 0x%.8x 0x%.8x\n",=0A=
+	       "MTD %s(): 0x%.8lx(0x%.8x): 0x%.8x 0x%.8x\n",=0A=
 	       __func__, adr, ones,=0A=
-	       prev_oldstatus, prev_status,=0A=
-	       oldstatus, status);=0A=
+	       prev_status, status);=0A=
 =0A=
  erase_failed:=0A=
 	ret =3D -EIO;=0A=
@@ -1068,15 +1124,17 @@=0A=
 =0A=
 static inline int do_erase_oneblock(struct map_info *map, struct =
flchip *chip, unsigned long adr)=0A=
 {=0A=
-	unsigned int oldstatus, status, prev_oldstatus, prev_status;=0A=
-	unsigned int dq6;=0A=
 	unsigned long timeo =3D jiffies + HZ;=0A=
 	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
 	DECLARE_WAITQUEUE(wait, current);=0A=
 	int ret =3D 0;=0A=
 	int ta =3D 0;=0A=
+        int i;=0A=
+        =0A=
+	cfi_word status, prev_status;=0A=
+	cfi_word dq7, dq5;=0A=
 	cfi_word ones =3D 0;=0A=
-=0A=
+        =0A=
  retry:=0A=
 	cfi_spin_lock(chip->mutex);=0A=
 =0A=
@@ -1100,7 +1158,7 @@=0A=
 	chip->state =3D FL_ERASING;=0A=
 =0A=
 	adr +=3D chip->start;=0A=
-	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): ERASE 0x%.8lx\n",=0A=
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): ERASE 0x%.8x 0x%.8x\n",=0A=
 	       __func__, adr );=0A=
 =0A=
 	ENABLE_VPP(map);=0A=
@@ -1109,7 +1167,6 @@=0A=
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, =
CFI_DEVICETYPE_X8, NULL);=0A=
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
CFI_DEVICETYPE_X8, NULL);=0A=
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
CFI_DEVICETYPE_X8, NULL);=0A=
-=0A=
 	cfi_write(map, CMD(0x30), adr);=0A=
 	=0A=
 	timeo =3D jiffies + (HZ*20);=0A=
@@ -1120,19 +1177,21 @@=0A=
 	 * The toggling stops as soon as the procedure is completed.=0A=
 	 *=0A=
 	 * If the process has gone on for too long on the chip bit 5 gets.=0A=
-	 * After bit5 is set you can kill the operation by sending a reset=0A=
+	 * After bit5 is set you can kill the operation by Wackysending a =
reset=0A=
 	 * command to the chip.=0A=
 	 */=0A=
 	/* see comments in do_write_oneword */=0A=
-	dq6 =3D CMD(1<<6);=0A=
+	dq7 =3D CMD(1<<7);=0A=
+	dq5 =3D CMD(1<<5);=0A=
 =0A=
-	oldstatus =3D cfi_read(map, adr);=0A=
-	status =3D cfi_read(map, adr);=0A=
-	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",=0A=
-	       __func__, oldstatus, status );=0A=
+	status    =3D cfi_read(map, adr);=0A=
 =0A=
-	while( ( ( status ^ oldstatus ) & dq6 )=0A=
-	       && ! ( ta =3D time_after(jiffies, timeo) ) ) {=0A=
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x\n",=0A=
+	       __func__, status );=0A=
+=0A=
+	while( ((status & dq7) !=3D dq7) && =0A=
+	       ((status & dq5) !=3D dq5) &&=0A=
+		!( ta =3D time_after(jiffies, timeo) )) {=0A=
 		int wait_reps;=0A=
 =0A=
 		/* an initial short sleep */=0A=
@@ -1161,9 +1220,10 @@=0A=
 =0A=
 		/* Busy wait for 1/10 of a milisecond */=0A=
 		for(wait_reps =3D 0;=0A=
-		    (wait_reps < 100)=0A=
-			    && ( ( status ^ oldstatus ) & dq6 );=0A=
-		    wait_reps++) {=0A=
+		    (wait_reps < 100) &&=0A=
+			((status & dq7) !=3D dq7) && =0A=
+			((status & dq5) !=3D dq5);=0A=
+			wait_reps++) {=0A=
 			=0A=
 			/* Latency issues. Drop the lock, wait a while and retry */=0A=
 			cfi_spin_unlock(chip->mutex);=0A=
@@ -1171,23 +1231,19 @@=0A=
 			cfi_udelay(1);=0A=
 		=0A=
 			cfi_spin_lock(chip->mutex);=0A=
-			oldstatus =3D cfi_read(map, adr);=0A=
 			status =3D cfi_read(map, adr);=0A=
 			DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",=0A=
-			       __func__, oldstatus, status );=0A=
+			       __func__, status );=0A=
 		}=0A=
-		oldstatus =3D cfi_read(map, adr);=0A=
 		status =3D cfi_read(map, adr);=0A=
-		DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",=0A=
-		       __func__, oldstatus, status );=0A=
+		DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x\n",=0A=
+		       __func__, status );=0A=
 	}=0A=
+	prev_status     =3D status;=0A=
+	status          =3D cfi_read(map, adr);=0A=
 =0A=
-	prev_oldstatus =3D oldstatus;=0A=
-	prev_status =3D status;=0A=
-	oldstatus =3D cfi_read(map, adr);=0A=
-	status =3D cfi_read(map, adr);=0A=
-	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",=0A=
-	       __func__, oldstatus, status );=0A=
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x\n",=0A=
+	       __func__, status );=0A=
 =0A=
 	if ( cfi_buswidth_is_1() ) {=0A=
 		ones =3D  (__u8)~0;=0A=
@@ -1195,18 +1251,20 @@=0A=
 		ones =3D (__u16)~0;=0A=
 	} else if ( cfi_buswidth_is_4() ) {=0A=
 		ones =3D (__u32)~0;=0A=
+	} else if ( cfi_buswidth_is_8() ) {=0A=
+		ones =3D (__u64)~0;=0A=
 	} else {=0A=
-		printk(KERN_WARNING "Unsupported buswidth\n");=0A=
+		printk(KERN_WARNING "Unsupported buswidth %d\n",CFIDEV_BUSWIDTH);=0A=
 		goto erase_failed;=0A=
 	}=0A=
 =0A=
-	if ( oldstatus =3D=3D ones && status =3D=3D ones ) {=0A=
+	if ( prev_status =3D=3D ones && status =3D=3D ones ) {=0A=
 		/* success - do nothing */=0A=
 		goto erase_done;=0A=
 	}=0A=
 =0A=
 	if ( ta ) {=0A=
-		int dq5mask =3D ( ( status ^ oldstatus ) & dq6 ) >> 1;=0A=
+		cfi_word dq5mask =3D ( ( status ^ prev_status ) & dq7 ) >> 2;=0A=
 		if ( status & dq5mask ) {=0A=
 			/* dq5 asserted - decode interleave chips */=0A=
 			printk( KERN_WARNING=0A=
@@ -1226,10 +1284,9 @@=0A=
 	       __func__ );=0A=
 =0A=
 	printk(KERN_WARNING=0A=
-	       "MTD %s(): 0x%.8lx(0x%.8x): 0x%.8x 0x%.8x 0x%.8x 0x%.8x\n",=0A=
+	       "MTD %s(): 0x%.8lx(0x%.8x): 0x%.8x 0x%.8x\n",=0A=
 	       __func__, adr, ones,=0A=
-	       prev_oldstatus, prev_status,=0A=
-	       oldstatus, status);=0A=
+	       prev_status, status);=0A=
 =0A=
  erase_failed:=0A=
 	ret =3D -EIO;=0A=
@@ -1239,6 +1296,7 @@=0A=
 =0A=
  erase_done:=0A=
 	DISABLE_VPP(map);=0A=
+        =0A=
 	chip->state =3D FL_READY;=0A=
 	wake_up(&chip->wq);=0A=
 	cfi_spin_unlock(chip->mutex);=0A=

------_=_NextPart_000_01C36806.BFAAA530
Content-Type: application/octet-stream;
	name="buffered-mode.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="buffered-mode.patch"

diff -u -r1.3 cfi_cmdset_0002.c=0A=
--- cfi_cmdset_0002.c	13 Aug 2003 15:28:17 -0000	1.3=0A=
+++ cfi_cmdset_0002.c	21 Aug 2003 16:44:41 -0000=0A=
@@ -30,9 +33,14 @@=0A=
 #include <linux/mtd/cfi.h>=0A=
 =0A=
 #define AMD_BOOTLOC_BUG=0A=
+//=0A=
+// debugging, turns off buffer write mode if set to 1=0A=
+#define FORCE_WORD_WRITE 0=0A=
+=0A=
 =0A=
 static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t =
*, u_char *);=0A=
-static int cfi_amdstd_write(struct mtd_info *, loff_t, size_t, size_t =
*, const u_char *);=0A=
+static int cfi_amdstd_write_words(struct mtd_info *, loff_t, size_t, =
size_t *, const u_char *);=0A=
+static int cfi_amdstd_write_buffers(struct mtd_info *, loff_t, size_t, =
size_t *, const u_char *);=0A=
 static int cfi_amdstd_erase_chip(struct mtd_info *, struct erase_info =
*);=0A=
 static int cfi_amdstd_erase_onesize(struct mtd_info *, struct =
erase_info *);=0A=
 static int cfi_amdstd_erase_varsize(struct mtd_info *, struct =
erase_info *);=0A=
@@ -307,7 +315,14 @@=0A=
 		else=0A=
 			mtd->erase =3D cfi_amdstd_erase_onesize;=0A=
 		mtd->read =3D cfi_amdstd_read;=0A=
-		mtd->write =3D cfi_amdstd_write;=0A=
+		if ( cfi->cfiq->BufWriteTimeoutTyp && !FORCE_WORD_WRITE) {=0A=
+			printk(KERN_INFO "Using buffer write method\n" );=0A=
+			mtd->write =3D cfi_amdstd_write_buffers;=0A=
+		} else {=0A=
+			printk(KERN_INFO "Using word write method\n" );=0A=
+			mtd->write =3D cfi_amdstd_write_words;=0A=
+		}=0A=
+=0A=
 		break;=0A=
 =0A=
 	default:=0A=
@@ -316,7 +331,7 @@=0A=
 		break;=0A=
 	}=0A=
 	if (cfi->fast_prog) {=0A=
-		/* In cfi_amdstd_write() we frob the protection stuff=0A=
+		/* In cfi_amdstd_write_words() we frob the protection stuff=0A=
 		   without paying any attention to the state machine.=0A=
 		   This upsets in-progress erases. So we turn this flag=0A=
 		   off for now till the code gets fixed. */=0A=
@@ -747,7 +762,7 @@=0A=
 	return ret;=0A=
 }=0A=
 =0A=
-static int cfi_amdstd_write (struct mtd_info *mtd, loff_t to , size_t =
len, size_t *retlen, const u_char *buf)=0A=
+static int cfi_amdstd_write_words (struct mtd_info *mtd, loff_t to , =
size_t len, size_t *retlen, const u_char *buf)=0A=
 {=0A=
 	struct map_info *map =3D mtd->priv;=0A=
 	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
@@ -945,6 +960,357 @@=0A=
 	return 0;=0A=
 }=0A=
 =0A=
+/*=0A=
+ * FIXME: interleaved mode not tested, and probably not supported!=0A=
+ */=0A=
+static inline int do_write_buffer(struct map_info *map, struct flchip =
*chip, =0A=
+				  unsigned long adr, const u_char *buf, int len)=0A=
+{=0A=
+	unsigned long timeo =3D jiffies + HZ;=0A=
+	cfi_word oldstatus, status, prev_oldstatus, prev_status;=0A=
+	cfi_word dq6;=0A=
+	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
+    /* We use a 1ms + 1 jiffies generic timeout for writes (most =
devices have=0A=
+       a max write time of a few hundreds usec). However, we should =
use the=0A=
+       maximum timeout value given by the chip at probe time instead. =
=0A=
+       Unfortunately, struct flchip does have a field for maximum =
timeout, =0A=
+       only for typical which can be far too short depending of the =
conditions.=0A=
+       The ' + 1' is to avoid having a timeout of 0 jiffies if HZ is =
smaller=0A=
+       than 1000. Using a static variable allows makes us save the =
costly=0A=
+       divide operation at each word write.*/ =0A=
+    static unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;=0A=
+	DECLARE_WAITQUEUE(wait, current);=0A=
+	int ret =3D 0;=0A=
+	int ta =3D 0;=0A=
+	unsigned long cmd_adr;=0A=
+	int z, bytes, words;=0A=
+	cfi_word datum;=0A=
+        =0A=
+ retry:=0A=
+	cfi_spin_lock(chip->mutex);=0A=
+=0A=
+	if (chip->state !=3D FL_READY) {=0A=
+#if 1=0A=
+	        printk(KERN_DEBUG "Waiting for chip to write, status =3D =
%d\n", chip->state);=0A=
+#endif=0A=
+		set_current_state(TASK_UNINTERRUPTIBLE);=0A=
+		add_wait_queue(&chip->wq, &wait);=0A=
+                =0A=
+		cfi_spin_unlock(chip->mutex);=0A=
+=0A=
+		schedule();=0A=
+		remove_wait_queue(&chip->wq, &wait);=0A=
+#if 1=0A=
+		printk(KERN_DEBUG "Wake up to write:\n");=0A=
+		if(signal_pending(current))=0A=
+			return -EINTR;=0A=
+#endif=0A=
+		timeo =3D jiffies + HZ;=0A=
+=0A=
+		goto retry;=0A=
+	}	=0A=
+=0A=
+	chip->state =3D FL_WRITING_TO_BUFFER;=0A=
+=0A=
+	adr +=3D chip->start;=0A=
+	cmd_adr =3D adr;=0A=
+=0A=
+=0A=
+	if (cfi_buswidth_is_1()) {=0A=
+		datum =3D *((__u8*)buf);=0A=
+	} else if (cfi_buswidth_is_2()) {=0A=
+		datum =3D *((__u16*)buf);=0A=
+	} else if (cfi_buswidth_is_4()) {=0A=
+		datum =3D *((__u32*)buf);=0A=
+	} else if (cfi_buswidth_is_8()) {=0A=
+		datum =3D *((__u64*)buf);=0A=
+	}=0A=
+=0A=
+#if 1=0A=
+        status =3D cfi_read(map, cmd_adr);=0A=
+=0A=
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): READ 0x%.8lx(0x%.8x)\n",=0A=
+	       __func__, adr, status );=0A=
+=0A=
+      	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): WRITE =
0x%.8lx(0x%.8x)\n",=0A=
+	       __func__, adr, datum );=0A=
+#endif=0A=
+=0A=
+	ENABLE_VPP(map);=0A=
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
CFI_DEVICETYPE_X8, NULL);=0A=
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
CFI_DEVICETYPE_X8, NULL);=0A=
+	//cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, =
CFI_DEVICETYPE_X8, NULL);=0A=
+=0A=
+	/* Write Buffer Load */=0A=
+	cfi_write(map, CMD(0x25), cmd_adr);=0A=
+=0A=
+	/* Write length of data to come */=0A=
+	bytes =3D len & (CFIDEV_BUSWIDTH-1);=0A=
+	words =3D len / CFIDEV_BUSWIDTH;=0A=
+	cfi_write(map, CMD(words - !bytes), cmd_adr );=0A=
+	/* Write data */=0A=
+	z =3D 0;=0A=
+	while(z < words * CFIDEV_BUSWIDTH) {=0A=
+		if (cfi_buswidth_is_1()) {=0A=
+			datum =3D *((__u8*)buf);=0A=
+			map_write8 (map, *((__u8*)buf)++, adr+z);=0A=
+		} else if (cfi_buswidth_is_2()) {=0A=
+			datum =3D *((__u16*)buf);=0A=
+			map_write16 (map, *((__u16*)buf)++, adr+z);=0A=
+		} else if (cfi_buswidth_is_4()) {=0A=
+			datum =3D *((__u32*)buf);=0A=
+			map_write32 (map, *((__u32*)buf)++, adr+z);=0A=
+		} else if (cfi_buswidth_is_8()) {=0A=
+			datum =3D *((__u64*)buf);=0A=
+			map_write64 (map, *((__u64*)buf)++, adr+z);=0A=
+		} else {=0A=
+			ret =3D -EINVAL;=0A=
+			goto write_failed;=0A=
+		}=0A=
+		z +=3D CFIDEV_BUSWIDTH;=0A=
+	}=0A=
+	if (bytes) {=0A=
+		int i =3D 0, n =3D 0;=0A=
+		u_char tmp_buf[8], *tmp_p =3D tmp_buf;=0A=
+=0A=
+		while (bytes--)=0A=
+			tmp_buf[i++] =3D buf[n++];=0A=
+		while (i < CFIDEV_BUSWIDTH)=0A=
+			tmp_buf[i++] =3D 0xff;=0A=
+		if (cfi_buswidth_is_2()) {=0A=
+			datum =3D *((__u16*)tmp_p);=0A=
+			map_write16 (map, *((__u16*)tmp_p)++, adr+z);=0A=
+		} else if (cfi_buswidth_is_4()) {=0A=
+			datum =3D *((__u32*)tmp_p);=0A=
+			map_write32 (map, *((__u32*)tmp_p)++, adr+z);=0A=
+		} else if (cfi_buswidth_is_8()) {=0A=
+			datum =3D *((__u64*)tmp_p);=0A=
+			map_write64 (map, *((__u64*)tmp_p)++, adr+z);=0A=
+		} else {=0A=
+			ret =3D -EINVAL;=0A=
+			goto write_failed;=0A=
+		}=0A=
+	} else if (words > 0) {=0A=
+		z -=3D CFIDEV_BUSWIDTH;=0A=
+	}=0A=
+=0A=
+	adr +=3D z;=0A=
+=0A=
+	/* Write Buffer Program Confirm: GO GO GO */=0A=
+	cfi_write(map, CMD(0x29), cmd_adr);=0A=
+	chip->state =3D FL_WRITING;=0A=
+=0A=
+	cfi_spin_unlock(chip->mutex);=0A=
+	cfi_udelay(chip->buffer_write_time);=0A=
+	cfi_spin_lock(chip->mutex);=0A=
+=0A=
+	/*=0A=
+	 * Polling toggle bits instead of reading back many times=0A=
+	 * This ensures that write operation is really completed,=0A=
+	 * or tells us why it failed.=0A=
+	 *=0A=
+	 * It appears that the polling and decoding of error state might=0A=
+	 * be simplified.  Don't do it unless you really know what you=0A=
+	 * are doing.  You must remember that JESD21-C 3.5.3 states that=0A=
+	 * the status must be read back an _additional_ two times before=0A=
+	 * a failure is determined.  This is because these devices have=0A=
+	 * internal state machines that are asynchronous to the external=0A=
+	 * data bus.  During an erase or write the read-back status of the=0A=
+	 * polling bits might be transitioning internaly when the external=0A=
+	 * read-back occurs.  This means that the bits aren't in the final=0A=
+	 * state and they might appear to report an error as they =
transition=0A=
+	 * and are in a weird state.  This will produce infrequent errors=0A=
+	 * that will usually disappear the next time an erase or write=0A=
+	 * happens (Try tracking those errors down!).  To ensure that=0A=
+	 * the bits are not in transition the location must be read-back=0A=
+	 * two more times and compared against what was written - BOTH =
reads=0A=
+	 * MUST match what was written - don't think this can be =
simplified=0A=
+	 * to only the last read matching.  If the comparison fails, error=0A=
+	 * state can then be decoded.=0A=
+	 *=0A=
+	 * - Thayne Harbaugh=0A=
+	 */=0A=
+	dq6 =3D CMD(1<<6);=0A=
+=0A=
+	/* See comment above for timeout value. */=0A=
+	timeo =3D jiffies + uWriteTimeout; =0A=
+		=0A=
+	oldstatus =3D cfi_read(map, adr);=0A=
+	status =3D cfi_read(map, adr);=0A=
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",=0A=
+	       __func__, oldstatus, status );=0A=
+=0A=
+	/*=0A=
+	 * This only checks if dq6 is still toggling and that our=0A=
+	 * timer hasn't expired.  We purposefully ignore the chips=0A=
+	 * internal timer that will assert dq5 and leave dq6 toggling.=0A=
+	 * This is done for a variety of reasons:=0A=
+	 * 1) Not all chips support dq5.=0A=
+	 * 2) Dealing with asynchronous status bit and data updates=0A=
+	 *    and reading a device two more times creates _messy_=0A=
+	 *    logic when trying to deal with interleaved devices -=0A=
+	 *    some may be changing while others are still busy.=0A=
+	 * 3) Checking dq5 only helps to optimize an error case that=0A=
+	 *    should at worst be infrequent and at best non-existent.=0A=
+	 *=0A=
+	 * If our timeout occurs _then_ we will check dq5 to see=0A=
+	 * if the device also had an internal timeout.=0A=
+	 */=0A=
+	while( ( ( status ^ oldstatus ) & dq6 )=0A=
+	       && ! ( ta =3D time_after(jiffies, timeo) ) ) {=0A=
+=0A=
+		if (need_resched()) {=0A=
+			cfi_spin_unlock(chip->mutex);=0A=
+			yield();=0A=
+			cfi_spin_lock(chip->mutex);=0A=
+		} else =0A=
+			udelay(1);=0A=
+=0A=
+=0A=
+		oldstatus =3D cfi_read( map, adr );=0A=
+		status =3D cfi_read( map, adr );=0A=
+		DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",=0A=
+		       __func__, oldstatus, status );=0A=
+	}=0A=
+=0A=
+	/*=0A=
+	 * Something kicked us out of the read-back loop.  We'll=0A=
+	 * check success before checking failure.=0A=
+	 * Even though dq6 might be true data, it is unkown if=0A=
+	 * all of the other bits have changed to true data due to=0A=
+	 * the asynchronous nature of the internal state machine.=0A=
+	 * We will read two more times and use this to either=0A=
+	 * verify that the write completed successfully or=0A=
+	 * that something really went wrong.  BOTH reads=0A=
+	 * must match what was written - this certifies that=0A=
+	 * bits aren't still changing  and that the status=0A=
+	 * bits erroneously match the datum that was written.=0A=
+	 */=0A=
+	prev_oldstatus =3D oldstatus;=0A=
+	prev_status =3D status;=0A=
+	oldstatus =3D cfi_read(map, adr);=0A=
+	status =3D cfi_read(map, adr);=0A=
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",=0A=
+	       __func__, oldstatus, status );=0A=
+=0A=
+	if ( oldstatus =3D=3D datum && status =3D=3D datum ) {=0A=
+		/* success - do nothing */=0A=
+		goto write_done;=0A=
+	}=0A=
+=0A=
+	if ( ta ) {=0A=
+		cfi_word dq5mask =3D ( ( status ^ oldstatus ) & dq6 ) >> 1;=0A=
+		if ( status & dq5mask ) {=0A=
+			/* dq5 asserted - decode interleave chips */=0A=
+			printk( KERN_WARNING=0A=
+				"MTD %s(): FLASH internal timeout: 0x%.8x 0x%.8x 0x%.8x\n",=0A=
+				__func__,=0A=
+				status & dq5mask, status, datum );=0A=
+		} else {=0A=
+			printk( KERN_WARNING=0A=
+				"MTD %s(): Software timed out during write.\n",=0A=
+				__func__ );=0A=
+		}=0A=
+		goto write_failed;=0A=
+	}=0A=
+=0A=
+	/*=0A=
+	 * If we get to here then it means that something=0A=
+	 * is wrong and it's not a timeout.  Something=0A=
+	 * is seriously wacky!  Dump some debug info.=0A=
+	 */=0A=
+	printk(KERN_WARNING=0A=
+	       "MTD %s(): Wacky!  Unable to decode failure status\n",=0A=
+	       __func__ );=0A=
+=0A=
+	printk(KERN_WARNING=0A=
+	       "MTD %s(): 0x%.8lx(0x%.8x): 0x%.8x 0x%.8x 0x%.8x 0x%.8x\n",=0A=
+	       __func__, adr, datum,=0A=
+	       prev_oldstatus, prev_status,=0A=
+	       oldstatus, status);=0A=
+=0A=
+ write_failed:=0A=
+	ret =3D -EIO;=0A=
+	/* reset on all failures. */=0A=
+	cfi_write( map, CMD(0xF0), chip->start );=0A=
+	/* FIXME - should have reset delay before continuing */=0A=
+=0A=
+ write_done:=0A=
+	DISABLE_VPP(map);=0A=
+	chip->state =3D FL_READY;=0A=
+	wake_up(&chip->wq);=0A=
+	cfi_spin_unlock(chip->mutex);=0A=
+=0A=
+	return ret;=0A=
+}=0A=
+=0A=
+static int cfi_amdstd_write_buffers (struct mtd_info *mtd, loff_t to, =
=0A=
+				       size_t len, size_t *retlen, const u_char *buf)=0A=
+{=0A=
+	struct map_info *map =3D mtd->priv;=0A=
+	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
+	int wbufsize =3D CFIDEV_INTERLEAVE << cfi->cfiq->MaxBufWriteSize;=0A=
+	int ret =3D 0;=0A=
+	int chipnum;=0A=
+	unsigned long ofs;=0A=
+=0A=
+	*retlen =3D 0;=0A=
+	if (!len)=0A=
+		return 0;=0A=
+=0A=
+	chipnum =3D to >> cfi->chipshift;=0A=
+	ofs =3D to  - (chipnum << cfi->chipshift);=0A=
+=0A=
+	/* If it's not bus-aligned, do the first word write */=0A=
+	if (ofs & (CFIDEV_BUSWIDTH-1)) {=0A=
+		size_t local_len =3D (-ofs)&(CFIDEV_BUSWIDTH-1);=0A=
+		if (local_len > len)=0A=
+			local_len =3D len;=0A=
+		ret =3D cfi_amdstd_write_words(mtd, to, local_len,=0A=
+					       retlen, buf);=0A=
+		if (ret)=0A=
+			return ret;=0A=
+		ofs +=3D local_len;=0A=
+		buf +=3D local_len;=0A=
+		len -=3D local_len;=0A=
+=0A=
+		if (ofs >> cfi->chipshift) {=0A=
+			chipnum ++;=0A=
+			ofs =3D 0;=0A=
+			if (chipnum =3D=3D cfi->numchips)=0A=
+				return 0;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	/* Write buffer is worth it only if more than one word to write... =
*/=0A=
+	while(len) {=0A=
+		/* We must not cross write block boundaries */=0A=
+		int size =3D wbufsize - (ofs & (wbufsize-1));=0A=
+=0A=
+		if (size > len)=0A=
+			size =3D len;=0A=
+		ret =3D do_write_buffer(map, &cfi->chips[chipnum], =0A=
+				      ofs, buf, size);=0A=
+		if (ret)=0A=
+			return ret;=0A=
+=0A=
+		ofs +=3D size;=0A=
+		buf +=3D size;=0A=
+		(*retlen) +=3D size;=0A=
+		len -=3D size;=0A=
+=0A=
+		if (ofs >> cfi->chipshift) {=0A=
+			chipnum ++; =0A=
+			ofs =3D 0;=0A=
+			if (chipnum =3D=3D cfi->numchips)=0A=
+				return 0;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+=0A=
 static inline int do_erase_chip(struct map_info *map, struct flchip =
*chip)=0A=
 {=0A=
 	unsigned long timeo =3D jiffies + HZ;=0A=

------_=_NextPart_000_01C36806.BFAAA530--
