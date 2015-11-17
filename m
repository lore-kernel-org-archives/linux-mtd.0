Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyUaM-0004c6-26
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 00:57:26 +0000
Received: by padhx2 with SMTP id hx2so192085963pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 16:57:05 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Clay McClure <clay@daemons.net>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH] mtd: brcmnand: clean up flash cache for parameter pages
Date: Mon, 16 Nov 2015 16:56:13 -0800
Message-Id: <1447721773-18417-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The read_byte() handling for accessing the flash cache has some awkward
swapping being done in the read_byte() function. Let's just make this a
byte array, and do the swapping with the word-level macros during the
initial buffer copy.

This is just a refactoring patch, with no (intended) functional change.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Clay McClure <clay@daemons.net>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: <bcm-kernel-feedback-list@broadcom.com>
Tested-by: Clay McClure <clay@daemons.net>
---
I wanted to get this out there as a proper patch, since there was some
confusion on the previous thread in which this appeared.

This does *not* fix the bug reported by Cyrille in the thread "mtd: brcmnand:
Fix NAND_CMD_PARAM byte order". There is a candidate patch which fixes this:

  http://patchwork.ozlabs.org/patch/535330/

But I'm awaiting a better explanation from Broadcom folks before I
respin/accept anything like that.

 drivers/mtd/nand/brcmnand/brcmnand.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 2a437c7ed175..0f43bc95ece4 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -134,7 +134,7 @@ struct brcmnand_controller {
 	dma_addr_t		dma_pa;
 
 	/* in-memory cache of the FLASH_CACHE, used only for some commands */
-	u32			flash_cache[FC_WORDS];
+	u8			flash_cache[FC_BYTES];
 
 	/* Controller revision details */
 	const u16		*reg_offsets;
@@ -1188,6 +1188,8 @@ static void brcmnand_cmdfunc(struct mtd_info *mtd, unsigned command,
 
 	if (native_cmd == CMD_PARAMETER_READ ||
 			native_cmd == CMD_PARAMETER_CHANGE_COL) {
+		/* Copy flash cache word-wise */
+		u32 *flash_cache = (u32 *)ctrl->flash_cache;
 		int i;
 
 		brcmnand_soc_data_bus_prepare(ctrl->soc);
@@ -1197,7 +1199,11 @@ static void brcmnand_cmdfunc(struct mtd_info *mtd, unsigned command,
 		 * SECTOR_SIZE_1K may invalidate it
 		 */
 		for (i = 0; i < FC_WORDS; i++)
-			ctrl->flash_cache[i] = brcmnand_read_fc(ctrl, i);
+			/*
+			 * Flash cache is big endian for parameter pages, at
+			 * least on STB SoCs
+			 */
+			flash_cache[i] = be32_to_cpu(brcmnand_read_fc(ctrl, i));
 
 		brcmnand_soc_data_bus_unprepare(ctrl->soc);
 
@@ -1250,8 +1256,7 @@ static uint8_t brcmnand_read_byte(struct mtd_info *mtd)
 		if (host->last_byte > 0 && offs == 0)
 			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, addr, -1);
 
-		ret = ctrl->flash_cache[offs >> 2] >>
-					(24 - ((offs & 0x03) << 3));
+		ret = ctrl->flash_cache[offs];
 		break;
 	case NAND_CMD_GET_FEATURES:
 		if (host->last_byte >= ONFI_SUBFEATURE_PARAM_LEN) {
-- 
2.6.0.rc2.230.g3dd15c0
