Received: from sand.ocn.ne.jp ([122.28.30.136] helo=smtp.sand.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1HWJ-0008SH-Jt
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 11:41:53 +0000
From: Jon Povey <jon.povey@racelogic.co.uk>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: fix MTD_MODE_RAW writes
Date: Thu, 30 Sep 2010 20:41:34 +0900
Message-Id: <1285846894-4479-1-git-send-email-jon.povey@racelogic.co.uk>
Cc: Jon Povey <jon.povey@racelogic.co.uk>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

RAW writes were broken by 782ce79a45b3b850b108896fcf7da26754061c8f
which introduced a check of ops->ooboffs in nand_do_write_ops().

When writing in RAW mode this is called with an ops struct on the stack
of mtdchar.c:mtd_write() which does not initialise ops->ooboffs, so it
is garbage and fails this test.

This test does not make sense if ops->oobbuf is NULL, which it is in the
RAW write path, so include that in the test.

Signed-off-by: Jon Povey <jon.povey@racelogic.co.uk>
CC: Maxim Levitsky <maximlevitsky@gmail.com>
CC: David Woodhouse <David.Woodhouse@intel.com>
---
I am not sure this is the right way to fix this, as I don't really understand
what the test was trying to fix/prevent.

This is really just me showing my shotgun debugging solution that seems to
work for me, and see what people have to say about it / how to fix properly.

This was an unpleasant regression for me: I use MTD_MODE_RAW to write a
bootloader, and this got close to being a field update bricker..

 drivers/mtd/nand/nand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 044be4c..b3469a7 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2219,7 +2219,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 		memset(chip->oob_poi, 0xff, mtd->oobsize);
 
 	/* Don't allow multipage oob writes with offset */
-	if (ops->ooboffs && (ops->ooboffs + ops->ooblen > oobmaxlen))
+	if (oob && ops->ooboffs && (ops->ooboffs + ops->ooblen > oobmaxlen))
 		return -EINVAL;
 
 	while(1) {
-- 
1.6.3.3
