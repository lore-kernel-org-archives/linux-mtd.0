Received: from mail-pa0-f48.google.com ([209.85.220.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZpiJW-0001ef-J5
 for linux-mtd@lists.infradead.org; Fri, 23 Oct 2015 19:47:47 +0000
Received: by padhk11 with SMTP id hk11so126390300pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 23 Oct 2015 12:47:25 -0700 (PDT)
From: Clay McClure <clay@daemons.net>
To: linux-mtd@lists.infradead.org
Cc: Clay McClure <clay@daemons.net>
Subject: [PATCH] mtd: brcmnand: Fix NAND_CMD_PARAM byte order
Date: Fri, 23 Oct 2015 12:47:06 -0700
Message-Id: <1445629626-27474-1-git-send-email-clay@daemons.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On systems using Broadcom Cortex-A9 SoCs (BCM585XX, BCM586XX, BCM56340),
nand_flash_detect_onfi() fails at boot with:

    Could not find valid ONFI parameter page; aborting

brcmnand_read_byte()'s NAND_CMD_PARAM handler assumes the in-memory
cache of the NAND controller's FLASH_CACHE registers is big-endian.
But the iproc_nand driver forces little-endian APB bus transfers,
so the in-memory cache ends up exactly backwards.

The solution is to swap flash_cache byte order before extracting
bytes from it. NAND_CMD_PARAM is not an oft-used command, so we
don't need to worry about the overhead of byte swaps here.

Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
Signed-off-by: Clay McClure <clay@daemons.net>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 7c1c306..932bc49 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1228,7 +1228,7 @@ static uint8_t brcmnand_read_byte(struct mtd_info *mtd)
 		if (host->last_byte > 0 && offs == 0)
 			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, addr, -1);
 
-		ret = ctrl->flash_cache[offs >> 2] >>
+		ret = __cpu_to_be32(ctrl->flash_cache[offs >> 2]) >>
 					(24 - ((offs & 0x03) << 3));
 		break;
 	case NAND_CMD_GET_FEATURES:
-- 
2.1.4
