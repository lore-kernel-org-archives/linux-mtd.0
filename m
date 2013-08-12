Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8kwK-0006yV-Fs
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 05:45:14 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 06/10] mtd: fix the wrong mtd->type for nand chip
Date: Mon, 12 Aug 2013 13:42:49 +0800
Message-ID: <1376286173-12581-7-git-send-email-b32955@freescale.com>
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
index 9bd7f04..4751814 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3767,7 +3767,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		chip->options |= NAND_SUBPAGE_READ;
 
 	/* Fill in remaining MTD driver data */
-	mtd->type = MTD_NANDFLASH;
+	mtd->type = nand_is_slc(chip) ? MTD_NANDFLASH : MTD_MLCNANDFLASH;
 	mtd->flags = (chip->options & NAND_ROM) ? MTD_CAP_ROM :
 						MTD_CAP_NANDFLASH;
 	mtd->_erase = nand_erase;
-- 
1.7.1
