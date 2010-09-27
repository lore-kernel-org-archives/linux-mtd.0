Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0B0G-0006VQ-Dc
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 10:32:13 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L9E00LDKILNVK50@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 19:32:11 +0900 (KST)
Received: from roh83 ([107.108.214.183])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L9E00145ILL6E@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 19:32:11 +0900 (KST)
Date: Mon, 27 Sep 2010 16:02:10 +0530
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Subject: [PATCH v3 2/2] mtd: MLC device check in OneNAND driver
To: dedekind1@gmail.com
Message-id: <002801cb5e2f$3f170c20$bd452460$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-language: en-us
Content-transfer-encoding: 7BIT
Cc: v.dalal@samsung.com, gupta.raghav@samsung.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The MLC NAND Flash differs from the SLC NAND flash in functioning
and the cell structure. Therefore we are considering it as a
different Flash type.

Signed-off-by: Rohit H.S <rohit.hs@samsung.com>
Signed-off-by: Raghav Gupta <gupta.raghav@samsung.com>
---
 drivers/mtd/onenand/onenand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index a2bb520..33e0dbb 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -4027,7 +4027,7 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	mtd->ecclayout = this->ecclayout;
 
 	/* Fill in remaining MTD driver data */
-	mtd->type = MTD_NANDFLASH;
+	mtd->type = ONENAND_IS_MLC(this) ? MTD_MLCNANDFLASH : MTD_NANDFLASH;
 	mtd->flags = MTD_CAP_NANDFLASH;
 	mtd->erase = onenand_erase;
 	mtd->point = NULL;
-- 
1.6.6.1
