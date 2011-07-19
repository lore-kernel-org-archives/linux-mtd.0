Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjDlk-0004ND-OQ
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 17:07:58 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 04/11] mtd: replace DEBUG() with pr_debug()
Date: Tue, 19 Jul 2011 10:06:09 -0700
Message-ID: <1311095176-5407-5-git-send-email-computersforpeace@gmail.com>
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

Start moving away from the MTD_DEBUG_LEVEL messages. The dynamic
debugging feature is a generic kernel feature that provides more
flexibility.

(See Documentation/dynamic-debug-howto.txt)

Also fix some punctuation, indentation, and capitalization that went
along with the affected lines.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   27 ++++++-------
 drivers/mtd/chips/fwh_lock.h        |    3 +-
 drivers/mtd/chips/jedec_probe.c     |   32 ++++++---------
 drivers/mtd/devices/doc2000.c       |   11 ++---
 drivers/mtd/devices/doc2001.c       |    5 +-
 drivers/mtd/devices/doc2001plus.c   |    5 +-
 drivers/mtd/devices/m25p80.c        |   20 ++++-----
 drivers/mtd/devices/mtd_dataflash.c |   43 ++++++++++----------
 drivers/mtd/devices/sst25l.c        |    3 +-
 drivers/mtd/ftl.c                   |   38 +++++++++---------
 drivers/mtd/inftlcore.c             |   38 +++++++++---------
 drivers/mtd/inftlmount.c            |   12 +++---
 drivers/mtd/mtdblock.c              |   14 +++---
 drivers/mtd/mtdchar.c               |   10 ++--
 drivers/mtd/mtdcore.c               |    2 +-
 drivers/mtd/mtdsuper.c              |   20 +++++-----
 drivers/mtd/nand/mxc_nand.c         |   14 +++----
 drivers/mtd/nand/nand_base.c        |   74 +++++++++++++++++------------------
 drivers/mtd/nand/nand_bbt.c         |    5 +-
 drivers/mtd/nand/nand_bch.c         |    2 +-
 drivers/mtd/nand/omap2.c            |    8 ++--
 drivers/mtd/nand/rtc_from4.c        |    2 +-
 drivers/mtd/nftlcore.c              |   23 +++++------
 drivers/mtd/onenand/onenand_base.c  |   18 ++++----
 drivers/mtd/onenand/onenand_bbt.c   |    2 +-
 drivers/mtd/ssfdc.c                 |   34 ++++++----------
 26 files changed, 216 insertions(+), 249 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 23175ed..2302cc0 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -145,8 +145,7 @@ static void fixup_amd_bootblock(struct mtd_info *mtd)
 	if (((major << 8) | minor) < 0x3131) {
 		/* CFI version 1.0 => don't trust bootloc */
 
-		DEBUG(MTD_DEBUG_LEVEL1,
-			"%s: JEDEC Vendor ID is 0x%02X Device ID is 0x%02X\n",
+		pr_debug("%s: JEDEC Vendor ID is 0x%02X Device ID is 0x%02X\n",
 			map->name, cfi->mfr, cfi->id);
 
 		/* AFAICS all 29LV400 with a bottom boot block have a device ID
@@ -166,8 +165,7 @@ static void fixup_amd_bootblock(struct mtd_info *mtd)
 			 * the 8-bit device ID.
 			 */
 			(cfi->mfr == CFI_MFR_MACRONIX)) {
-			DEBUG(MTD_DEBUG_LEVEL1,
-				"%s: Macronix MX29LV400C with bottom boot block"
+			pr_debug("%s: Macronix MX29LV400C with bottom boot block"
 				" detected\n", map->name);
 			extp->TopBottom = 2;	/* bottom boot */
 		} else
@@ -178,8 +176,7 @@ static void fixup_amd_bootblock(struct mtd_info *mtd)
 			extp->TopBottom = 2;	/* bottom boot */
 		}
 
-		DEBUG(MTD_DEBUG_LEVEL1,
-			"%s: AMD CFI PRI V%c.%c has no boot block field;"
+		pr_debug("%s: AMD CFI PRI V%c.%c has no boot block field;"
 			" deduced %s from Device ID\n", map->name, major, minor,
 			extp->TopBottom == 2 ? "bottom" : "top");
 	}
@@ -191,7 +188,7 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 	if (cfi->cfiq->BufWriteTimeoutTyp) {
-		DEBUG(MTD_DEBUG_LEVEL1, "Using buffer write method\n" );
+		pr_debug("Using buffer write method\n" );
 		mtd->write = cfi_amdstd_write_buffers;
 	}
 }
@@ -443,7 +440,7 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 	mtd->writesize = 1;
 	mtd->writebufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "MTD %s(): write buffer size %d\n",
+	pr_debug("MTD %s(): write buffer size %d\n",
 		__func__, mtd->writebufsize);
 
 	mtd->reboot_notifier.notifier_call = cfi_amdstd_reboot;
@@ -1163,7 +1160,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 		return ret;
 	}
 
-	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
+	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
 	       __func__, adr, datum.x[0] );
 
 	/*
@@ -1174,7 +1171,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	 */
 	oldd = map_read(map, adr);
 	if (map_word_equal(map, oldd, datum)) {
-		DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): NOP\n",
+		pr_debug("MTD %s(): NOP\n",
 		       __func__);
 		goto op_done;
 	}
@@ -1400,7 +1397,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 
 	datum = map_word_load(map, buf);
 
-	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
+	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
 	       __func__, adr, datum.x[0] );
 
 	XIP_INVAL_CACHED_RANGE(map, adr, len);
@@ -1587,7 +1584,7 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 		return ret;
 	}
 
-	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): ERASE 0x%.8lx\n",
+	pr_debug("MTD %s(): ERASE 0x%.8lx\n",
 	       __func__, chip->start );
 
 	XIP_INVAL_CACHED_RANGE(map, adr, map->size);
@@ -1675,7 +1672,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 		return ret;
 	}
 
-	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): ERASE 0x%.8lx\n",
+	pr_debug("MTD %s(): ERASE 0x%.8lx\n",
 	       __func__, adr );
 
 	XIP_INVAL_CACHED_RANGE(map, adr, len);
