Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bRUz-0004an-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 19:24:53 +0000
Received: from phobos.hpl.hp.com ([192.6.19.124])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 16bRfe-00070D-00
	for linux-mtd@lists.infradead.org; Thu, 14 Feb 2002 19:35:54 +0000
To: ch@murgatroid.com, dwmw2@readhat.com, linux-mtd@lists.infradead.org
Subject: patch for lock/unlock with varsize (against infradead cvs)
Message-Id: <20020214193546.1080123DC12@friction.hpl.hp.com>
Date: Thu, 14 Feb 2002 11:35:46 -0800 (PST)
From: ch@friction.hpl.hp.com (Christopher Hoover)
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

Index: drivers/mtd/chips/cfi_cmdset_0001.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0001.c,v
retrieving revision 1.93
diff -a -u -r1.93 cfi_cmdset_0001.c
--- drivers/mtd/chips/cfi_cmdset_0001.c	2002/01/31 17:44:04	1.93
+++ drivers/mtd/chips/cfi_cmdset_0001.c	2002/02/14 02:05:27
@@ -13,6 +13,8 @@
  * 	- scalability vs code size is completely set at compile-time
  * 	  (see include/linux/mtd/cfi.h for selection)
  *	- optimized write buffer method
+ * 02/05/2002	Christopher Hoover <ch@hpl.hp.com>/<ch@murgatroid.com>
+ *	- reworked lock/unlock/erase support for var size flash
  */
 
 #include <linux/module.h>
@@ -57,12 +59,14 @@
 	module: THIS_MODULE
 };
 
-/* #define DEBUG_LOCK_BITS */
-/* #define DEBUG_CFI_FEATURES */
+//#define DEBUG_LOCK_BITS
+//#define DEBUG_CFI_FEATURES
 
 #ifdef DEBUG_CFI_FEATURES
 static void cfi_tell_features(struct cfi_pri_intelext *extp)
 {
+	int i;
+
 	printk("  Feature/Command Support: %4.4X\n", extp->FeatureSupport);
 	printk("     - Chip Erase:         %s\n", extp->FeatureSupport&1?"supported":"unsupported");
 	printk("     - Suspend Erase:      %s\n", extp->FeatureSupport&2?"supported":"unsupported");
@@ -1077,10 +1081,101 @@
 	return 0;
 }
 
+typedef int (*varsize_frob_t)(struct map_info *map, struct flchip *chip,
+			      unsigned long adr, void *thunk);
 
-static inline int do_erase_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr)
+static int cfi_intelext_varsize_frob(struct mtd_info *mtd, varsize_frob_t frob,
+				     loff_t ofs, size_t len, void *thunk)
 {
+	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
+	unsigned long adr;
+	int chipnum, ret = 0;
+	int i, first;
+	struct mtd_erase_region_info *regions = mtd->eraseregions;
+
+	if (ofs > mtd->size)
+		return -EINVAL;
+
+	if ((len + ofs) > mtd->size)
+		return -EINVAL;
+
+	/* Check that both start and end of the requested erase are
+	 * aligned with the erasesize at the appropriate addresses.
+	 */
+
+	i = 0;
+
+	/* Skip all erase regions which are ended before the start of 
+	   the requested erase. Actually, to save on the calculations,
+	   we skip to the first erase region which starts after the
+	   start of the requested erase, and then go back one.
+	*/
+	
+	while (i < mtd->numeraseregions && ofs >= regions[i].offset)
+	       i++;
+	i--;
+
+	/* OK, now i is pointing at the erase region in which this 
+	   erase request starts. Check the start of the requested
+	   erase range is aligned with the erase size which is in
+	   effect here.
+	*/
+
+	if (ofs & (regions[i].erasesize-1))
+		return -EINVAL;
+
+	/* Remember the erase region we start on */
+	first = i;
+
+	/* Next, check that the end of the requested erase is aligned
+	 * with the erase region at that address.
+	 */
+
+	while (i<mtd->numeraseregions && (ofs + len) >= regions[i].offset)
+		i++;
+
+	/* As before, drop back one to point at the region in which
+	   the address actually falls
+	*/
+	i--;
+	
+	if ((ofs + len) & (regions[i].erasesize-1))
+		return -EINVAL;
+
+	chipnum = ofs >> cfi->chipshift;
+	adr = ofs - (chipnum << cfi->chipshift);
+
+	i=first;
+
+	while(len) {
+		ret = (*frob)(map, &cfi->chips[chipnum], adr, thunk);
+		
+		if (ret)
+			return ret;
+
+		adr += regions[i].erasesize;
+		len -= regions[i].erasesize;
+
+		if (adr % (1<< cfi->chipshift) == ((regions[i].offset + (regions[i].erasesize * regions[i].numblocks)) %( 1<< cfi->chipshift)))
+			i++;
+
+		if (adr >> cfi->chipshift) {
+			adr = 0;
+			chipnum++;
+			
+			if (chipnum >= cfi->numchips)
+			break;
+		}
+	}
+
+	return 0;
+}
+
+
+static int do_erase_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr, void *thunk)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
 	cfi_word status, status_OK;
 	unsigned long timeo;
 	int retries = 3;
