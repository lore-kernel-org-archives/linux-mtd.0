Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Or8Ra-0006Fd-MV
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 11:59:03 +0000
Received: by wwb24 with SMTP id 24so576929wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 04:59:01 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
Date: Thu, 2 Sep 2010 13:55:46 +0200
Subject: [PATCH 1/2 l2-mtd-2.6/dunno] NAND: fix all checkpatch errors in
	nand_base.c
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201009021355.47808.ffainelli@freebox.fr>
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
---
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8ea0110..9d66557 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -59,7 +59,7 @@ static struct nand_ecclayout nand_oob_8 = {
 		{.offset = 3,
 		 .length = 2},
 		{.offset = 6,
-		 .length = 2}}
+		 .length = 2} }
 };
 
 static struct nand_ecclayout nand_oob_16 = {
@@ -67,7 +67,7 @@ static struct nand_ecclayout nand_oob_16 = {
 	.eccpos = {0, 1, 2, 3, 6, 7},
 	.oobfree = {
 		{.offset = 8,
-		 . length = 8}}
+		 . length = 8} }
 };
 
 static struct nand_ecclayout nand_oob_64 = {
@@ -78,7 +78,7 @@ static struct nand_ecclayout nand_oob_64 = {
 		   56, 57, 58, 59, 60, 61, 62, 63},
 	.oobfree = {
 		{.offset = 2,
-		 .length = 38}}
+		 .length = 38} }
 };
 
 static struct nand_ecclayout nand_oob_128 = {
@@ -92,7 +92,7 @@ static struct nand_ecclayout nand_oob_128 = {
 		   120, 121, 122, 123, 124, 125, 126, 127},
 	.oobfree = {
 		{.offset = 2,
-		 .length = 78}}
+		 .length = 78} }
 };
 
 static int nand_get_device(struct nand_chip *chip, struct mtd_info *mtd,
@@ -612,7 +612,8 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 			       NAND_CTRL_CLE | NAND_CTRL_CHANGE);
 		chip->cmd_ctrl(mtd,
 			       NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
-		while (!(chip->read_byte(mtd) & NAND_STATUS_READY)) ;
+		while (!(chip->read_byte(mtd) & NAND_STATUS_READY))
+				;
 		return;
 
 		/* This applies to read commands */
@@ -718,7 +719,8 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
 		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
 			       NAND_NCE | NAND_CTRL_CHANGE);
-		while (!(chip->read_byte(mtd) & NAND_STATUS_READY)) ;
+		while (!(chip->read_byte(mtd) & NAND_STATUS_READY))
+			;
 		return;
 
 	case NAND_CMD_RNDOUT:
@@ -834,7 +836,7 @@ static void panic_nand_wait(struct mtd_info *mtd, struct nand_chip *chip,
 				break;
 		}
 		mdelay(1);
