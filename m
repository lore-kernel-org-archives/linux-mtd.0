Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P9JkF-0002kj-VS
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 15:41:29 +0000
Subject: [PATCH 2/4] mtd: cfi_cmdset_0002: make sector erase command variable
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Fri, 22 Oct 2010 17:40:20 +0200
Message-ID: <20101022154020.11097.4024.stgit@dev.siriade.com>
In-Reply-To: <20101022154015.11097.94660.stgit@dev.siriade.com>
References: <20101022154015.11097.94660.stgit@dev.siriade.com>
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
 drivers/mtd/chips/cfi_cmdset_0002.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 3e6c47b..209928b 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -78,6 +78,7 @@ static struct mtd_chip_driver cfi_amdstd_chipdrv = {
 	.module		= THIS_MODULE
 };
 
+static map_word sector_erase_cmd = CMD(0x30);
 
 /* #define DEBUG_CFI_FEATURES */
 
@@ -674,7 +675,7 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 				 * there was an error (so leave the erase
 				 * routine to recover from it) or we trying to
 				 * use the erase-in-progress sector. */
-				map_write(map, CMD(0x30), chip->in_progress_block_addr);
+				map_write(map, sector_erase_cmd, chip->in_progress_block_addr);
 				chip->state = FL_ERASING;
 				chip->oldstate = FL_READY;
 				printk(KERN_ERR "MTD %s(): chip not ready after erase suspend\n", __func__);
@@ -727,7 +728,7 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 	switch(chip->oldstate) {
 	case FL_ERASING:
 		chip->state = chip->oldstate;
-		map_write(map, CMD(0x30), chip->in_progress_block_addr);
+		map_write(map, sector_erase_cmd, chip->in_progress_block_addr);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
 		break;
@@ -870,7 +871,7 @@ static void __xipram xip_udelay(struct map_info *map, struct flchip *chip,
 			local_irq_disable();
 
 			/* Resume the write or erase operation */
-			map_write(map, CMD(0x30), adr);
+			map_write(map, sector_erase_cmd, adr);
 			chip->state = oldstate;
 			start = xip_currtime();
 		} else if (usec >= 1000000/HZ) {
@@ -1675,7 +1676,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	map_write(map, CMD(0x30), adr);
+	map_write(map, sector_erase_cmd, adr);
 
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
