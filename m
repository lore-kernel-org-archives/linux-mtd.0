Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16DUDI-0001rE-00
	for <linux-mtd@lists.infradead.org>; Mon, 10 Dec 2001 17:27:37 +0000
From: Stuart Menefy <Stuart.Menefy@st.com>
Message-Id: <1011210173740.ZM1919@bristol.st.com>
Date: Mon, 10 Dec 2001 17:37:40 +0000
In-Reply-To: mhill@bustech.com
        "LOCK/UNLOCK questions in cfi_cmdset_0001.c" (Dec  4,  9:18am)
References: <Pine.LNX.4.33.0112030715100.14716-100000@newbast.lynuxworks.co>
	<006501c17cce$9c30b6f0$26e8b2c6@MHILL>
To: mhill@bustech.com, linux-mtd@lists.infradead.org
Subject: Re: LOCK/UNLOCK questions in cfi_cmdset_0001.c
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="PART-BOUNDARY=.11011210173740.ZM1919.st.com"
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

--
--PART-BOUNDARY=.11011210173740.ZM1919.st.com
Content-Type: text/plain; charset=us-ascii

Hi Mike

I had the same problems when trying to use some ST Flash devices for the
the first time, and so came up with the following modifications. These
work for me (both with devices with a single erase size and multiple erase
sizes) - although the ST devices need some further mods, the CFI data
appears to be buggy unfortunatly.

These changes are pretty simple, and allowed me to take advantage of the
fact that there was pre-existing code to support erasing of devices
with multiple erase sizes. So by renaming a couple of existing
functions, and adding an extra parameter, there are now two functions
(..._operate_onesize and ..._operate_varsize) which handle dividing up
the operation into erase size chunks, and three functions which can be
called from these two to do the lock, unlock and erase. The downside
of doing this is that there is now a function pointer call in the
middle of all the operations, do some function calls can no longer be
inlined.

Comments welcome

Stuart

 

On Dec 4,  9:18am, mhill@bustech.com wrote:
> Subject: LOCK/UNLOCK questions in cfi_cmdset_0001.c
> I am not very familiar with the CFI code.  Could someone who is familiar
> with the cfi_cmdset_0001.c code take a look at this and verify:
> 
> 1) It appears that in both cfi_intelext_lock and cfi_intelext_unlock, FLASH
> parts with multiple erasesize regions are not supported.
> 
> 2) In cfi_intelext_unlock, only the region pointed to by the offset will be
> unlocked.  The "len" parameter is never used to calculate if more than one
> region should be unlocked.
> 
> 
> Thanks,
> Mike
> 
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
>-- End of excerpt from mhill@bustech.com



--PART-BOUNDARY=.11011210173740.ZM1919.st.com
Content-Description: Text
Content-Type: text/plain ; name="diffs" ; charset=us-ascii
Content-Disposition: attachment ; filename="diffs"
X-Zm-Content-Name: diffs

Index: drivers/mtd/chips/cfi_cmdset_0001.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0001.c,v
retrieving revision 1.88
diff -u -r1.88 cfi_cmdset_0001.c
--- drivers/mtd/chips/cfi_cmdset_0001.c	2001/11/27 14:55:12	1.88
+++ drivers/mtd/chips/cfi_cmdset_0001.c	2001/12/10 15:47:50
@@ -30,15 +30,22 @@
 #include <linux/mtd/cfi.h>
 #include <linux/mtd/compatmac.h>
 
+typedef int operate_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr);
+
 static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_intelext_read_user_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_intelext_read_fact_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int cfi_intelext_write_buffers(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
+static int cfi_intelext_operate_onesize(struct mtd_info *mtd, loff_t ofs, size_t len, operate_oneblock op);
+static int cfi_intelext_operate_varsize(struct mtd_info *mtd, loff_t ofs, size_t len, operate_oneblock op);
 static int cfi_intelext_erase_varsize(struct mtd_info *, struct erase_info *);
+static int cfi_intelext_erase_onesize(struct mtd_info *, struct erase_info *);
 static void cfi_intelext_sync (struct mtd_info *);
-static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, size_t len);
-static int cfi_intelext_unlock(struct mtd_info *mtd, loff_t ofs, size_t len);
+static int cfi_intelext_lock_varsize(struct mtd_info *mtd, loff_t ofs, size_t len);
+static int cfi_intelext_lock_onesize(struct mtd_info *mtd, loff_t ofs, size_t len);
+static int cfi_intelext_unlock_varsize(struct mtd_info *mtd, loff_t ofs, size_t len);
+static int cfi_intelext_unlock_onesize(struct mtd_info *mtd, loff_t ofs, size_t len);
 static int cfi_intelext_suspend (struct mtd_info *);
 static void cfi_intelext_resume (struct mtd_info *);
 
