Received: from pop.gmx.net ([213.165.64.20] helo=mail.gmx.net)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDhHR-0000OV-Rd
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2004 11:06:05 +0100
From: dkey <dk.dbox2@gmx.net>
To: linux-mtd@lists.infradead.org,
 David Vrabel <dvrabel@arcom.com>
Date: Wed, 14 Apr 2004 12:09:42 +0200
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_m3QfAnUNBs2yXCd"
Message-Id: <200404141209.42563.dk.dbox2@gmx.net>
Subject: cfi_cmdset_0002.c (AMD interleaved chips) fix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Boundary-00=_m3QfAnUNBs2yXCd
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hi,

attached a cif_cmdset_0002.c diff against the current cvs tested on AMD 
interleaved chips and it works!
thx @ David Vrable who provided this patch!!

greets dkey

--Boundary-00=_m3QfAnUNBs2yXCd
Content-Type: text/x-diff;
  charset="us-ascii";
  name="cfi_cmdset_0002.c.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="cfi_cmdset_0002.c.diff"

Index: cfi_cmdset_0002.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0002.c,v
retrieving revision 1.97
diff -u -r1.97 cfi_cmdset_0002.c
--- cfi_cmdset_0002.c	24 Feb 2004 13:50:21 -0000	1.97
+++ cfi_cmdset_0002.c	14 Apr 2004 09:58:04 -0000
@@ -90,7 +90,7 @@
 	};
 
 	printk("  Silicon revision: %d\n", extp->SiliconRevision >> 1);
