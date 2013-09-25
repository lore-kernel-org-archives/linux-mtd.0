Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOjEz-0005nD-3J
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 07:10:30 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v4 12/12] mtd: nand: fix the wrong mtd->type for nand chip
Date: Wed, 25 Sep 2013 14:58:21 +0800
Message-ID: <1380092301-21924-13-git-send-email-b32955@freescale.com>
In-Reply-To: <1380092301-21924-1-git-send-email-b32955@freescale.com>
References: <1380092301-21924-1-git-send-email-b32955@freescale.com>
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

After this patch, the jffs2 only supports the SLC nand.

The side-effect of this patch:
  Before this patch, the ioctl(MEMGETINFO) can only return with the
  MTD_NANDFLASH; but after this patch, the ioctl(MEMGETINFO) will
  return with the MTD_NANDFLASH for SLC, and MTD_MLCNANDFLASH for MLC.

  So the user applictions(such as mtd-utils) should also changes a little
  for this.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b94309b..2e5b50f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3785,7 +3785,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		chip->options |= NAND_SUBPAGE_READ;
 
 	/* Fill in remaining MTD driver data */
-	mtd->type = MTD_NANDFLASH;
+	mtd->type = nand_is_slc(chip) ? MTD_NANDFLASH : MTD_MLCNANDFLASH;
 	mtd->flags = (chip->options & NAND_ROM) ? MTD_CAP_ROM :
 						MTD_CAP_NANDFLASH;
 	mtd->_erase = nand_erase;
-- 
1.7.1
