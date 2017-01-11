Received: from mout.web.de ([212.227.17.12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRPfb-0006oB-7Y
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2017 20:38:57 +0000
Subject: [PATCH 03/18] mtd-cfi_cmdset_0001: Add some spaces for better code
 readability
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>, Denys Vlasenko <dvlasenk@redhat.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
References: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <a6f28358-3f8d-180e-9a59-b5ee276cb7d9@users.sourceforge.net>
Date: Wed, 11 Jan 2017 21:38:18 +0100
MIME-Version: 1.0
In-Reply-To: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 11 Jan 2017 16:34:12 +0100

Use space characters at some source code places according to
the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 132 +++++++++++++++++++-----------------
 1 file changed, 70 insertions(+), 62 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 0d7c2ef533d1..0bcb785305d6 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -131,30 +131,30 @@ static void cfi_tell_features(struct cfi_pri_intelext *extp)
 	printk("     - Synchronous read:        %s\n", extp->FeatureSupport&256?"supported":"unsupported");
 	printk("     - Simultaneous operations: %s\n", extp->FeatureSupport&512?"supported":"unsupported");
 	printk("     - Extended Flash Array:    %s\n", extp->FeatureSupport&1024?"supported":"unsupported");
-	for (i=11; i<32; i++) {
-		if (extp->FeatureSupport & (1<<i))
+	for (i = 11; i < 32; i++) {
+		if (extp->FeatureSupport & (1 << i))
 			printk("     - Unknown Bit %X:      supported\n", i);
 	}
 
 	printk("  Supported functions after Suspend: %2.2X\n", extp->SuspendCmdSupport);
 	printk("     - Program after Erase Suspend: %s\n", extp->SuspendCmdSupport&1?"supported":"unsupported");
-	for (i=1; i<8; i++) {
-		if (extp->SuspendCmdSupport & (1<<i))
+	for (i = 1; i < 8; i++) {
+		if (extp->SuspendCmdSupport & (1 << i))
 			printk("     - Unknown Bit %X:               supported\n", i);
 	}
 
 	printk("  Block Status Register Mask: %4.4X\n", extp->BlkStatusRegMask);
 	printk("     - Lock Bit Active:      %s\n", extp->BlkStatusRegMask&1?"yes":"no");
 	printk("     - Lock-Down Bit Active: %s\n", extp->BlkStatusRegMask&2?"yes":"no");
-	for (i=2; i<3; i++) {
-		if (extp->BlkStatusRegMask & (1<<i))
-			printk("     - Unknown Bit %X Active: yes\n",i);
+	for (i = 2; i < 3; i++) {
+		if (extp->BlkStatusRegMask & (1 << i))
+			printk("     - Unknown Bit %X Active: yes\n", i);
 	}
 	printk("     - EFA Lock Bit:         %s\n", extp->BlkStatusRegMask&16?"yes":"no");
 	printk("     - EFA Lock-Down Bit:    %s\n", extp->BlkStatusRegMask&32?"yes":"no");
-	for (i=6; i<16; i++) {
-		if (extp->BlkStatusRegMask & (1<<i))
-			printk("     - Unknown Bit %X Active: yes\n",i);
+	for (i = 6; i < 16; i++) {
+		if (extp->BlkStatusRegMask & (1 << i))
+			printk("     - Unknown Bit %X Active: yes\n", i);
 	}
 
 	printk("  Vcc Logic Supply Optimum Program/Erase Voltage: %d.%d V\n",
@@ -185,19 +185,19 @@ static void fixup_convert_atmel_pri(struct mtd_info *mtd)
 	printk(KERN_ERR "atmel Features: %02x\n", atmel_pri.Features);
 
 	if (atmel_pri.Features & 0x01) /* chip erase supported */
-		features |= (1<<0);
+		features |= (1 << 0);
 	if (atmel_pri.Features & 0x02) /* erase suspend supported */
-		features |= (1<<1);
+		features |= (1 << 1);
 	if (atmel_pri.Features & 0x04) /* program suspend supported */
-		features |= (1<<2);
+		features |= (1 << 2);
 	if (atmel_pri.Features & 0x08) /* simultaneous operations supported */
-		features |= (1<<9);
+		features |= (1 << 9);
 	if (atmel_pri.Features & 0x20) /* page mode read supported */
-		features |= (1<<7);
+		features |= (1 << 7);
 	if (atmel_pri.Features & 0x40) /* queued erase supported */
-		features |= (1<<4);
+		features |= (1 << 4);
 	if (atmel_pri.Features & 0x80) /* Protection bits supported */
-		features |= (1<<6);
+		features |= (1 << 6);
 
 	extp->FeatureSupport = features;
 
@@ -439,7 +439,8 @@ read_pri_intelext(struct map_info *map, __u16 adr)
 			extra_size += sizeof(*rinfo);
 			if (extp_size < sizeof(*extp) + extra_size)
 				goto need_more;
-			rinfo->NumIdentPartitions=le16_to_cpu(rinfo->NumIdentPartitions);
+			rinfo->NumIdentPartitions
+				= le16_to_cpu(rinfo->NumIdentPartitions);
 			extra_size += (rinfo->NumBlockTypes - 1)
 				      * sizeof(struct cfi_intelext_blockinfo);
 		}
@@ -499,7 +500,7 @@ struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
 		 * routine faked a CFI structure. So we read the feature
 		 * table from it.
 		 */
-		__u16 adr = primary?cfi->cfiq->P_ADR:cfi->cfiq->A_ADR;
+		__u16 adr = primary ? cfi->cfiq->P_ADR : cfi->cfiq->A_ADR;
 		struct cfi_pri_intelext *extp;
 
 		extp = read_pri_intelext(map, adr);
@@ -518,7 +519,7 @@ struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
 		cfi_tell_features(extp);
 #endif
 
-		if(extp->SuspendCmdSupport & 1) {
+		if (extp->SuspendCmdSupport & 1) {
 			printk(KERN_NOTICE "cfi_cmdset_0001: Erase suspend on write enabled\n");
 		}
 	}
@@ -529,43 +530,43 @@ struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
 	/* Apply generic fixups */
 	cfi_fixup(mtd, fixup_table);
 
-	for (i=0; i< cfi->numchips; i++) {
+	for (i = 0; i < cfi->numchips; i++) {
 		if (cfi->cfiq->WordWriteTimeoutTyp)
 			cfi->chips[i].word_write_time =
-				1<<cfi->cfiq->WordWriteTimeoutTyp;
+				1 << cfi->cfiq->WordWriteTimeoutTyp;
 		else
 			cfi->chips[i].word_write_time = 50000;
 
 		if (cfi->cfiq->BufWriteTimeoutTyp)
 			cfi->chips[i].buffer_write_time =
-				1<<cfi->cfiq->BufWriteTimeoutTyp;
+				1 << cfi->cfiq->BufWriteTimeoutTyp;
 		/* No default; if it isn't specified, we won't use it */
 
 		if (cfi->cfiq->BlockEraseTimeoutTyp)
 			cfi->chips[i].erase_time =
-				1000<<cfi->cfiq->BlockEraseTimeoutTyp;
+				1000 << cfi->cfiq->BlockEraseTimeoutTyp;
 		else
 			cfi->chips[i].erase_time = 2000000;
 
 		if (cfi->cfiq->WordWriteTimeoutTyp &&
 		    cfi->cfiq->WordWriteTimeoutMax)
 			cfi->chips[i].word_write_time_max =
-				1<<(cfi->cfiq->WordWriteTimeoutTyp +
-				    cfi->cfiq->WordWriteTimeoutMax);
+				1 << (cfi->cfiq->WordWriteTimeoutTyp
+				     + cfi->cfiq->WordWriteTimeoutMax);
 		else
 			cfi->chips[i].word_write_time_max = 50000 * 8;
 
 		if (cfi->cfiq->BufWriteTimeoutTyp &&
 		    cfi->cfiq->BufWriteTimeoutMax)
 			cfi->chips[i].buffer_write_time_max =
-				1<<(cfi->cfiq->BufWriteTimeoutTyp +
-				    cfi->cfiq->BufWriteTimeoutMax);
+				1 << (cfi->cfiq->BufWriteTimeoutTyp
+				     + cfi->cfiq->BufWriteTimeoutMax);
 
 		if (cfi->cfiq->BlockEraseTimeoutTyp &&
 		    cfi->cfiq->BlockEraseTimeoutMax)
 			cfi->chips[i].erase_time_max =
-				1000<<(cfi->cfiq->BlockEraseTimeoutTyp +
-				       cfi->cfiq->BlockEraseTimeoutMax);
+				1000 << (cfi->cfiq->BlockEraseTimeoutTyp
+					+ cfi->cfiq->BlockEraseTimeoutMax);
 		else
 			cfi->chips[i].erase_time_max = 2000000 * 8;
 
@@ -588,8 +589,8 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long offset = 0;
-	int i,j;
-	unsigned long devsize = (1<<cfi->cfiq->DevSize) * cfi->interleave;
+	int i, j;
+	unsigned long devsize = (1 << cfi->cfiq->DevSize) * cfi->interleave;
 
 	//printk(KERN_DEBUG "number of CFI chips: %d\n", cfi->numchips);
 
@@ -601,7 +602,7 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 	if (!mtd->eraseregions)
 		goto setup_err;
 
-	for (i=0; i<cfi->cfiq->NumEraseRegions; i++) {
+	for (i = 0; i < cfi->cfiq->NumEraseRegions; i++) {
 		unsigned long ernum, ersize;
 		ersize = ((cfi->cfiq->EraseRegionInfo[i] >> 8) & ~0xff) * cfi->interleave;
 		ernum = (cfi->cfiq->EraseRegionInfo[i] & 0xffff) + 1;
@@ -609,12 +610,15 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 		if (mtd->erasesize < ersize) {
 			mtd->erasesize = ersize;
 		}
-		for (j=0; j<cfi->numchips; j++) {
-			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].offset = (j*devsize)+offset;
-			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].erasesize = ersize;
-			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].numblocks = ernum;
-			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].lockmap = kmalloc(ernum / 8 + 1, GFP_KERNEL);
-			if (!mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].lockmap)
+		for (j = 0; j < cfi->numchips; j++) {
+			unsigned int const x = j * cfi->cfiq->NumEraseRegions
+					       + i;
+
+			mtd->eraseregions[x].offset = j * devsize + offset;
+			mtd->eraseregions[x].erasesize = ersize;
+			mtd->eraseregions[x].numblocks = ernum;
+			mtd->eraseregions[x].lockmap = kmalloc(ernum / 8 + 1, GFP_KERNEL);
+			if (!mtd->eraseregions[x].lockmap)
 				goto setup_err;
 		}
 		offset += (ersize * ernum);
@@ -626,9 +630,9 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 		goto setup_err;
 	}
 
-	for (i=0; i<mtd->numeraseregions;i++){
+	for (i = 0; i < mtd->numeraseregions; i++) {
 		printk(KERN_DEBUG "erase region %d: offset=0x%llx,size=0x%x,blocks=%d\n",
-		       i,(unsigned long long)mtd->eraseregions[i].offset,
+		       i, (unsigned long long)mtd->eraseregions[i].offset,
 		       mtd->eraseregions[i].erasesize,
 		       mtd->eraseregions[i].numblocks);
 	}
@@ -653,9 +657,12 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 
  setup_err:
 	if (mtd->eraseregions)
-		for (i=0; i<cfi->cfiq->NumEraseRegions; i++)
-			for (j=0; j<cfi->numchips; j++)
-				kfree(mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].lockmap);
+		for (i = 0; i < cfi->cfiq->NumEraseRegions; i++)
+			for (j = 0; j < cfi->numchips; j++)
+				kfree(mtd->eraseregions[j
+							* cfi->cfiq
+							  ->NumEraseRegions
+							+ i].lockmap);
 	kfree(mtd->eraseregions);
 	kfree(mtd);
 	kfree(cfi->cmdset_priv);
@@ -775,8 +782,9 @@ static int cfi_intelext_partition_fixup(struct mtd_info *mtd,
 
 		printk(KERN_DEBUG "%s: %d set(s) of %d interleaved chips "
 				  "--> %d partitions of %d KiB\n",
-				  map->name, cfi->numchips, cfi->interleave,
-				  newcfi->numchips, 1<<(newcfi->chipshift-10));
+		       map->name, cfi->numchips, cfi->interleave,
+		       newcfi->numchips,
+		       1 << (newcfi->chipshift - 10));
 
 		map->fldrv_priv = newcfi;
 		*pcfi = newcfi;
@@ -1032,7 +1040,7 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 		mutex_unlock(&shared->lock);
 	}
 
-	switch(chip->oldstate) {
+	switch (chip->oldstate) {
 	case FL_ERASING:
 		/* What if one interleaved chip has finished and the
 		   other hasn't? The old code would leave the finished
@@ -1387,8 +1395,8 @@ static int cfi_intelext_point(struct mtd_info *mtd, loff_t from, size_t len,
 		else if (cfi->chips[chipnum].start != last_end)
 			break;
 
-		if ((len + ofs -1) >> cfi->chipshift)
-			thislen = (1<<cfi->chipshift) - ofs;
+		if ((len + ofs - 1) >> cfi->chipshift)
+			thislen = (1 << cfi->chipshift) - ofs;
 		else
 			thislen = len;
 
@@ -1427,15 +1435,15 @@ static int cfi_intelext_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 		if (chipnum >= cfi->numchips)
 			break;
 
-		if ((len + ofs -1) >> cfi->chipshift)
-			thislen = (1<<cfi->chipshift) - ofs;
+		if ((len + ofs - 1) >> cfi->chipshift)
+			thislen = (1 << cfi->chipshift) - ofs;
 		else
 			thislen = len;
 
 		mutex_lock(&chip->mutex);
 		if (chip->state == FL_POINT) {
 			chip->ref_point_counter--;
-			if(chip->ref_point_counter == 0)
+			if (chip->ref_point_counter == 0)
 				chip->state = FL_READY;
 		} else {
 			printk(KERN_ERR "%s: Error: unpoint called on non pointed region\n", map->name);
@@ -1503,8 +1511,8 @@ static int cfi_intelext_read (struct mtd_info *mtd, loff_t from, size_t len, siz
 		if (chipnum >= cfi->numchips)
 			break;
 
-		if ((len + ofs -1) >> cfi->chipshift)
-			thislen = (1<<cfi->chipshift) - ofs;
+		if ((len + ofs - 1) >> cfi->chipshift)
+			thislen = (1 << cfi->chipshift) - ofs;
 		else
 			thislen = len;
 
@@ -1637,7 +1645,7 @@ static int cfi_intelext_write_words (struct mtd_info *mtd, loff_t to , size_t le
 		}
 	}
 
-	while(len >= map_bankwidth(map)) {
+	while (len >= map_bankwidth(map)) {
 		map_word datum = map_word_load(map, buf);
 
 		ret = do_write_oneword(map, &cfi->chips[chipnum],
@@ -2019,7 +2027,7 @@ static void cfi_intelext_sync (struct mtd_info *mtd)
 	struct flchip *chip;
 	int ret = 0;
 
-	for (i=0; !ret && i<cfi->numchips; i++) {
+	for (i = 0; !ret && i < cfi->numchips; i++) {
 		chip = &cfi->chips[i];
 
 		mutex_lock(&chip->mutex);
@@ -2038,7 +2046,7 @@ static void cfi_intelext_sync (struct mtd_info *mtd)
 
 	/* Unlock the chips again */
 
-	for (i--; i >=0; i--) {
+	for (i--; i >= 0; i--) {
 		chip = &cfi->chips[i];
 
 		mutex_lock(&chip->mutex);
@@ -2474,7 +2482,7 @@ static void cfi_intelext_save_locks(struct mtd_info *mtd)
 		if (!region->lockmap)
 			continue;
 
-		for (block = 0; block < region->numblocks; block++){
+		for (block = 0; block < region->numblocks; block++) {
 			len = region->erasesize;
 			adr = region->offset + block * len;
 
@@ -2501,7 +2509,7 @@ static int cfi_intelext_suspend(struct mtd_info *mtd)
 	    && extp && (extp->FeatureSupport & (1 << 5)))
 		cfi_intelext_save_locks(mtd);
 
-	for (i=0; !ret && i<cfi->numchips; i++) {
+	for (i = 0; !ret && i < cfi->numchips; i++) {
 		chip = &cfi->chips[i];
 
 		mutex_lock(&chip->mutex);
@@ -2542,7 +2550,7 @@ static int cfi_intelext_suspend(struct mtd_info *mtd)
 	/* Unlock the chips again */
 
 	if (ret) {
-		for (i--; i >=0; i--) {
+		for (i--; i >= 0; i--) {
 			chip = &cfi->chips[i];
 
 			mutex_lock(&chip->mutex);
@@ -2590,7 +2598,7 @@ static void cfi_intelext_resume(struct mtd_info *mtd)
 	int i;
 	struct flchip *chip;
 
-	for (i=0; i<cfi->numchips; i++) {
+	for (i = 0; i < cfi->numchips; i++) {
 
 		chip = &cfi->chips[i];
 
@@ -2619,7 +2627,7 @@ static int cfi_intelext_reset(struct mtd_info *mtd)
 	struct cfi_private *cfi = map->fldrv_priv;
 	int i, ret;
 
-	for (i=0; i < cfi->numchips; i++) {
+	for (i = 0; i < cfi->numchips; i++) {
 		struct flchip *chip = &cfi->chips[i];
 
 		/* force the completion of any ongoing operation
-- 
2.11.0
