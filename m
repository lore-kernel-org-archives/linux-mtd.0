Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMlGD-00056h-QP
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2012 19:18:53 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/7] mtd: ecc_strength is at ecc step granularity
Date: Tue, 24 Apr 2012 12:18:19 -0700
Message-Id: <1335295105-7981-2-git-send-email-mikedunn@newsguy.com>
In-Reply-To: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ecc_strength element of mtd_info will be the strength of one ecc step, not of
the entire writesize, as was previously planned.  This is the appropriate way
because, as was pointed out [1], bit errors in excess of the strength of one
step can cause a hard error if they all occur within the same ecc region.

[1] http://lists.infradead.org/pipermail/linux-mtd/2012-March/040313.html

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 include/linux/mtd/mtd.h      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index eb88d8b..c2d2e93 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3484,7 +3484,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 
 	/* propagate ecc info to mtd_info */
 	mtd->ecclayout = chip->ecc.layout;
-	mtd->ecc_strength = chip->ecc.strength * chip->ecc.steps;
+	mtd->ecc_strength = chip->ecc.strength;
 
 	/* Check, if we should skip the bad block table scan */
 	if (chip->options & NAND_SKIP_BBTSCAN)
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index cf5ea8c..cd0119d 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -164,7 +164,7 @@ struct mtd_info {
 	/* ECC layout structure pointer - read only! */
 	struct nand_ecclayout *ecclayout;
 
-	/* max number of correctible bit errors per writesize */
+	/* max number of correctible bit errors per ecc step */
 	unsigned int ecc_strength;
 
 	/* Data for variable erase regions. If numeraseregions is zero,
-- 
1.7.3.4