@@ -61,6 +68,8 @@
 #ifdef DEBUG_CFI_FEATURES
 static void cfi_tell_features(struct cfi_pri_intelext *extp)
 {
+	int i;
+
 	printk("  Feature/Command Support: %4.4X\n", extp->FeatureSupport);
 	printk("     - Chip Erase:         %s\n", extp->FeatureSupport&1?"supported":"unsupported");
 	printk("     - Suspend Erase:      %s\n", extp->FeatureSupport&2?"supported":"unsupported");
@@ -92,10 +101,10 @@
 	}
 	
 	printk("  Vcc Logic Supply Optimum Program/Erase Voltage: %d.%d V\n", 
-	       extp->VccOptimal >> 8, extp->VccOptimal & 0xf);
+	       extp->VccOptimal >> 4, extp->VccOptimal & 0xf);
 	if (extp->VppOptimal)
 		printk("  Vpp Programming Supply Optimum Program/Erase Voltage: %d.%d V\n", 
-		       extp->VppOptimal >> 8, extp->VppOptimal & 0xf);
+		       extp->VppOptimal >> 4, extp->VppOptimal & 0xf);
 }
 #endif
 
@@ -241,7 +250,15 @@
 		}
 
 	/* Also select the correct geometry setup too */ 
+	if (mtd->numeraseregions > 1) {
 		mtd->erase = cfi_intelext_erase_varsize;
+		mtd->lock = cfi_intelext_lock_varsize;
+		mtd->unlock = cfi_intelext_unlock_varsize;
+	} else {
+		mtd->erase = cfi_intelext_erase_onesize;
+		mtd->lock = cfi_intelext_lock_onesize;
+		mtd->unlock = cfi_intelext_unlock_onesize;
+	}
 	mtd->read = cfi_intelext_read;
 	if ( cfi->cfiq->BufWriteTimeoutTyp ) {
 		//printk(KERN_INFO "Using buffer write method\n" );
@@ -253,8 +270,6 @@
 	mtd->read_user_prot_reg = cfi_intelext_read_user_prot_reg;
 	mtd->read_fact_prot_reg = cfi_intelext_read_fact_prot_reg;
 	mtd->sync = cfi_intelext_sync;
-	mtd->lock = cfi_intelext_lock;
-	mtd->unlock = cfi_intelext_unlock;
 	mtd->suspend = cfi_intelext_suspend;
 	mtd->resume = cfi_intelext_resume;
 	mtd->flags = MTD_CAP_NORFLASH;
@@ -1196,18 +1211,18 @@
 	return ret;
 }
 
-int cfi_intelext_erase_varsize(struct mtd_info *mtd, struct erase_info *instr)
+static int cfi_intelext_operate_varsize(struct mtd_info *mtd, loff_t ofs, size_t len, operate_oneblock op)
 {	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long adr, len;
+	unsigned long adr;
 	int chipnum, ret = 0;
 	int i, first;
 	struct mtd_erase_region_info *regions = mtd->eraseregions;
 
-	if (instr->addr > mtd->size)
+	if (ofs > mtd->size)
 		return -EINVAL;
 
-	if ((instr->len + instr->addr) > mtd->size)
+	if ((len + ofs) > mtd->size)
 		return -EINVAL;
 
 	/* Check that both start and end of the requested erase are
@@ -1222,7 +1237,7 @@
 	   start of the requested erase, and then go back one.
 	*/
 	
-	while (i < mtd->numeraseregions && instr->addr >= regions[i].offset)
+	while (i < mtd->numeraseregions && ofs >= regions[i].offset)
 	       i++;
 	i--;
 
@@ -1232,7 +1247,7 @@
 	   effect here.
 	*/
 
-	if (instr->addr & (regions[i].erasesize-1))
+	if (ofs & (regions[i].erasesize-1))
 		return -EINVAL;
 
 	/* Remember the erase region we start on */
@@ -1242,7 +1257,7 @@
 	 * with the erase region at that address.
 	 */
 
-	while (i<mtd->numeraseregions && (instr->addr + instr->len) >= regions[i].offset)
+	while (i<mtd->numeraseregions && (ofs + len) >= regions[i].offset)
 		i++;
 
 	/* As before, drop back one to point at the region in which
@@ -1250,17 +1265,16 @@
 	*/
 	i--;
 	
-	if ((instr->addr + instr->len) & (regions[i].erasesize-1))
+	if ((ofs + len) & (regions[i].erasesize-1))
 		return -EINVAL;
 
-	chipnum = instr->addr >> cfi->chipshift;
-	adr = instr->addr - (chipnum << cfi->chipshift);
-	len = instr->len;
+	chipnum = ofs >> cfi->chipshift;
+	adr = ofs - (chipnum << cfi->chipshift);
 
 	i=first;
 
 	while(len) {
-		ret = do_erase_oneblock(map, &cfi->chips[chipnum], adr);
+		ret = op(map, &cfi->chips[chipnum], adr);
 		
 		if (ret)
 			return ret;
@@ -1280,13 +1294,78 @@
 		}
 	}
 		