@@ -1177,7 +1272,7 @@
 		if (time_after(jiffies, timeo)) {
 			cfi_write(map, CMD(0x70), adr);
 			chip->state = FL_STATUS;
-			printk(KERN_ERR "waiting for erase at %08x to complete timed out. Xstatus = %x, status = %x.\n", adr, status, cfi_read(map, adr));
+			printk(KERN_ERR "waiting for erase at %08lX to complete timed out. Xstatus = %X, status = %X.\n", adr, status, cfi_read(map, adr));
 			/* Clear status bits */
 			cfi_write(map, CMD(0x50), adr);
 			cfi_write(map, CMD(0x70), adr);
@@ -1209,7 +1304,7 @@
 				      chipstatus |= status >> (cfi->device_type * 8);
 			}
 #ifndef CFI_WORD_64
-			printk(KERN_WARNING "Status is not identical for all chips: 0x%lx. Merging to give 0x%02x\n", status, chipstatus);
+			printk(KERN_WARNING "Status is not identical for all chips: 0x%X. Merging to give 0x%02x\n", status, chipstatus);
 #else
 			printk(KERN_WARNING "Status is not identical for all chips: 0x%llx. Merging to give 0x%02x\n", status, chipstatus);
 #endif
@@ -1220,7 +1315,7 @@
 		
 		if ((chipstatus & 0x30) == 0x30) {
 #ifndef CFI_WORD_64
-			printk(KERN_NOTICE "Chip reports improper command sequence: status 0x%lx\n", status);
+			printk(KERN_NOTICE "Chip reports improper command sequence: status 0x%X\n", status);
 #else
 			printk(KERN_NOTICE "Chip reports improper command sequence: status 0x%llx\n", status);
 #endif
@@ -1231,7 +1326,7 @@
 		} else if (chipstatus & 0x8) {
 			/* Voltage */
 #ifndef CFI_WORD_64
-			printk(KERN_WARNING "Chip reports voltage low on erase: status 0x%lx\n", status);
+			printk(KERN_WARNING "Chip reports voltage low on erase: status 0x%X\n", status);
 #else
 			printk(KERN_WARNING "Chip reports voltage low on erase: status 0x%llx\n", status);
 #endif
@@ -1239,7 +1334,7 @@
 		} else if (chipstatus & 0x20) {
 			if (retries--) {
 #ifndef CFI_WORD_64
-				printk(KERN_DEBUG "Chip erase failed at 0x%08lx: status 0x%lx. Retrying...\n", adr, status);
+				printk(KERN_DEBUG "Chip erase failed at 0x%08lx: status 0x%X. Retrying...\n", adr, status);
 #else
 				printk(KERN_DEBUG "Chip erase failed at 0x%08lx: status 0x%llx. Retrying...\n", adr, status);
 #endif
@@ -1249,7 +1344,7 @@
 				goto retry;
 			}
 #ifndef CFI_WORD_64
-			printk(KERN_DEBUG "Chip erase failed at 0x%08lx: status 0x%lx\n", adr, status);
+			printk(KERN_DEBUG "Chip erase failed at 0x%08lx: status 0x%X\n", adr, status);
 #else
 			printk(KERN_DEBUG "Chip erase failed at 0x%08lx: status 0x%llx\n", adr, status);
 #endif
@@ -1263,89 +1358,17 @@
 }
 
 int cfi_intelext_erase_varsize(struct mtd_info *mtd, struct erase_info *instr)
