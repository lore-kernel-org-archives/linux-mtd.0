Received: from thoth.sbs.de ([192.35.17.2])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19l0xc-0003qm-Du
	for <linux-mtd@lists.infradead.org>; Fri, 08 Aug 2003 07:42:48 +0100
From: Stefano Babic <stefano.babic@siemens.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1060252618.25209.31.camel@passion.cambridge.redhat.com>
References: <1060252618.25209.31.camel@passion.cambridge.redhat.com>
Date: 08 Aug 2003 08:42:32 +0200
Message-Id: <1060324952.24780.115.camel@mhw42463>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-ta44nCJhAFB73Jk4IgaK"
cc: linux-mtd@lists.infradead.org
Subject: Re: Concurrency erase/write on the same AMD chip with not aligned
	words
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ta44nCJhAFB73Jk4IgaK
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2003-08-07 at 12:36, David Woodhouse wrote:
> 
> I haven't seen it personally, but it definitely looks like you're right.
> Please could you send a patch?

Hi David,

I send you the patch file for the cfi_cmdset_0002.c .

stefano



--=-ta44nCJhAFB73Jk4IgaK
Content-Disposition: attachment; filename=patch_cficmdset_0002
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch; name=patch_cficmdset_0002; charset=ISO-8859-1

diff -Naur mtd-snapshot-2003071/cfi_cmdset_0002.c new/cfi_cmdset_0002.c
--- mtd-snapshot-2003071/cfi_cmdset_0002.c	Fri Aug  8 08:31:20 2003
+++ new/cfi_cmdset_0002.c	Fri Aug  8 08:32:08 2003
@@ -238,7 +238,7 @@
 		break;
=20
 	default:
-	        printk(KERN_WARNING "Unsupported buswidth\n");
+	        printk(KERN_WARNING "Unsupported buswidth %d\n",CFIDEV_BUSWIDTH);
 		goto setup_err;
 		break;
 	}
@@ -468,10 +468,11 @@
 static int do_write_oneword(struct map_info *map, struct flchip *chip, uns=
igned long adr, cfi_word datum, int fast)
 {
 	unsigned long timeo =3D jiffies + HZ;
-	unsigned int oldstatus, status, prev_oldstatus, prev_status;
-	unsigned int dq6;
 	struct cfi_private *cfi =3D map->fldrv_priv;
=20
+	cfi_word oldstatus, status, prev_oldstatus, prev_status;
+	cfi_word dq6;
+
     /* We use a 1ms + 1 jiffies generic timeout for writes (most devices h=
ave
        a max write time of a few hundreds usec). However, we should use th=
e
        maximum timeout value given by the chip at probe time instead.=20
@@ -484,7 +485,7 @@
 	DECLARE_WAITQUEUE(wait, current);
 	int ret =3D 0;
 	int ta =3D 0;
-
+       =20
  retry:
 	cfi_spin_lock(chip->mutex);
=20
@@ -512,7 +513,12 @@
 	chip->state =3D FL_WRITING;
=20
 	adr +=3D chip->start;
-	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): WRITE 0x%.8lx(0x%.8x)\n",
+        status =3D cfi_read(map, adr);
+       =20
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): READ 0x%.8lx(0x%.8x)\n",
+	       __func__, adr, status );
+
+      	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): WRITE 0x%.8lx(0x%.8x)\n",
 	       __func__, adr, datum );
=20
 	ENABLE_VPP(map);
@@ -557,6 +563,7 @@
 	 * - Thayne Harbaugh
 	 */
 	dq6 =3D CMD(1<<6);
+
 	/* See comment above for timeout value. */
 	timeo =3D jiffies + uWriteTimeout;=20
 	=09
@@ -591,6 +598,7 @@
 		} else=20
 			udelay(1);
=20
+
 		oldstatus =3D cfi_read( map, adr );
 		status =3D cfi_read( map, adr );
 		DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",
@@ -623,13 +631,13 @@
 	}
