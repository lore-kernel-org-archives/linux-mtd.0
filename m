Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjDln-0004Ov-Ez
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 17:07:48 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 05/11] mtd: cleanup style on pr_debug messages
Date: Tue, 19 Jul 2011 10:06:10 -0700
Message-ID: <1311095176-5407-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
References: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   10 ++++------
 drivers/mtd/devices/m25p80.c        |   33 ++++++++++++++-------------------
 drivers/mtd/devices/mtd_dataflash.c |   18 +++++++++---------
 drivers/mtd/inftlcore.c             |   35 ++++++++++++++++-------------------
 drivers/mtd/inftlmount.c            |    3 +--
 drivers/mtd/nand/mxc_nand.c         |    6 ++----
 drivers/mtd/nand/nand_bch.c         |    4 ++--
 drivers/mtd/nand/omap2.c            |    4 ++--
 drivers/mtd/onenand/onenand_base.c  |   31 ++++++++++++++++---------------
 9 files changed, 66 insertions(+), 78 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 2302cc0..8d70895 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -440,8 +440,8 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 	mtd->writesize = 1;
 	mtd->writebufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
 
-	pr_debug("MTD %s(): write buffer size %d\n",
-		__func__, mtd->writebufsize);
+	pr_debug("MTD %s(): write buffer size %d\n", __func__,
+			mtd->writebufsize);
 
 	mtd->reboot_notifier.notifier_call = cfi_amdstd_reboot;
 
@@ -1798,8 +1798,7 @@ static int do_atmel_lock(struct map_info *map, struct flchip *chip,
 		goto out_unlock;
 	chip->state = FL_LOCKING;
 
-	pr_debug("MTD %s(): LOCK 0x%08lx len %d\n",
-	      __func__, adr, len);
+	pr_debug("MTD %s(): LOCK 0x%08lx len %d\n", __func__, adr, len);
 
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
 			 cfi->device_type, NULL);
