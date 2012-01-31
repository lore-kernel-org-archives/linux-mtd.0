Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsCY6-0003c8-5a
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 12:10:59 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: gpmi: use correct member for checking
 NAND_BBT_USE_FLASH
Date: Tue, 31 Jan 2012 13:10:43 +0100
Message-Id: <1328011843-7402-1-git-send-email-w.sang@pengutronix.de>
Cc: Huang Shijie <b32955@freescale.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This has been moved from .options to .bbt_options meanwhile. So, it
currently checks for something totally different (NAND_OWN_BUFFERS) and
decides according to that.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: Huang Shijie <b32955@freescale.com>
---

Artem: NAND_OWN_BUFFERS should not get set, so no danger. But I'd think we
should add the stable tag nonetheless if Huang is fine with this change.

 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 493ec2f..f39f83e 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1124,7 +1124,7 @@ static int gpmi_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		chip->bbt[block >> 2] |= 0x01 << ((block & 0x03) << 1);
 
 	/* Do we have a flash based bad block table ? */
-	if (chip->options & NAND_BBT_USE_FLASH)
+	if (chip->bbt_options & NAND_BBT_USE_FLASH)
 		ret = nand_update_bbt(mtd, ofs);
 	else {
 		chipnr = (int)(ofs >> chip->chip_shift);
-- 
1.7.8.3