=20
 	if ( ta ) {
-		int dq5mask =3D ( ( status ^ oldstatus ) & dq6 ) >> 1;
+		cfi_word dq5mask =3D ( ( status ^ oldstatus ) & dq6 ) >> 1;
 		if ( status & dq5mask ) {
 			/* dq5 asserted - decode interleave chips */
 			printk( KERN_WARNING
-				"MTD %s(): FLASH internal timeout: 0x%.8x\n",
+				"MTD %s(): FLASH internal timeout: 0x%.8x 0x%.8x 0x%.8x\n",
 				__func__,
-				status & dq5mask );
+				status & dq5mask, status, datum );
 		} else {
 			printk( KERN_WARNING
 				"MTD %s(): Software timed out during write.\n",
@@ -675,6 +683,7 @@
 	int ret =3D 0;
 	int chipnum;
 	unsigned long ofs, chipstart;
+	DECLARE_WAITQUEUE(wait, current);
=20
 	*retlen =3D 0;
 	if (!len)
@@ -683,7 +692,7 @@
 	chipnum =3D to >> cfi->chipshift;
 	ofs =3D to  - (chipnum << cfi->chipshift);
 	chipstart =3D cfi->chips[chipnum].start;
-
+       =20
 	/* If it's not bus-aligned, do the first byte write */
 	if (ofs & (CFIDEV_BUSWIDTH-1)) {
 		unsigned long bus_ofs =3D ofs & ~(CFIDEV_BUSWIDTH-1);
@@ -692,10 +701,36 @@
 		u_char tmp_buf[sizeof(cfi_word)];
 		cfi_word datum;
=20
-		map->copy_from(map, tmp_buf, bus_ofs + cfi->chips[chipnum].start, CFIDEV=
_BUSWIDTH);
-		while (len && i < CFIDEV_BUSWIDTH)
-			tmp_buf[i++] =3D buf[n++], len--;
+ retry:
+	cfi_spin_lock(cfi->chips[chipnum].mutex);
=20
+	if (cfi->chips[chipnum].state !=3D FL_READY) {
+#if 0
+	        printk(KERN_DEBUG "Waiting for chip to write, status =3D %d\n", c=
fi->chips[chipnum].state);
+#endif
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		add_wait_queue(&cfi->chips[chipnum].wq, &wait);
+               =20
+		cfi_spin_unlock(cfi->chips[chipnum].mutex);
+
+		schedule();
+		remove_wait_queue(&cfi->chips[chipnum].wq, &wait);
+#if 0
+		printk(KERN_DEBUG "Wake up to write:\n");
+		if(signal_pending(current))
+			return -EINTR;
+#endif
+		goto retry;
+	}
+        =09
+		map->copy_from(map, tmp_buf, bus_ofs + cfi->chips[chipnum].start, CFIDEV=
_BUSWIDTH);
+               =20
+		cfi_spin_unlock(cfi->chips[chipnum].mutex);
+               =20
+		while (len && i < CFIDEV_BUSWIDTH) {
+			tmp_buf[i++] =3D buf[n++];
+                        len--;
+                }
 		if (cfi_buswidth_is_2()) {
 			datum =3D *(__u16*)tmp_buf;
 		} else if (cfi_buswidth_is_4()) {
@@ -794,7 +829,32 @@
 		u_char tmp_buf[sizeof(cfi_word)];
 		cfi_word datum;
=20
+ retry1:
+	cfi_spin_lock(cfi->chips[chipnum].mutex);
+
+	if (cfi->chips[chipnum].state !=3D FL_READY) {
+#if 0
+	        printk(KERN_DEBUG "Waiting for chip to write, status =3D %d\n", c=
fi->chips[chipnum].state);
+#endif
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		add_wait_queue(&cfi->chips[chipnum].wq, &wait);
+               =20
+		cfi_spin_unlock(cfi->chips[chipnum].mutex);
+
+		schedule();
+		remove_wait_queue(&cfi->chips[chipnum].wq, &wait);
+#if 0
+		printk(KERN_DEBUG "Wake up to write:\n");
+		if(signal_pending(current))
+			return -EINTR;
+#endif
+		goto retry1;
+	}
+        =09
 		map->copy_from(map, tmp_buf, ofs + cfi->chips[chipnum].start, CFIDEV_BUS=
WIDTH);
+               =20
+		cfi_spin_unlock(cfi->chips[chipnum].mutex);
+
 		while (len--)
 			tmp_buf[i++] =3D buf[n++];
=20
@@ -822,16 +882,17 @@
=20
 static inline int do_erase_chip(struct map_info *map, struct flchip *chip)
 {
-	unsigned int oldstatus, status, prev_oldstatus, prev_status;
-	unsigned int dq6;
 	unsigned long timeo =3D jiffies + HZ;
 	unsigned long int adr;
 	struct cfi_private *cfi =3D map->fldrv_priv;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret =3D 0;
 	int ta =3D 0;
-	cfi_word ones =3D 0;
=20
+	cfi_word status, prev_status;
+	cfi_word dq7, dq5;
+	cfi_word ones =3D 0;
+       =20
  retry:
 	cfi_spin_lock(chip->mutex);
=20
@@ -879,15 +940,14 @@
 	 * command to the chip.
 	 */
 	/* see comments in do_write_oneword */
-	dq6 =3D CMD(1<<6);
+	dq7 =3D CMD(1<<7);
+	dq5 =3D CMD(1<<5);
=20
-	oldstatus =3D cfi_read(map, adr);
 	status =3D cfi_read(map, adr);
-	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",
-	       __func__, oldstatus, status );
-
-	while( ( ( status ^ oldstatus ) & dq6 )
-	       && ! ( ta =3D time_after(jiffies, timeo) ) ) {
+       =20
+	while( ((status & dq7) !=3D dq7) &&=20
+	       ((status & dq5) !=3D dq5) &&
+	       ! ( ta =3D time_after(jiffies, timeo) ) ) {
 		int wait_reps;
=20
 		/* an initial short sleep */
@@ -916,8 +976,9 @@
=20
 		/* Busy wait for 1/10 of a milisecond */
 		for(wait_reps =3D 0;
-		    (wait_reps < 100)
-			    && ( ( status ^ oldstatus ) & dq6 );
+		    (wait_reps < 100) &&
+		    ((status & dq7) !=3D dq7) &&=20
+		    ((status & dq5) !=3D dq5);
 		    wait_reps++) {
 		=09
 			/* Latency issues. Drop the lock, wait a while and retry */
@@ -926,23 +987,17 @@
 			cfi_udelay(1);
=20
 			cfi_spin_lock(chip->mutex);
-			oldstatus =3D cfi_read(map, adr);
 			status =3D cfi_read(map, adr);
-			DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",
-			       __func__, oldstatus, status );
 		}
-		oldstatus =3D cfi_read(map, adr);
 		status =3D cfi_read(map, adr);
 		DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",
-		       __func__, oldstatus, status );
+		       __func__, status );
 	}
=20
-	prev_oldstatus =3D oldstatus;
 	prev_status =3D status;
-	oldstatus =3D cfi_read(map, adr);
 	status =3D cfi_read(map, adr);
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",
-	       __func__, oldstatus, status );
+	       __func__, status );
=20
 	if ( cfi_buswidth_is_1() ) {
 		ones =3D  (__u8)~0;
@@ -950,18 +1005,20 @@
 		ones =3D (__u16)~0;
 	} else if ( cfi_buswidth_is_4() ) {
 		ones =3D (__u32)~0;
+        } else if ( cfi_buswidth_is_8() ) {
+	        ones =3D (__u64)~0;
 	} else {
-		printk(KERN_WARNING "Unsupported buswidth\n");
+		printk(KERN_WARNING "Unsupported buswidth %d\n",CFIDEV_BUSWIDTH);
 		goto erase_failed;
 	}
 =09