-	instr->state = MTD_ERASE_DONE;
-	if (instr->callback)
-		instr->callback(instr);
-	
 	return 0;
 }
 
+static int cfi_intelext_operate_onesize(struct mtd_info *mtd, loff_t ofs, size_t len, operate_oneblock op)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	unsigned long adr;
+	int chipnum, ret = 0;
+
+	if (ofs & (mtd->erasesize - 1))
+		return -EINVAL;
+
+	if (len & (mtd->erasesize -1))
+		return -EINVAL;
+
+	if ((len + ofs) > mtd->size)
+		return -EINVAL;
+
+	chipnum = ofs >> cfi->chipshift;
+	adr = ofs - (chipnum << cfi->chipshift);
+
+	while(len) {
+		ret = op(map, &cfi->chips[chipnum], adr);
+
+		if (ret)
+			return ret;
+
+		adr += mtd->erasesize;
+		len -= mtd->erasesize;
+
+		if (adr >> cfi->chipshift) {
+			adr = 0;
+			chipnum++;
+			
+			if (chipnum >= cfi->numchips)
+			break;
+		}
+	}
+	return 0;
+}
+
+static int cfi_intelext_erase_varsize(struct mtd_info *mtd, struct erase_info *instr)
+{
+	int ret;
+
+	ret = cfi_intelext_operate_varsize(mtd, instr->addr, instr->len, do_erase_oneblock);
+
+	if (ret == 0) {
+		instr->state = MTD_ERASE_DONE;
+		if (instr->callback)
+			instr->callback(instr);
+	}
+
+	return ret;	
+}
+
+static int cfi_intelext_erase_onesize(struct mtd_info *mtd, struct erase_info *instr)
+{
+	int ret;
+
+	ret = cfi_intelext_operate_onesize(mtd, instr->addr, instr->len, do_erase_oneblock);
+
+	if (ret == 0) {
+		instr->state = MTD_ERASE_DONE;
+		if (instr->callback)
+			instr->callback(instr);
+	}
+
+	return ret;	
+}
+
 static void cfi_intelext_sync (struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
@@ -1400,6 +1479,7 @@
 	ENABLE_VPP(map);
 	cfi_write(map, CMD(0x60), adr);
 	cfi_write(map, CMD(0x01), adr);
+
 	chip->state = FL_LOCKING;
 	
 	spin_unlock_bh(chip->mutex);
@@ -1439,60 +1519,48 @@
 	spin_unlock_bh(chip->mutex);
 	return 0;
 }
