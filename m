Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz6dS-0008UZ-8v
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 11:40:15 +0000
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L99002541R0KL00@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 20:40:12 +0900 (KST)
Received: from roh83 ([107.108.214.183])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L9900CDA1QY9X@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 20:40:12 +0900 (KST)
Date: Fri, 24 Sep 2010 17:10:10 +0530
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Subject: [PATCH RESEND][MTD]MLC device check in OneNAND driver
To: dedekind1@gmail.com, linux-mtd@lists.infradead.org
Message-id: <001701cb5bdd$3fd69a80$bf83cf80$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-language: en-us
Content-transfer-encoding: 7BIT
Cc: v.dalal@samsung.com, gupta.raghav@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Rohit HS <rohit.hs@samsung.com>
Signed-off-by: Raghav Gupta <gupta.raghav@samsung.com>
---
 drivers/mtd/onenand/onenand_base.c |    2 +-
 include/mtd/mtd-abi.h              |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

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
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index 4debb45..8d8161c 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -52,6 +52,7 @@ struct mtd_oob_buf64 {
 #define MTD_NANDFLASH		4
 #define MTD_DATAFLASH		6
 #define MTD_UBIVOLUME		7
+#define MTD_MLCNANDFLASH	8
 
 #define MTD_WRITEABLE		0x400	/* Device is writeable */
 #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
-- 
1.6.6.1
