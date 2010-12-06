Received: from mailout4.samsung.com ([203.254.224.34])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PPOa7-0006jK-Cc
	for linux-mtd@lists.infradead.org; Mon, 06 Dec 2010 00:05:28 +0000
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built
	Sep 7
	2010)) with ESMTP id <0LCZ001NXC8Y6W60@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 06 Dec 2010 09:05:22 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0LCZ00KOEC8Y92@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 06 Dec 2010 09:05:22 +0900 (KST)
Date: Mon, 06 Dec 2010 09:05:18 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH] mtd: OneNAND: Fix multi block erase support at 4KiB	pagesize
To: linux-mtd@lists.infradead.org
Message-id: <20101206000518.GA18352@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
Cc: dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kyungmin Park <kyungmin.park@samsung.com>

Original 4KiB pagesize chip (SLC) doesn't support Multi block erase at Spec.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index c38bf9c..88f23e3 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2492,7 +2492,8 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 	/* Grab the lock and see if the device is available */
 	onenand_get_device(mtd, FL_ERASING);
 
-	if (region || instr->len < MB_ERASE_MIN_BLK_COUNT * block_size) {
+	if (ONENAND_IS_4KB_PAGE(this) || region ||
+	    instr->len < MB_ERASE_MIN_BLK_COUNT * block_size) {
 		/* region is set for Flex-OneNAND (no mb erase) */
 		ret = onenand_block_by_block_erase(mtd, instr,
 						   region, block_size);
