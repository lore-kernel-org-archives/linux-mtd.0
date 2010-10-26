Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAfou-00024Y-AK
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2010 09:27:54 +0000
Subject: [PATCH 2 3/3] mtd: cfi_cmdset_0002: make sector erase command variable
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Tue, 26 Oct 2010 11:26:36 +0200
Message-ID: <20101026092636.5790.29589.stgit@dev.siriade.com>
In-Reply-To: <20101026092626.5790.91523.stgit@dev.siriade.com>
References: <20101026092626.5790.91523.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: fggs@terra.com.br, zhangyd6@gmail.com, w.sang@pengutronix.de,
	David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some old SST chips use 0x50 as sector erase command, instead
of 0x30. Make this value variable to handle such chips.

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   10 ++++++----
 drivers/mtd/chips/cfi_probe.c       |    2 ++
 include/linux/mtd/cfi.h             |    1 +
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 1cdba02..a6b6a78 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -291,6 +291,8 @@ static void fixup_sst39vf_rev_b(struct mtd_info *mtd, void *param)
 
 	cfi->addr_unlock1 = 0x555;
 	cfi->addr_unlock2 = 0x2AA;
+
+	cfi->sector_erase_cmd = 0x50;
 }
 
 static void fixup_sst38vf640x_sectorsize(struct mtd_info *mtd, void *param)
@@ -691,7 +693,7 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 				 * there was an error (so leave the erase
 				 * routine to recover from it) or we trying to
 				 * use the erase-in-progress sector. */
-				map_write(map, CMD(0x30), chip->in_progress_block_addr);
+				map_write(map, CMD(cfi->sector_erase_cmd), chip->in_progress_block_addr);
 				chip->state = FL_ERASING;
 				chip->oldstate = FL_READY;
 				printk(KERN_ERR "MTD %s(): chip not ready after erase suspend\n", __func__);
@@ -744,7 +746,7 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 	switch(chip->oldstate) {
 	case FL_ERASING:
 		chip->state = chip->oldstate;
-		map_write(map, CMD(0x30), chip->in_progress_block_addr);
+		map_write(map, CMD(cfi->sector_erase_cmd), chip->in_progress_block_addr);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
 		break;
@@ -887,7 +889,7 @@ static void __xipram xip_udelay(struct map_info *map, struct flchip *chip,
 			local_irq_disable();
 
 			/* Resume the write or erase operation */
-			map_write(map, CMD(0x30), adr);
+			map_write(map, CMD(cfi->sector_erase_cmd), adr);
 			chip->state = oldstate;
 			start = xip_currtime();
 		} else if (usec >= 1000000/HZ) {
@@ -1670,7 +1672,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	map_write(map, CMD(0x30), adr);
+	map_write(map, CMD(cfi->sector_erase_cmd), adr);
 
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index 8f5b96a..f030300 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -177,6 +177,8 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 
 	cfi->cfi_mode = CFI_MODE_CFI;
 
+	cfi->sector_erase_cmd = 0x30;
+
 	/* Read the CFI info structure */
 	xip_disable_qry(base, map, cfi);
 	for (i=0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++)
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index d2118b0..b97a0f8 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -289,6 +289,7 @@ struct cfi_private {
 				  must be of the same type. */
 	int mfr, id;
 	int numchips;
+	int sector_erase_cmd;
 	unsigned long chipshift; /* Because they're of the same type */
 	const char *im_name;	 /* inter_module name for cmdset_setup */
 	struct flchip chips[0];  /* per-chip data structure for each chip */