@@ -1801,7 +1798,7 @@ static int do_atmel_lock(struct map_info *map, struct flchip *chip,
 		goto out_unlock;
 	chip->state = FL_LOCKING;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "MTD %s(): LOCK 0x%08lx len %d\n",
+	pr_debug("MTD %s(): LOCK 0x%08lx len %d\n",
 	      __func__, adr, len);
 
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
@@ -1837,7 +1834,7 @@ static int do_atmel_unlock(struct map_info *map, struct flchip *chip,
 		goto out_unlock;
 	chip->state = FL_UNLOCKING;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "MTD %s(): LOCK 0x%08lx len %d\n",
+	pr_debug("MTD %s(): LOCK 0x%08lx len %d\n",
 	      __func__, adr, len);
 
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
diff --git a/drivers/mtd/chips/fwh_lock.h b/drivers/mtd/chips/fwh_lock.h
index 5e3cc80..89c6595 100644
--- a/drivers/mtd/chips/fwh_lock.h
+++ b/drivers/mtd/chips/fwh_lock.h
@@ -34,8 +34,7 @@ static int fwh_xxlock_oneblock(struct map_info *map, struct flchip *chip,
 
 	/* Refuse the operation if the we cannot look behind the chip */
 	if (chip->start < 0x400000) {
-		DEBUG( MTD_DEBUG_LEVEL3,
-			"MTD %s(): chip->start: %lx wanted >= 0x400000\n",
+		pr_debug( "MTD %s(): chip->start: %lx wanted >= 0x400000\n",
 			__func__, chip->start );
 		return -EIO;
 	}
diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index d40c410..c443f52 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -1917,8 +1917,7 @@ static void jedec_reset(u32 base, struct map_info *map, struct cfi_private *cfi)
 	 * as they will ignore the writes and don't care what address
 	 * the F0 is written to */
 	if (cfi->addr_unlock1) {
-		DEBUG( MTD_DEBUG_LEVEL3,
-		       "reset unlock called %x %x \n",
+		pr_debug( "reset unlock called %x %x \n",
 		       cfi->addr_unlock1,cfi->addr_unlock2);
 		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
 		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, cfi->device_type, NULL);
@@ -1941,7 +1940,7 @@ static int cfi_jedec_setup(struct map_info *map, struct cfi_private *cfi, int in
 	uint8_t uaddr;
 
 	if (!(jedec_table[index].devtypes & cfi->device_type)) {
-		DEBUG(MTD_DEBUG_LEVEL1, "Rejecting potential %s with incompatible %d-bit device type\n",
+		pr_debug("Rejecting potential %s with incompatible %d-bit device type\n",
 		      jedec_table[index].name, 4 * (1<<cfi->device_type));
 		return 0;
 	}
@@ -2021,7 +2020,7 @@ static inline int jedec_match( uint32_t base,
 		 * there aren't.
 		 */
 		if (finfo->dev_id > 0xff) {
-			DEBUG( MTD_DEBUG_LEVEL3, "%s(): ID is not 8bit\n",
+			pr_debug("%s(): ID is not 8bit\n",
 			       __func__);
 			goto match_done;
 		}
@@ -2045,12 +2044,10 @@ static inline int jedec_match( uint32_t base,
 	}
 
 	/* the part size must fit in the memory window */
-	DEBUG( MTD_DEBUG_LEVEL3,
-	       "MTD %s(): Check fit 0x%.8x + 0x%.8x = 0x%.8x\n",
+	pr_debug("MTD %s(): Check fit 0x%.8x + 0x%.8x = 0x%.8x\n",
 	       __func__, base, 1 << finfo->dev_size, base + (1 << finfo->dev_size) );
 	if ( base + cfi_interleave(cfi) * ( 1 << finfo->dev_size ) > map->size ) {
-		DEBUG( MTD_DEBUG_LEVEL3,
-		       "MTD %s(): 0x%.4x 0x%.4x %dKiB doesn't fit\n",
+		pr_debug("MTD %s(): 0x%.4x 0x%.4x %dKiB doesn't fit\n",
 		       __func__, finfo->mfr_id, finfo->dev_id,
 		       1 << finfo->dev_size );
 		goto match_done;
@@ -2061,13 +2058,12 @@ static inline int jedec_match( uint32_t base,
 
 	uaddr = finfo->uaddr;
 
-	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): check unlock addrs 0x%.4x 0x%.4x\n",
+	pr_debug("MTD %s(): check unlock addrs 0x%.4x 0x%.4x\n",
 	       __func__, cfi->addr_unlock1, cfi->addr_unlock2 );
 	if ( MTD_UADDR_UNNECESSARY != uaddr && MTD_UADDR_DONT_CARE != uaddr
 	     && ( unlock_addrs[uaddr].addr1 / cfi->device_type != cfi->addr_unlock1 ||
 		  unlock_addrs[uaddr].addr2 / cfi->device_type != cfi->addr_unlock2 ) ) {
-		DEBUG( MTD_DEBUG_LEVEL3,
-			"MTD %s(): 0x%.4x 0x%.4x did not match\n",
+		pr_debug("MTD %s(): 0x%.4x 0x%.4x did not match\n",
 			__func__,
 			unlock_addrs[uaddr].addr1,
 			unlock_addrs[uaddr].addr2);
@@ -2083,15 +2079,13 @@ static inline int jedec_match( uint32_t base,
 	 * FIXME - write a driver that takes all of the chip info as
 	 * module parameters, doesn't probe but forces a load.
 	 */
-	DEBUG( MTD_DEBUG_LEVEL3,
-	       "MTD %s(): check ID's disappear when not in ID mode\n",
+	pr_debug("MTD %s(): check ID's disappear when not in ID mode\n",
 	       __func__ );
 	jedec_reset( base, map, cfi );
 	mfr = jedec_read_mfr( map, base, cfi );
 	id = jedec_read_id( map, base, cfi );
 	if ( mfr == cfi->mfr && id == cfi->id ) {
-		DEBUG( MTD_DEBUG_LEVEL3,
-		       "MTD %s(): ID 0x%.2x:0x%.2x did not change after reset:\n"
+		pr_debug("MTD %s(): ID 0x%.2x:0x%.2x did not change after reset:\n"
 		       "You might need to manually specify JEDEC parameters.\n",
 			__func__, cfi->mfr, cfi->id );
 		goto match_done;
@@ -2104,7 +2098,7 @@ static inline int jedec_match( uint32_t base,
 	 * Put the device back in ID mode - only need to do this if we
 	 * were truly frobbing a real device.
 	 */
-	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): return to ID mode\n", __func__ );
+	pr_debug("MTD %s(): return to ID mode\n", __func__ );
 	if (cfi->addr_unlock1) {
 		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
 		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, cfi->device_type, NULL);
@@ -2167,13 +2161,11 @@ static int jedec_probe_chip(struct map_info *map, __u32 base,
 
 		cfi->mfr = jedec_read_mfr(map, base, cfi);
 		cfi->id = jedec_read_id(map, base, cfi);
-		DEBUG(MTD_DEBUG_LEVEL3,
-		      "Search for id:(%02x %02x) interleave(%d) type(%d)\n",
+		pr_debug("Search for id:(%02x %02x) interleave(%d) type(%d)\n",
 			cfi->mfr, cfi->id, cfi_interleave(cfi), cfi->device_type);
 		for (i = 0; i < ARRAY_SIZE(jedec_table); i++) {
 			if ( jedec_match( base, map, cfi, &jedec_table[i] ) ) {
-				DEBUG( MTD_DEBUG_LEVEL3,
-				       "MTD %s(): matched device 0x%x,0x%x unlock_addrs: 0x%.4x 0x%.4x\n",
+				pr_debug("MTD %s(): matched device 0x%x,0x%x unlock_addrs: 0x%.4x 0x%.4x\n",
 				       __func__, cfi->mfr, cfi->id,
 				       cfi->addr_unlock1, cfi->addr_unlock2 );
 				if (!cfi_jedec_setup(map, cfi, i))
diff --git a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc2000.c
index ed15447..8c97033 100644
--- a/drivers/mtd/devices/doc2000.c
+++ b/drivers/mtd/devices/doc2000.c
@@ -82,8 +82,7 @@ static int _DoC_WaitReady(struct DiskOnChip *doc)
 	void __iomem *docptr = doc->virtadr;
 	unsigned long timeo = jiffies + (HZ * 10);
 
-	DEBUG(MTD_DEBUG_LEVEL3,
-	      "_DoC_WaitReady called for out-of-line wait\n");
+	pr_debug("_DoC_WaitReady called for out-of-line wait\n");
 
 	/* Out-of-line routine to wait for chip response */
 	while (!(ReadDOC(docptr, CDSNControl) & CDSN_CTRL_FR_B)) {
@@ -92,7 +91,7 @@ static int _DoC_WaitReady(struct DiskOnChip *doc)
 		DoC_Delay(doc, 2);
 
 		if (time_after(jiffies, timeo)) {
-			DEBUG(MTD_DEBUG_LEVEL2, "_DoC_WaitReady timed out.\n");
+			pr_debug("_DoC_WaitReady timed out.\n");
 			return -EIO;
 		}
 		udelay(1);
@@ -323,8 +322,7 @@ static int DoC_IdentChip(struct DiskOnChip *doc, int floor, int chip)
 
 	/* Reset the chip */
 	if (DoC_Command(doc, NAND_CMD_RESET, CDSN_CTRL_WP)) {
-		DEBUG(MTD_DEBUG_LEVEL2,
-		      "DoC_Command (reset) for %d,%d returned true\n",
+		pr_debug("DoC_Command (reset) for %d,%d returned true\n",
 		      floor, chip);
 		return 0;
 	}
@@ -332,8 +330,7 @@ static int DoC_IdentChip(struct DiskOnChip *doc, int floor, int chip)
 
 	/* Read the NAND chip ID: 1. Send ReadID command */
 	if (DoC_Command(doc, NAND_CMD_READID, CDSN_CTRL_WP)) {
-		DEBUG(MTD_DEBUG_LEVEL2,
-		      "DoC_Command (ReadID) for %d,%d returned true\n",
+		pr_debug("DoC_Command (ReadID) for %d,%d returned true\n",
 		      floor, chip);
 		return 0;
 	}
diff --git a/drivers/mtd/devices/doc2001.c b/drivers/mtd/devices/doc2001.c
index c6ea860..3d2b459 100644
--- a/drivers/mtd/devices/doc2001.c
+++ b/drivers/mtd/devices/doc2001.c
@@ -55,15 +55,14 @@ static int _DoC_WaitReady(void __iomem * docptr)
 {
 	unsigned short c = 0xffff;
 
-	DEBUG(MTD_DEBUG_LEVEL3,
-	      "_DoC_WaitReady called for out-of-line wait\n");
+	pr_debug("_DoC_WaitReady called for out-of-line wait\n");
 
 	/* Out-of-line routine to wait for chip response */
 	while (!(ReadDOC(docptr, CDSNControl) & CDSN_CTRL_FR_B) && --c)
 		;
 
 	if (c == 0)
-		DEBUG(MTD_DEBUG_LEVEL2, "_DoC_WaitReady timed out.\n");
+		pr_debug("_DoC_WaitReady timed out.\n");
 
 	return (c == 0);
 }
diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/doc2001plus.c
index fe82fbf..d28c9d9 100644
--- a/drivers/mtd/devices/doc2001plus.c
+++ b/drivers/mtd/devices/doc2001plus.c
@@ -61,15 +61,14 @@ static int _DoC_WaitReady(void __iomem * docptr)
 {
 	unsigned int c = 0xffff;
 
-	DEBUG(MTD_DEBUG_LEVEL3,
-	      "_DoC_WaitReady called for out-of-line wait\n");
+	pr_debug("_DoC_WaitReady called for out-of-line wait\n");
 
 	/* Out-of-line routine to wait for chip response */
 	while (((ReadDOC(docptr, Mplus_FlashControl) & CDSN_CTRL_FR_B_MASK) != CDSN_CTRL_FR_B_MASK) && --c)
 		;
 
 	if (c == 0)
-		DEBUG(MTD_DEBUG_LEVEL2, "_DoC_WaitReady timed out.\n");
+		pr_debug("_DoC_WaitReady timed out.\n");
 
 	return (c == 0);
 }
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 66a3555..6417bd6 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -208,7 +208,7 @@ static int wait_till_ready(struct m25p *flash)
  */
 static int erase_chip(struct m25p *flash)
 {
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: %s %lldKiB\n",
+	pr_debug("%s: %s %lldKiB\n",
 	      dev_name(&flash->spi->dev), __func__,
 	      (long long)(flash->mtd.size >> 10));
 
@@ -249,7 +249,7 @@ static int m25p_cmdsz(struct m25p *flash)
  */
 static int erase_sector(struct m25p *flash, u32 offset)
 {
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: %s %dKiB at 0x%08x\n",
+	pr_debug("%s: %s %dKiB at 0x%08x\n",
 			dev_name(&flash->spi->dev), __func__,
 			flash->mtd.erasesize / 1024, offset);
 
@@ -285,7 +285,7 @@ static int m25p80_erase(struct mtd_info *mtd, struct erase_info *instr)
 	u32 addr,len;
 	uint32_t rem;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "%s: %s %s 0x%llx, len %lld\n",
+	pr_debug("%s: %s %s 0x%llx, len %lld\n",
 	      dev_name(&flash->spi->dev), __func__, "at",
 	      (long long)instr->addr, (long long)instr->len);
 
@@ -347,7 +347,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	struct spi_transfer t[2];
 	struct spi_message m;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "%s: %s %s 0x%08x, len %zd\n",
+	pr_debug("%s: %s %s 0x%08x, len %zd\n",
 			dev_name(&flash->spi->dev), __func__, "from",
 			(u32)from, len);
 
@@ -416,7 +416,7 @@ static int m25p80_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct spi_transfer t[2];
 	struct spi_message m;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "%s: %s %s 0x%08x, len %zd\n",
+	pr_debug("%s: %s %s 0x%08x, len %zd\n",
 			dev_name(&flash->spi->dev), __func__, "to",
 			(u32)to, len);
 
@@ -509,7 +509,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	size_t actual;
 	int cmd_sz, ret;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "%s: %s %s 0x%08x, len %zd\n",
+	pr_debug("%s: %s %s 0x%08x, len %zd\n",
 			dev_name(&flash->spi->dev), __func__, "to",
 			(u32)to, len);
 
@@ -787,7 +787,7 @@ static const struct spi_device_id *__devinit jedec_probe(struct spi_device *spi)
 	 */
 	tmp = spi_write_then_read(spi, &code, 1, id, 5);
 	if (tmp < 0) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: error %d reading JEDEC ID\n",
+		pr_debug("%s: error %d reading JEDEC ID\n",
 			dev_name(&spi->dev), tmp);
 		return ERR_PTR(tmp);
 	}
@@ -944,8 +944,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	dev_info(&spi->dev, "%s (%lld Kbytes)\n", id->name,
 			(long long)flash->mtd.size >> 10);
 
-	DEBUG(MTD_DEBUG_LEVEL2,
-		"mtd .name = %s, .size = 0x%llx (%lldMiB) "
+	pr_debug("mtd .name = %s, .size = 0x%llx (%lldMiB) "
 			".erasesize = 0x%.8x (%uKiB) .numeraseregions = %d\n",
 		flash->mtd.name,
 		(long long)flash->mtd.size, (long long)(flash->mtd.size >> 20),
@@ -954,8 +953,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
 
 	if (flash->mtd.numeraseregions)
 		for (i = 0; i < flash->mtd.numeraseregions; i++)
-			DEBUG(MTD_DEBUG_LEVEL2,
-				"mtd.eraseregions[%d] = { .offset = 0x%llx, "
+			pr_debug("mtd.eraseregions[%d] = { .offset = 0x%llx, "
 				".erasesize = 0x%.8x (%uKiB), "
 				".numblocks = %d }\n",
 				i, (long long)flash->mtd.eraseregions[i].offset,
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 8f6b02c..db0ab7e 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -122,7 +122,7 @@ static int dataflash_waitready(struct spi_device *spi)
 	for (;;) {
 		status = dataflash_status(spi);
 		if (status < 0) {
-			DEBUG(MTD_DEBUG_LEVEL1, "%s: status %d?\n",
+			pr_debug("%s: status %d?\n",
 					dev_name(&spi->dev), status);
 			status = 0;
 		}
@@ -149,7 +149,7 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
 	uint8_t			*command;
 	uint32_t		rem;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "%s: erase addr=0x%llx len 0x%llx\n",
+	pr_debug("%s: erase addr=0x%llx len 0x%llx\n",
 	      dev_name(&spi->dev), (long long)instr->addr,
 	      (long long)instr->len);
 
@@ -187,7 +187,7 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
 		command[2] = (uint8_t)(pageaddr >> 8);
 		command[3] = 0;
 
-		DEBUG(MTD_DEBUG_LEVEL3, "ERASE %s: (%x) %x %x %x [%i]\n",
+		pr_debug("ERASE %s: (%x) %x %x %x [%i]\n",
 			do_block ? "block" : "page",
 			command[0], command[1], command[2], command[3],
 			pageaddr);
@@ -238,7 +238,7 @@ static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 	uint8_t			*command;
 	int			status;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "%s: read 0x%x..0x%x\n",
+	pr_debug("%s: read 0x%x..0x%x\n",
 		dev_name(&priv->spi->dev), (unsigned)from, (unsigned)(from + len));
 
 	*retlen = 0;
@@ -255,7 +255,7 @@ static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	command = priv->command;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "READ: (%x) %x %x %x\n",
+	pr_debug("READ: (%x) %x %x %x\n",
 		command[0], command[1], command[2], command[3]);
 
 	spi_message_init(&msg);
@@ -287,7 +287,7 @@ static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 		*retlen = msg.actual_length - 8;
 		status = 0;
 	} else
-		DEBUG(MTD_DEBUG_LEVEL1, "%s: read %x..%x --> %d\n",
+		pr_debug("%s: read %x..%x --> %d\n",
 			dev_name(&priv->spi->dev),
 			(unsigned)from, (unsigned)(from + len),
 			status);
@@ -314,7 +314,7 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 	int			status = -EINVAL;
 	uint8_t			*command;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "%s: write 0x%x..0x%x\n",
+	pr_debug("%s: write 0x%x..0x%x\n",
 		dev_name(&spi->dev), (unsigned)to, (unsigned)(to + len));
 
 	*retlen = 0;
@@ -340,7 +340,7 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	mutex_lock(&priv->lock);
 	while (remaining > 0) {
-		DEBUG(MTD_DEBUG_LEVEL3, "write @ %i:%i len=%i\n",
+		pr_debug("write @ %i:%i len=%i\n",
 			pageaddr, offset, writelen);
 
 		/* REVISIT:
@@ -368,12 +368,12 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 			command[2] = (addr & 0x0000FF00) >> 8;
 			command[3] = 0;
 
-			DEBUG(MTD_DEBUG_LEVEL3, "TRANSFER: (%x) %x %x %x\n",
+			pr_debug("TRANSFER: (%x) %x %x %x\n",
 				command[0], command[1], command[2], command[3]);
 
 			status = spi_sync(spi, &msg);
 			if (status < 0)
-				DEBUG(MTD_DEBUG_LEVEL1, "%s: xfer %u -> %d \n",
+				pr_debug("%s: xfer %u -> %d \n",
 					dev_name(&spi->dev), addr, status);
 
 			(void) dataflash_waitready(priv->spi);
@@ -386,7 +386,7 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 		command[2] = (addr & 0x0000FF00) >> 8;
 		command[3] = (addr & 0x000000FF);
 
-		DEBUG(MTD_DEBUG_LEVEL3, "PROGRAM: (%x) %x %x %x\n",
+		pr_debug("PROGRAM: (%x) %x %x %x\n",
 			command[0], command[1], command[2], command[3]);
 
 		x[1].tx_buf = writebuf;
@@ -395,7 +395,7 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 		status = spi_sync(spi, &msg);
 		spi_transfer_del(x + 1);
 		if (status < 0)
-			DEBUG(MTD_DEBUG_LEVEL1, "%s: pgm %u/%u -> %d \n",
+			pr_debug("%s: pgm %u/%u -> %d \n",
 				dev_name(&spi->dev), addr, writelen, status);
 
 		(void) dataflash_waitready(priv->spi);
@@ -410,12 +410,12 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 		command[2] = (addr & 0x0000FF00) >> 8;
 		command[3] = 0;
 
-		DEBUG(MTD_DEBUG_LEVEL3, "COMPARE: (%x) %x %x %x\n",
+		pr_debug("COMPARE: (%x) %x %x %x\n",
 			command[0], command[1], command[2], command[3]);
 
 		status = spi_sync(spi, &msg);
 		if (status < 0)
-			DEBUG(MTD_DEBUG_LEVEL1, "%s: compare %u -> %d \n",
+			pr_debug("%s: compare %u -> %d \n",
 				dev_name(&spi->dev), addr, status);
 
 		status = dataflash_waitready(priv->spi);
@@ -767,7 +767,7 @@ static struct flash_info *__devinit jedec_probe(struct spi_device *spi)
 	 */
 	tmp = spi_write_then_read(spi, &code, 1, id, 3);
 	if (tmp < 0) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: error %d reading JEDEC ID\n",
+		pr_debug("%s: error %d reading JEDEC ID\n",
 			dev_name(&spi->dev), tmp);
 		return ERR_PTR(tmp);
 	}
@@ -784,7 +784,7 @@ static struct flash_info *__devinit jedec_probe(struct spi_device *spi)
 			tmp < ARRAY_SIZE(dataflash_data);
 			tmp++, info++) {
 		if (info->jedec_id == jedec) {
-			DEBUG(MTD_DEBUG_LEVEL1, "%s: OTP, sector protect%s\n",
+			pr_debug("%s: OTP, sector protect%s\n",
 				dev_name(&spi->dev),
 				(info->flags & SUP_POW2PS)
 					? ", binary pagesize" : ""
@@ -792,8 +792,7 @@ static struct flash_info *__devinit jedec_probe(struct spi_device *spi)
 			if (info->flags & SUP_POW2PS) {
 				status = dataflash_status(spi);
 				if (status < 0) {
-					DEBUG(MTD_DEBUG_LEVEL1,
-						"%s: status error %d\n",
+					pr_debug("%s: status error %d\n",
 						dev_name(&spi->dev), status);
 					return ERR_PTR(status);
 				}
@@ -858,7 +857,7 @@ static int __devinit dataflash_probe(struct spi_device *spi)
 	 */
 	status = dataflash_status(spi);
 	if (status <= 0 || status == 0xff) {
-		DEBUG(MTD_DEBUG_LEVEL1, "%s: status error %d\n",
+		pr_debug("%s: status error %d\n",
 				dev_name(&spi->dev), status);
 		if (status == 0 || status == 0xff)
 			status = -ENODEV;
@@ -894,13 +893,13 @@ static int __devinit dataflash_probe(struct spi_device *spi)
 		break;
 	/* obsolete AT45DB1282 not (yet?) supported */
 	default:
-		DEBUG(MTD_DEBUG_LEVEL1, "%s: unsupported device (%x)\n",
+		pr_debug("%s: unsupported device (%x)\n",
 				dev_name(&spi->dev), status & 0x3c);
 		status = -ENODEV;
 	}
 
 	if (status < 0)
-		DEBUG(MTD_DEBUG_LEVEL1, "%s: add_dataflash --> %d\n",
+		pr_debug("%s: add_dataflash --> %d\n",
 				dev_name(&spi->dev), status);
 
 	return status;
@@ -911,7 +910,7 @@ static int __devexit dataflash_remove(struct spi_device *spi)
 	struct dataflash	*flash = dev_get_drvdata(&spi->dev);
 	int			status;
 
-	DEBUG(MTD_DEBUG_LEVEL1, "%s: remove\n", dev_name(&spi->dev));
+	pr_debug("%s: remove\n", dev_name(&spi->dev));
 
 	status = mtd_device_unregister(&flash->mtd);
 	if (status == 0) {
diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index eaae4e0..1bd349f 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -410,8 +410,7 @@ static int __devinit sst25l_probe(struct spi_device *spi)
 	dev_info(&spi->dev, "%s (%lld KiB)\n", flash_info->name,
 		 (long long)flash->mtd.size >> 10);
 
-	DEBUG(MTD_DEBUG_LEVEL2,
-	      "mtd .name = %s, .size = 0x%llx (%lldMiB) "
+	pr_debug("mtd .name = %s, .size = 0x%llx (%lldMiB) "
 	      ".erasesize = 0x%.8x (%uKiB) .numeraseregions = %d\n",
 	      flash->mtd.name,
 	      (long long)flash->mtd.size, (long long)(flash->mtd.size >> 20),
diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index 037b399..95d7768 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -339,7 +339,7 @@ static int erase_xfer(partition_t *part,
     struct erase_info *erase;
 
     xfer = &part->XferInfo[xfernum];
-    DEBUG(1, "ftl_cs: erasing xfer unit at 0x%x\n", xfer->Offset);
+    pr_debug("ftl_cs: erasing xfer unit at 0x%x\n", xfer->Offset);
     xfer->state = XFER_ERASING;
 
     /* Is there a free erase slot? Always in MTD. */
@@ -415,7 +415,7 @@ static int prepare_xfer(partition_t *part, int i)
     xfer = &part->XferInfo[i];
     xfer->state = XFER_FAILED;
 
-    DEBUG(1, "ftl_cs: preparing xfer unit at 0x%x\n", xfer->Offset);
+    pr_debug("ftl_cs: preparing xfer unit at 0x%x\n", xfer->Offset);
 
     /* Write the transfer unit header */
     header = part->header;
@@ -476,7 +476,7 @@ static int copy_erase_unit(partition_t *part, uint16_t srcunit,
 
     eun = &part->EUNInfo[srcunit];
     xfer = &part->XferInfo[xferunit];
-    DEBUG(2, "ftl_cs: copying block 0x%x to 0x%x\n",
+    pr_debug("ftl_cs: copying block 0x%x to 0x%x\n",
 	  eun->Offset, xfer->Offset);
 
 
@@ -609,8 +609,8 @@ static int reclaim_block(partition_t *part)
     uint32_t best;
     int queued, ret;
 
-    DEBUG(0, "ftl_cs: reclaiming space...\n");
-    DEBUG(3, "NumTransferUnits == %x\n", part->header.NumTransferUnits);
+    pr_debug("ftl_cs: reclaiming space...\n");
+    pr_debug("NumTransferUnits == %x\n", part->header.NumTransferUnits);
     /* Pick the least erased transfer unit */
     best = 0xffffffff; xfer = 0xffff;
     do {
@@ -618,22 +618,22 @@ static int reclaim_block(partition_t *part)
 	for (i = 0; i < part->header.NumTransferUnits; i++) {
 	    int n=0;
 	    if (part->XferInfo[i].state == XFER_UNKNOWN) {
-		DEBUG(3,"XferInfo[%d].state == XFER_UNKNOWN\n",i);
+		pr_debug("XferInfo[%d].state == XFER_UNKNOWN\n",i);
 		n=1;
 		erase_xfer(part, i);
 	    }
 	    if (part->XferInfo[i].state == XFER_ERASING) {
-		DEBUG(3,"XferInfo[%d].state == XFER_ERASING\n",i);
+		pr_debug("XferInfo[%d].state == XFER_ERASING\n",i);
 		n=1;
 		queued = 1;
 	    }
 	    else if (part->XferInfo[i].state == XFER_ERASED) {
-		DEBUG(3,"XferInfo[%d].state == XFER_ERASED\n",i);
+		pr_debug("XferInfo[%d].state == XFER_ERASED\n",i);
 		n=1;
 		prepare_xfer(part, i);
 	    }
 	    if (part->XferInfo[i].state == XFER_PREPARED) {
-		DEBUG(3,"XferInfo[%d].state == XFER_PREPARED\n",i);
+		pr_debug("XferInfo[%d].state == XFER_PREPARED\n",i);
 		n=1;
 		if (part->XferInfo[i].EraseCount <= best) {
 		    best = part->XferInfo[i].EraseCount;
@@ -641,12 +641,12 @@ static int reclaim_block(partition_t *part)
 		}
 	    }
 		if (!n)
-		    DEBUG(3,"XferInfo[%d].state == %x\n",i, part->XferInfo[i].state);
+		    pr_debug("XferInfo[%d].state == %x\n",i, part->XferInfo[i].state);
 
 	}
 	if (xfer == 0xffff) {
 	    if (queued) {
-		DEBUG(1, "ftl_cs: waiting for transfer "
+		pr_debug("ftl_cs: waiting for transfer "
 		      "unit to be prepared...\n");
 		if (part->mbd.mtd->sync)
 			part->mbd.mtd->sync(part->mbd.mtd);
@@ -656,7 +656,7 @@ static int reclaim_block(partition_t *part)
 		    printk(KERN_NOTICE "ftl_cs: reclaim failed: no "
 			   "suitable transfer units!\n");
 		else
-		    DEBUG(1, "ftl_cs: reclaim failed: no "
+		    pr_debug("ftl_cs: reclaim failed: no "
 			  "suitable transfer units!\n");
 
 		return -EIO;
@@ -666,7 +666,7 @@ static int reclaim_block(partition_t *part)
 
     eun = 0;
     if ((jiffies % shuffle_freq) == 0) {
-	DEBUG(1, "ftl_cs: recycling freshest block...\n");
+	pr_debug("ftl_cs: recycling freshest block...\n");
 	best = 0xffffffff;
 	for (i = 0; i < part->DataUnits; i++)
 	    if (part->EUNInfo[i].EraseCount <= best) {
@@ -686,7 +686,7 @@ static int reclaim_block(partition_t *part)
 		printk(KERN_NOTICE "ftl_cs: reclaim failed: "
 		       "no free blocks!\n");
 	    else
-		DEBUG(1,"ftl_cs: reclaim failed: "
+		pr_debug("ftl_cs: reclaim failed: "
 		       "no free blocks!\n");
 
 	    return -EIO;
@@ -771,7 +771,7 @@ static uint32_t find_free(partition_t *part)
 	printk(KERN_NOTICE "ftl_cs: bad free list!\n");
 	return 0;
     }
-    DEBUG(2, "ftl_cs: found free block at %d in %d\n", blk, eun);
+    pr_debug("ftl_cs: found free block at %d in %d\n", blk, eun);
     return blk;
 
 } /* find_free */
@@ -791,7 +791,7 @@ static int ftl_read(partition_t *part, caddr_t buffer,
     int ret;
     size_t offset, retlen;
 
-    DEBUG(2, "ftl_cs: ftl_read(0x%p, 0x%lx, %ld)\n",
+    pr_debug("ftl_cs: ftl_read(0x%p, 0x%lx, %ld)\n",
 	  part, sector, nblocks);
     if (!(part->state & FTL_FORMATTED)) {
 	printk(KERN_NOTICE "ftl_cs: bad partition\n");
@@ -840,7 +840,7 @@ static int set_bam_entry(partition_t *part, uint32_t log_addr,
     int ret;
     size_t retlen, offset;
 
-    DEBUG(2, "ftl_cs: set_bam_entry(0x%p, 0x%x, 0x%x)\n",
+    pr_debug("ftl_cs: set_bam_entry(0x%p, 0x%x, 0x%x)\n",
 	  part, log_addr, virt_addr);
     bsize = 1 << part->header.EraseUnitSize;
     eun = log_addr / bsize;
@@ -905,7 +905,7 @@ static int ftl_write(partition_t *part, caddr_t buffer,
     int ret;
     size_t retlen, offset;
 
-    DEBUG(2, "ftl_cs: ftl_write(0x%p, %ld, %ld)\n",
+    pr_debug("ftl_cs: ftl_write(0x%p, %ld, %ld)\n",
 	  part, sector, nblocks);
     if (!(part->state & FTL_FORMATTED)) {
 	printk(KERN_NOTICE "ftl_cs: bad partition\n");
@@ -1011,7 +1011,7 @@ static int ftl_discardsect(struct mtd_blktrans_dev *dev,
 	partition_t *part = (void *)dev;
 	uint32_t bsize = 1 << part->header.EraseUnitSize;
 
-	DEBUG(1, "FTL erase sector %ld for %d sectors\n",
+	pr_debug("FTL erase sector %ld for %d sectors\n",
 	      sector, nr_sects);
 
 	while (nr_sects) {
diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index c9a31e6..232e11b 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -63,7 +63,7 @@ static void inftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 		return;
 	}
 
-	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: add_mtd for %s\n", mtd->name);
+	pr_debug("INFTL: add_mtd for %s\n", mtd->name);
 
 	inftl = kzalloc(sizeof(*inftl), GFP_KERNEL);
 
@@ -131,7 +131,7 @@ static void inftl_remove_dev(struct mtd_blktrans_dev *dev)
 {
 	struct INFTLrecord *inftl = (void *)dev;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: remove_dev (i=%d)\n", dev->devnum);
+	pr_debug("INFTL: remove_dev (i=%d)\n", dev->devnum);
 
 	del_mtd_blktrans_dev(dev);
 
@@ -213,7 +213,7 @@ static u16 INFTL_findfreeblock(struct INFTLrecord *inftl, int desperate)
 	u16 pot = inftl->LastFreeEUN;
 	int silly = inftl->nb_blocks;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: INFTL_findfreeblock(inftl=%p,"
+	pr_debug("INFTL: INFTL_findfreeblock(inftl=%p,"
 		"desperate=%d)\n", inftl, desperate);
 
 	/*
@@ -221,7 +221,7 @@ static u16 INFTL_findfreeblock(struct INFTLrecord *inftl, int desperate)
 	 * blocks completely.
 	 */
 	if (!desperate && inftl->numfreeEUNs < 2) {
-		DEBUG(MTD_DEBUG_LEVEL1, "INFTL: there are too few free "
+		pr_debug("INFTL: there are too few free "
 			"EUNs (%d)\n", inftl->numfreeEUNs);
 		return BLOCK_NIL;
 	}
@@ -257,7 +257,7 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, unsigned thisVUC, unsigned
 	struct inftl_oob oob;
 	size_t retlen;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: INFTL_foldchain(inftl=%p,thisVUC=%d,"
+	pr_debug("INFTL: INFTL_foldchain(inftl=%p,thisVUC=%d,"
 		"pending=%d)\n", inftl, thisVUC, pendingblock);
 
 	memset(BlockMap, 0xff, sizeof(BlockMap));
@@ -321,7 +321,7 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, unsigned thisVUC, unsigned
 	 * Chain, and the Erase Unit into which we are supposed to be copying.
 	 * Go for it.
 	 */
-	DEBUG(MTD_DEBUG_LEVEL1, "INFTL: folding chain %d into unit %d\n",
+	pr_debug("INFTL: folding chain %d into unit %d\n",
 		thisVUC, targetEUN);
 
 	for (block = 0; block < inftl->EraseSize/SECTORSIZE ; block++) {
@@ -353,7 +353,7 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, unsigned thisVUC, unsigned
 					(block * SECTORSIZE), SECTORSIZE,
 					&retlen, movebuf);
 			if (ret != -EIO)
-				DEBUG(MTD_DEBUG_LEVEL1, "INFTL: error went "
+				pr_debug("INFTL: error went "
 				      "away on retry?\n");
 		}
 		memset(&oob, 0xff, sizeof(struct inftl_oob));
@@ -370,7 +370,7 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, unsigned thisVUC, unsigned
 	 * is important, by doing oldest first if we crash/reboot then it
 	 * it is relatively simple to clean up the mess).
 	 */
-	DEBUG(MTD_DEBUG_LEVEL1, "INFTL: want to erase virtual chain %d\n",
+	pr_debug("INFTL: want to erase virtual chain %d\n",
 		thisVUC);
 
 	for (;;) {
@@ -419,7 +419,7 @@ static u16 INFTL_makefreeblock(struct INFTLrecord *inftl, unsigned pendingblock)
 	u16 ChainLength = 0, thislen;
 	u16 chain, EUN;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: INFTL_makefreeblock(inftl=%p,"
+	pr_debug("INFTL: INFTL_makefreeblock(inftl=%p,"
 		"pending=%d)\n", inftl, pendingblock);
 
 	for (chain = 0; chain < inftl->nb_blocks; chain++) {
@@ -482,7 +482,7 @@ static inline u16 INFTL_findwriteunit(struct INFTLrecord *inftl, unsigned block)
 	size_t retlen;
 	int silly, silly2 = 3;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: INFTL_findwriteunit(inftl=%p,"
+	pr_debug("INFTL: INFTL_findwriteunit(inftl=%p,"
 		"block=%d)\n", inftl, block);
 
 	do {
@@ -499,7 +499,7 @@ static inline u16 INFTL_findwriteunit(struct INFTLrecord *inftl, unsigned block)
 				       blockofs, 8, &retlen, (char *)&bci);
 
 			status = bci.Status | bci.Status1;
-			DEBUG(MTD_DEBUG_LEVEL3, "INFTL: status of block %d in "
+			pr_debug("INFTL: status of block %d in "
 				"EUN %d is %x\n", block , writeEUN, status);
 
 			switch(status) {
@@ -553,7 +553,7 @@ hitused:
 			 * Hopefully we free something, lets try again.
 			 * This time we are desperate...
 			 */
-			DEBUG(MTD_DEBUG_LEVEL1, "INFTL: using desperate==1 "
+			pr_debug("INFTL: using desperate==1 "
 				"to find free EUN to accommodate write to "
 				"VUC %d\n", thisVUC);
 			writeEUN = INFTL_findfreeblock(inftl, 1);
@@ -645,7 +645,7 @@ static void INFTL_trydeletechain(struct INFTLrecord *inftl, unsigned thisVUC)
 	struct inftl_bci bci;
 	size_t retlen;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: INFTL_trydeletechain(inftl=%p,"
+	pr_debug("INFTL: INFTL_trydeletechain(inftl=%p,"
 		"thisVUC=%d)\n", inftl, thisVUC);
 
 	memset(BlockUsed, 0, sizeof(BlockUsed));
@@ -709,7 +709,7 @@ static void INFTL_trydeletechain(struct INFTLrecord *inftl, unsigned thisVUC)
 	 * For each block in the chain free it and make it available
 	 * for future use. Erase from the oldest unit first.
 	 */
-	DEBUG(MTD_DEBUG_LEVEL1, "INFTL: deleting empty VUC %d\n", thisVUC);
+	pr_debug("INFTL: deleting empty VUC %d\n", thisVUC);
 
 	for (;;) {
 		u16 *prevEUN = &inftl->VUtable[thisVUC];
@@ -717,7 +717,7 @@ static void INFTL_trydeletechain(struct INFTLrecord *inftl, unsigned thisVUC)
 
 		/* If the chain is all gone already, we're done */
 		if (thisEUN == BLOCK_NIL) {
-			DEBUG(MTD_DEBUG_LEVEL2, "INFTL: Empty VUC %d for deletion was already absent\n", thisEUN);
+			pr_debug("INFTL: Empty VUC %d for deletion was already absent\n", thisEUN);
 			return;
 		}
 
@@ -729,7 +729,7 @@ static void INFTL_trydeletechain(struct INFTLrecord *inftl, unsigned thisVUC)
 			thisEUN = *prevEUN;
 		}
 
-		DEBUG(MTD_DEBUG_LEVEL3, "Deleting EUN %d from VUC %d\n",
+		pr_debug("Deleting EUN %d from VUC %d\n",
 		      thisEUN, thisVUC);
 
 		if (INFTL_formatblock(inftl, thisEUN) < 0) {
@@ -765,7 +765,7 @@ static int INFTL_deleteblock(struct INFTLrecord *inftl, unsigned block)
 	size_t retlen;
 	struct inftl_bci bci;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: INFTL_deleteblock(inftl=%p,"
+	pr_debug("INFTL: INFTL_deleteblock(inftl=%p,"
 		"block=%d)\n", inftl, block);
 
 	while (thisEUN < inftl->nb_blocks) {
@@ -824,7 +824,7 @@ static int inftl_writeblock(struct mtd_blktrans_dev *mbd, unsigned long block,
 	struct inftl_oob oob;
 	char *p, *pend;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: inftl_writeblock(inftl=%p,block=%ld,"
+	pr_debug("INFTL: inftl_writeblock(inftl=%p,block=%ld,"
 		"buffer=%p)\n", inftl, block, buffer);
 
 	/* Is block all zero? */
@@ -874,7 +874,7 @@ static int inftl_readblock(struct mtd_blktrans_dev *mbd, unsigned long block,
 	struct inftl_bci bci;
 	size_t retlen;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: inftl_readblock(inftl=%p,block=%ld,"
+	pr_debug("INFTL: inftl_readblock(inftl=%p,block=%ld,"
 		"buffer=%p)\n", inftl, block, buffer);
 
 	while (thisEUN < inftl->nb_blocks) {
diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 104052e..d969c2d 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -53,7 +53,7 @@ static int find_boot_record(struct INFTLrecord *inftl)
 	struct INFTLPartition *ip;
 	size_t retlen;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: find_boot_record(inftl=%p)\n", inftl);
+	pr_debug("INFTL: find_boot_record(inftl=%p)\n", inftl);
 
         /*
 	 * Assume logical EraseSize == physical erasesize for starting the
@@ -385,7 +385,7 @@ int INFTL_formatblock(struct INFTLrecord *inftl, int block)
 	struct mtd_info *mtd = inftl->mbd.mtd;
 	int physblock;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: INFTL_formatblock(inftl=%p,"
+	pr_debug("INFTL: INFTL_formatblock(inftl=%p,"
 		"block=%d)\n", inftl, block);
 
 	memset(instr, 0, sizeof(struct erase_info));
@@ -555,7 +555,7 @@ int INFTL_mount(struct INFTLrecord *s)
 	int i;
 	u8 *ANACtable, ANAC;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: INFTL_mount(inftl=%p)\n", s);
+	pr_debug("INFTL: INFTL_mount(inftl=%p)\n", s);
 
 	/* Search for INFTL MediaHeader and Spare INFTL Media Header */
 	if (find_boot_record(s) < 0) {
@@ -585,7 +585,7 @@ int INFTL_mount(struct INFTLrecord *s)
 	 * NOTEXPLORED state. Then at the end we will try to format it and
 	 * mark it as free.
 	 */
-	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: pass 1, explore each unit\n");
+	pr_debug("INFTL: pass 1, explore each unit\n");
 	for (first_block = s->firstEUN; first_block <= s->lastEUN; first_block++) {
 		if (s->PUtable[first_block] != BLOCK_NOTEXPLORED)
 			continue;
@@ -727,7 +727,7 @@ int INFTL_mount(struct INFTLrecord *s)
 	 * possible because we don't update the previous pointers when
 	 * we fold chains. No big deal, just fix them up in PUtable.
 	 */
-	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: pass 2, validate virtual chains\n");
+	pr_debug("INFTL: pass 2, validate virtual chains\n");
 	for (logical_block = 0; logical_block < s->numvunits; logical_block++) {
 		block = s->VUtable[logical_block];
 		last_block = BLOCK_NIL;
@@ -785,7 +785,7 @@ int INFTL_mount(struct INFTLrecord *s)
 	s->numfreeEUNs = 0;
 	s->LastFreeEUN = BLOCK_NIL;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: pass 3, format unused blocks\n");
+	pr_debug("INFTL: pass 3, format unused blocks\n");
 	for (block = s->firstEUN; block <= s->lastEUN; block++) {
 		if (s->PUtable[block] == BLOCK_NOTEXPLORED) {
 			printk("INFTL: unreferenced block %d, formatting it\n",
diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 1976b6c..7c1dc90 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -119,7 +119,7 @@ static int write_cached_data (struct mtdblk_dev *mtdblk)
 	if (mtdblk->cache_state != STATE_DIRTY)
 		return 0;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "mtdblock: writing cached data for \"%s\" "
+	pr_debug("mtdblock: writing cached data for \"%s\" "
 			"at 0x%lx, size 0x%x\n", mtd->name,
 			mtdblk->cache_offset, mtdblk->cache_size);
 
@@ -148,7 +148,7 @@ static int do_cached_write (struct mtdblk_dev *mtdblk, unsigned long pos,
 	size_t retlen;
 	int ret;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "mtdblock: write on \"%s\" at 0x%lx, size 0x%x\n",
+	pr_debug("mtdblock: write on \"%s\" at 0x%lx, size 0x%x\n",
 		mtd->name, pos, len);
 
 	if (!sect_size)
@@ -218,7 +218,7 @@ static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
 	size_t retlen;
 	int ret;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "mtdblock: read on \"%s\" at 0x%lx, size 0x%x\n",
+	pr_debug("mtdblock: read on \"%s\" at 0x%lx, size 0x%x\n",
 			mtd->name, pos, len);
 
 	if (!sect_size)
@@ -283,7 +283,7 @@ static int mtdblock_open(struct mtd_blktrans_dev *mbd)
 {
 	struct mtdblk_dev *mtdblk = container_of(mbd, struct mtdblk_dev, mbd);
 
-	DEBUG(MTD_DEBUG_LEVEL1,"mtdblock_open\n");
+	pr_debug("mtdblock_open\n");
 
 	mutex_lock(&mtdblks_lock);
 	if (mtdblk->count) {
@@ -303,7 +303,7 @@ static int mtdblock_open(struct mtd_blktrans_dev *mbd)
 
 	mutex_unlock(&mtdblks_lock);
 
-	DEBUG(MTD_DEBUG_LEVEL1, "ok\n");
+	pr_debug("ok\n");
 
 	return 0;
 }
@@ -312,7 +312,7 @@ static int mtdblock_release(struct mtd_blktrans_dev *mbd)
 {
 	struct mtdblk_dev *mtdblk = container_of(mbd, struct mtdblk_dev, mbd);
 
-   	DEBUG(MTD_DEBUG_LEVEL1, "mtdblock_release\n");
+	pr_debug("mtdblock_release\n");
 
 	mutex_lock(&mtdblks_lock);
 
@@ -329,7 +329,7 @@ static int mtdblock_release(struct mtd_blktrans_dev *mbd)
 
 	mutex_unlock(&mtdblks_lock);
 
-	DEBUG(MTD_DEBUG_LEVEL1, "ok\n");
+	pr_debug("ok\n");
 
 	return 0;
 }
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 978e084..d899757 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -86,7 +86,7 @@ static int mtd_open(struct inode *inode, struct file *file)
 	struct mtd_file_info *mfi;
 	struct inode *mtd_ino;
 
-	DEBUG(MTD_DEBUG_LEVEL0, "MTD_open\n");
+	pr_debug("MTD_open\n");
 
 	/* You can't open the RO devices RW */
 	if ((file->f_mode & FMODE_WRITE) && (minor & 1))
@@ -151,7 +151,7 @@ static int mtd_close(struct inode *inode, struct file *file)
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
 
-	DEBUG(MTD_DEBUG_LEVEL0, "MTD_close\n");
+	pr_debug("MTD_close\n");
 
 	/* Only sync if opened RW */
 	if ((file->f_mode & FMODE_WRITE) && mtd->sync)
@@ -195,7 +195,7 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 	size_t size = count;
 	char *kbuf;
 
-	DEBUG(MTD_DEBUG_LEVEL0,"MTD_read\n");
+	pr_debug("MTD_read\n");
 
 	if (*ppos + count > mtd->size)
 		count = mtd->size - *ppos;
@@ -278,7 +278,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 	int ret=0;
 	int len;
 
-	DEBUG(MTD_DEBUG_LEVEL0,"MTD_write\n");
+	pr_debug("MTD_write\n");
 
 	if (*ppos == mtd->size)
 		return -ENOSPC;
@@ -570,7 +570,7 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 	u_long size;
 	struct mtd_info_user info;
 
-	DEBUG(MTD_DEBUG_LEVEL0, "MTD_ioctl\n");
+	pr_debug("MTD_ioctl\n");
 
 	size = (cmd & IOCSIZE_MASK) >> IOCSIZE_SHIFT;
 	if (cmd & IOC_IN) {
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index f9cc2d2..887aed0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -362,7 +362,7 @@ int add_mtd_device(struct mtd_info *mtd)
 			      MTD_DEVT(i) + 1,
 			      NULL, "mtd%dro", i);
 
-	DEBUG(0, "mtd: Giving out device %d to %s\n", i, mtd->name);
+	pr_debug("mtd: Giving out device %d to %s\n", i, mtd->name);
 	/* No need to get a refcount on the module containing
 	   the notifier, since we hold the mtd_table_mutex */
 	list_for_each_entry(not, &mtd_notifiers, list)
diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
index 16b02a1..80fe5dc 100644
--- a/drivers/mtd/mtdsuper.c
+++ b/drivers/mtd/mtdsuper.c
@@ -26,12 +26,12 @@ static int get_sb_mtd_compare(struct super_block *sb, void *_mtd)
 	struct mtd_info *mtd = _mtd;
 
 	if (sb->s_mtd == mtd) {
-		DEBUG(2, "MTDSB: Match on device %d (\"%s\")\n",
+		pr_debug("MTDSB: Match on device %d (\"%s\")\n",
 		      mtd->index, mtd->name);
 		return 1;
 	}
 
-	DEBUG(2, "MTDSB: No match, device %d (\"%s\"), device %d (\"%s\")\n",
+	pr_debug("MTDSB: No match, device %d (\"%s\"), device %d (\"%s\")\n",
 	      sb->s_mtd->index, sb->s_mtd->name, mtd->index, mtd->name);
 	return 0;
 }
@@ -70,7 +70,7 @@ static struct dentry *mount_mtd_aux(struct file_system_type *fs_type, int flags,
 		goto already_mounted;
 
 	/* fresh new superblock */
-	DEBUG(1, "MTDSB: New superblock for device %d (\"%s\")\n",
+	pr_debug("MTDSB: New superblock for device %d (\"%s\")\n",
 	      mtd->index, mtd->name);
 
 	sb->s_flags = flags;
@@ -87,7 +87,7 @@ static struct dentry *mount_mtd_aux(struct file_system_type *fs_type, int flags,
 
 	/* new mountpoint for an already mounted superblock */
 already_mounted:
-	DEBUG(1, "MTDSB: Device %d (\"%s\") is already mounted\n",
+	pr_debug("MTDSB: Device %d (\"%s\") is already mounted\n",
 	      mtd->index, mtd->name);
 	put_mtd_device(mtd);
 	return dget(sb->s_root);
@@ -108,7 +108,7 @@ static struct dentry *mount_mtd_nr(struct file_system_type *fs_type, int flags,
 
 	mtd = get_mtd_device(NULL, mtdnr);
 	if (IS_ERR(mtd)) {
-		DEBUG(0, "MTDSB: Device #%u doesn't appear to exist\n", mtdnr);
+		pr_debug("MTDSB: Device #%u doesn't appear to exist\n", mtdnr);
 		return ERR_CAST(mtd);
 	}
 
@@ -131,7 +131,7 @@ struct dentry *mount_mtd(struct file_system_type *fs_type, int flags,
 	if (!dev_name)
 		return ERR_PTR(-EINVAL);
 
-	DEBUG(2, "MTDSB: dev_name \"%s\"\n", dev_name);
+	pr_debug("MTDSB: dev_name \"%s\"\n", dev_name);
 
 	/* the preferred way of mounting in future; especially when
 	 * CONFIG_BLOCK=n - we specify the underlying MTD device by number or
@@ -142,7 +142,7 @@ struct dentry *mount_mtd(struct file_system_type *fs_type, int flags,
 			struct mtd_info *mtd;
 
 			/* mount by MTD device name */
-			DEBUG(1, "MTDSB: mtd:%%s, name \"%s\"\n",
+			pr_debug("MTDSB: mtd:%%s, name \"%s\"\n",
 			      dev_name + 4);
 
 			mtd = get_mtd_device_nm(dev_name + 4);
@@ -163,7 +163,7 @@ struct dentry *mount_mtd(struct file_system_type *fs_type, int flags,
 			mtdnr = simple_strtoul(dev_name + 3, &endptr, 0);
 			if (!*endptr) {
 				/* It was a valid number */
-				DEBUG(1, "MTDSB: mtd%%d, mtdnr %d\n",
+				pr_debug("MTDSB: mtd%%d, mtdnr %d\n",
 				      mtdnr);
 				return mount_mtd_nr(fs_type, flags,
 						     dev_name, data,
@@ -179,10 +179,10 @@ struct dentry *mount_mtd(struct file_system_type *fs_type, int flags,
 	bdev = lookup_bdev(dev_name);
 	if (IS_ERR(bdev)) {
 		ret = PTR_ERR(bdev);
-		DEBUG(1, "MTDSB: lookup_bdev() returned %d\n", ret);
+		pr_debug("MTDSB: lookup_bdev() returned %d\n", ret);
 		return ERR_PTR(ret);
 	}
-	DEBUG(1, "MTDSB: lookup_bdev() returned 0\n");
+	pr_debug("MTDSB: lookup_bdev() returned 0\n");
 
 	ret = -EINVAL;
 
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 4c2bb4a..2fbfb71 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -349,7 +349,7 @@ static void wait_op_done(struct mxc_nand_host *host, int useirq)
 			udelay(1);
 		}
 		if (max_retries < 0)
-			DEBUG(MTD_DEBUG_LEVEL0, "%s: INT not set\n",
+			pr_debug("%s: INT not set\n",
 			      __func__);
 	}
 }
@@ -370,7 +370,7 @@ static void send_cmd_v3(struct mxc_nand_host *host, uint16_t cmd, int useirq)
  * waits for completion. */
 static void send_cmd_v1_v2(struct mxc_nand_host *host, uint16_t cmd, int useirq)
 {
-	DEBUG(MTD_DEBUG_LEVEL3, "send_cmd(host, 0x%x, %d)\n", cmd, useirq);
+	pr_debug("send_cmd(host, 0x%x, %d)\n", cmd, useirq);
 
 	writew(cmd, NFC_V1_V2_FLASH_CMD);
 	writew(NFC_CMD, NFC_V1_V2_CONFIG2);
@@ -386,7 +386,7 @@ static void send_cmd_v1_v2(struct mxc_nand_host *host, uint16_t cmd, int useirq)
 			udelay(1);
 		}
 		if (max_retries < 0)
-			DEBUG(MTD_DEBUG_LEVEL0, "%s: RESET failed\n",
+			pr_debug("%s: RESET failed\n",
 			      __func__);
 	} else {
 		/* Wait for operation to complete */
@@ -410,7 +410,7 @@ static void send_addr_v3(struct mxc_nand_host *host, uint16_t addr, int islast)
  * a NAND command. */
 static void send_addr_v1_v2(struct mxc_nand_host *host, uint16_t addr, int islast)
 {
-	DEBUG(MTD_DEBUG_LEVEL3, "send_addr(host, 0x%x %d)\n", addr, islast);
+	pr_debug("send_addr(host, 0x%x %d)\n", addr, islast);
 
 	writew(addr, NFC_V1_V2_FLASH_ADDR);
 	writew(NFC_ADDR, NFC_V1_V2_CONFIG2);
@@ -560,8 +560,7 @@ static int mxc_nand_correct_data_v1(struct mtd_info *mtd, u_char *dat,
 	uint16_t ecc_status = readw(NFC_V1_V2_ECC_STATUS_RESULT);
 
 	if (((ecc_status & 0x3) == 2) || ((ecc_status >> 2) == 2)) {
-		DEBUG(MTD_DEBUG_LEVEL0,
-		      "MXC_NAND: HWECC uncorrectable 2-bit ECC error\n");
+		pr_debug("MXC_NAND: HWECC uncorrectable 2-bit ECC error\n");
 		return -1;
 	}
 
@@ -931,8 +930,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 	struct nand_chip *nand_chip = mtd->priv;
 	struct mxc_nand_host *host = nand_chip->priv;
 
-	DEBUG(MTD_DEBUG_LEVEL3,
-	      "mxc_nand_command (cmd = 0x%x, col = 0x%x, page = 0x%x)\n",
+	pr_debug("mxc_nand_command (cmd = 0x%x, col = 0x%x, page = 0x%x)\n",
 	      command, column, page_addr);
 
 	/* Reset command state information */
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9430768..d2ee68a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -113,21 +113,19 @@ static int check_offs_len(struct mtd_info *mtd,
 
 	/* Start address must align on block boundary */
 	if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address\n", __func__);
+		pr_debug("%s: unaligned address\n", __func__);
 		ret = -EINVAL;
 	}
 
 	/* Length must align on block boundary */
 	if (len & ((1 << chip->phys_erase_shift) - 1)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not block aligned\n",
-					__func__);
+		pr_debug("%s: length not block aligned\n", __func__);
 		ret = -EINVAL;
 	}
 
 	/* Do not allow past end of device */
 	if (ofs + len > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of device\n",
-					__func__);
+		pr_debug("%s: past end of device\n", __func__);
 		ret = -EINVAL;
 	}
 
@@ -913,7 +911,7 @@ static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
 	status = chip->waitfunc(mtd, chip);
 	/* See if device thinks it succeeded */
 	if (status & 0x01) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Error status = 0x%08x\n",
+		pr_debug("%s: error status = 0x%08x\n",
 					__func__, status);
 		ret = -EIO;
 	}
@@ -935,7 +933,7 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	int chipnr;
 	struct nand_chip *chip = mtd->priv;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
+	pr_debug("%s: start = 0x%012llx, len = %llu\n",
 			__func__, (unsigned long long)ofs, len);
 
 	if (check_offs_len(mtd, ofs, len))
@@ -954,7 +952,7 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 
 	/* Check, if it is write protected */
 	if (nand_check_wp(mtd)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Device is write protected!!!\n",
+		pr_debug("%s: device is write protected!\n",
 					__func__);
 		ret = -EIO;
 		goto out;
@@ -988,7 +986,7 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	int chipnr, status, page;
 	struct nand_chip *chip = mtd->priv;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
+	pr_debug("%s: start = 0x%012llx, len = %llu\n",
 			__func__, (unsigned long long)ofs, len);
 
 	if (check_offs_len(mtd, ofs, len))
@@ -1003,7 +1001,7 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 
 	/* Check, if it is write protected */
 	if (nand_check_wp(mtd)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Device is write protected!!!\n",
+		pr_debug("%s: device is write protected!\n",
 					__func__);
 		status = MTD_ERASE_FAILED;
 		ret = -EIO;
@@ -1018,7 +1016,7 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	status = chip->waitfunc(mtd, chip);
 	/* See if device thinks it succeeded */
 	if (status & 0x01) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Error status = 0x%08x\n",
+		pr_debug("%s: error status = 0x%08x\n",
 					__func__, status);
 		ret = -EIO;
 		goto out;
@@ -1756,7 +1754,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	int len;
 	uint8_t *buf = ops->oobbuf;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: from = 0x%08Lx, len = %i\n",
+	pr_debug("%s: from = 0x%08Lx, len = %i\n",
 			__func__, (unsigned long long)from, readlen);
 
 	stats = mtd->ecc_stats;
@@ -1767,8 +1765,8 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 		len = mtd->oobsize;
 
 	if (unlikely(ops->ooboffs >= len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to start read "
-					"outside oob\n", __func__);
+		pr_debug("%s: attempt to start read outside oob\n",
+				__func__);
 		return -EINVAL;
 	}
 
@@ -1776,8 +1774,8 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	if (unlikely(from >= mtd->size ||
 		     ops->ooboffs + readlen > ((mtd->size >> chip->page_shift) -
 					(from >> chip->page_shift)) * len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt read beyond end "
-					"of device\n", __func__);
+		pr_debug("%s: attempt to read beyond end of device\n",
+				__func__);
 		return -EINVAL;
 	}
 
@@ -1856,8 +1854,8 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 
 	/* Do not allow reads past end of device */
 	if (ops->datbuf && (from + ops->len) > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt read "
-				"beyond end of device\n", __func__);
+		pr_debug("%s: attempt to read beyond end of device\n",
+				__func__);
 		return -EINVAL;
 	}
 
@@ -2349,7 +2347,7 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 	int chipnr, page, status, len;
 	struct nand_chip *chip = mtd->priv;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n",
+	pr_debug("%s: to = 0x%08x, len = %i\n",
 			 __func__, (unsigned int)to, (int)ops->ooblen);
 
 	if (ops->mode == MTD_OOB_AUTO)
@@ -2359,14 +2357,14 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 
 	/* Do not allow write past end of page */
 	if ((ops->ooboffs + ops->ooblen) > len) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to write "
-				"past end of page\n", __func__);
+		pr_debug("%s: attempt to write past end of page\n",
+				__func__);
 		return -EINVAL;
 	}
 
 	if (unlikely(ops->ooboffs >= len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to start "
-				"write outside oob\n", __func__);
+		pr_debug("%s: attempt to start write outside oob\n",
+				__func__);
 		return -EINVAL;
 	}
 
@@ -2375,8 +2373,8 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 		     ops->ooboffs + ops->ooblen >
 			((mtd->size >> chip->page_shift) -
 			 (to >> chip->page_shift)) * len)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt write beyond "
-				"end of device\n", __func__);
+		pr_debug("%s: attempt to write beyond end of device\n",
+				__func__);
 		return -EINVAL;
 	}
 
@@ -2429,8 +2427,8 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 
 	/* Do not allow writes past end of device */
 	if (ops->datbuf && (to + ops->len) > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt write beyond "
-				"end of device\n", __func__);
+		pr_debug("%s: attempt to write beyond end of device\n",
+				__func__);
 		return -EINVAL;
 	}
 
@@ -2519,9 +2517,9 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 	unsigned int bbt_masked_page = 0xffffffff;
 	loff_t len;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
-				__func__, (unsigned long long)instr->addr,
-				(unsigned long long)instr->len);
+	pr_debug("%s: start = 0x%012llx, len = %llu\n",
+			__func__, (unsigned long long)instr->addr,
+			(unsigned long long)instr->len);
 
 	if (check_offs_len(mtd, instr->addr, instr->len))
 		return -EINVAL;
@@ -2543,8 +2541,8 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 
 	/* Check, if it is write protected */
 	if (nand_check_wp(mtd)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: Device is write protected!!!\n",
-					__func__);
+		pr_debug("%s: device is write protected!\n",
+				__func__);
 		instr->state = MTD_ERASE_FAILED;
 		goto erase_exit;
 	}
@@ -2595,8 +2593,8 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 
 		/* See if block erase succeeded */
 		if (status & NAND_STATUS_FAIL) {
-			DEBUG(MTD_DEBUG_LEVEL0, "%s: Failed erase, "
-					"page 0x%08x\n", __func__, page);
+			pr_debug("%s: failed erase, page 0x%08x\n",
+					__func__, page);
 			instr->state = MTD_ERASE_FAILED;
 			instr->fail_addr =
 				((loff_t)page << chip->page_shift);
@@ -2656,9 +2654,9 @@ erase_exit:
 		if (!rewrite_bbt[chipnr])
 			continue;
 		/* Update the BBT for chip */
-		DEBUG(MTD_DEBUG_LEVEL0, "%s: nand_update_bbt "
-			"(%d:0x%0llx 0x%0x)\n", __func__, chipnr,
-			rewrite_bbt[chipnr], chip->bbt_td->pages[chipnr]);
+		pr_debug("%s: nand_update_bbt (%d:0x%0llx 0x%0x)\n",
+				__func__, chipnr, rewrite_bbt[chipnr],
+				chip->bbt_td->pages[chipnr]);
 		nand_update_bbt(mtd, rewrite_bbt[chipnr]);
 	}
 
@@ -2676,7 +2674,7 @@ static void nand_sync(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: called\n", __func__);
+	pr_debug("%s: called\n", __func__);
 
 	/* Grab the lock and see if the device is available */
 	nand_get_device(chip, mtd, FL_SYNCING);
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index dba3323..6aa8125 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1383,8 +1383,9 @@ int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 	block = (int)(offs >> (this->bbt_erase_shift - 1));
 	res = (this->bbt[block >> 3] >> (block & 0x06)) & 0x03;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
-	      (unsigned int)offs, block >> 1, res);
+	pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: "
+			"(block %d) 0x%02x\n",
+			(unsigned int)offs, block >> 1, res);
 
 	switch ((int)res) {
 	case 0x00:
diff --git a/drivers/mtd/nand/nand_bch.c b/drivers/mtd/nand/nand_bch.c
index 0f931e7..16cca9b 100644
--- a/drivers/mtd/nand/nand_bch.c
+++ b/drivers/mtd/nand/nand_bch.c
@@ -93,7 +93,7 @@ int nand_bch_correct_data(struct mtd_info *mtd, unsigned char *buf,
 				buf[errloc[i] >> 3] ^= (1 << (errloc[i] & 7));
 			/* else error in ecc, no action needed */
 
-			DEBUG(MTD_DEBUG_LEVEL0, "%s: corrected bitflip %u\n",
+			pr_debug("%s: corrected bitflip %u\n",
 			      __func__, errloc[i]);
 		}
 	} else if (count < 0) {
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index c5e33fd..81e6bc0 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -741,12 +741,12 @@ static int omap_compare_ecc(u8 *ecc_data1,	/* read from NAND memory */
 
 	case 1:
 		/* Uncorrectable error */
-		DEBUG(MTD_DEBUG_LEVEL0, "ECC UNCORRECTED_ERROR 1\n");
+		pr_debug("ECC UNCORRECTED_ERROR 1\n");
 		return -1;
 
 	case 11:
 		/* UN-Correctable error */
-		DEBUG(MTD_DEBUG_LEVEL0, "ECC UNCORRECTED_ERROR B\n");
+		pr_debug("ECC UNCORRECTED_ERROR B\n");
 		return -1;
 
 	case 12:
@@ -763,7 +763,7 @@ static int omap_compare_ecc(u8 *ecc_data1,	/* read from NAND memory */
 
 		find_bit = (ecc_bit[5] << 2) + (ecc_bit[3] << 1) + ecc_bit[1];
 
-		DEBUG(MTD_DEBUG_LEVEL0, "Correcting single bit ECC error at "
+		pr_debug("Correcting single bit ECC error at "
 				"offset: %d, bit: %d\n", find_byte, find_bit);
 
 		page_data[find_byte] ^= (1 << find_bit);
@@ -776,7 +776,7 @@ static int omap_compare_ecc(u8 *ecc_data1,	/* read from NAND memory */
 			    ecc_data2[2] == 0)
 				return 0;
 		}
-		DEBUG(MTD_DEBUG_LEVEL0, "UNCORRECTED_ERROR default\n");
+		pr_debug("UNCORRECTED_ERROR default\n");
 		return -1;
 	}
 }
diff --git a/drivers/mtd/nand/rtc_from4.c b/drivers/mtd/nand/rtc_from4.c
index 33fe922..f309add 100644
--- a/drivers/mtd/nand/rtc_from4.c
+++ b/drivers/mtd/nand/rtc_from4.c
@@ -380,7 +380,7 @@ static int rtc_from4_correct_data(struct mtd_info *mtd, const u_char *buf, u_cha
 	/* Let the library code do its magic. */
 	res = decode_rs8(rs_decoder, (uint8_t *) buf, par, 512, syn, 0, NULL, 0xff, NULL);
 	if (res > 0) {
-		DEBUG(MTD_DEBUG_LEVEL0, "rtc_from4_correct_data: " "ECC corrected %d errors on read\n", res);
+		pr_debug("rtc_from4_correct_data: " "ECC corrected %d errors on read\n", res);
 	}
 	return res;
 }
diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index f3b3239..93d6fc6 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -63,7 +63,7 @@ static void nftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 		return;
 	}
 
-	DEBUG(MTD_DEBUG_LEVEL1, "NFTL: add_mtd for %s\n", mtd->name);
+	pr_debug("NFTL: add_mtd for %s\n", mtd->name);
 
 	nftl = kzalloc(sizeof(struct NFTLrecord), GFP_KERNEL);
 
@@ -130,7 +130,7 @@ static void nftl_remove_dev(struct mtd_blktrans_dev *dev)
 {
 	struct NFTLrecord *nftl = (void *)dev;
 
-	DEBUG(MTD_DEBUG_LEVEL1, "NFTL: remove_dev (i=%d)\n", dev->devnum);
+	pr_debug("NFTL: remove_dev (i=%d)\n", dev->devnum);
 
 	del_mtd_blktrans_dev(dev);
 	kfree(nftl->ReplUnitTable);
@@ -218,7 +218,7 @@ static u16 NFTL_findfreeblock(struct NFTLrecord *nftl, int desperate )
 
 	/* Normally, we force a fold to happen before we run out of free blocks completely */
 	if (!desperate && nftl->numfreeEUNs < 2) {
-		DEBUG(MTD_DEBUG_LEVEL1, "NFTL_findfreeblock: there are too few free EUNs\n");
+		pr_debug("NFTL_findfreeblock: there are too few free EUNs\n");
 		return BLOCK_NIL;
 	}
 
@@ -289,8 +289,7 @@ static u16 NFTL_foldchain (struct NFTLrecord *nftl, unsigned thisVUC, unsigned p
 			if (block == 2) {
 				foldmark = oob.u.c.FoldMark | oob.u.c.FoldMark1;
 				if (foldmark == FOLD_MARK_IN_PROGRESS) {
-					DEBUG(MTD_DEBUG_LEVEL1,
-					      "Write Inhibited on EUN %d\n", thisEUN);
+					pr_debug("Write Inhibited on EUN %d\n", thisEUN);
 					inplace = 0;
 				} else {
 					/* There's no other reason not to do inplace,
@@ -355,7 +354,7 @@ static u16 NFTL_foldchain (struct NFTLrecord *nftl, unsigned thisVUC, unsigned p
 			if (BlockLastState[block] != SECTOR_FREE &&
 			    BlockMap[block] != BLOCK_NIL &&
 			    BlockMap[block] != targetEUN) {
-				DEBUG(MTD_DEBUG_LEVEL1, "Setting inplace to 0. VUC %d, "
+				pr_debug("Setting inplace to 0. VUC %d, "
 				      "block %d was %x lastEUN, "
 				      "and is in EUN %d (%s) %d\n",
 				      thisVUC, block, BlockLastState[block],
@@ -371,14 +370,14 @@ static u16 NFTL_foldchain (struct NFTLrecord *nftl, unsigned thisVUC, unsigned p
 		    pendingblock < ((thisVUC + 1)* (nftl->EraseSize / 512)) &&
 		    BlockLastState[pendingblock - (thisVUC * (nftl->EraseSize / 512))] !=
 		    SECTOR_FREE) {
-			DEBUG(MTD_DEBUG_LEVEL1, "Pending write not free in EUN %d. "
+			pr_debug("Pending write not free in EUN %d. "
 			      "Folding out of place.\n", targetEUN);
 			inplace = 0;
 		}
 	}
 
 	if (!inplace) {
-		DEBUG(MTD_DEBUG_LEVEL1, "Cannot fold Virtual Unit Chain %d in place. "
+		pr_debug("Cannot fold Virtual Unit Chain %d in place. "
 		      "Trying out-of-place\n", thisVUC);
 		/* We need to find a targetEUN to fold into. */
 		targetEUN = NFTL_findfreeblock(nftl, 1);
@@ -408,7 +407,7 @@ static u16 NFTL_foldchain (struct NFTLrecord *nftl, unsigned thisVUC, unsigned p
 	   and the Erase Unit into which we are supposed to be copying.
 	   Go for it.
 	*/
-	DEBUG(MTD_DEBUG_LEVEL1,"Folding chain %d into unit %d\n", thisVUC, targetEUN);
+	pr_debug("Folding chain %d into unit %d\n", thisVUC, targetEUN);
 	for (block = 0; block < nftl->EraseSize / 512 ; block++) {
 		unsigned char movebuf[512];
 		int ret;
@@ -455,7 +454,7 @@ static u16 NFTL_foldchain (struct NFTLrecord *nftl, unsigned thisVUC, unsigned p
 	   has duplicate chains, we need to free one of the chains because it's not necessary any more.
 	*/
 	thisEUN = nftl->EUNtable[thisVUC];
-	DEBUG(MTD_DEBUG_LEVEL1,"Want to erase\n");
+	pr_debug("Want to erase\n");
 
 	/* For each block in the old chain (except the targetEUN of course),
 	   free it and make it available for future use */
@@ -568,7 +567,7 @@ static inline u16 NFTL_findwriteunit(struct NFTLrecord *nftl, unsigned block)
 				      (writeEUN * nftl->EraseSize) + blockofs,
 				      8, &retlen, (char *)&bci);
 
-			DEBUG(MTD_DEBUG_LEVEL2, "Status of block %d in EUN %d is %x\n",
+			pr_debug("Status of block %d in EUN %d is %x\n",
 			      block , writeEUN, le16_to_cpu(bci.Status));
 
 			status = bci.Status | bci.Status1;
@@ -621,7 +620,7 @@ static inline u16 NFTL_findwriteunit(struct NFTLrecord *nftl, unsigned block)
 				   but they are reserved for when we're
 				   desperate. Well, now we're desperate.
 				*/
-				DEBUG(MTD_DEBUG_LEVEL1, "Using desperate==1 to find free EUN to accommodate write to VUC %d\n", thisVUC);
+				pr_debug("Using desperate==1 to find free EUN to accommodate write to VUC %d\n", thisVUC);
 				writeEUN = NFTL_findfreeblock(nftl, 1);
 			}
 			if (writeEUN == BLOCK_NIL) {
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 30c652c..b07b052 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1122,7 +1122,7 @@ static int onenand_mlc_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	int ret = 0;
 	int writesize = this->writesize;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: from = 0x%08x, len = %i\n",
+	pr_debug("%s: from = 0x%08x, len = %i\n",
 	      __func__, (unsigned int) from, (int) len);
 
 	if (ops->mode == MTD_OOB_AUTO)
@@ -1226,7 +1226,7 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	int ret = 0, boundary = 0;
 	int writesize = this->writesize;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: from = 0x%08x, len = %i\n",
+	pr_debug("%s: from = 0x%08x, len = %i\n",
 			__func__, (unsigned int) from, (int) len);
 
 	if (ops->mode == MTD_OOB_AUTO)
@@ -1357,7 +1357,7 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 
 	from += ops->ooboffs;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: from = 0x%08x, len = %i\n",
+	pr_debug("%s: from = 0x%08x, len = %i\n",
 		__func__, (unsigned int) from, (int) len);
 
 	/* Initialize return length value */
@@ -1576,7 +1576,7 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 	size_t len = ops->ooblen;
 	u_char *buf = ops->oobbuf;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: from = 0x%08x, len = %zi\n",
+	pr_debug("%s: from = 0x%08x, len = %zi\n",
 		__func__, (unsigned int) from, len);
 
 	/* Initialize return value */
@@ -1750,7 +1750,7 @@ static int onenand_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 	/* Wait for any existing operation to clear */
 	onenand_panic_wait(mtd);
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n",
+	pr_debug("%s: to = 0x%08x, len = %i\n",
 		__func__, (unsigned int) to, (int) len);
 
 	/* Initialize retlen, in case of early exit */
@@ -1883,7 +1883,7 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 	u_char *oobbuf;
 	int ret = 0, cmd;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n",
+	pr_debug("%s: to = 0x%08x, len = %i\n",
 		__func__, (unsigned int) to, (int) len);
 
 	/* Initialize retlen, in case of early exit */
@@ -2078,7 +2078,7 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 
 	to += ops->ooboffs;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n",
+	pr_debug("%s: to = 0x%08x, len = %i\n",
 		__func__, (unsigned int) to, (int) len);
 
 	/* Initialize retlen, in case of early exit */
@@ -2489,7 +2489,7 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 	struct mtd_erase_region_info *region = NULL;
 	loff_t region_offset = 0;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: start=0x%012llx, len=%llu\n", __func__,
+	pr_debug("%s: start=0x%012llx, len=%llu\n", __func__,
 	      (unsigned long long) instr->addr, (unsigned long long) instr->len);
 
 	/* Do not allow erase past end of device */
@@ -2558,7 +2558,7 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
  */
 static void onenand_sync(struct mtd_info *mtd)
 {
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: called\n", __func__);
+	pr_debug("%s: called\n", __func__);
 
 	/* Grab the lock and see if the device is available */
 	onenand_get_device(mtd, FL_SYNCING);
diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
index 09a7d1f..3b9a2a9 100644
--- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -153,7 +153,7 @@ static int onenand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 	block = (int) (onenand_block(this, offs) << 1);
 	res = (bbm->bbt[block >> 3] >> (block & 0x06)) & 0x03;
 
-	DEBUG(MTD_DEBUG_LEVEL2, "onenand_isbad_bbt: bbt info for offs 0x%08x: (block %d) 0x%02x\n",
+	pr_debug("onenand_isbad_bbt: bbt info for offs 0x%08x: (block %d) 0x%02x\n",
 		(unsigned int) offs, block >> 1, res);
 
 	switch ((int) res) {
diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 00d1405..5f917f0 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -135,8 +135,7 @@ static int get_valid_cis_sector(struct mtd_info *mtd)
 				/* Found */
 				cis_sector = (int)(offset >> SECTOR_SHIFT);
 			} else {
-				DEBUG(MTD_DEBUG_LEVEL1,
-					"SSFDC_RO: CIS/IDI sector not found"
+				pr_debug("SSFDC_RO: CIS/IDI sector not found"
 					" on %s (mtd%d)\n", mtd->name,
 					mtd->index);
 			}
@@ -221,8 +220,7 @@ static int get_logical_address(uint8_t *oob_buf)
 			block_address >>= 1;
 
 			if (get_parity(block_address, 10) != parity) {
-				DEBUG(MTD_DEBUG_LEVEL0,
-					"SSFDC_RO: logical address field%d"
+				pr_debug("SSFDC_RO: logical address field%d"
 					"parity error(0x%04X)\n", j+1,
 					block_address);
 			} else {
@@ -235,7 +233,7 @@ static int get_logical_address(uint8_t *oob_buf)
 	if (!ok)
 		block_address = -2;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "SSFDC_RO: get_logical_address() %d\n",
+	pr_debug("SSFDC_RO: get_logical_address() %d\n",
 		block_address);
 
 	return block_address;
@@ -249,7 +247,7 @@ static int build_logical_block_map(struct ssfdcr_record *ssfdc)
 	int ret, block_address, phys_block;
 	struct mtd_info *mtd = ssfdc->mbd.mtd;
 
-	DEBUG(MTD_DEBUG_LEVEL1, "SSFDC_RO: build_block_map() nblks=%d (%luK)\n",
+	pr_debug("SSFDC_RO: build_block_map() nblks=%d (%luK)\n",
 	      ssfdc->map_len,
 	      (unsigned long)ssfdc->map_len * ssfdc->erase_size / 1024);
 
@@ -262,8 +260,7 @@ static int build_logical_block_map(struct ssfdcr_record *ssfdc)
 
 		ret = read_raw_oob(mtd, offset, oob_buf);
 		if (ret < 0) {
-			DEBUG(MTD_DEBUG_LEVEL0,
-				"SSFDC_RO: mtd read_oob() failed at %lu\n",
+			pr_debug("SSFDC_RO: mtd read_oob() failed at %lu\n",
 				offset);
 			return -1;
 		}
@@ -279,8 +276,7 @@ static int build_logical_block_map(struct ssfdcr_record *ssfdc)
 			ssfdc->logic_block_map[block_address] =
 				(unsigned short)phys_block;
 
-			DEBUG(MTD_DEBUG_LEVEL2,
-				"SSFDC_RO: build_block_map() phys_block=%d,"
+			pr_debug("SSFDC_RO: build_block_map() phys_block=%d,"
 				"logic_block_addr=%d, zone=%d\n",
 				phys_block, block_address, zone_index);
 		}
@@ -316,8 +312,7 @@ static void ssfdcr_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	ssfdc->erase_size = mtd->erasesize;
 	ssfdc->map_len = (u32)mtd->size / mtd->erasesize;
 
-	DEBUG(MTD_DEBUG_LEVEL1,
-		"SSFDC_RO: cis_block=%d,erase_size=%d,map_len=%d,n_zones=%d\n",
+	pr_debug("SSFDC_RO: cis_block=%d,erase_size=%d,map_len=%d,n_zones=%d\n",
 		ssfdc->cis_block, ssfdc->erase_size, ssfdc->map_len,
 		DIV_ROUND_UP(ssfdc->map_len, MAX_PHYS_BLK_PER_ZONE));
 
@@ -328,7 +323,7 @@ static void ssfdcr_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	ssfdc->cylinders = (unsigned short)(((u32)mtd->size >> SECTOR_SHIFT) /
 			((long)ssfdc->sectors * (long)ssfdc->heads));
 
-	DEBUG(MTD_DEBUG_LEVEL1, "SSFDC_RO: using C:%d H:%d S:%d == %ld sects\n",
+	pr_debug("SSFDC_RO: using C:%d H:%d S:%d == %ld sects\n",
 		ssfdc->cylinders, ssfdc->heads , ssfdc->sectors,
 		(long)ssfdc->cylinders * (long)ssfdc->heads *
 		(long)ssfdc->sectors);
@@ -365,7 +360,7 @@ static void ssfdcr_remove_dev(struct mtd_blktrans_dev *dev)
 {
 	struct ssfdcr_record *ssfdc = (struct ssfdcr_record *)dev;
 
-	DEBUG(MTD_DEBUG_LEVEL1, "SSFDC_RO: remove_dev (i=%d)\n", dev->devnum);
+	pr_debug("SSFDC_RO: remove_dev (i=%d)\n", dev->devnum);
 
 	del_mtd_blktrans_dev(dev);
 	kfree(ssfdc->logic_block_map);
@@ -381,8 +376,7 @@ static int ssfdcr_readsect(struct mtd_blktrans_dev *dev,
 	offset = (int)(logic_sect_no % sectors_per_block);
 	block_address = (int)(logic_sect_no / sectors_per_block);
 
-	DEBUG(MTD_DEBUG_LEVEL3,
-		"SSFDC_RO: ssfdcr_readsect(%lu) sec_per_blk=%d, ofst=%d,"
+	pr_debug("SSFDC_RO: ssfdcr_readsect(%lu) sec_per_blk=%d, ofst=%d,"
 		" block_addr=%d\n", logic_sect_no, sectors_per_block, offset,
 		block_address);
 
@@ -391,8 +385,7 @@ static int ssfdcr_readsect(struct mtd_blktrans_dev *dev,
 
 	block_address = ssfdc->logic_block_map[block_address];
 
-	DEBUG(MTD_DEBUG_LEVEL3,
-		"SSFDC_RO: ssfdcr_readsect() phys_block_addr=%d\n",
+	pr_debug("SSFDC_RO: ssfdcr_readsect() phys_block_addr=%d\n",
 		block_address);
 
 	if (block_address < 0xffff) {
@@ -401,8 +394,7 @@ static int ssfdcr_readsect(struct mtd_blktrans_dev *dev,
 		sect_no = (unsigned long)block_address * sectors_per_block +
 				offset;
 
-		DEBUG(MTD_DEBUG_LEVEL3,
-			"SSFDC_RO: ssfdcr_readsect() phys_sect_no=%lu\n",
+		pr_debug("SSFDC_RO: ssfdcr_readsect() phys_sect_no=%lu\n",
 			sect_no);
 
 		if (read_physical_sector(ssfdc->mbd.mtd, buf, sect_no) < 0)
@@ -418,7 +410,7 @@ static int ssfdcr_getgeo(struct mtd_blktrans_dev *dev,  struct hd_geometry *geo)
 {
 	struct ssfdcr_record *ssfdc = (struct ssfdcr_record *)dev;
 
-	DEBUG(MTD_DEBUG_LEVEL1, "SSFDC_RO: ssfdcr_getgeo() C=%d, H=%d, S=%d\n",
+	pr_debug("SSFDC_RO: ssfdcr_getgeo() C=%d, H=%d, S=%d\n",
 			ssfdc->cylinders, ssfdc->heads, ssfdc->sectors);
 
 	geo->heads = ssfdc->heads;
-- 
1.7.0.4
