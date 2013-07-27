Received: from mail-pb0-x230.google.com ([2607:f8b0:400e:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V2u2a-0008Fe-Op
 for linux-mtd@lists.infradead.org; Sat, 27 Jul 2013 02:15:36 +0000
Received: by mail-pb0-f48.google.com with SMTP id md4so2638794pbc.21
 for <linux-mtd@lists.infradead.org>; Fri, 26 Jul 2013 19:15:07 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next 4/7] mtd: mtd_readtest: use mtd_test module
Date: Sat, 27 Jul 2013 11:14:13 +0900
Message-Id: <1374891256-20248-5-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1374891256-20248-1-git-send-email-akinobu.mita@gmail.com>
References: <1374891256-20248-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Akinobu Mita <akinobu.mita@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use mtdtest_read() and mtdtest_scan_for_bad_eraseblocks() in mtd_test
module.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/tests/mtd_readtest.c | 51 +++++++---------------------------------
 1 file changed, 9 insertions(+), 42 deletions(-)

diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index 2cdd0c4..bb30773 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -29,6 +29,8 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 
+#include "mtd_test.h"
+
 static int dev = -EINVAL;
 module_param(dev, int, S_IRUGO);
 MODULE_PARM_DESC(dev, "MTD device number to use");
@@ -44,24 +46,19 @@ static int pgcnt;
 
 static int read_eraseblock_by_page(int ebnum)
 {
-	size_t read;
 	int i, ret, err = 0;
 	loff_t addr = ebnum * mtd->erasesize;
 	void *buf = iobuf;
 	void *oobbuf = iobuf1;
 
 	for (i = 0; i < pgcnt; i++) {
-		memset(buf, 0 , pgsize);
-		ret = mtd_read(mtd, addr, pgsize, &read, buf);
-		if (ret == -EUCLEAN)
-			ret = 0;
-		if (ret || read != pgsize) {
+		memset(buf, 0 , pgcnt);
+		ret = mtdtest_read(mtd, addr, pgsize, buf);
+		if (ret) {
 			pr_err("error: read failed at %#llx\n",
 			       (long long)addr);
 			if (!err)
 				err = ret;
-			if (!err)
-				err = -EINVAL;
 		}
 		if (mtd->oobsize) {
 			struct mtd_oob_ops ops;
@@ -127,39 +124,6 @@ static void dump_eraseblock(int ebnum)
 		}
 }
 
-static int is_block_bad(int ebnum)
-{
-	loff_t addr = ebnum * mtd->erasesize;
-	int ret;
-
-	ret = mtd_block_isbad(mtd, addr);
-	if (ret)
-		pr_info("block %d is bad\n", ebnum);
-	return ret;
-}
-
-static int scan_for_bad_eraseblocks(void)
-{
-	int i, bad = 0;
-
-	bbt = kzalloc(ebcnt, GFP_KERNEL);
-	if (!bbt)
-		return -ENOMEM;
-
-	if (!mtd_can_have_bb(mtd))
-		return 0;
-
-	pr_info("scanning for bad eraseblocks\n");
-	for (i = 0; i < ebcnt; ++i) {
-		bbt[i] = is_block_bad(i) ? 1 : 0;
-		if (bbt[i])
-			bad += 1;
-		cond_resched();
-	}
-	pr_info("scanned %d eraseblocks, %d are bad\n", i, bad);
-	return 0;
-}
-
 static int __init mtd_readtest_init(void)
 {
 	uint64_t tmp;
@@ -208,7 +172,10 @@ static int __init mtd_readtest_init(void)
 	if (!iobuf1)
 		goto out;
 
-	err = scan_for_bad_eraseblocks();
+	bbt = kzalloc(ebcnt, GFP_KERNEL);
+	if (!bbt)
+		goto out;
+	err = mtdtest_scan_for_bad_eraseblocks(mtd, bbt, ebcnt);
 	if (err)
 		goto out;
 
-- 
1.8.3.1
