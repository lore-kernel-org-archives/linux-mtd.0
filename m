Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qw1AL-00082K-CZ
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 00:17:58 +0000
Received: by yxk8 with SMTP id 8so643642yxk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2011 17:17:55 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/5] mtd: do not assume oobsize is power of 2
Date: Tue, 23 Aug 2011 17:17:32 -0700
Message-Id: <1314145056-5233-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Previous generations of MTDs all used OOB sizes that were powers of 2,
(e.g., 64, 128). However, newer generations of flash, especially NAND,
use irregular OOB sizes that are not powers of 2 (e.g., 218, 224, 448).
This means we cannot use masks like "mtd->oobsize - 1" to assume that we
will get a proper bitmask for OOB operations.

These masks are really only intended to hide the "page" portion of the
offset, leaving any OOB offset intact, so a masking with the writesize
(which *is* always a power of 2) is valid and makes more sense.

This has been tested for read/write of NAND devices (nanddump/nandwrite)
using nandsim and actual NAND flash.

Cc: stable@kernel.org [2.6.30+]
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Changes since v1 as "RFC": instead of dropping the mask, we use
    writesize instead.

Stable: this error actually appeared way back in 2.6.17, but it was
    cut-and-pasted in the 2.6.30-rcX cycle, so it won't apply cleanly.
    Anyway, I don't think we don't maintain -stable that far back.

 drivers/mtd/mtdchar.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index a75d555..b206254 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -410,7 +410,7 @@ static int mtd_do_writeoob(struct file *file, struct mtd_info *mtd,
 		return ret;
 
 	ops.ooblen = length;
-	ops.ooboffs = start & (mtd->oobsize - 1);
+	ops.ooboffs = start & (mtd->writesize - 1);
 	ops.datbuf = NULL;
 	ops.mode = MTD_OOB_PLACE;
 
@@ -421,7 +421,7 @@ static int mtd_do_writeoob(struct file *file, struct mtd_info *mtd,
 	if (IS_ERR(ops.oobbuf))
 		return PTR_ERR(ops.oobbuf);
 
-	start &= ~((uint64_t)mtd->oobsize - 1);
+	start &= ~((uint64_t)mtd->writesize - 1);
 	ret = mtd->write_oob(mtd, start, &ops);
 
 	if (ops.oobretlen > 0xFFFFFFFFU)
@@ -452,7 +452,7 @@ static int mtd_do_readoob(struct mtd_info *mtd, uint64_t start,
 		return ret;
 
 	ops.ooblen = length;
-	ops.ooboffs = start & (mtd->oobsize - 1);
+	ops.ooboffs = start & (mtd->writesize - 1);
 	ops.datbuf = NULL;
 	ops.mode = MTD_OOB_PLACE;
 
@@ -463,7 +463,7 @@ static int mtd_do_readoob(struct mtd_info *mtd, uint64_t start,
 	if (!ops.oobbuf)
 		return -ENOMEM;
 
-	start &= ~((uint64_t)mtd->oobsize - 1);
+	start &= ~((uint64_t)mtd->writesize - 1);
 	ret = mtd->read_oob(mtd, start, &ops);
 
 	if (put_user(ops.oobretlen, retp))
-- 
1.7.5.4