-{	struct map_info *map = mtd->priv;
-	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long adr, len;
-	int chipnum, ret = 0;
-	int i, first;
-	struct mtd_erase_region_info *regions = mtd->eraseregions;
-
-	if (instr->addr > mtd->size)
-		return -EINVAL;
-
-	if ((instr->len + instr->addr) > mtd->size)
-		return -EINVAL;
-
-	/* Check that both start and end of the requested erase are
-	 * aligned with the erasesize at the appropriate addresses.
-	 */
-
-	i = 0;
-
-	/* Skip all erase regions which are ended before the start of 
-	   the requested erase. Actually, to save on the calculations,
-	   we skip to the first erase region which starts after the
-	   start of the requested erase, and then go back one.
-	*/
-	
-	while (i < mtd->numeraseregions && instr->addr >= regions[i].offset)
-	       i++;
-	i--;
-
-	/* OK, now i is pointing at the erase region in which this 
-	   erase request starts. Check the start of the requested
-	   erase range is aligned with the erase size which is in
-	   effect here.
-	*/
-
-	if (instr->addr & (regions[i].erasesize-1))
-		return -EINVAL;
-
-	/* Remember the erase region we start on */
-	first = i;
-
-	/* Next, check that the end of the requested erase is aligned
-	 * with the erase region at that address.
-	 */
-
-	while (i<mtd->numeraseregions && (instr->addr + instr->len) >= regions[i].offset)
-		i++;
-
-	/* As before, drop back one to point at the region in which
-	   the address actually falls
-	*/
-	i--;
-	
-	if ((instr->addr + instr->len) & (regions[i].erasesize-1))
-		return -EINVAL;
+{
+	unsigned long ofs, len;
+	int ret;
 
-	chipnum = instr->addr >> cfi->chipshift;
-	adr = instr->addr - (chipnum << cfi->chipshift);
+	ofs = instr->addr;
 	len = instr->len;
-
-	i=first;
 
-	while(len) {
-		ret = do_erase_oneblock(map, &cfi->chips[chipnum], adr);
-		
-		if (ret)
-			return ret;
+	ret = cfi_intelext_varsize_frob(mtd, do_erase_oneblock, ofs, len, 0);
+	if (ret)
+		return ret;
 
-		adr += regions[i].erasesize;
-		len -= regions[i].erasesize;
-
-		if (adr % (1<< cfi->chipshift) == ((regions[i].offset + (regions[i].erasesize * regions[i].numblocks)) %( 1<< cfi->chipshift)))
-			i++;
-
-		if (adr >> cfi->chipshift) {
-			adr = 0;
-			chipnum++;
-			
-			if (chipnum >= cfi->numchips)
-			break;
-		}
-	}
-		
 	instr->state = MTD_ERASE_DONE;
 	if (instr->callback)
 		instr->callback(instr);
@@ -1410,160 +1433,25 @@
 	}
 }
 
-static inline int do_lock_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr)
+#ifdef DEBUG_LOCK_BITS
+static int do_printlockstatus_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr, void *thunk)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	cfi_word status, status_OK;
-	unsigned long timeo = jiffies + HZ;
-	DECLARE_WAITQUEUE(wait, current);
-
-	adr += chip->start;
-
-	/* Let's determine this according to the interleave only once */
-	status_OK = CMD(0x80);
-
-	timeo = jiffies + HZ;
-retry:
-	spin_lock_bh(chip->mutex);
-
-	/* Check that the chip's ready to talk to us. */
-	switch (chip->state) {
-	case FL_CFI_QUERY:
-	case FL_JEDEC_QUERY:
-	case FL_READY:
-		cfi_write(map, CMD(0x70), adr);
-		chip->state = FL_STATUS;
-
-	case FL_STATUS:
-		status = cfi_read(map, adr);
-		if ((status & status_OK) == status_OK) 
-			break;
-		
-		/* Urgh. Chip not yet ready to talk to us. */
-		if (time_after(jiffies, timeo)) {
-			spin_unlock_bh(chip->mutex);
-			printk(KERN_ERR "waiting for chip to be ready timed out in lock\n");
-			return -EIO;
-		}
-
-		/* Latency issues. Drop the lock, wait a while and retry */
-		spin_unlock_bh(chip->mutex);
-		cfi_udelay(1);
-		goto retry;
-
-	default:
-		/* Stick ourselves on a wait queue to be woken when
-		   someone changes the status */
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		add_wait_queue(&chip->wq, &wait);
-		spin_unlock_bh(chip->mutex);
-		schedule();
-		remove_wait_queue(&chip->wq, &wait);
-		timeo = jiffies + HZ;
-		goto retry;
-	}
-
-	ENABLE_VPP(map);
-	cfi_write(map, CMD(0x60), adr);
-	cfi_write(map, CMD(0x01), adr);
-	chip->state = FL_LOCKING;
-	
-	spin_unlock_bh(chip->mutex);
-	schedule_timeout(HZ);
-	spin_lock_bh(chip->mutex);
-
-	/* FIXME. Use a timer to check this, and return immediately. */
-	/* Once the state machine's known to be working I'll do that */
-
-	timeo = jiffies + (HZ*2);
-	for (;;) {
+	int ofs_factor = cfi->interleave * cfi->device_type;
 
-		status = cfi_read(map, adr);
-		if ((status & status_OK) == status_OK)
-			break;
-		
-		/* OK Still waiting */
-		if (time_after(jiffies, timeo)) {
-			cfi_write(map, CMD(0x70), adr);
-			chip->state = FL_STATUS;
-#ifndef CFI_WORD_64
-			printk(KERN_ERR "waiting for lock to complete timed out. Xstatus = %lx, status = %lx.\n", status, cfi_read(map, adr));
-#else
-			printk(KERN_ERR "waiting for lock to complete timed out. Xstatus = %llx, status = %llx.\n", status, cfi_read(map, adr));
-#endif
-			DISABLE_VPP(map);
-			spin_unlock_bh(chip->mutex);
-			return -EIO;
-		}
-		
-		/* Latency issues. Drop the lock, wait a while and retry */
-		spin_unlock_bh(chip->mutex);
-		cfi_udelay(1);
-		spin_lock_bh(chip->mutex);
-	}
+	cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
+	printk(KERN_DEBUG "block status register for 0x%08lx is %x\n",
+	       adr, cfi_read_query(map, adr+(2*ofs_factor)));
+	cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
 	