-        }
+	}
 }
 
 /**
@@ -1390,7 +1392,7 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 static uint8_t *nand_transfer_oob(struct nand_chip *chip, uint8_t *oob,
 				  struct mtd_oob_ops *ops, size_t len)
 {
-	switch(ops->mode) {
+	switch (ops->mode) {
 
 	case MTD_OOB_PLACE:
 	case MTD_OOB_RAW:
@@ -1402,7 +1404,7 @@ static uint8_t *nand_transfer_oob(struct nand_chip *chip, uint8_t *oob,
 		uint32_t boffs = 0, roffs = ops->ooboffs;
 		size_t bytes = 0;
 
-		for(; free->length && len; free++, len -= bytes) {
+		for (; free->length && len; free++, len -= bytes) {
 			/* Read request not from offset 0 ? */
 			if (unlikely(roffs)) {
 				if (roffs >= free->length) {
@@ -1466,7 +1468,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	buf = ops->datbuf;
 	oob = ops->oobbuf;
 
-	while(1) {
+	while (1) {
 		bytes = min(mtd->writesize - col, readlen);
 		aligned = (bytes == mtd->writesize);
 
@@ -1791,7 +1793,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	realpage = (int)(from >> chip->page_shift);
 	page = realpage & chip->pagemask;
 
-	while(1) {
+	while (1) {
 		sndcmd = chip->ecc.read_oob(mtd, chip, page, sndcmd);
 
 		len = min(len, readlen);
@@ -1861,7 +1863,7 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 
 	nand_get_device(chip, mtd, FL_READING);
 
-	switch(ops->mode) {
+	switch (ops->mode) {
 	case MTD_OOB_PLACE:
 	case MTD_OOB_AUTO:
 	case MTD_OOB_RAW:
@@ -2099,7 +2101,7 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 static uint8_t *nand_fill_oob(struct nand_chip *chip, uint8_t *oob, size_t len,
 						struct mtd_oob_ops *ops)
 {
-	switch(ops->mode) {
+	switch (ops->mode) {
 
 	case MTD_OOB_PLACE:
 	case MTD_OOB_RAW:
@@ -2111,7 +2113,7 @@ static uint8_t *nand_fill_oob(struct nand_chip *chip, uint8_t *oob, size_t len,
 		uint32_t boffs = 0, woffs = ops->ooboffs;
 		size_t bytes = 0;
 
-		for(; free->length && len; free++, len -= bytes) {
+		for (; free->length && len; free++, len -= bytes) {
 			/* Write request not from offset 0 ? */
 			if (unlikely(woffs)) {
 				if (woffs >= free->length) {
@@ -2137,7 +2139,7 @@ static uint8_t *nand_fill_oob(struct nand_chip *chip, uint8_t *oob, size_t len,
 	return NULL;
 }
 
-#define NOTALIGNED(x)	(x & (chip->subpagesize - 1)) != 0
+#define NOTALIGNED(x)	((x & (chip->subpagesize - 1)) != 0)
 
 /**
  * nand_do_write_ops - [Internal] NAND write with ECC
@@ -2203,7 +2205,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	if (ops->ooboffs && (ops->ooboffs + ops->ooblen > oobmaxlen))
 		return -EINVAL;
 
-	while(1) {
+	while (1) {
 		int bytes = mtd->writesize;
 		int cached = writelen > bytes && page != blockmask;
 		uint8_t *wbuf = buf;
@@ -2431,7 +2433,7 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 
 	nand_get_device(chip, mtd, FL_WRITING);
 
-	switch(ops->mode) {
+	switch (ops->mode) {
 	case MTD_OOB_PLACE:
 	case MTD_OOB_AUTO:
 	case MTD_OOB_RAW:
@@ -2511,7 +2513,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 {
 	int page, status, pages_per_block, ret, chipnr;
 	struct nand_chip *chip = mtd->priv;
-	loff_t rewrite_bbt[NAND_MAX_CHIPS]={0};
+	loff_t rewrite_bbt[NAND_MAX_CHIPS] = {0};
 	unsigned int bbt_masked_page = 0xffffffff;
 	loff_t len;
 
@@ -2706,7 +2708,8 @@ static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	struct nand_chip *chip = mtd->priv;
 	int ret;
 
-	if ((ret = nand_block_isbad(mtd, ofs))) {
+	ret = nand_block_isbad(mtd, ofs);
+	if (ret) {
 		/* If it was bad already, return success and do nothing. */
 		if (ret > 0)
 			return 0;
@@ -2935,7 +2938,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	for (; type->name != NULL; type++)
 		if (*dev_id == type->id)
-                        break;
+			break;
 
 	chip->onfi_version = 0;
 	if (!type->name || !type->pagesize) {
@@ -3123,7 +3126,7 @@ ident_done:
 	printk(KERN_INFO "NAND device: Manufacturer ID:"
 		" 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, *dev_id,
 		nand_manuf_ids[maf_idx].name,
-		chip->onfi_version ? type->name:chip->onfi_params.model);
+		chip->onfi_version ? type->name : chip->onfi_params.model);
 
 	return type;
 }
@@ -3346,7 +3349,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	 * mode
 	 */
 	chip->ecc.steps = mtd->writesize / chip->ecc.size;
-	if(chip->ecc.steps * chip->ecc.size != mtd->writesize) {
+	if (chip->ecc.steps * chip->ecc.size != mtd->writesize) {
 		printk(KERN_WARNING "Invalid ecc parameters\n");
 		BUG();
 	}
@@ -3358,7 +3361,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	 */
 	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
 	    !(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
-		switch(chip->ecc.steps) {
+		switch (chip->ecc.steps) {
 		case 2:
 			mtd->subpage_sft = 1;
 			break;