@@ -1834,8 +1833,7 @@ static int do_atmel_unlock(struct map_info *map, struct flchip *chip,
 		goto out_unlock;
 	chip->state = FL_UNLOCKING;
 
-	pr_debug("MTD %s(): LOCK 0x%08lx len %d\n",
-	      __func__, adr, len);
+	pr_debug("MTD %s(): LOCK 0x%08lx len %d\n", __func__, adr, len);
 
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
 			 cfi->device_type, NULL);
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 6417bd6..e6ba034 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -208,9 +208,8 @@ static int wait_till_ready(struct m25p *flash)
  */
 static int erase_chip(struct m25p *flash)
 {
-	pr_debug("%s: %s %lldKiB\n",
-	      dev_name(&flash->spi->dev), __func__,
-	      (long long)(flash->mtd.size >> 10));
+	pr_debug("%s: %s %lldKiB\n", dev_name(&flash->spi->dev), __func__,
+			(long long)(flash->mtd.size >> 10));
 
 	/* Wait until finished previous write command. */
 	if (wait_till_ready(flash))
@@ -249,9 +248,8 @@ static int m25p_cmdsz(struct m25p *flash)
  */
 static int erase_sector(struct m25p *flash, u32 offset)
 {
-	pr_debug("%s: %s %dKiB at 0x%08x\n",
-			dev_name(&flash->spi->dev), __func__,
-			flash->mtd.erasesize / 1024, offset);
+	pr_debug("%s: %s %dKiB at 0x%08x\n", dev_name(&flash->spi->dev),
+			__func__, flash->mtd.erasesize / 1024, offset);
 
 	/* Wait until finished previous write command. */
 	if (wait_till_ready(flash))
@@ -285,9 +283,9 @@ static int m25p80_erase(struct mtd_info *mtd, struct erase_info *instr)
 	u32 addr,len;
 	uint32_t rem;
 
-	pr_debug("%s: %s %s 0x%llx, len %lld\n",
-	      dev_name(&flash->spi->dev), __func__, "at",
-	      (long long)instr->addr, (long long)instr->len);
+	pr_debug("%s: %s at 0x%llx, len %lld\n", dev_name(&flash->spi->dev),
+			__func__, (long long)instr->addr,
+			(long long)instr->len);
 
 	/* sanity checks */
 	if (instr->addr + instr->len > flash->mtd.size)
@@ -347,9 +345,8 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	struct spi_transfer t[2];
 	struct spi_message m;
 
-	pr_debug("%s: %s %s 0x%08x, len %zd\n",
-			dev_name(&flash->spi->dev), __func__, "from",
-			(u32)from, len);
+	pr_debug("%s: %s from 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
+			__func__, (u32)from, len);
 
 	/* sanity checks */
 	if (!len)
@@ -416,9 +413,8 @@ static int m25p80_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct spi_transfer t[2];
 	struct spi_message m;
 
-	pr_debug("%s: %s %s 0x%08x, len %zd\n",
-			dev_name(&flash->spi->dev), __func__, "to",
-			(u32)to, len);
+	pr_debug("%s: %s to 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
+			__func__, (u32)to, len);
 
 	*retlen = 0;
 
@@ -509,9 +505,8 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	size_t actual;
 	int cmd_sz, ret;
 
-	pr_debug("%s: %s %s 0x%08x, len %zd\n",
-			dev_name(&flash->spi->dev), __func__, "to",
-			(u32)to, len);
+	pr_debug("%s: %s to 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
+			__func__, (u32)to, len);
 
 	*retlen = 0;
 
@@ -788,7 +783,7 @@ static const struct spi_device_id *__devinit jedec_probe(struct spi_device *spi)
 	tmp = spi_write_then_read(spi, &code, 1, id, 5);
 	if (tmp < 0) {
 		pr_debug("%s: error %d reading JEDEC ID\n",
-			dev_name(&spi->dev), tmp);
+				dev_name(&spi->dev), tmp);
 		return ERR_PTR(tmp);
 	}
 	jedec = id[0];
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index db0ab7e..83cfb07 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -238,8 +238,8 @@ static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 	uint8_t			*command;
 	int			status;
 
-	pr_debug("%s: read 0x%x..0x%x\n",
-		dev_name(&priv->spi->dev), (unsigned)from, (unsigned)(from + len));
+	pr_debug("%s: read 0x%x..0x%x\n", dev_name(&priv->spi->dev),
+			(unsigned)from, (unsigned)(from + len));
 
 	*retlen = 0;
 
@@ -373,7 +373,7 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 			status = spi_sync(spi, &msg);
 			if (status < 0)
-				pr_debug("%s: xfer %u -> %d \n",
+				pr_debug("%s: xfer %u -> %d\n",
 					dev_name(&spi->dev), addr, status);
 
 			(void) dataflash_waitready(priv->spi);
@@ -395,7 +395,7 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 		status = spi_sync(spi, &msg);
 		spi_transfer_del(x + 1);
 		if (status < 0)
-			pr_debug("%s: pgm %u/%u -> %d \n",
+			pr_debug("%s: pgm %u/%u -> %d\n",
 				dev_name(&spi->dev), addr, writelen, status);
 
 		(void) dataflash_waitready(priv->spi);
@@ -415,7 +415,7 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 		status = spi_sync(spi, &msg);
 		if (status < 0)
-			pr_debug("%s: compare %u -> %d \n",
+			pr_debug("%s: compare %u -> %d\n",
 				dev_name(&spi->dev), addr, status);
 
 		status = dataflash_waitready(priv->spi);
@@ -893,14 +893,14 @@ static int __devinit dataflash_probe(struct spi_device *spi)
 		break;
 	/* obsolete AT45DB1282 not (yet?) supported */
 	default:
-		pr_debug("%s: unsupported device (%x)\n",
-				dev_name(&spi->dev), status & 0x3c);
+		pr_debug("%s: unsupported device (%x)\n", dev_name(&spi->dev),
+				status & 0x3c);
 		status = -ENODEV;
 	}
 
 	if (status < 0)
-		pr_debug("%s: add_dataflash --> %d\n",
-				dev_name(&spi->dev), status);
+		pr_debug("%s: add_dataflash --> %d\n", dev_name(&spi->dev),
+				status);
 
 	return status;
 }
diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index 232e11b..21aa981 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -213,16 +213,16 @@ static u16 INFTL_findfreeblock(struct INFTLrecord *inftl, int desperate)
 	u16 pot = inftl->LastFreeEUN;
 	int silly = inftl->nb_blocks;
 
-	pr_debug("INFTL: INFTL_findfreeblock(inftl=%p,"
-		"desperate=%d)\n", inftl, desperate);
+	pr_debug("INFTL: INFTL_findfreeblock(inftl=%p,desperate=%d)\n",
+			inftl, desperate);
 
 	/*
 	 * Normally, we force a fold to happen before we run out of free
 	 * blocks completely.
 	 */
 	if (!desperate && inftl->numfreeEUNs < 2) {
-		pr_debug("INFTL: there are too few free "
-			"EUNs (%d)\n", inftl->numfreeEUNs);
+		pr_debug("INFTL: there are too few free EUNs (%d)\n",
+				inftl->numfreeEUNs);
 		return BLOCK_NIL;
 	}
 
@@ -257,8 +257,8 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, unsigned thisVUC, unsigned
 	struct inftl_oob oob;
 	size_t retlen;
 
-	pr_debug("INFTL: INFTL_foldchain(inftl=%p,thisVUC=%d,"
-		"pending=%d)\n", inftl, thisVUC, pendingblock);
+	pr_debug("INFTL: INFTL_foldchain(inftl=%p,thisVUC=%d,pending=%d)\n",
+			inftl, thisVUC, pendingblock);
 
 	memset(BlockMap, 0xff, sizeof(BlockMap));
 	memset(BlockDeleted, 0, sizeof(BlockDeleted));
@@ -321,8 +321,7 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, unsigned thisVUC, unsigned
 	 * Chain, and the Erase Unit into which we are supposed to be copying.
 	 * Go for it.
 	 */
-	pr_debug("INFTL: folding chain %d into unit %d\n",
-		thisVUC, targetEUN);
+	pr_debug("INFTL: folding chain %d into unit %d\n", thisVUC, targetEUN);
 
 	for (block = 0; block < inftl->EraseSize/SECTORSIZE ; block++) {
 		unsigned char movebuf[SECTORSIZE];
@@ -353,8 +352,7 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, unsigned thisVUC, unsigned
 					(block * SECTORSIZE), SECTORSIZE,
 					&retlen, movebuf);
 			if (ret != -EIO)
-				pr_debug("INFTL: error went "
-				      "away on retry?\n");
+				pr_debug("INFTL: error went away on retry?\n");
 		}
 		memset(&oob, 0xff, sizeof(struct inftl_oob));
 		oob.b.Status = oob.b.Status1 = SECTOR_USED;
@@ -370,8 +368,7 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, unsigned thisVUC, unsigned
 	 * is important, by doing oldest first if we crash/reboot then it
 	 * it is relatively simple to clean up the mess).
 	 */