-	/* Done and happy. */
-	chip->state = FL_STATUS;
-	DISABLE_VPP(map);
-	wake_up(&chip->wq);
-	spin_unlock_bh(chip->mutex);
 	return 0;
 }
-static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
-{
-	struct map_info *map = mtd->priv;
-	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long adr;
-	int chipnum, ret = 0;
-#ifdef DEBUG_LOCK_BITS
-	int ofs_factor = cfi->interleave * cfi->device_type;
 #endif
-
-	if (ofs & (mtd->erasesize - 1))
-		return -EINVAL;
 
-	if (len & (mtd->erasesize -1))
-		return -EINVAL;
+#define DO_XXLOCK_ONEBLOCK_LOCK		((void *) 1)
+#define DO_XXLOCK_ONEBLOCK_UNLOCK	((void *) 2)
 
-	if ((len + ofs) > mtd->size)
-		return -EINVAL;
-
-	chipnum = ofs >> cfi->chipshift;
-	adr = ofs - (chipnum << cfi->chipshift);
-
-	while(len) {
-
-#ifdef DEBUG_LOCK_BITS
-		cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
-		printk("before lock: block status register is %x\n",cfi_read_query(map, adr+(2*ofs_factor)));
-		cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
-#endif
-
-		ret = do_lock_oneblock(map, &cfi->chips[chipnum], adr);
-
-#ifdef DEBUG_LOCK_BITS
-		cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
-		printk("after lock: block status register is %x\n",cfi_read_query(map, adr+(2*ofs_factor)));
-		cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
-#endif	
-		
-		if (ret)
-			return ret;
-
-		adr += mtd->erasesize;
-		len -= mtd->erasesize;
-
-		if (adr >> cfi->chipshift) {
-			adr = 0;
-			chipnum++;
-			
-			if (chipnum >= cfi->numchips)
-			break;
-		}
-	}
-	return 0;
-}
-static inline int do_unlock_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr)
+static int do_xxlock_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr, void *thunk)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	cfi_word status, status_OK;
@@ -1595,7 +1483,7 @@
 		/* Urgh. Chip not yet ready to talk to us. */
 		if (time_after(jiffies, timeo)) {
 			spin_unlock_bh(chip->mutex);
-			printk(KERN_ERR "waiting for chip to be ready timed out in unlock\n");
+			printk(KERN_ERR __FUNCTION__ ": waiting for chip to be ready timed out\n");
 			return -EIO;
 		}
 
@@ -1618,9 +1506,16 @@
 
 	ENABLE_VPP(map);
 	cfi_write(map, CMD(0x60), adr);
-	cfi_write(map, CMD(0xD0), adr);
-	chip->state = FL_UNLOCKING;
-	
+
+	if (thunk == DO_XXLOCK_ONEBLOCK_LOCK) {
+		cfi_write(map, CMD(0x01), adr);
+		chip->state = FL_LOCKING;
+	} else if (thunk == DO_XXLOCK_ONEBLOCK_UNLOCK) {
+		cfi_write(map, CMD(0xD0), adr);
+		chip->state = FL_UNLOCKING;
+	} else
+		BUG();
+
 	spin_unlock_bh(chip->mutex);
 	schedule_timeout(HZ);
 	spin_lock_bh(chip->mutex);
