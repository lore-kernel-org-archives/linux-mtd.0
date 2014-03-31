Received: from c-67-176-60-102.hsd1.co.comcast.net ([67.176.60.102]
 helo=pearl.egauge.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUle8-0002J8-Ei
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 23:29:41 +0000
From: David Mosberger <davidm@egauge.net>
To: pekon@ti.com
Subject: [PATCH v4 3/5] mtd: nand: Enable subpage-reads on flashes with on-die
 ECC enabled.
Date: Mon, 31 Mar 2014 17:28:55 -0600
Message-Id: <1396308537-16013-4-git-send-email-davidm@egauge.net>
In-Reply-To: <1396308537-16013-1-git-send-email-davidm@egauge.net>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
Cc: David Mosberger <davidm@egauge.net>, gsi@denx.de,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As far as we know, all flash chips with the Micron on-die ECC hardware
have subpage capability, so enable it for that case.

Signed-off-by: David Mosberger <davidm@egauge.net>
---
 drivers/mtd/nand/nand_base.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 7047e9f5..435ef44 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4185,8 +4185,13 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/* Invalidate the pagebuffer reference */
 	chip->pagebuf = -1;
 
-	/* Large page NAND with SOFT_ECC should support subpage reads */
-	if ((ecc->mode == NAND_ECC_SOFT) && (chip->page_shift > 9))
+	/*
+	 * Large page NAND with SOFT_ECC or on-die ECC should support
+	 * subpage reads.
+	 */
+	if (((ecc->mode == NAND_ECC_SOFT)
+	     || (chip->ecc.mode == NAND_ECC_HW_ON_DIE))
+	    && (chip->page_shift > 9))
 		chip->options |= NAND_SUBPAGE_READ;
 
 	/* Fill in remaining MTD driver data */
-- 
1.7.9.5
