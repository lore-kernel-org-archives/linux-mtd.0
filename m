Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OvQWq-00033Y-I8
	for linux-mtd@lists.infradead.org; Tue, 14 Sep 2010 08:06:13 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L8Q002ND968TWB0@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 14 Sep 2010 17:06:08 +0900 (KST)
Received: from roh83 ([107.108.214.183])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L8Q00KVH966XR@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 14 Sep 2010 17:06:08 +0900 (KST)
Date: Tue, 14 Sep 2010 13:36:06 +0530
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Subject: [PATCH 1/2][MTD]MLC device check in OneNAND driver
To: dedekind1@gmail.com
Message-id: <000001cb53e3$afc0f090$0f42d1b0$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-language: en-us
Content-transfer-encoding: 7BIT
Cc: v.dalal@samsung.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

 This MLC device check will be required for adding MLC support in file system.


Signed-off-by: Rohit HS <rohit.hs@samsung.com>
---
 drivers/mtd/onenand/onenand_base.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index a2bb520..59af37d 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -4028,7 +4028,8 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 
 	/* Fill in remaining MTD driver data */
 	mtd->type = MTD_NANDFLASH;
-	mtd->flags = MTD_CAP_NANDFLASH;
+	mtd->flags = ONENAND_IS_MLC(this) ? MTD_CAP_MLCNANDFLASH
+						: MTD_CAP_NANDFLASH;
 	mtd->erase = onenand_erase;
 	mtd->point = NULL;
 	mtd->unpoint = NULL;
---



Regards,
Rohit.H.S
