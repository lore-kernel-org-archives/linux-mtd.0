Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVOlU-0004Rg-CM
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 14:34:33 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: tests: stresstest: bail out if device has not enough
 eraseblocks
Date: Tue, 29 Nov 2011 15:34:08 +0100
Message-Id: <1322577248-20759-1-git-send-email-w.sang@pengutronix.de>
Cc: Wolfram Sang <w.sang@pengutronix.de>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

stresstest needs at least two eraseblocks. Bail out gracefully if that
condition is not met. Fixes the following 'division by zero' OOPS:

[  619.100000] mtd_stresstest: MTD device size 131072, eraseblock size 131072, page size 2048, count of eraseblocks 1, pages per eraseblock 64, OOB size 64
[  619.120000] mtd_stresstest: scanning for bad eraseblocks
[  619.120000] mtd_stresstest: scanned 1 eraseblocks, 0 are bad
[  619.130000] mtd_stresstest: doing operations
[  619.130000] mtd_stresstest: 0 operations done
[  619.140000] Division by zero in kernel.
...

caused by

        /* Read or write up 2 eraseblocks at a time - hence 'ebcnt - 1' */
        eb %= (ebcnt - 1);

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
---
 drivers/mtd/tests/mtd_stresstest.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 52ffd91..811642f 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -284,6 +284,12 @@ static int __init mtd_stresstest_init(void)
 	       (unsigned long long)mtd->size, mtd->erasesize,
 	       pgsize, ebcnt, pgcnt, mtd->oobsize);
 
+	if (ebcnt < 2) {
+		printk(PRINT_PREF "error: need at least 2 eraseblocks\n");
+		err = -ENOSPC;
+		goto out_put_mtd;
+	}
+
 	/* Read or write up 2 eraseblocks at a time */
 	bufsize = mtd->erasesize * 2;
 
@@ -322,6 +328,7 @@ out:
 	kfree(bbt);
 	vfree(writebuf);
 	vfree(readbuf);
+out_put_mtd:
 	put_mtd_device(mtd);
 	if (err)
 		printk(PRINT_PREF "error %d occurred\n", err);
-- 
1.7.7.3
