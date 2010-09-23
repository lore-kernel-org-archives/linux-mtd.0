Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OykPc-0004Wt-Sa
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 11:56:30 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L9700BO17U2VE40@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 20:56:26 +0900 (KST)
Received: from roh83 ([107.108.214.183])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L9700BJD7U0MR@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 20:56:26 +0900 (KST)
Date: Thu, 23 Sep 2010 17:26:24 +0530
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Subject: [PATCH 1/2][MTD]MLC device check in OneNAND driver
To: dedekind1@gmail.com
Message-id: <000101cb5b16$59d2dab0$0d789010$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
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

Hi Artem,

Adding driver check for MLC flash type.


Signed-off-by: Rohit HS <rohit.hs@samsung.com>
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


Regards,
Rohit.H.S
