Received: from phobos.hpl.hp.com ([192.6.19.124])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iUtK-0002rR-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2002 06:27:10 +0000
Date: Tue, 5 Mar 2002 22:38:25 -0800
From: Christopher Hoover <ch@hpl.hp.com>
To: dwmw2@redhat.com
Cc: ch@murgatroid.com, linux-mtd@lists.infradead.org
Subject: Re: patch for lock/unlock with varsize (against infradead cvs)
Message-ID: <20020305223825.A17649@friction.hpl.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

On Mon, Feb 25, 2002, David Woodhouse wrote:
> ch@murgatroid.com said:
> >  (I'm not sure this applies cleanly anymore but it did as of
> > Valentine's Day.) 
> 
> It doesn't - I cleaned up the #ifdef CFI_WORD_64 stuff. Can I have another? 
> Sorry to be a pain.
> 
> --
> dwmw2


No problem.  Here you go.

Cheers,
-ch

mailto:ch@murgatroid.com
mailto:ch@hpl.hp.com


Index: cfi_cmdset_0001.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0001.c,v
retrieving revision 1.95
diff -u -p -r1.95 cfi_cmdset_0001.c
--- cfi_cmdset_0001.c	2002/02/21 19:09:02	1.95
+++ cfi_cmdset_0001.c	2002/03/06 06:17:30
@@ -13,6 +13,8 @@
  * 	- scalability vs code size is completely set at compile-time
  * 	  (see include/linux/mtd/cfi.h for selection)
  *	- optimized write buffer method
+ * 02/05/2002	Christopher Hoover <ch@hpl.hp.com>/<ch@murgatroid.com>
+ *	- reworked lock/unlock/erase support for var size flash
  */
 
 #include <linux/module.h>
@@ -1066,10 +1068,101 @@ static int cfi_intelext_write_buffers (s
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
@@ -1233,89 +1326,17 @@ retry:
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
-
-	while(len) {
-		ret = do_erase_oneblock(map, &cfi->chips[chipnum], adr);
-		
-		if (ret)
-			return ret;
 
-		adr += regions[i].erasesize;
-		len -= regions[i].erasesize;
-
-		if (adr % (1<< cfi->chipshift) == ((regions[i].offset + (regions[i].erasesize * regions[i].numblocks)) %( 1<< cfi->chipshift)))
-			i++;
+	ret = cfi_intelext_varsize_frob(mtd, do_erase_oneblock, ofs, len, 0);
+	if (ret)
+		return ret;
 
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
@@ -1380,156 +1401,25 @@ static void cfi_intelext_sync (struct mt
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
-			printk(KERN_ERR "waiting for lock to complete timed out. Xstatus = %llx, status = %llx.\n", (__u64)status, (__u64)cfi_read(map, adr));
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
-
-	if (len & (mtd->erasesize -1))
-		return -EINVAL;
 
-	if ((len + ofs) > mtd->size)
-		return -EINVAL;
+#define DO_XXLOCK_ONEBLOCK_LOCK		((void *) 1)
+#define DO_XXLOCK_ONEBLOCK_UNLOCK	((void *) 2)
 
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
@@ -1561,7 +1451,7 @@ retry:
 		/* Urgh. Chip not yet ready to talk to us. */
 		if (time_after(jiffies, timeo)) {
 			spin_unlock_bh(chip->mutex);
-			printk(KERN_ERR "waiting for chip to be ready timed out in unlock\n");
+			printk(KERN_ERR __FUNCTION__ ": waiting for chip to be ready timed out\n");
 			return -EIO;
 		}
 
@@ -1584,9 +1474,16 @@ retry:
 
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
@@ -1594,7 +1491,7 @@ retry:
 	/* FIXME. Use a timer to check this, and return immediately. */
 	/* Once the state machine's known to be working I'll do that */
 
-	timeo = jiffies + (HZ*2);
+	timeo = jiffies + (HZ*20);
 	for (;;) {
 
 		status = cfi_read(map, adr);
@@ -1611,7 +1508,7 @@ retry:
 			return -EIO;
 		}
 		
-		/* Latency issues. Drop the unlock, wait a while and retry */
+		/* Latency issues. Drop the lock, wait a while and retry */
 		spin_unlock_bh(chip->mutex);
 		cfi_udelay(1);
 		spin_lock_bh(chip->mutex);
@@ -1624,40 +1521,52 @@ retry:
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