-	if ( oldstatus =3D=3D ones && status =3D=3D ones ) {
+	if ( prev_status =3D=3D ones && status =3D=3D ones ) {
 		/* success - do nothing */
 		goto erase_done;
 	}
=20
 	if ( ta ) {
-		int dq5mask =3D ( ( status ^ oldstatus ) & dq6 ) >> 1;
+		cfi_word dq5mask =3D ( ( status ^ prev_status ) & dq7 ) >> 2;
 		if ( status & dq5mask ) {
 			/* dq5 asserted - decode interleave chips */
 			printk( KERN_WARNING
@@ -981,10 +1038,9 @@
 	       __func__ );
=20
 	printk(KERN_WARNING
-	       "MTD %s(): 0x%.8lx(0x%.8x): 0x%.8x 0x%.8x 0x%.8x 0x%.8x\n",
+	       "MTD %s(): 0x%.8lx(0x%.8x): 0x%.8x 0x%.8x\n",
 	       __func__, adr, ones,
-	       prev_oldstatus, prev_status,
-	       oldstatus, status);
+	       prev_status, status);
=20
  erase_failed:
 	ret =3D -EIO;
@@ -1003,15 +1059,17 @@
=20
 static inline int do_erase_oneblock(struct map_info *map, struct flchip *c=
hip, unsigned long adr)
 {
-	unsigned int oldstatus, status, prev_oldstatus, prev_status;
-	unsigned int dq6;
 	unsigned long timeo =3D jiffies + HZ;
 	struct cfi_private *cfi =3D map->fldrv_priv;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret =3D 0;
 	int ta =3D 0;
+        int i;
+       =20
+	cfi_word status, prev_status;
+	cfi_word dq7, dq5;
 	cfi_word ones =3D 0;
-
+       =20
  retry:
 	cfi_spin_lock(chip->mutex);
=20
@@ -1035,7 +1093,7 @@
 	chip->state =3D FL_ERASING;
=20
 	adr +=3D chip->start;
-	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): ERASE 0x%.8lx\n",
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): ERASE 0x%.8x 0x%.8x\n",
 	       __func__, adr );
=20
 	ENABLE_VPP(map);
@@ -1044,7 +1102,6 @@
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVI=
CETYPE_X8, NULL);
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVI=
CETYPE_X8, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVI=
CETYPE_X8, NULL);
-
 	cfi_write(map, CMD(0x30), adr);
 =09
 	timeo =3D jiffies + (HZ*20);