@@ -1628,7 +1523,7 @@
 	/* FIXME. Use a timer to check this, and return immediately. */
 	/* Once the state machine's known to be working I'll do that */
 
-	timeo = jiffies + (HZ*2);
+	timeo = jiffies + (HZ*20);
 	for (;;) {
 
 		status = cfi_read(map, adr);
@@ -1640,16 +1535,16 @@
 			cfi_write(map, CMD(0x70), adr);
 			chip->state = FL_STATUS;
 #ifndef CFI_WORD_64
-			printk(KERN_ERR "waiting for unlock to complete timed out. Xstatus = %lx, status = %lx.\n", status, cfi_read(map, adr));
+			printk(KERN_ERR __FUNCTION__ ": waiting for xxlock to complete timed out. Xstatus = %X, status = %X.\n", status, cfi_read(map, adr));
 #else
-			printk(KERN_ERR "waiting for unlock to complete timed out. Xstatus = %llx, status = %llx.\n", status, cfi_read(map, adr));
+			printk(KERN_ERR __FUCNTION__ ": waiting for xxlock to complete timed out. Xstatus = %llx, status = %llx.\n", status, cfi_read(map, adr));
 #endif
 			DISABLE_VPP(map);
 			spin_unlock_bh(chip->mutex);
 			return -EIO;
 		}
 		
-		/* Latency issues. Drop the unlock, wait a while and retry */
+		/* Latency issues. Drop the lock, wait a while and retry */
 		spin_unlock_bh(chip->mutex);
 		cfi_udelay(1);
 		spin_lock_bh(chip->mutex);
@@ -1662,40 +1557,52 @@
 	spin_unlock_bh(chip->mutex);
 	return 0;
 }
-static int cfi_intelext_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
+
+static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
 {
-	struct map_info *map = mtd->priv;
-	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long adr;
-	int chipnum, ret = 0;
+	int ret;
+
 #ifdef DEBUG_LOCK_BITS
-	int ofs_factor = cfi->interleave * cfi->device_type;
+	printk(KERN_DEBUG __FUNCTION__ 
+	       ": lock status before, ofs=0x%08llx, len=0x%08X\n",
+	       ofs, len);
+	cfi_intelext_varsize_frob(mtd, do_printlockstatus_oneblock,
+				  ofs, len, 0);
 #endif
 
-	chipnum = ofs >> cfi->chipshift;
-	adr = ofs - (chipnum << cfi->chipshift);
-
+	ret = cfi_intelext_varsize_frob(mtd, do_xxlock_oneblock, 
+					ofs, len, DO_XXLOCK_ONEBLOCK_LOCK);
+	
 #ifdef DEBUG_LOCK_BITS
-	{
-		unsigned long temp_adr = adr;
-		unsigned long temp_len = len;
-                 
-		cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
-                while (temp_len) {
-			printk("before unlock %x: block status register is %x\n",temp_adr,cfi_read_query(map, temp_adr+(2*ofs_factor)));
-			temp_adr += mtd->erasesize;
-			temp_len -= mtd->erasesize;
-		}
-		cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
-	}
+	printk(KERN_DEBUG __FUNCTION__
+	       ": lock status after, ret=%d\n", ret);
+	cfi_intelext_varsize_frob(mtd, do_printlockstatus_oneblock,
+				  ofs, len, 0);
 #endif
 
-	ret = do_unlock_oneblock(map, &cfi->chips[chipnum], adr);
+	return ret;
+}
 
+static int cfi_intelext_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+	int ret;
+
 #ifdef DEBUG_LOCK_BITS
-	cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
-	printk("after unlock: block status register is %x\n",cfi_read_query(map, adr+(2*ofs_factor)));
-	cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
+	printk(KERN_DEBUG __FUNCTION__ 
+	       ": lock status before, ofs=0x%08llx, len=0x%08X\n",
+	       ofs, len);
+	cfi_intelext_varsize_frob(mtd, do_printlockstatus_oneblock,
+				  ofs, len, 0);
+#endif
+
+	ret = cfi_intelext_varsize_frob(mtd, do_xxlock_oneblock,
+					ofs, len, DO_XXLOCK_ONEBLOCK_UNLOCK);
+	
+#ifdef DEBUG_LOCK_BITS
+	printk(KERN_DEBUG __FUNCTION__
+	       ": lock status after, ret=%d\n", ret);
+	cfi_intelext_varsize_frob(mtd, do_printlockstatus_oneblock, 
+				  ofs, len, 0);
 #endif
 	
 	return ret;
