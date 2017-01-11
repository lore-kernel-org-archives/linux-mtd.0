Received: from mout.web.de ([212.227.15.4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRPo5-0005oE-2o
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2017 20:47:43 +0000
Subject: [PATCH 12/18] mtd-cfi_cmdset_0002: Add some spaces for better code
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
Message-ID: <0001d1b9-d7ba-2292-e448-33c35a57cc75@users.sourceforge.net>
Date: Wed, 11 Jan 2017 21:47:09 +0100
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
Date: Wed, 11 Jan 2017 18:45:20 +0100

Use space characters at some source code places according to
the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 84 +++++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index dc02d99bd7dc..7d4d4a144631 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -546,9 +546,9 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 	mtd->_panic_write = cfi_amdstd_panic_write;
 	mtd->reboot_notifier.notifier_call = cfi_amdstd_reboot;
 
-	if (cfi->cfi_mode==CFI_MODE_CFI){
+	if (cfi->cfi_mode == CFI_MODE_CFI) {
 		unsigned char bootloc;
-		__u16 adr = primary?cfi->cfiq->P_ADR:cfi->cfiq->A_ADR;
+		__u16 adr = primary ? cfi->cfiq->P_ADR : cfi->cfiq->A_ADR;
 		struct cfi_pri_amdstd *extp;
 
 		extp = (struct cfi_pri_amdstd*)cfi_read_pri(map, adr, sizeof(*extp), "Amd/Fujitsu");
@@ -613,8 +613,11 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 			if (bootloc == 3 && cfi->cfiq->NumEraseRegions > 1) {
 				printk(KERN_WARNING "%s: Swapping erase regions for top-boot CFI table.\n", map->name);
 
-				for (i=0; i<cfi->cfiq->NumEraseRegions / 2; i++) {
-					int j = (cfi->cfiq->NumEraseRegions-1)-i;
+				for (i = 0;
+				     i < cfi->cfiq->NumEraseRegions / 2;
+				     i++) {
+					int j = cfi->cfiq->NumEraseRegions - 1
+						- i;
 
 					swap(cfi->cfiq->EraseRegionInfo[i],
 					     cfi->cfiq->EraseRegionInfo[j]);
@@ -639,10 +642,12 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 	/* Apply generic fixups */
 	cfi_fixup(mtd, fixup_table);
 
-	for (i=0; i< cfi->numchips; i++) {
-		cfi->chips[i].word_write_time = 1<<cfi->cfiq->WordWriteTimeoutTyp;
-		cfi->chips[i].buffer_write_time = 1<<cfi->cfiq->BufWriteTimeoutTyp;
-		cfi->chips[i].erase_time = 1<<cfi->cfiq->BlockEraseTimeoutTyp;
+	for (i = 0; i < cfi->numchips; i++) {
+		cfi->chips[i].word_write_time
+			= 1 << cfi->cfiq->WordWriteTimeoutTyp;
+		cfi->chips[i].buffer_write_time
+			= 1 << cfi->cfiq->BufWriteTimeoutTyp;
+		cfi->chips[i].erase_time = 1 << cfi->cfiq->BlockEraseTimeoutTyp;
 		/*
 		 * First calculate the timeout max according to timeout field
 		 * of struct cfi_ident that probed from chip's CFI aera, if
@@ -678,12 +683,13 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long devsize = (1<<cfi->cfiq->DevSize) * cfi->interleave;
+	unsigned long devsize = (1 << cfi->cfiq->DevSize) * cfi->interleave;
 	unsigned long offset = 0;
-	int i,j;
+	int i, j;
 
 	printk(KERN_NOTICE "number of %s chips: %d\n",
-	       (cfi->cfi_mode == CFI_MODE_CFI)?"CFI":"JEDEC",cfi->numchips);
+	       (cfi->cfi_mode == CFI_MODE_CFI) ? "CFI" : "JEDEC",
+	       cfi->numchips);
 	/* Select the correct geometry setup */
 	mtd->size = devsize * cfi->numchips;
 
@@ -694,7 +700,7 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
 	if (!mtd->eraseregions)
 		goto free_priv;
 
-	for (i=0; i<cfi->cfiq->NumEraseRegions; i++) {
+	for (i = 0; i < cfi->cfiq->NumEraseRegions; i++) {
 		unsigned long ernum, ersize;
 		ersize = ((cfi->cfiq->EraseRegionInfo[i] >> 8) & ~0xff) * cfi->interleave;
 		ernum = (cfi->cfiq->EraseRegionInfo[i] & 0xffff) + 1;
@@ -702,10 +708,13 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
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
@@ -882,7 +891,7 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 
-	switch(chip->oldstate) {
+	switch (chip->oldstate) {
 	case FL_ERASING:
 		cfi_fixup_m29ew_erase_suspend(map,
 			chip->in_progress_block_addr);
@@ -1151,8 +1160,8 @@ static int cfi_amdstd_read (struct mtd_info *mtd, loff_t from, size_t len, size_
 		if (chipnum >= cfi->numchips)
 			break;
 
-		if ((len + ofs -1) >> cfi->chipshift)
-			thislen = (1<<cfi->chipshift) - ofs;
+		if ((len + ofs - 1) >> cfi->chipshift)
+			thislen = (1 << cfi->chipshift) - ofs;
 		else
 			thislen = len;
 
@@ -1216,7 +1225,7 @@ static inline int do_read_secsi_onechip(struct map_info *map,
  retry:
 	mutex_lock(&chip->mutex);
 
-	if (chip->state != FL_READY){
+	if (chip->state != FL_READY) {
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		add_wait_queue(&chip->wq, &wait);
 
@@ -1253,8 +1262,8 @@ static int cfi_amdstd_secsi_read (struct mtd_info *mtd, loff_t from, size_t len,
 
 	/* ofs: offset within the first chip that the first read should start */
 	/* 8 secsi bytes per chip */
-	chipnum=from>>3;
-	ofs=from & 7;
+	chipnum = from >> 3;
+	ofs = from & 7;
 
 	while (len) {
 		unsigned long thislen;
@@ -1262,8 +1271,8 @@ static int cfi_amdstd_secsi_read (struct mtd_info *mtd, loff_t from, size_t len,
 		if (chipnum >= cfi->numchips)
 			break;
 
-		if ((len + ofs -1) >> 3)
-			thislen = (1<<3) - ofs;
+		if ((len + ofs - 1) >> 3)
+			thislen = (1 << 3) - ofs;
 		else
 			thislen = len;
 
@@ -1624,7 +1633,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 
-		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
+		if (time_after(jiffies, timeo) && !chip_ready(map, adr)) {
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
 			xip_disable(map, chip, adr);
@@ -1725,7 +1734,7 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 	}
 
 	/* We are now aligned, write as much as possible */
-	while(len >= map_bankwidth(map)) {
+	while (len >= map_bankwidth(map)) {
 		map_word datum;
 
 		datum = map_word_load(map, buf);
@@ -1837,7 +1846,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	map_write(map, CMD(words - 1), cmd_adr);
 	/* Write data */
 	z = 0;
-	while(z < words * map_bankwidth(map)) {
+	while (z < words * map_bankwidth(map)) {
 		datum = map_word_load(map, buf);
 		map_write(map, datum, adr + z);
 
@@ -1934,7 +1943,8 @@ static int cfi_amdstd_write_buffers(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t local_len = (-ofs)&(map_bankwidth(map)-1);
 		if (local_len > len)
 			local_len = len;
-		ret = cfi_amdstd_write_words(mtd, ofs + (chipnum<<cfi->chipshift),
+		ret = cfi_amdstd_write_words(mtd,
+					     ofs + (chipnum << cfi->chipshift),
 					     local_len, retlen, buf);
 		if (ret)
 			return ret;
@@ -1981,7 +1991,8 @@ static int cfi_amdstd_write_buffers(struct mtd_info *mtd, loff_t to, size_t len,
 	if (len) {
 		size_t retlen_dregs = 0;
 
-		ret = cfi_amdstd_write_words(mtd, ofs + (chipnum<<cfi->chipshift),
+		ret = cfi_amdstd_write_words(mtd,
+					     ofs + (chipnum << cfi->chipshift),
 					     len, &retlen_dregs, buf);
 
 		*retlen += retlen_dregs;
@@ -2732,13 +2743,13 @@ static void cfi_amdstd_sync (struct mtd_info *mtd)
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
@@ -2770,7 +2781,7 @@ static void cfi_amdstd_sync (struct mtd_info *mtd)
 
 	/* Unlock the chips again */
 
-	for (i--; i >=0; i--) {
+	for (i--; i >= 0; i--) {
 		chip = &cfi->chips[i];
 
 		mutex_lock(&chip->mutex);
@@ -2792,12 +2803,12 @@ static int cfi_amdstd_suspend(struct mtd_info *mtd)
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
@@ -2821,7 +2832,7 @@ static int cfi_amdstd_suspend(struct mtd_info *mtd)
 	/* Unlock the chips again */
 
 	if (ret) {
-		for (i--; i >=0; i--) {
+		for (i--; i >= 0; i--) {
 			chip = &cfi->chips[i];
 
 			mutex_lock(&chip->mutex);
@@ -2845,8 +2856,7 @@ static void cfi_amdstd_resume(struct mtd_info *mtd)
 	int i;
 	struct flchip *chip;
 
-	for (i=0; i<cfi->numchips; i++) {
-
+	for (i = 0; i < cfi->numchips; i++) {
 		chip = &cfi->chips[i];
 
 		mutex_lock(&chip->mutex);
-- 
2.11.0
