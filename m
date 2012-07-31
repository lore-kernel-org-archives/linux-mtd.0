Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sw0oJ-0003ld-2H
 for linux-mtd@lists.infradead.org; Tue, 31 Jul 2012 00:59:43 +0000
Received: by pbbrq13 with SMTP id rq13so11599453pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 30 Jul 2012 17:59:24 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH RESEND] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set from
 driver
Date: Mon, 30 Jul 2012 18:02:17 -0700
Message-Id: <1343696537-2564-1-git-send-email-computersforpeace@gmail.com>
Cc: Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND_CHIPOPTIONS_MSK has limited utility and is causing real bugs. It
silently masks off at least one flag that might be set by the driver
(NAND_NO_SUBPAGE_WRITE). This breaks the GPMI NAND driver and possibly others.

Really, as long as driver writers exercise a small amount of care with NAND_*
options, this mask is not necessary at all. Thus, kill it.

>From Huang Shijie:

"I tested this patch on imx6q-arm2 board with Micron MT29F32G08QAA.
it works fine, thanks."

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Tested-by: Huang Shijie <shijie8@gmail.com>
Cc: Marek Vasut <marex@denx.de>
---
Hello Artem/David,

GPMI NAND has needed this patch for some time, and I think it was agreed
on by a few. I'm resending to get acknowledgment from a maintainer.

 drivers/mtd/nand/nand_base.c | 7 ++-----
 include/linux/mtd/nand.h     | 3 ---
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ead301a..996cc48 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2909,8 +2909,6 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	if (le16_to_cpu(p->features) & 1)
 		*busw = NAND_BUSWIDTH_16;
 
-	chip->options &= ~NAND_CHIPOPTIONS_MSK;
-
 	pr_info("ONFI flash detected\n");
 	return 1;
 }
@@ -3074,9 +3072,8 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 			mtd->erasesize <<= ((id_data[3] & 0x03) << 1);
 		}
 	}
-	/* Get chip options, preserve non chip based options */
-	chip->options &= ~NAND_CHIPOPTIONS_MSK;
-	chip->options |= type->options & NAND_CHIPOPTIONS_MSK;
+	/* Get chip options */
+	chip->options |= type->options;
 
 	/*
 	 * Check if chip is not a Samsung device. Do not clear the
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 6dce5a7..eeb7015 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -206,9 +206,6 @@ typedef enum {
 #define NAND_SUBPAGE_READ(chip) ((chip->ecc.mode == NAND_ECC_SOFT) \
 					&& (chip->page_shift > 9))
 
-/* Mask to zero out the chip options, which come from the id table */
-#define NAND_CHIPOPTIONS_MSK	0x0000ffff
-
 /* Non chip related options */
 /* This option skips the bbt scan during initialization. */
 #define NAND_SKIP_BBTSCAN	0x00010000
-- 
1.7.11.3
