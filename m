Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bMLb-0004Bv-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 13:54:51 +0000
Received: from jocke.lumentis.se (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id PAA27967
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 15:05:35 +0100 (MET)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
To: linux-mtd@lists.infradead.org
Subject: cfi_cmdset0001.c: bug fixes and new features.
Date: Thu, 14 Feb 2002 15:05:34 +0100
References: <0111121314140A.28381@jocke.lumentis.se> <02010409585400.10979@jocke.lumentis.se> <02012911331100.15969@jocke.lumentis.se>
In-Reply-To: <02012911331100.15969@jocke.lumentis.se>
MIME-Version: 1.0
Message-Id: <02021415053402.15969@jocke.lumentis.se>
Content-Transfer-Encoding: 8bit
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

Hi again

I hve fixed a few minor bugs:
1)  
-               extp->FeatureSupport = cfi32_to_cpu(extp->FeatureSupport);
-               extp->BlkStatusRegMask = cfi32_to_cpu(extp->BlkStatusRegMask);
-               extp->ProtRegAddr = cfi32_to_cpu(extp->ProtRegAddr);
+               extp->FeatureSupport = le32_to_cpu(extp->FeatureSupport);
+               extp->BlkStatusRegMask = le16_to_cpu(extp->BlkStatusRegMask);
+               extp->ProtRegAddr = le16_to_cpu(extp->ProtRegAddr);

This flash always reports these in litte endian. This corrects things on a BE CPU. Not sure if this
is the correct fix though.

2)
-               if (!((struct cfi_pri_intelext *)cfi->cmdset_priv)->FeatureSupport & 2)
+               if (! (extp->FeatureSupport & 2))

was doing if ( (!*p) & 2), should be if (! (*p &2))

New features:
3)
+#ifdef CONFIG_BUGGY_CMDSET001_CHIPS
+               /* Disable Erase Suspend function in flash, needed by early revisions of Intel Strata chips */
+               extp->FeatureSupport &= ~2;
+#endif
No explanation needed :-)

4)
    Rest of the patch:
         improves suspending erase to do a read.
         adds suspending erase to do a write.

The path is against: $Id: cfi_cmdset_0001.c,v 1.91 2002/01/10 20:27:40 eric Exp $
since thats what I am using.

Comments?

             Jocke

Patch follows:
I--- /usr/local/src/MTD/mtd/drivers/mtd/chips/cfi_cmdset_0001.c	Mon Jan 21 14:06:02 2002
+++ drivers/mtd/chips/cfi_cmdset_0001.c	Thu Feb 14 15:02:15 2002
@@ -4,7 +4,7 @@
  *
  * (C) 2000 Red Hat. GPL'd
  *
- * $Id: cfi_cmdset_0001.c,v 1.91 2002/01/10 20:27:40 eric Exp $
+ * $Id: cfi_cmdset_0001.c,v 1.4 2002/01/31 13:56:10 jocke Exp $
  *
  * 
  * 10/10/2000	Nicolas Pitre <nico@cam.org>
@@ -61,6 +61,8 @@
 #ifdef DEBUG_CFI_FEATURES
 static void cfi_tell_features(struct cfi_pri_intelext *extp)
 {
+	int i;
+
 	printk("  Feature/Command Support: %4.4X\n", extp->FeatureSupport);
 	printk("     - Chip Erase:         %s\n", extp->FeatureSupport&1?"supported":"unsupported");
 	printk("     - Suspend Erase:      %s\n", extp->FeatureSupport&2?"supported":"unsupported");
@@ -151,15 +153,20 @@
 		}
 		
 		/* Do some byteswapping if necessary */
-		extp->FeatureSupport = cfi32_to_cpu(extp->FeatureSupport);
-		extp->BlkStatusRegMask = cfi32_to_cpu(extp->BlkStatusRegMask);
-		extp->ProtRegAddr = cfi32_to_cpu(extp->ProtRegAddr);
+		extp->FeatureSupport = le32_to_cpu(extp->FeatureSupport);
+		extp->BlkStatusRegMask = le16_to_cpu(extp->BlkStatusRegMask);
+		extp->ProtRegAddr = le16_to_cpu(extp->ProtRegAddr);
 			
 #ifdef DEBUG_CFI_FEATURES
 		/* Tell the user about it in lots of lovely detail */
 		cfi_tell_features(extp);
 #endif	
 