-static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
+
+#ifdef DEBUG_LOCK_BITS
+static int operate_oneblock_wrapper(struct map_info *map, struct flchip *chip, unsigned long adr, operate_oneblock op)
 {
-	struct map_info *map = mtd->priv;
+	int ret;
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long adr;
-	int chipnum, ret = 0;
-#ifdef DEBUG_LOCK_BITS
 	int ofs_factor = cfi->interleave * cfi->device_type;
-#endif
 
-	if (ofs & (mtd->erasesize - 1))
-		return -EINVAL;
+	/* If the chip's not idle, then this is a pretty obnoxious thing to do. */
+	cfi_send_gen_cmd(0x90, 0x55, chip->start, map, cfi, cfi->device_type, NULL);
+	printk("before: block status register is %x\n",cfi_read_query(map, adr+chip->start+(2*ofs_factor)));
+	cfi_send_gen_cmd(0xff, 0x55, chip->start, map, cfi, cfi->device_type, NULL);
+	chip->state = FL_READY;
+
+	ret = op(map, chip, adr);
+
+	cfi_send_gen_cmd(0x90, 0x55, chip->start, map, cfi, cfi->device_type, NULL);
+	printk("after: block status register is %x\n",cfi_read_query(map, adr+chip->start+(2*ofs_factor)));
+	cfi_send_gen_cmd(0xff, 0x55, chip->start, map, cfi, cfi->device_type, NULL);
+	chip->state = FL_READY;
 
-	if (len & (mtd->erasesize -1))
-		return -EINVAL;
-
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
+	return ret;
+}
 
-		ret = do_lock_oneblock(map, &cfi->chips[chipnum], adr);
+static int do_lock_oneblock_wrapper(struct map_info *map, struct flchip *chip, unsigned long adr)
+{
+	return operate_oneblock_wrapper(map, chip, adr, do_lock_oneblock);
+}
 
-#ifdef DEBUG_LOCK_BITS
-		cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
-		printk("after lock: block status register is %x\n",cfi_read_query(map, adr+(2*ofs_factor)));
-		cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
+#define do_lock_oneblock do_lock_oneblock_wrapper
 #endif	
-		
-		if (ret)
-			return ret;
 
-		adr += mtd->erasesize;
-		len -= mtd->erasesize;
+static int cfi_intelext_lock_varsize(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+	return cfi_intelext_operate_varsize(mtd, ofs, len, do_lock_oneblock);
+}
 
-		if (adr >> cfi->chipshift) {
-			adr = 0;
-			chipnum++;
-			
-			if (chipnum >= cfi->numchips)
-			break;
-		}
-	}
-	return 0;
+static int cfi_intelext_lock_onesize(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+	return cfi_intelext_operate_onesize(mtd, ofs, len, do_lock_oneblock);
 }
+
 static inline int do_unlock_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -1550,6 +1618,9 @@
 	cfi_write(map, CMD(0x60), adr);
 	cfi_write(map, CMD(0xD0), adr);
 	chip->state = FL_UNLOCKING;
+
+// SIM: I've added this for the ST chip which reverts to read mode. Ahhh
+cfi_write(map, CMD(0x70), adr);
 	
 	spin_unlock_bh(chip->mutex);
 	schedule_timeout(HZ);
@@ -1588,43 +1659,24 @@
 	spin_unlock_bh(chip->mutex);
 	return 0;
 }
-static int cfi_intelext_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
-{
-	struct map_info *map = mtd->priv;
-	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long adr;
-	int chipnum, ret = 0;
-#ifdef DEBUG_LOCK_BITS
-	int ofs_factor = cfi->interleave * cfi->device_type;
-#endif
-
-	chipnum = ofs >> cfi->chipshift;
-	adr = ofs - (chipnum << cfi->chipshift);
 
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
+static int do_unlock_oneblock_wrapper(struct map_info *map, struct flchip *chip, unsigned long adr)
+{
+        return operate_oneblock_wrapper(map, chip, adr, do_unlock_oneblock);
+}
+
+#define do_unlock_oneblock do_unlock_oneblock_wrapper
 #endif
 
-	ret = do_unlock_oneblock(map, &cfi->chips[chipnum], adr);
+static int cfi_intelext_unlock_varsize(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+	return cfi_intelext_operate_varsize(mtd, ofs, len, do_unlock_oneblock);
+}
 
-#ifdef DEBUG_LOCK_BITS
-	cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
-	printk("after unlock: block status register is %x\n",cfi_read_query(map, adr+(2*ofs_factor)));
-	cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
-#endif
-	
-	return ret;
+static int cfi_intelext_unlock_onesize(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+	return cfi_intelext_operate_onesize(mtd, ofs, len, do_unlock_oneblock);
 }
 
 static int cfi_intelext_suspend(struct mtd_info *mtd)

--PART-BOUNDARY=.11011210173740.ZM1919.st.com--
