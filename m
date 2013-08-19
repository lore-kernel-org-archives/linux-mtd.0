Received: from mail-db9lp0251.outbound.messaging.microsoft.com
 ([213.199.154.251] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBFJT-0004fl-HF
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 02:35:37 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 6/9] mtd: fix the wrong mtd->type for nand chip
Date: Mon, 19 Aug 2013 10:31:15 +0800
Message-ID: <1376879478-22128-7-git-send-email-b32955@freescale.com>
In-Reply-To: <1376879478-22128-1-git-send-email-b32955@freescale.com>
References: <1376879478-22128-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, akinobu.mita@gmail.com, matthieu.castet@parrot.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Current code sets the mtd->type with MTD_NANDFLASH for both
SLC and MLC. So the jffs2 may supports the MLC nand, but in actually,
the jffs2 should not support the MLC.

This patch uses the nand_is_slc() to check the nand cell type,
and set the mtd->type with the right nand type.

After this patch, the jffs2 only can support the SLC nand.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8b487d5..f2bb925 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3776,7 +3776,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		chip->options |= NAND_SUBPAGE_READ;
 
 	/* Fill in remaining MTD driver data */
-	mtd->type = MTD_NANDFLASH;
+	mtd->type = nand_is_slc(chip) ? MTD_NANDFLASH : MTD_MLCNANDFLASH;
 	mtd->flags = (chip->options & NAND_ROM) ? MTD_CAP_ROM :
 						MTD_CAP_NANDFLASH;
 	mtd->_erase = nand_erase;
-- 
1.7.1