-	pr_debug("INFTL: want to erase virtual chain %d\n",
-		thisVUC);
+	pr_debug("INFTL: want to erase virtual chain %d\n", thisVUC);
 
 	for (;;) {
 		/* Find oldest unit in chain. */
@@ -482,8 +479,8 @@ static inline u16 INFTL_findwriteunit(struct INFTLrecord *inftl, unsigned block)
 	size_t retlen;
 	int silly, silly2 = 3;
 
-	pr_debug("INFTL: INFTL_findwriteunit(inftl=%p,"
-		"block=%d)\n", inftl, block);
+	pr_debug("INFTL: INFTL_findwriteunit(inftl=%p,block=%d)\n",
+			inftl, block);
 
 	do {
 		/*
@@ -499,8 +496,8 @@ static inline u16 INFTL_findwriteunit(struct INFTLrecord *inftl, unsigned block)
 				       blockofs, 8, &retlen, (char *)&bci);
 
 			status = bci.Status | bci.Status1;
-			pr_debug("INFTL: status of block %d in "
-				"EUN %d is %x\n", block , writeEUN, status);
+			pr_debug("INFTL: status of block %d in EUN %d is %x\n",
+					block , writeEUN, status);
 
 			switch(status) {
 			case SECTOR_FREE:
@@ -553,9 +550,9 @@ hitused:
 			 * Hopefully we free something, lets try again.
 			 * This time we are desperate...
 			 */
-			pr_debug("INFTL: using desperate==1 "
-				"to find free EUN to accommodate write to "
-				"VUC %d\n", thisVUC);
+			pr_debug("INFTL: using desperate==1 to find free EUN "
+					"to accommodate write to VUC %d\n",
+					thisVUC);
 			writeEUN = INFTL_findfreeblock(inftl, 1);
 			if (writeEUN == BLOCK_NIL) {
 				/*
diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index d969c2d..bd82b04 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -385,8 +385,7 @@ int INFTL_formatblock(struct INFTLrecord *inftl, int block)
 	struct mtd_info *mtd = inftl->mbd.mtd;
 	int physblock;
 
-	pr_debug("INFTL: INFTL_formatblock(inftl=%p,"
-		"block=%d)\n", inftl, block);
+	pr_debug("INFTL: INFTL_formatblock(inftl=%p,block=%d)\n", inftl, block);
 
 	memset(instr, 0, sizeof(struct erase_info));
 
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 2fbfb71..ebeb843 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -349,8 +349,7 @@ static void wait_op_done(struct mxc_nand_host *host, int useirq)
 			udelay(1);
 		}
 		if (max_retries < 0)
-			pr_debug("%s: INT not set\n",
-			      __func__);
+			pr_debug("%s: INT not set\n", __func__);
 	}
 }
 
@@ -386,8 +385,7 @@ static void send_cmd_v1_v2(struct mxc_nand_host *host, uint16_t cmd, int useirq)
 			udelay(1);
 		}
 		if (max_retries < 0)
-			pr_debug("%s: RESET failed\n",
-			      __func__);
+			pr_debug("%s: RESET failed\n", __func__);
 	} else {
 		/* Wait for operation to complete */
 		wait_op_done(host, useirq);
diff --git a/drivers/mtd/nand/nand_bch.c b/drivers/mtd/nand/nand_bch.c
index 16cca9b..3803e0b 100644
--- a/drivers/mtd/nand/nand_bch.c
+++ b/drivers/mtd/nand/nand_bch.c
@@ -93,8 +93,8 @@ int nand_bch_correct_data(struct mtd_info *mtd, unsigned char *buf,
 				buf[errloc[i] >> 3] ^= (1 << (errloc[i] & 7));
 			/* else error in ecc, no action needed */
 
-			pr_debug("%s: corrected bitflip %u\n",
-			      __func__, errloc[i]);
+			pr_debug("%s: corrected bitflip %u\n", __func__,
+					errloc[i]);
 		}
 	} else if (count < 0) {
 		printk(KERN_ERR "ecc unrecoverable error\n");
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 81e6bc0..19b283f 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -763,8 +763,8 @@ static int omap_compare_ecc(u8 *ecc_data1,	/* read from NAND memory */
 
 		find_bit = (ecc_bit[5] << 2) + (ecc_bit[3] << 1) + ecc_bit[1];
 
-		pr_debug("Correcting single bit ECC error at "
-				"offset: %d, bit: %d\n", find_byte, find_bit);
+		pr_debug("Correcting single bit ECC error at offset: "
+				"%d, bit: %d\n", find_byte, find_bit);
 
 		page_data[find_byte] ^= (1 << find_bit);
 
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index b07b052..de98791 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1122,8 +1122,8 @@ static int onenand_mlc_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	int ret = 0;
 	int writesize = this->writesize;
 
-	pr_debug("%s: from = 0x%08x, len = %i\n",
-	      __func__, (unsigned int) from, (int) len);
+	pr_debug("%s: from = 0x%08x, len = %i\n", __func__, (unsigned int)from,
+			(int)len);
 
 	if (ops->mode == MTD_OOB_AUTO)
 		oobsize = this->ecclayout->oobavail;
@@ -1226,8 +1226,8 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	int ret = 0, boundary = 0;
 	int writesize = this->writesize;
 
-	pr_debug("%s: from = 0x%08x, len = %i\n",
-			__func__, (unsigned int) from, (int) len);
+	pr_debug("%s: from = 0x%08x, len = %i\n", __func__, (unsigned int)from,
+			(int)len);
 
 	if (ops->mode == MTD_OOB_AUTO)
 		oobsize = this->ecclayout->oobavail;
@@ -1357,8 +1357,8 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 
 	from += ops->ooboffs;
 
-	pr_debug("%s: from = 0x%08x, len = %i\n",
-		__func__, (unsigned int) from, (int) len);
+	pr_debug("%s: from = 0x%08x, len = %i\n", __func__, (unsigned int)from,
+			(int)len);
 
 	/* Initialize return length value */
 	ops->oobretlen = 0;
@@ -1576,8 +1576,8 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 	size_t len = ops->ooblen;
 	u_char *buf = ops->oobbuf;
 
-	pr_debug("%s: from = 0x%08x, len = %zi\n",
-		__func__, (unsigned int) from, len);
+	pr_debug("%s: from = 0x%08x, len = %zi\n", __func__, (unsigned int)from,
+			len);
 
 	/* Initialize return value */
 	ops->oobretlen = 0;
@@ -1750,8 +1750,8 @@ static int onenand_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 	/* Wait for any existing operation to clear */
 	onenand_panic_wait(mtd);
 
-	pr_debug("%s: to = 0x%08x, len = %i\n",
-		__func__, (unsigned int) to, (int) len);
+	pr_debug("%s: to = 0x%08x, len = %i\n", __func__, (unsigned int)to,
+			(int)len);
 
 	/* Initialize retlen, in case of early exit */
 	*retlen = 0;
@@ -1883,8 +1883,8 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 	u_char *oobbuf;
 	int ret = 0, cmd;
 
-	pr_debug("%s: to = 0x%08x, len = %i\n",
-		__func__, (unsigned int) to, (int) len);
+	pr_debug("%s: to = 0x%08x, len = %i\n", __func__, (unsigned int)to,
+			(int)len);
 
 	/* Initialize retlen, in case of early exit */
 	ops->retlen = 0;
@@ -2078,8 +2078,8 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 
 	to += ops->ooboffs;
 
-	pr_debug("%s: to = 0x%08x, len = %i\n",
-		__func__, (unsigned int) to, (int) len);
+	pr_debug("%s: to = 0x%08x, len = %i\n", __func__, (unsigned int)to,
+			(int)len);
 
 	/* Initialize retlen, in case of early exit */
 	ops->oobretlen = 0;
@@ -2490,7 +2490,8 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 	loff_t region_offset = 0;
 
 	pr_debug("%s: start=0x%012llx, len=%llu\n", __func__,
-	      (unsigned long long) instr->addr, (unsigned long long) instr->len);
+			(unsigned long long)instr->addr,
+			(unsigned long long)instr->len);
 
 	/* Do not allow erase past end of device */
 	if (unlikely((len + addr) > mtd->size)) {
-- 
1.7.0.4