+#ifdef CONFIG_BUGGY_CMDSET001_CHIPS
+		/* Disable Erase Suspend function in flash, needed by early revisions of Intel Strata chips */
+		extp->FeatureSupport &= ~2;
+#endif	
+
 		/* Install our own private info structure */
 		cfi->cmdset_priv = extp;	
 	}
@@ -213,7 +220,7 @@
 		unsigned long ernum, ersize;
 		ersize = ((cfi->cfiq->EraseRegionInfo[i] >> 8) & ~0xff) * cfi->interleave;
 		ernum = (cfi->cfiq->EraseRegionInfo[i] & 0xffff) + 1;
-
+		
 		if (mtd->erasesize < ersize) {
 			mtd->erasesize = ersize;
 		}
@@ -223,25 +230,25 @@
 			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].numblocks = ernum;
 		}
 		offset += (ersize * ernum);
-		}
-
-		if (offset != devsize) {
-			/* Argh */
-			printk(KERN_WARNING "Sum of regions (%lx) != total size of set of interleaved chips (%lx)\n", offset, devsize);
-			kfree(mtd->eraseregions);
-			kfree(cfi->cmdset_priv);
-			return NULL;
-		}
-
-		for (i=0; i<mtd->numeraseregions;i++){
-			printk(KERN_DEBUG "%d: offset=0x%x,size=0x%x,blocks=%d\n",
-			       i,mtd->eraseregions[i].offset,
-			       mtd->eraseregions[i].erasesize,
-			       mtd->eraseregions[i].numblocks);
-		}
+	}
+	
+	if (offset != devsize) {
+		/* Argh */
+		printk(KERN_WARNING "Sum of regions (%lx) != total size of set of interleaved chips (%lx)\n", offset, devsize);
+		kfree(mtd->eraseregions);
+		kfree(cfi->cmdset_priv);
+		return NULL;
+	}
+	
+	for (i=0; i<mtd->numeraseregions;i++){
+		printk(KERN_DEBUG "%d: offset=0x%x,size=0x%x,blocks=%d\n",
+		       i,mtd->eraseregions[i].offset,
+		       mtd->eraseregions[i].erasesize,
+		       mtd->eraseregions[i].numblocks);
+	}
 
 	/* Also select the correct geometry setup too */ 