-	printk("  Address sensitive unlock: %s\n", 
+	printk("  Address sensitive unlock: %s\n",
 	       (extp->SiliconRevision & 1) ? "Not required" : "Required");
 
 	if (extp->EraseSuspend < ARRAY_SIZE(erase_suspend))
@@ -115,9 +115,9 @@
 	else
 		printk("  Page mode: %d word page\n", extp->PageMode << 2);
 
-	printk("  Vpp Supply Minimum Program/Erase Voltage: %d.%d V\n", 
+	printk("  Vpp Supply Minimum Program/Erase Voltage: %d.%d V\n",
 	       extp->VppMin >> 4, extp->VppMin & 0xf);
-	printk("  Vpp Supply Maximum Program/Erase Voltage: %d.%d V\n", 
+	printk("  Vpp Supply Maximum Program/Erase Voltage: %d.%d V\n",
 	       extp->VppMax >> 4, extp->VppMax & 0xf);
 
 	if (extp->TopBottom < ARRAY_SIZE(top_bottom))
@@ -167,7 +167,7 @@
 	int i;
 
 	if (cfi->cfi_mode==CFI_MODE_CFI){
-		/* 
+		/*
 		 * It's a real CFI chip, not one for which the probe
 		 * routine faked a CFI structure. So we read the feature
 		 * table from it.
@@ -180,14 +180,14 @@
 			return NULL;
 
 		/* Install our own private info structure */
-		cfi->cmdset_priv = extp;	
+		cfi->cmdset_priv = extp;
 
 		cfi_fixup(map, fixup_table);
 
 #ifdef DEBUG_CFI_FEATURES
 		/* Tell the user about it in lots of lovely detail */
 		cfi_tell_features(extp);
-#endif	
+#endif
 
 		bootloc = extp->TopBottom;
 		if ((bootloc != 2) && (bootloc != 3)) {
@@ -198,11 +198,11 @@
 
 		if (bootloc == 3 && cfi->cfiq->NumEraseRegions > 1) {
 			printk(KERN_WARNING "%s: Swapping erase regions for broken CFI table.\n", map->name);
-			
+
 			for (i=0; i<cfi->cfiq->NumEraseRegions / 2; i++) {
 				int j = (cfi->cfiq->NumEraseRegions-1)-i;
 				__u32 swap;
-				
+
 				swap = cfi->cfiq->EraseRegionInfo[i];
 				cfi->cfiq->EraseRegionInfo[i] = cfi->cfiq->EraseRegionInfo[j];
 				cfi->cfiq->EraseRegionInfo[j] = swap;
@@ -215,8 +215,8 @@
 		if ( ! (cfi->addr_unlock1 && cfi->addr_unlock2) ) {
 			switch (cfi->device_type) {
 			case CFI_DEVICETYPE_X8:
-				cfi->addr_unlock1 = 0x555; 
-				cfi->addr_unlock2 = 0x2aa; 
+				cfi->addr_unlock1 = 0x555;
+				cfi->addr_unlock2 = 0x2aa;
 				break;
 			case CFI_DEVICETYPE_X16:
 				cfi->addr_unlock1 = 0xaaa;
@@ -228,8 +228,8 @@
 				}
 				break;
 			case CFI_DEVICETYPE_X32:
-				cfi->addr_unlock1 = 0x1555; 
-				cfi->addr_unlock2 = 0xaaa; 
+				cfi->addr_unlock1 = 0x1555;
+				cfi->addr_unlock2 = 0xaaa;
 				break;
 			default:
 				printk(KERN_WARNING
@@ -245,8 +245,8 @@
 		cfi->chips[i].word_write_time = 1<<cfi->cfiq->WordWriteTimeoutTyp;
 		cfi->chips[i].buffer_write_time = 1<<cfi->cfiq->BufWriteTimeoutTyp;
 		cfi->chips[i].erase_time = 1<<cfi->cfiq->BlockEraseTimeoutTyp;
-	}		
-	
+	}
+
 	map->fldrv = &cfi_amdstd_chipdrv;
 
 	return cfi_amdstd_setup(map);
@@ -262,7 +262,7 @@
 	int i,j;
 
 	mtd = kmalloc(sizeof(*mtd), GFP_KERNEL);
-	printk(KERN_NOTICE "number of %s chips: %d\n", 
+	printk(KERN_NOTICE "number of %s chips: %d\n",
 	       (cfi->cfi_mode == CFI_MODE_CFI)?"CFI":"JEDEC",cfi->numchips);
 
 	if (!mtd) {
@@ -273,22 +273,22 @@
 	memset(mtd, 0, sizeof(*mtd));
 	mtd->priv = map;
 	mtd->type = MTD_NORFLASH;
-	/* Also select the correct geometry setup too */ 
+	/* Also select the correct geometry setup too */
 	mtd->size = devsize * cfi->numchips;
 
 	mtd->numeraseregions = cfi->cfiq->NumEraseRegions * cfi->numchips;
 	mtd->eraseregions = kmalloc(sizeof(struct mtd_erase_region_info)
 				    * mtd->numeraseregions, GFP_KERNEL);
-	if (!mtd->eraseregions) { 
+	if (!mtd->eraseregions) {
 		printk(KERN_WARNING "Failed to allocate memory for MTD erase region info\n");
 		goto setup_err;
 	}
-			
+
 	for (i=0; i<cfi->cfiq->NumEraseRegions; i++) {
 		unsigned long ernum, ersize;
 		ersize = ((cfi->cfiq->EraseRegionInfo[i] >> 8) & ~0xff) * cfi->interleave;
 		ernum = (cfi->cfiq->EraseRegionInfo[i] & 0xffff) + 1;
-			
+
 		if (mtd->erasesize < ersize) {
 			mtd->erasesize = ersize;
 		}
@@ -355,7 +355,7 @@
 
 	/* does this chip have a secsi area? */
 	if(cfi->mfr==1){
-		
+
 		switch(cfi->id){
 		case 0x50:
 		case 0x53:
@@ -366,12 +366,12 @@
 			/* Yes */
 			mtd->read_user_prot_reg = cfi_amdstd_secsi_read;
 			mtd->read_fact_prot_reg = cfi_amdstd_secsi_read;
-		default:		       
+		default:
 			;
 		}
 	}
-	
-		
+
+
 	mtd->sync = cfi_amdstd_sync;
 	mtd->suspend = cfi_amdstd_suspend;
 	mtd->resume = cfi_amdstd_resume;
@@ -429,7 +429,7 @@
 	do {
 		d = cfi_read(map, addr);
 		t = d ^ cfi_read(map, addr);
-	
+
 		if (t == 0)		       /* no toggles -- Read or Erase-Suspend-Read mode */
 			return CHIP_READY;
 		if (!(t & ~dq2) && (t & dq2)) { /* only DQ2 toggling -- this sector is erase suspended */
@@ -447,10 +447,20 @@
 		}
 		/* some other bits toggled -- probably a program/erase just finished */
 	} while(retry--);
-	
+
 	return CHIP_ERROR;
 }
 
+static int chip_ready(struct map_info *map, unsigned long addr)
+{
+    cfi_word d, t;
+
+    d = cfi_read(map, addr);
+    t = d ^ cfi_read(map, addr);
+
+    return t == 0;
+}
+
 static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode)
 {
 	DECLARE_WAITQUEUE(wait, current);
@@ -465,7 +475,7 @@
 
 	case FL_STATUS:
 		for (;;) {
-			if (chip_status(map, adr) == CHIP_READY)
+			if (chip_ready(map, adr))
 				break;
 
 			if (time_after(jiffies, timeo)) {
@@ -479,7 +489,7 @@
 			/* Someone else might have been playing with it. */
 			goto retry;
 		}
-				
+
 	case FL_READY:
 	case FL_CFI_QUERY:
 	case FL_JEDEC_QUERY:
@@ -506,7 +516,7 @@
 		chip->state = FL_ERASE_SUSPENDING;
 		chip->erase_suspended = 1;
 		for (;;) {
-			if (chip_status(map, adr) == CHIP_READY)
+			if (chip_ready(map, adr))
 				break;
 
 			if (time_after(jiffies, timeo)) {
@@ -521,7 +531,7 @@
 				printk(KERN_ERR "MTD %s(): chip not ready after erase suspend\n", __func__);
 				return -EIO;
 			}
-			
+
 			cfi_spin_unlock(chip->mutex);
 			cfi_udelay(1);
 			cfi_spin_lock(chip->mutex);
@@ -581,8 +591,8 @@
 
 	adr += chip->start;
 
-	/* Ensure cmd read/writes are aligned. */ 
-	cmd_addr = adr & ~(CFIDEV_BUSWIDTH-1); 
+	/* Ensure cmd read/writes are aligned. */
+	cmd_addr = adr & ~(CFIDEV_BUSWIDTH-1);
 
 	cfi_spin_lock(chip->mutex);
 	ret = get_chip(map, chip, cmd_addr, FL_READY);
@@ -662,7 +672,7 @@
 #endif
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		add_wait_queue(&chip->wq, &wait);
-		
+
 		cfi_spin_unlock(chip->mutex);
 
 		schedule();
@@ -674,7 +684,7 @@
 		timeo = jiffies + HZ;
 
 		goto retry;
-	}	
+	}
 
 	adr += chip->start;
 
@@ -684,7 +694,7 @@
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x88, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	
+
 	map_copy_from(map, buf, adr, len);
 
 	/* should these be CFI_DEVICETYPE_X8 instead of cfi->device_type? */
@@ -692,7 +702,7 @@
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	
+
 	wake_up(&chip->wq);
 	cfi_spin_unlock(chip->mutex);
 
@@ -805,7 +815,7 @@
 	cfi_spin_lock(chip->mutex);
 
 	/* See comment above for timeout value. */
-	timeo = jiffies + uWriteTimeout; 
+	timeo = jiffies + uWriteTimeout;
 	for (;;) {
 		if (chip->state != FL_WRITING) {
 			/* Someone's suspended the write. Sleep */
@@ -821,8 +831,11 @@
 			continue;
 		}
 
-		if ((status = chip_status(map, adr)) != CHIP_BUSY)
-			break;
+		if (chip_ready(map, adr))
+                        goto op_done;
+
+                if (time_after(jiffies, timeo))
+                        break;
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		cfi_spin_unlock(chip->mutex);
@@ -833,15 +846,8 @@
 	if (status == CHIP_READY)
 		goto op_done;
 
-	if (status == CHIP_TIMEDOUT)
-		printk(KERN_WARNING "MTD %s(): flash internal timeout\n",
-		       __func__);
-	else if (ta)
-		printk(KERN_WARNING "MTD %s(): software timeout\n",
-		       __func__ );
-	else
-		printk(KERN_WARNING "MTD %s(): unexpected failure.  status = %d\n",
-			__func__, status);
+	printk(KERN_WARNING "MTD %s(): software timeout\n",
+               __func__ );
 
  op_failed:
 	/* reset on all failures. */
@@ -929,23 +935,23 @@
 			return -EINVAL;
 		}
 
-		ret = do_write_oneword(map, &cfi->chips[chipnum], 
+		ret = do_write_oneword(map, &cfi->chips[chipnum],
 				       bus_ofs, datum);
-		if (ret) 
+		if (ret)
 			return ret;
-		
+
 		ofs += n;
 		buf += n;
 		(*retlen) += n;
 
 		if (ofs >> cfi->chipshift) {
-			chipnum ++; 
+			chipnum ++;
 			ofs = 0;
 			if (chipnum == cfi->numchips)
 				return 0;
 		}
 	}
-	
+
 	/* We are now aligned, write as much as possible */
 	while(len >= CFIDEV_BUSWIDTH) {
 		cfi_word datum;
@@ -976,7 +982,7 @@
 		len -= CFIDEV_BUSWIDTH;
 
 		if (ofs >> cfi->chipshift) {
-			chipnum ++; 
+			chipnum ++;
 			ofs = 0;
 			if (chipnum == cfi->numchips)
 				return 0;
@@ -1032,11 +1038,11 @@
 			return -EINVAL;
 		}
 
-		ret = do_write_oneword(map, &cfi->chips[chipnum], 
+		ret = do_write_oneword(map, &cfi->chips[chipnum],
 				ofs, datum);
-		if (ret) 
+		if (ret)
 			return ret;
-		
+
 		(*retlen) += n;
 	}
 
@@ -1047,7 +1053,7 @@
 /*
  * FIXME: interleaved mode not tested, and probably not supported!
  */
-static inline int do_write_buffer(struct map_info *map, struct flchip *chip, 
+static inline int do_write_buffer(struct map_info *map, struct flchip *chip,
 				  unsigned long adr, const u_char *buf, int len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -1168,8 +1174,8 @@
 	cfi_udelay(chip->buffer_write_time);
 	cfi_spin_lock(chip->mutex);
 
-	timeo = jiffies + uWriteTimeout; 
-		
+	timeo = jiffies + uWriteTimeout;
+
 	for (;;) {
 		if (chip->state != FL_WRITING) {
 			/* Someone's suspended the write. Sleep */
@@ -1185,10 +1191,11 @@
 			continue;
 		}
 
-		if( (status = chip_status(map, adr)) != CHIP_BUSY
-		    || ( ta = time_after(jiffies, timeo)) ) {
+		if (chip_ready(map, adr))
+                        goto op_done;
+
+		if( time_after(jiffies, timeo))
 			break;
-		}
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		cfi_spin_unlock(chip->mutex);
@@ -1197,19 +1204,8 @@
 	}
 
 
-	if (status == CHIP_READY)
-		goto op_done;
-
-	if (status == CHIP_TIMEDOUT) {
-		printk(KERN_WARNING "MTD %s(): flash internal timeout\n",
-		       __func__);
-	}
-	else if (ta)
-		printk(KERN_WARNING "MTD %s(): software timeout\n",
-		       __func__ );
-	else
-		printk(KERN_WARNING "MTD %s(): unexpected failure.  status = %d\n",
-			__func__, status);
+	 printk(KERN_WARNING "MTD %s(): software timeout\n",
+               __func__ );
 
  op_failed:
 	/* reset on all failures. */
@@ -1271,7 +1267,7 @@
 
 		if (size > len)
 			size = len;
-		ret = do_write_buffer(map, &cfi->chips[chipnum], 
+		ret = do_write_buffer(map, &cfi->chips[chipnum],
 				      ofs, buf, size);
 		if (ret)
 			return ret;
@@ -1282,7 +1278,7 @@
 		len -= size;
 
 		if (ofs >> cfi->chipshift) {
-			chipnum ++; 
+			chipnum ++;
 			ofs = 0;
 			if (chipnum == cfi->numchips)
 				return 0;
@@ -1356,10 +1352,12 @@
 			chip->erase_suspended = 0;
 		}
 
-		if ((status = chip_status(map, adr)) != CHIP_BUSY
-		    || ( ta = time_after(jiffies, timeo)) )
+		if (chip_ready(map, adr))
+                        goto op_done;
+
+                if (time_after(jiffies, timeo))
 			break;
-		
+
 		/* Latency issues. Drop the lock, wait a while and retry */
 		cfi_spin_unlock(chip->mutex);
 		set_current_state(TASK_UNINTERRUPTIBLE);
@@ -1367,18 +1365,8 @@
 		cfi_spin_lock(chip->mutex);
 	}
 
-	if (status == CHIP_READY)
-		goto op_done;
-
-	if (status == CHIP_TIMEDOUT)
-		printk(KERN_WARNING "MTD %s(): flash internal timeout\n",
-		       __func__);
-	else if (ta)
-		printk(KERN_WARNING "MTD %s(): software timeout\n",
-		       __func__ );
-	else
-		printk(KERN_WARNING "MTD %s(): unexpected failure.  status = %d\n",
-		       __func__, status);
+	 printk(KERN_WARNING "MTD %s(): software timeout\n",
+               __func__ );
 
  op_failed:
 	/* reset on all failures. */
@@ -1421,17 +1409,17 @@
 
 	i = 0;
 
-	/* Skip all erase regions which are ended before the start of 
+	/* Skip all erase regions which are ended before the start of
 	   the requested erase. Actually, to save on the calculations,
 	   we skip to the first erase region which starts after the
 	   start of the requested erase, and then go back one.
 	*/
-	
+
 	while (i < mtd->numeraseregions && ofs >= regions[i].offset)
 	       i++;
 	i--;
 
-	/* OK, now i is pointing at the erase region in which this 
+	/* OK, now i is pointing at the erase region in which this
 	   erase request starts. Check the start of the requested
 	   erase range is aligned with the erase size which is in
 	   effect here.
@@ -1454,7 +1442,7 @@
 	   the address actually falls
 	*/
 	i--;
-	
+
 	if ((ofs + len) & (regions[i].erasesize-1))
 		return -EINVAL;
 
@@ -1465,7 +1453,7 @@
 
 	while (len) {
 		ret = (*frob)(map, &cfi->chips[chipnum], adr, thunk);
-		
+
 		if (ret)
 			return ret;
 
@@ -1478,7 +1466,7 @@
 		if (adr >> cfi->chipshift) {
 			adr = 0;
 			chipnum++;
-			
+
 			if (chipnum >= cfi->numchips)
 			break;
 		}
@@ -1520,7 +1508,7 @@
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
 	chip->in_progress_block_addr = adr;
-	
+
 	cfi_spin_unlock(chip->mutex);
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	schedule_timeout((chip->erase_time*HZ)/(2*1000));
@@ -1546,10 +1534,12 @@
 			chip->erase_suspended = 0;
 		}
 
-		if ((status = chip_status(map, adr)) != CHIP_BUSY
-		    || ( ta = time_after(jiffies, timeo)) )
+		if (chip_ready(map, adr))
+                        goto op_done;
+
+                if (time_after(jiffies, timeo))
 			break;
-		
+
 		/* Latency issues. Drop the lock, wait a while and retry */
 		cfi_spin_unlock(chip->mutex);
 		set_current_state(TASK_UNINTERRUPTIBLE);
@@ -1557,18 +1547,8 @@
 		cfi_spin_lock(chip->mutex);
 	}
 
-	if (status == CHIP_READY)
-		goto op_done;
-
-	if (status == CHIP_TIMEDOUT)
-		printk(KERN_WARNING "MTD %s(): flash internal timeout\n",
-		       __func__);
-	else if (ta)
-		printk(KERN_WARNING "MTD %s(): software timeout\n",
-		       __func__ );
-	else
-		printk(KERN_WARNING "MTD %s(): unexpected failure.  status = %d\n",
-		       __func__, status);
+	printk(KERN_WARNING "MTD %s(): software timeout\n",
+               __func__ );
 
  op_failed:
 	/* reset on all failures. */
@@ -1599,7 +1579,7 @@
 	instr->state = MTD_ERASE_DONE;
 	if (instr->callback)
 		instr->callback(instr);
-	
+
 	return 0;
 }
 
@@ -1623,7 +1603,7 @@
 	instr->state = MTD_ERASE_DONE;
 	if (instr->callback)
 		instr->callback(instr);
-	
+
 	return 0;
 }
 
@@ -1650,7 +1630,7 @@
 		case FL_JEDEC_QUERY:
 			chip->oldstate = chip->state;
 			chip->state = FL_SYNCING;
-			/* No need to wake_up() on this state change - 
+			/* No need to wake_up() on this state change -
 			 * as the whole point is that nobody can do anything
 			 * with the chip now anyway.
 			 */
@@ -1661,13 +1641,13 @@
 		default:
 			/* Not an idle state */
 			add_wait_queue(&chip->wq, &wait);
-			
+
 			cfi_spin_unlock(chip->mutex);
 
 			schedule();
 
 			remove_wait_queue(&chip->wq, &wait);
-			
+
 			goto retry;
 		}
 	}
@@ -1678,7 +1658,7 @@
 		chip = &cfi->chips[i];
 
 		cfi_spin_lock(chip->mutex);
-		
+
 		if (chip->state == FL_SYNCING) {
 			chip->state = chip->oldstate;
 			wake_up(&chip->wq);
@@ -1708,7 +1688,7 @@
 		case FL_JEDEC_QUERY:
 			chip->oldstate = chip->state;
 			chip->state = FL_PM_SUSPENDED;
-			/* No need to wake_up() on this state change - 
+			/* No need to wake_up() on this state change -
 			 * as the whole point is that nobody can do anything
 			 * with the chip now anyway.
 			 */
@@ -1729,7 +1709,7 @@
 			chip = &cfi->chips[i];
 
 			cfi_spin_lock(chip->mutex);
-		
+
 			if (chip->state == FL_PM_SUSPENDED) {
 				chip->state = chip->oldstate;
 				wake_up(&chip->wq);
@@ -1737,7 +1717,7 @@
 			cfi_spin_unlock(chip->mutex);
 		}
 	}
-	
+
 	return ret;
 }
 
@@ -1750,11 +1730,11 @@
 	struct flchip *chip;
 
 	for (i=0; i<cfi->numchips; i++) {
-	
+
 		chip = &cfi->chips[i];
 
 		cfi_spin_lock(chip->mutex);
-		
+
 		if (chip->state == FL_PM_SUSPENDED) {
 			chip->state = FL_READY;
 			cfi_write(map, CMD(0xF0), chip->start);
@@ -1782,7 +1762,7 @@
 	printk(KERN_DEBUG "block status register for 0x%08lx is %x\n",
 	       adr, cfi_read_query(map, adr+(2*ofs_factor)));
 	cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
-	
+
 	return 0;
 }
 
@@ -1842,7 +1822,7 @@
 
 	chip->state = xxlt->state;
 	cfi_write(map, CMD(xxlt->val), adr);
-	
+
 	/* Done and happy. */
 	chip->state = FL_READY;
 	put_chip(map, chip, adr);
@@ -1864,7 +1844,7 @@
 
 	ret = cfi_amdstd_varsize_frob(mtd, do_xxlock_oneblock, ofs, len,
 				      (void *)&DO_XXLOCK_ONEBLOCK_LOCK);
-	
+
 	DEBUG(MTD_DEBUG_LEVEL3,
 	      "%s: lock status after, ret=%d\n",
 	      __func__, ret);
@@ -1888,12 +1868,12 @@
 
 	ret = cfi_amdstd_varsize_frob(mtd, do_xxlock_oneblock, ofs, len,
 				      (void *)&DO_XXLOCK_ONEBLOCK_UNLOCK);
-	
+
 	DEBUG(MTD_DEBUG_LEVEL3,
 	      "%s: lock status after, ret=%d\n",
 	      __func__, ret);
 	debug_dump_locks(mtd, do_printlockstatus_oneblock, ofs, len, 0);
-	
+
 	return ret;
 }
 

--Boundary-00=_m3QfAnUNBs2yXCd--
