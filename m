Received: from dns2.vpop.net ([216.193.240.3] helo=thorin.vpop.net)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IiGzn-0000t2-1x
	for linux-mtd@lists.infradead.org; Wed, 17 Oct 2007 23:04:10 +0100
Received: from mail.vpop.net (dns1.vpop.net [216.193.240.2])
	by thorin.vpop.net (Postfix) with ESMTP id 352CF8BF0D4
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Oct 2007 14:34:21 -0700 (PDT)
From: mattjreimer@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: treat any negative return value from correct() as an
	error
Date: Wed, 17 Oct 2007 14:33:23 -0700
Message-Id: <1192656803-32151-1-git-send-email-mattjreimer@gmail.com>
Cc: Matt Reimer <mreimer@vpop.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Matt Reimer <mreimer@vpop.net>

Treat any negative return value from a NAND driver's correct() function
as a failure, rather than just -1. Some drivers (e.g. diskonchip) can
return error values such as -EIO, which ended up being treated as the
number of bits corrected, which in turn resulted in nand_do_read_ops()
returning -EUCLEAN rather than -EBADMSG.

Signed-off-by: Matt Reimer <mreimer@vpop.net>
---
 drivers/mtd/nand/nand_base.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 24ac677..6d40edf 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -789,7 +789,7 @@ static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
 		int stat;
 
 		stat = chip->ecc.correct(mtd, p, &ecc_code[i], &ecc_calc[i]);
-		if (stat == -1)
+		if (stat < 0)
 			mtd->ecc_stats.failed++;
 		else
 			mtd->ecc_stats.corrected += stat;
@@ -833,7 +833,7 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 		int stat;
 
 		stat = chip->ecc.correct(mtd, p, &ecc_code[i], &ecc_calc[i]);
-		if (stat == -1)
+		if (stat < 0)
 			mtd->ecc_stats.failed++;
 		else
 			mtd->ecc_stats.corrected += stat;
@@ -874,7 +874,7 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->read_buf(mtd, oob, eccbytes);
 		stat = chip->ecc.correct(mtd, p, oob, NULL);
 
-		if (stat == -1)
+		if (stat < 0)
 			mtd->ecc_stats.failed++;
 		else
 			mtd->ecc_stats.corrected += stat;
-- 
1.5.3.2
