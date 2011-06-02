Received: from mailout4.samsung.com ([203.254.224.34])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QS1i1-0000e1-PJ
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 06:48:46 +0000
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built
	Sep 7
	2010)) with ESMTP id <0LM50039ZHK0KOH0@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 15:48:40 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0LM500G68HL4EF@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 15:48:40 +0900 (KST)
Date: Thu, 02 Jun 2011 15:48:32 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH] mtd: OneNAND: Fix wrong subpage_sft at 4KiB pagesize
To: linux-mtd@lists.infradead.org
Message-id: <20110602064832.GA7319@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
Cc: m.szyprowski@samsung.com, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kyungmin Park <kyungmin.park@samsung.com>

There's no case to use the subpage for 4KiB pagesize.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index ac9e959..337be7c 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -4047,13 +4047,11 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	 */
 	switch (mtd->oobsize) {
 	case 128:
-		if (FLEXONENAND(this)) {
+		if (FLEXONENAND(this))
 			this->ecclayout = &flexonenand_oob_128;
-			mtd->subpage_sft = 0;
-		} else {
+		else
 			this->ecclayout = &onenand_oob_128;
-			mtd->subpage_sft = 2;
-		}
+		mtd->subpage_sft = 0;
 		break;
 	case 64:
 		this->ecclayout = &onenand_oob_64;