-		mtd->erase = cfi_intelext_erase_varsize;
+	mtd->erase = cfi_intelext_erase_varsize;
 	mtd->read = cfi_intelext_read;
 	if ( cfi->cfiq->BufWriteTimeoutTyp ) {
 		//printk(KERN_INFO "Using buffer write method\n" );
@@ -273,6 +280,7 @@
 	int suspended = 0;
 	unsigned long cmd_addr;
 	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 
 	adr += chip->start;
 
@@ -291,7 +299,7 @@
 	 */
 	switch (chip->state) {
 	case FL_ERASING:
-		if (!((struct cfi_pri_intelext *)cfi->cmdset_priv)->FeatureSupport & 2)
+		if (! (extp->FeatureSupport & 2))
 			goto sleep; /* We don't support erase suspend */
 		
 		cfi_write (map, CMD(0xb0), cmd_addr);
@@ -325,8 +333,10 @@
 			cfi_udelay(1);
 			spin_lock_bh(chip->mutex);
 		}
+		/* see if chip was suspended or if it completed the erase cycle */
+		if (status & CMD(0x40))
+			suspended = 1; 	/* at least one chip has been suspended */
 		
-		suspended = 1;
 		cfi_write(map, CMD(0xff), cmd_addr);
 		chip->state = FL_READY;
 		break;
@@ -551,10 +561,11 @@
 static int do_write_oneword(struct map_info *map, struct flchip *chip, unsigned long adr, __u32 datum)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 	__u32 status, status_OK;
 	unsigned long timeo;
 	DECLARE_WAITQUEUE(wait, current);
-	int z;
+	int z, suspended=0;
 
 	adr += chip->start;
 
@@ -565,11 +576,6 @@
  retry:
 	spin_lock_bh(chip->mutex);
 
-	/* Check that the chip's ready to talk to us.
-	 * Later, we can actually think about interrupting it
-	 * if it's in FL_ERASING state.
-	 * Not just yet, though.
-	 */
 	switch (chip->state) {
 	case FL_READY:
 		break;
@@ -596,7 +602,52 @@
 		cfi_udelay(1);
 		goto retry;
 
+	case FL_ERASING:
+		if (! ((extp->FeatureSupport & 2) && (extp->SuspendCmdSupport & 1)))
+			goto sleep; /* We don't support program in erase suspend */
+		
+		cfi_write (map, CMD(0xb0), adr);
+
+		/* If the flash has finished erasing, then 'erase suspend'
+		 * appears to make some (28F320) flash devices switch to
+		 * 'read' mode.  Make sure that we switch to 'read status'
+		 * mode so we get the right data. --rmk
+		 */
+		cfi_write(map, CMD(0x70), adr);
+		chip->oldstate = FL_ERASING;
+		chip->state = FL_ERASE_SUSPENDING;
+		//printk("Erase suspending at 0x%lx\n", adr);
+		for (;;) {
+			status = cfi_read(map, adr);
+			if ((status & status_OK) == status_OK)
+				break;
+			
+			if (time_after(jiffies, timeo)) {
+				/* Urgh */
+				cfi_write(map, CMD(0xd0), adr);
+				/* make sure we're in 'read status' mode */
+				cfi_write(map, CMD(0x70), adr);
+				chip->state = FL_ERASING;
+				spin_unlock_bh(chip->mutex);
+				printk(KERN_ERR "Chip not ready after erase "
+				       "suspended: status = 0x%x\n", status);
+				return -EIO;
+			}
+			
+			spin_unlock_bh(chip->mutex);
+			cfi_udelay(1);
+			spin_lock_bh(chip->mutex);
+		}
+		/* see if chip(s) was suspended or if it completed the erase cycle */
+		if (status & CMD(0x40)){
+			suspended = 1; 	/* at least one chip has been suspended */
+			//printk("Erase was suspended at 0x%lx\n", adr);
+		}
+		chip->state = FL_STATUS;
+		break;
+
 	default:
+	sleep:
 		/* Stick ourselves on a wait queue to be woken when
 		   someone changes the status */
 		set_current_state(TASK_UNINTERRUPTIBLE);
@@ -661,20 +712,33 @@
 
 	/* Done and happy. */
 	DISABLE_VPP(map);
-	chip->state = FL_STATUS;
+
 	/* check for lock bit */
 	if (status & CMD(0x02)) {
-		/* clear status */
-		cfi_write(map, CMD(0x50), adr);
-		/* put back into read status register mode */
+		cfi_write(map, CMD(0x50), adr); /* clear status */
+	}
+
+	if (suspended) {
+		chip->state = chip->oldstate;
+		/* What if one interleaved chip has finished and the 
+		   other hasn't? The old code would leave the finished
+		   one in READY mode. That's bad, and caused -EROFS 
+		   errors to be returned from do_erase_oneblock because
+		   that's the only bit it checked for at the time.
+		   As the state machine appears to explicitly allow 
+		   sending the 0x70 (Read Status) command to an erasing
+		   chip and expecting it to be ignored, that's what we 
+		   do. */
+		cfi_write(map, CMD(0xd0), adr);
 		cfi_write(map, CMD(0x70), adr);
-		wake_up(&chip->wq);
-		spin_unlock_bh(chip->mutex);
-		return -EROFS;
+	} else {
+                /* Must be leave with FL_READY since we may have suspended an erase which compleated during suspend */
+		cfi_write(map, CMD(0xff), adr);
+		chip->state = FL_READY;
 	}
 	wake_up(&chip->wq);
 	spin_unlock_bh(chip->mutex);
-	return 0;
+	return (status & CMD(0x02) ? -EROFS : 0);
 }
 
 
@@ -798,10 +862,11 @@
 				  unsigned long adr, const u_char *buf, int len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 	__u32 status, status_OK;
 	unsigned long cmd_adr, timeo;
 	DECLARE_WAITQUEUE(wait, current);
-	int wbufsize, z;
+	int wbufsize, z, suspended=0;
 
 	wbufsize = CFIDEV_INTERLEAVE << cfi->cfiq->MaxBufWriteSize;
 	adr += chip->start;
@@ -814,11 +879,6 @@
  retry:
 	spin_lock_bh(chip->mutex);
 
-	/* Check that the chip's ready to talk to us.
-	 * Later, we can actually think about interrupting it
-	 * if it's in FL_ERASING state.
-	 * Not just yet, though.
-	 */
 	switch (chip->state) {
 	case FL_READY:
 	case FL_CFI_QUERY:
@@ -842,7 +902,53 @@
 		cfi_udelay(1);
 		goto retry;
 
+	case FL_ERASING:
+		if (! ((extp->FeatureSupport & 2) && (extp->SuspendCmdSupport & 1)))
+			goto sleep; /* We don't support erase suspend */
+		
+		cfi_write (map, CMD(0xb0), adr);
+
+		/* If the flash has finished erasing, then 'erase suspend'
+		 * appears to make some (28F320) flash devices switch to
+		 * 'read' mode.  Make sure that we switch to 'read status'
+		 * mode so we get the right data. --rmk
+		 */
+		cfi_write(map, CMD(0x70), adr);
+		chip->oldstate = FL_ERASING;
+		chip->state = FL_ERASE_SUSPENDING;
+		//printk("Erase suspending at 0x%lx\n", adr);
+		for (;;) {
+			status = cfi_read(map, adr);
+			if ((status & status_OK) == status_OK)
+				break;
+			
+			if (time_after(jiffies, timeo)) {
+				/* Urgh */
+				cfi_write(map, CMD(0xd0), adr);
+				/* make sure we're in 'read status' mode */
+				cfi_write(map, CMD(0x70), adr);
+				chip->state = FL_ERASING;
+				spin_unlock_bh(chip->mutex);
+				printk(KERN_ERR "Chip not ready after erase "
+				       "suspended: status = 0x%x\n", status);
+				return -EIO;
+			}
+			
+			spin_unlock_bh(chip->mutex);
+			cfi_udelay(1);
+			spin_lock_bh(chip->mutex);
+		}
+		/* see if chip was suspended or if it completed the erase cycle */
+		if (status & CMD(0x40)){
+			suspended = 1; 	/* at least one chip has been suspended */
+			//printk("Erase was suspended at 0x%lx\n", adr);
+		}
+		
+		chip->state = FL_STATUS;
+		break;
+
 	default:
+	sleep:
 		/* Stick ourselves on a wait queue to be woken when
 		   someone changes the status */
 		set_current_state(TASK_UNINTERRUPTIBLE);
@@ -959,20 +1065,33 @@
 
 	/* Done and happy. */
 	DISABLE_VPP(map);
-	chip->state = FL_STATUS;
-	/* check for lock bit */
+	
+        /* check for lock bit */
 	if (status & CMD(0x02)) {
-		/* clear status */
-		cfi_write(map, CMD(0x50), cmd_adr);
-		/* put back into read status register mode */
-		cfi_write(map, CMD(0x70), adr);
-		wake_up(&chip->wq);
-		spin_unlock_bh(chip->mutex);
-		return -EROFS;
+		cfi_write(map, CMD(0x50), adr); /* clear status */
+	}
+	if (suspended) {
+		//printk("Erase resumed at 0x%lx\n", adr);
+		chip->state = chip->oldstate;
+		/* What if one interleaved chip has finished and the 
+		   other hasn't? The old code would leave the finished
+		   one in READY mode. That's bad, and caused -EROFS 
+		   errors to be returned from do_erase_oneblock because
+		   that's the only bit it checked for at the time.
+		   As the state machine appears to explicitly allow 
+		   sending the 0x70 (Read Status) command to an erasing
+		   chip and expecting it to be ignored, that's what we 
+		   do. */
+		cfi_write(map, CMD(0xd0), adr);
+		cfi_write(map, CMD(0x70), adr);		
+	} else {
+		/* Must be leave with FL_READY since we may have suspended an erase which compleated during suspend */
+		cfi_write(map, CMD(0xff), adr);
+		chip->state = FL_READY;
 	}
 	wake_up(&chip->wq);
 	spin_unlock_bh(chip->mutex);
-	return 0;
+	return (status & CMD(0x02) ? -EROFS : 0);
 }
 
 static int cfi_intelext_write_buffers (struct mtd_info *mtd, loff_t to, 
@@ -1126,6 +1245,8 @@
 
 	timeo = jiffies + (HZ*20);
 	for (;;) {
+		if(chip->state == FL_READY)
+			break; /* erase has compleated and someone put the chip into ready state */ 
 		if (chip->state != FL_ERASING) {
 			/* Someone's suspended the erase. Sleep */
 			set_current_state(TASK_UNINTERRUPTIBLE);
@@ -1151,7 +1272,7 @@
 		if (time_after(jiffies, timeo)) {
 			cfi_write(map, CMD(0x70), adr);
 			chip->state = FL_STATUS;
-			printk(KERN_ERR "waiting for erase at %08x to complete timed out. Xstatus = %x, status = %x.\n", adr, status, cfi_read(map, adr));
+			printk(KERN_ERR "waiting for erase at %08lx to complete timed out. Xstatus = %x, status = %x.\n", adr, status, cfi_read(map, adr));
 			/* Clear status bits */
 			cfi_write(map, CMD(0x50), adr);
 			cfi_write(map, CMD(0x70), adr);