@@ -1055,19 +1112,21 @@
 	 * The toggling stops as soon as the procedure is completed.
 	 *
 	 * If the process has gone on for too long on the chip bit 5 gets.
-	 * After bit5 is set you can kill the operation by sending a reset
+	 * After bit5 is set you can kill the operation by Wackysending a reset
 	 * command to the chip.
 	 */
 	/* see comments in do_write_oneword */
-	dq6 =3D CMD(1<<6);
+	dq7 =3D CMD(1<<7);
+	dq5 =3D CMD(1<<5);
=20
-	oldstatus =3D cfi_read(map, adr);
-	status =3D cfi_read(map, adr);
-	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",
-	       __func__, oldstatus, status );
+	status    =3D cfi_read(map, adr);
=20
-	while( ( ( status ^ oldstatus ) & dq6 )
-	       && ! ( ta =3D time_after(jiffies, timeo) ) ) {
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x\n",
+	       __func__, status );
+
+	while( ((status & dq7) !=3D dq7) &&=20
+	       ((status & dq5) !=3D dq5) &&
+		!( ta =3D time_after(jiffies, timeo) )) {
 		int wait_reps;
=20
 		/* an initial short sleep */
@@ -1096,9 +1155,10 @@
=20
 		/* Busy wait for 1/10 of a milisecond */
 		for(wait_reps =3D 0;
-		    (wait_reps < 100)
-			    && ( ( status ^ oldstatus ) & dq6 );
-		    wait_reps++) {
+		    (wait_reps < 100) &&
+			((status & dq7) !=3D dq7) &&=20
+			((status & dq5) !=3D dq5);
+			wait_reps++) {
 		=09
 			/* Latency issues. Drop the lock, wait a while and retry */
 			cfi_spin_unlock(chip->mutex);
@@ -1106,23 +1166,19 @@
 			cfi_udelay(1);
 	=09
 			cfi_spin_lock(chip->mutex);
-			oldstatus =3D cfi_read(map, adr);
 			status =3D cfi_read(map, adr);
 			DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",
-			       __func__, oldstatus, status );
+			       __func__, status );
 		}
-		oldstatus =3D cfi_read(map, adr);
 		status =3D cfi_read(map, adr);
-		DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",
-		       __func__, oldstatus, status );
+		DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x\n",
+		       __func__, status );
 	}
+	prev_status     =3D status;
+	status          =3D cfi_read(map, adr);
=20
-	prev_oldstatus =3D oldstatus;
-	prev_status =3D status;
-	oldstatus =3D cfi_read(map, adr);
-	status =3D cfi_read(map, adr);
-	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",
-	       __func__, oldstatus, status );
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x\n",
+	       __func__, status );
=20
 	if ( cfi_buswidth_is_1() ) {
 		ones =3D  (__u8)~0;
@@ -1130,18 +1186,20 @@
 		ones =3D (__u16)~0;
 	} else if ( cfi_buswidth_is_4() ) {
 		ones =3D (__u32)~0;
+	} else if ( cfi_buswidth_is_8() ) {
+		ones =3D (__u64)~0;
 	} else {
-		printk(KERN_WARNING "Unsupported buswidth\n");
+		printk(KERN_WARNING "Unsupported buswidth %d\n",CFIDEV_BUSWIDTH);
 		goto erase_failed;
 	}
=20
-	if ( oldstatus =3D=3D ones && status =3D=3D ones ) {
+	if ( prev_status =3D=3D ones && status =3D=3D ones ) {
 		/* success - do nothing */
 		goto erase_done;
 	}
=20
 	if ( ta ) {
-		int dq5mask =3D ( ( status ^ oldstatus ) & dq6 ) >> 1;
+		cfi_word dq5mask =3D ( ( status ^ prev_status ) & dq7 ) >> 2;
 		if ( status & dq5mask ) {
 			/* dq5 asserted - decode interleave chips */
 			printk( KERN_WARNING
@@ -1161,10 +1219,9 @@
 	       __func__ );
=20
 	printk(KERN_WARNING
-	       "MTD %s(): 0x%.8lx(0x%.8x): 0x%.8x 0x%.8x 0x%.8x 0x%.8x\n",
+	       "MTD %s(): 0x%.8lx(0x%.8x): 0x%.8x 0x%.8x\n",
 	       __func__, adr, ones,
-	       prev_oldstatus, prev_status,
-	       oldstatus, status);
+	       prev_status, status);
=20
  erase_failed:
 	ret =3D -EIO;
@@ -1174,6 +1231,7 @@
=20
  erase_done:
 	DISABLE_VPP(map);
+       =20
 	chip->state =3D FL_READY;
 	wake_up(&chip->wq);
 	cfi_spin_unlock(chip->mutex);

--=-ta44nCJhAFB73Jk4IgaK--
