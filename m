Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8kwG-0006yP-3D
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 05:45:10 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 01/10] mtd: set the cell information for ONFI nand
Date: Mon, 12 Aug 2013 13:42:44 +0800
Message-ID: <1376286173-12581-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1376286173-12581-1-git-send-email-b32955@freescale.com>
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current code does not set the SLC/MLC information for onfi nand.
(This makes that the kernel treats all the onfi nand as SLC nand.)

This patch fills the chip->cellinfo when the onfi nand is a MLC(or TLC) nand
(p->bits_per_cell > 1).

The macro NAND_CI_CELLTYPE_SHIFT is added to avoid the hardcode.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    3 +++
 include/linux/mtd/nand.h     |    1 +
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ff605c8..ee1aa52 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2988,6 +2988,9 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	chip->chipsize = le32_to_cpu(p->blocks_per_lun);
 	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
 
+	/* @bits_per_cell equals 1 means this is a SLC nand. */
+	chip->cellinfo = (p->bits_per_cell - 1) << NAND_CI_CELLTYPE_SHIFT;
+
 	if (onfi_feature(chip) & ONFI_FEATURE_16_BIT_BUS)
 		*busw = NAND_BUSWIDTH_16;
 	else
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index ac8e89d..bf743ba 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -198,6 +198,7 @@ typedef enum {
 /* Cell info constants */
 #define NAND_CI_CHIPNR_MSK	0x03
 #define NAND_CI_CELLTYPE_MSK	0x0C
+#define NAND_CI_CELLTYPE_SHIFT	2
 
 /* Keep gcc happy */
 struct nand_chip;
-- 
1.7.1
