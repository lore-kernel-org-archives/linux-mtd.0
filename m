Received: from mout.web.de ([212.227.15.4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRPw5-0002JZ-L9
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2017 20:56:00 +0000
Subject: [PATCH 18/18] mtd-cfi_cmdset_0020: Add some spaces for better code
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
Message-ID: <0e5ee358-fb62-5d0b-81cf-d73a1a47f6d4@users.sourceforge.net>
Date: Wed, 11 Jan 2017 21:55:20 +0100
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
Date: Wed, 11 Jan 2017 20:55:40 +0100

Use space characters at some source code places according to
the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/chips/cfi_cmdset_0020.c | 99 ++++++++++++++++++++-----------------
 1 file changed, 55 insertions(+), 44 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 60de9d58dcc6..f6b2bf056849 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -75,24 +75,24 @@ static void cfi_tell_features(struct cfi_pri_intelext *extp)
 	printk("     - Protection Bits:    %s\n", extp->FeatureSupport&64?"supported":"unsupported");
 	printk("     - Page-mode read:     %s\n", extp->FeatureSupport&128?"supported":"unsupported");
 	printk("     - Synchronous read:   %s\n", extp->FeatureSupport&256?"supported":"unsupported");
-	for (i=9; i<32; i++) {
-		if (extp->FeatureSupport & (1<<i))
+	for (i = 9; i < 32; i++) {
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
 	printk("     - Valid Bit Active:     %s\n", extp->BlkStatusRegMask&2?"yes":"no");
-	for (i=2; i<16; i++) {
-		if (extp->BlkStatusRegMask & (1<<i))
-			printk("     - Unknown Bit %X Active: yes\n",i);
+	for (i = 2; i < 16; i++) {
+		if (extp->BlkStatusRegMask & (1 << i))
+			printk("     - Unknown Bit %X Active: yes\n", i);
 	}
 
 	printk("  Vcc Logic Supply Optimum Program/Erase Voltage: %d.%d V\n",
@@ -121,7 +121,7 @@ struct mtd_info *cfi_cmdset_0020(struct map_info *map, int primary)
 		 * routine faked a CFI structure. So we read the feature
 		 * table from it.
 		 */
-		__u16 adr = primary?cfi->cfiq->P_ADR:cfi->cfiq->A_ADR;
+		__u16 adr = primary ? cfi->cfiq->P_ADR : cfi->cfiq->A_ADR;
 		struct cfi_pri_intelext *extp;
 
 		extp = (struct cfi_pri_intelext*)cfi_read_pri(map, adr, sizeof(*extp), "ST Microelectronics");
@@ -151,7 +151,7 @@ struct mtd_info *cfi_cmdset_0020(struct map_info *map, int primary)
 		cfi->cmdset_priv = extp;
 	}
 
-	for (i=0; i< cfi->numchips; i++) {
+	for (i = 0; i < cfi->numchips; i++) {
 		cfi->chips[i].word_write_time = 128;
 		cfi->chips[i].buffer_write_time = 128;
 		cfi->chips[i].erase_time = 1024;
@@ -168,8 +168,8 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 	struct cfi_private *cfi = map->fldrv_priv;
 	struct mtd_info *mtd;
 	unsigned long offset = 0;
-	int i,j;
-	unsigned long devsize = (1<<cfi->cfiq->DevSize) * cfi->interleave;
+	int i, j;
+	unsigned long devsize = (1 << cfi->cfiq->DevSize) * cfi->interleave;
 
 	mtd = kzalloc(sizeof(*mtd), GFP_KERNEL);
 	//printk(KERN_DEBUG "number of CFI chips: %d\n", cfi->numchips);
@@ -187,7 +187,7 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 	if (!mtd->eraseregions)
 		goto free_mtd;
 
-	for (i=0; i<cfi->cfiq->NumEraseRegions; i++) {
+	for (i = 0; i < cfi->cfiq->NumEraseRegions; i++) {
 		unsigned long ernum, ersize;
 		ersize = ((cfi->cfiq->EraseRegionInfo[i] >> 8) & ~0xff) * cfi->interleave;
 		ernum = (cfi->cfiq->EraseRegionInfo[i] & 0xffff) + 1;
@@ -195,10 +195,13 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 		if (mtd->erasesize < ersize) {
 			mtd->erasesize = ersize;
 		}
-		for (j=0; j<cfi->numchips; j++) {
-			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].offset = (j*devsize)+offset;
-			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].erasesize = ersize;
-			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].numblocks = ernum;
+		for (j = 0; j < cfi->numchips; j++) {
+			unsigned int const x = j * cfi->cfiq->NumEraseRegions
+					       + i;
+
+			mtd->eraseregions[x].offset = j * devsize + offset;
+			mtd->eraseregions[x].erasesize = ersize;
+			mtd->eraseregions[x].numblocks = ernum;
 		}
 		offset += (ersize * ernum);
 	}
@@ -210,7 +213,7 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 		goto free_mtd;
 	}
 
-	for (i=0; i<mtd->numeraseregions;i++){
+	for (i = 0; i < mtd->numeraseregions; i++) {
 		printk(KERN_DEBUG "%d: offset=0x%llx,size=0x%x,blocks=%d\n",
 		       i, (unsigned long long)mtd->eraseregions[i].offset,
 		       mtd->eraseregions[i].erasesize,
@@ -395,8 +398,8 @@ static int cfi_staa_read (struct mtd_info *mtd, loff_t from, size_t len, size_t
 		if (chipnum >= cfi->numchips)
 			break;
 
-		if ((len + ofs -1) >> cfi->chipshift)
-			thislen = (1<<cfi->chipshift) - ofs;
+		if ((len + ofs - 1) >> cfi->chipshift)
+			thislen = (1 << cfi->chipshift) - ofs;
 		else
 			thislen = len;
 
@@ -676,7 +679,7 @@ cfi_staa_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	if (!buffer)
 		return -ENOMEM;
 
-	for (i=0; i<count; i++) {
+	for (i = 0; i < count; i++) {
 		size_t elem_len = vecs[i].iov_len;
 		void *elem_base = vecs[i].iov_base;
 		if (!elem_len) /* FIXME: Might be unnecessary. Check that */
@@ -844,8 +847,9 @@ static inline int do_erase_oneblock(struct map_info *map, struct flchip *chip, u
 		unsigned char chipstatus = status.x[0];
 		if (!map_word_equal(map, status, CMD(chipstatus))) {
 			int i, w;
-			for (w=0; w<map_words(map); w++) {
-				for (i = 0; i<cfi_interleave(cfi); i++) {
+
+			for (w = 0; w < map_words(map); w++) {
+				for (i = 0; i < cfi_interleave(cfi); i++) {
 					chipstatus |= status.x[w] >> (cfi->device_type * 8);
 				}
 			}
@@ -925,7 +929,8 @@ static int cfi_staa_erase_varsize(struct mtd_info *mtd,
 	 * with the erase region at that address.
 	 */
 
-	while (i<mtd->numeraseregions && (instr->addr + instr->len) >= regions[i].offset)
+	while (i < mtd->numeraseregions
+	      && (instr->addr + instr->len) >= regions[i].offset)
 		i++;
 
 	/* As before, drop back one to point at the region in which
@@ -933,16 +938,15 @@ static int cfi_staa_erase_varsize(struct mtd_info *mtd,
 	*/
 	i--;
 
-	if ((instr->addr + instr->len) & (regions[i].erasesize-1))
+	if ((instr->addr + instr->len) & (regions[i].erasesize - 1))
 		return -EINVAL;
 
 	chipnum = instr->addr >> cfi->chipshift;
 	adr = instr->addr - (chipnum << cfi->chipshift);
 	len = instr->len;
+	i = first;
 
-	i=first;
-
-	while(len) {
+	while (len) {
 		ret = do_erase_oneblock(map, &cfi->chips[chipnum], adr);
 
 		if (ret)
@@ -951,7 +955,10 @@ static int cfi_staa_erase_varsize(struct mtd_info *mtd,
 		adr += regions[i].erasesize;
 		len -= regions[i].erasesize;
 
-		if (adr % (1<< cfi->chipshift) == (((unsigned long)regions[i].offset + (regions[i].erasesize * regions[i].numblocks)) %( 1<< cfi->chipshift)))
+		if (adr % (1 << cfi->chipshift)
+		   == (((unsigned long)regions[i].offset
+		      + (regions[i].erasesize * regions[i].numblocks))
+			% (1 << cfi->chipshift)))
 			i++;
 
 		if (adr >> cfi->chipshift) {
@@ -978,13 +985,13 @@ static void cfi_staa_sync (struct mtd_info *mtd)
 	int ret = 0;
 	DECLARE_WAITQUEUE(wait, current);
 
-	for (i=0; !ret && i<cfi->numchips; i++) {
+	for (i = 0; !ret && i < cfi->numchips; i++) {
 		chip = &cfi->chips[i];
 
 	retry:
 		mutex_lock(&chip->mutex);
 
-		switch(chip->state) {
+		switch (chip->state) {
 		case FL_READY:
 		case FL_STATUS:
 		case FL_CFI_QUERY:
@@ -1014,7 +1021,7 @@ static void cfi_staa_sync (struct mtd_info *mtd)
 
 	/* Unlock the chips again */
 
-	for (i--; i >=0; i--) {
+	for (i--; i >= 0; i--) {
 		chip = &cfi->chips[i];
 
 		mutex_lock(&chip->mutex);
@@ -1092,7 +1099,7 @@ static inline int do_lock_oneblock(struct map_info *map, struct flchip *chip, un
 	/* FIXME. Use a timer to check this, and return immediately. */
 	/* Once the state machine's known to be working I'll do that */
 
-	timeo = jiffies + (HZ*2);
+	timeo = jiffies + HZ * 2;
 	for (;;) {
 
 		status = map_read(map, adr);
@@ -1135,17 +1142,18 @@ static int cfi_staa_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (ofs & (mtd->erasesize - 1))
 		return -EINVAL;
 
-	if (len & (mtd->erasesize -1))
+	if (len & (mtd->erasesize - 1))
 		return -EINVAL;
 
 	chipnum = ofs >> cfi->chipshift;
 	adr = ofs - (chipnum << cfi->chipshift);
 
-	while(len) {
+	while (len) {
 
 #ifdef DEBUG_LOCK_BITS
 		cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
-		printk("before lock: block status register is %x\n",cfi_read_query(map, adr+(2*ofs_factor)));
+		printk("before lock: block status register is %x\n",
+		       cfi_read_query(map, adr + 2 * ofs_factor));
 		cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
 #endif
 
@@ -1153,7 +1161,8 @@ static int cfi_staa_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 
 #ifdef DEBUG_LOCK_BITS
 		cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
-		printk("after lock: block status register is %x\n",cfi_read_query(map, adr+(2*ofs_factor)));
+		printk("after lock: block status register is %x\n",
+		       cfi_read_query(map, adr + 2 * ofs_factor));
 		cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
 #endif
 
@@ -1238,7 +1247,7 @@ static inline int do_unlock_oneblock(struct map_info *map, struct flchip *chip,
 	/* FIXME. Use a timer to check this, and return immediately. */
 	/* Once the state machine's known to be working I'll do that */
 
-	timeo = jiffies + (HZ*2);
+	timeo = jiffies + HZ * 2;
 	for (;;) {
 
 		status = map_read(map, adr);
@@ -1288,7 +1297,9 @@ static int cfi_staa_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 
 		cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
                 while (temp_len) {
-			printk("before unlock %x: block status register is %x\n",temp_adr,cfi_read_query(map, temp_adr+(2*ofs_factor)));
+			printk("before unlock %x: block status register is %x\n",
+			       temp_adr,
+			       cfi_read_query(map, temp_adr + 2 * ofs_factor));
 			temp_adr += mtd->erasesize;
 			temp_len -= mtd->erasesize;
 		}
@@ -1300,7 +1311,8 @@ static int cfi_staa_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 
 #ifdef DEBUG_LOCK_BITS
 	cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
-	printk("after unlock: block status register is %x\n",cfi_read_query(map, adr+(2*ofs_factor)));
+	printk("after unlock: block status register is %x\n",
+	       cfi_read_query(map, adr + 2 * ofs_factor));
 	cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
 #endif
 
@@ -1315,12 +1327,12 @@ static int cfi_staa_suspend(struct mtd_info *mtd)
 	struct flchip *chip;
 	int ret = 0;
 
-	for (i=0; !ret && i<cfi->numchips; i++) {
+	for (i = 0; !ret && i < cfi->numchips; i++) {
 		chip = &cfi->chips[i];
 
 		mutex_lock(&chip->mutex);
 
-		switch(chip->state) {
+		switch (chip->state) {
 		case FL_READY:
 		case FL_STATUS:
 		case FL_CFI_QUERY:
@@ -1344,7 +1356,7 @@ static int cfi_staa_suspend(struct mtd_info *mtd)
 	/* Unlock the chips again */
 
 	if (ret) {
-		for (i--; i >=0; i--) {
+		for (i--; i >= 0; i--) {
 			chip = &cfi->chips[i];
 
 			mutex_lock(&chip->mutex);
@@ -1370,8 +1382,7 @@ static void cfi_staa_resume(struct mtd_info *mtd)
 	int i;
 	struct flchip *chip;
 
-	for (i=0; i<cfi->numchips; i++) {
-
+	for (i = 0; i < cfi->numchips; i++) {
 		chip = &cfi->chips[i];
 
 		mutex_lock(&chip->mutex);
-- 
2.11.0
