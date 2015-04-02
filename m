Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ydfsv-0001GW-At
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 14:14:22 +0000
From: Richard Weinberger <richard@nod.at>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: Add simple read disturb test
Date: Thu,  2 Apr 2015 16:13:46 +0200
Message-Id: <1427984026-31100-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This simple MTD tests allows the user to see when read disturb happens.
By reading blocks over and over it reports flipped bits.
Currently it reports only flipped bits of the worst page of a block.
If within block X page P1 has 3 bit flips and P6 4, it will report 4.
By default every 50th block is read.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/tests/Makefile          |   2 +
 drivers/mtd/tests/readdisturbtest.c | 246 ++++++++++++++++++++++++++++++++++++
 2 files changed, 248 insertions(+)
 create mode 100644 drivers/mtd/tests/readdisturbtest.c

diff --git a/drivers/mtd/tests/Makefile b/drivers/mtd/tests/Makefile
index 937a829..d9cb76a 100644
--- a/drivers/mtd/tests/Makefile
+++ b/drivers/mtd/tests/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_MTD_TESTS) += mtd_subpagetest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_torturetest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_nandecctest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_nandbiterrs.o
+obj-$(CONFIG_MTD_TESTS) += mtd_readdisturbtest.o
 
 mtd_oobtest-objs := oobtest.o mtd_test.o
 mtd_pagetest-objs := pagetest.o mtd_test.o
@@ -16,3 +17,4 @@ mtd_stresstest-objs := stresstest.o mtd_test.o
 mtd_subpagetest-objs := subpagetest.o mtd_test.o
 mtd_torturetest-objs := torturetest.o mtd_test.o
 mtd_nandbiterrs-objs := nandbiterrs.o mtd_test.o
+mtd_readdisturbtest-objs := readdisturbtest.o mtd_test.o
diff --git a/drivers/mtd/tests/readdisturbtest.c b/drivers/mtd/tests/readdisturbtest.c
new file mode 100644
index 0000000..c22caf6
--- /dev/null
+++ b/drivers/mtd/tests/readdisturbtest.c
@@ -0,0 +1,246 @@
+/*
+ * Copyright (C) 2006-2008 Nokia Corporation
+ * Copyright (C) 2015 sigma star gmbh
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
+ * more details.
+ *
+ * Check MTD device for read disturb.
+ *
+ * Author: Richard Weinberger <richard@nod.at>
+ *
+ * Based on mtd_readtest.c and mtd_pagetest.c
+ * Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/mtd/mtd.h>
+#include <linux/random.h>
+#include <linux/slab.h>
+
+#include "mtd_test.h"
+
+static int dev = -EINVAL;
+module_param(dev, int, S_IRUGO);
+MODULE_PARM_DESC(dev, "MTD device number to use");
+
+static int skip_blocks = 50;
+module_param(skip_blocks, int, S_IRUGO);
+MODULE_PARM_DESC(skip_blocks, "Test every n-th block, default is 50");
+
+static struct mtd_info *mtd;
+static unsigned char *iobuf;
+static unsigned char *iobuf_orig;
+static unsigned char *bbt;
+static unsigned long *bit_flips;
+
+static int pgsize;
+static int ebcnt;
+static int pgcnt;
+
+static struct rnd_state rnd_state;
+
+static int check_buf(unsigned char *buf, unsigned char *buf2, size_t len)
+{
+	int i;
+	int flips = 0;
+
+	for (i = 0; i < len; i++)
+		if (buf[i] != buf2[i])
+			flips += hweight8(buf[i] ^ buf2[i]);
+
+	return flips;
+}
+
+static int read_eraseblock_by_page(int ebnum, unsigned long iteration)
+{
+	size_t read;
+	int i, ret;
+	loff_t addr = ebnum * mtd->erasesize;
+	void *buf = iobuf;
+	struct mtd_oob_ops ops;
+	int flips;
+
+	for (i = 0; i < pgcnt; i++) {
+		ops.mode = MTD_OPS_RAW;
+		ops.len = pgsize;
+		ops.oobbuf = NULL;
+		ops.datbuf = buf;
+
+		ret = mtd_read_oob(mtd, addr, &ops);
+		read = ops.retlen;
+		if (ret || read != pgsize) {
+			pr_info("error: read failed at %#llx, block:%i, ret:%i, read:%zu\n",
+			       (long long)addr, ebnum, ret, read);
+
+			return ret ?: -EIO;
+		}
+
+		flips = check_buf(buf, iobuf_orig + (pgsize * i), pgsize);
+
+		/*
+		 * We count bit flips only per block. Worst page dominates.
+		 */
+		if (flips > bit_flips[ebnum]) {
+			bit_flips[ebnum] = flips;
+			pr_info("Detected %i flipped bits at %#llx, block %i after %lu reads\n",
+				flips, addr, ebnum, iteration);
+		}
+
+		addr += pgsize;
+		buf += pgsize;
+	}
+
+	return 0;
+}
+
+static int __init mtd_readdisturbtest_init(void)
+{
+	uint64_t tmp;
+	unsigned long iteration = 0;
+	int err, i, ret = 0;
+
+	pr_info("\n");
+	pr_info("=================================================\n");
+
+	if (dev < 0) {
+		pr_info("Please specify a valid mtd-device via module paramter\n");
+		return -EINVAL;
+	}
+
+	pr_info("MTD device: %d\n", dev);
+
+	mtd = get_mtd_device(NULL, dev);
+	if (IS_ERR(mtd)) {
+		err = PTR_ERR(mtd);
+		pr_info("error: Cannot get MTD device\n");
+		return err;
+	}
+
+	if (mtd->writesize == 1) {
+		pr_info("not NAND flash, assume page size is 512 "
+		       "bytes.\n");
+		pgsize = 512;
+	} else
+		pgsize = mtd->writesize;
+
+	tmp = mtd->size;
+	do_div(tmp, mtd->erasesize);
+	ebcnt = tmp;
+	pgcnt = mtd->erasesize / pgsize;
+
+	pr_info("MTD device size %llu, eraseblock size %u, "
+	       "page size %u, count of eraseblocks %u, pages per "
+	       "eraseblock %u, OOB size %u\n",
+	       (unsigned long long)mtd->size, mtd->erasesize,
+	       pgsize, ebcnt, pgcnt, mtd->oobsize);
+
+	err = -ENOMEM;
+	iobuf = kmalloc(mtd->erasesize, GFP_KERNEL);
+	if (!iobuf)
+		goto out;
+
+	iobuf_orig = kmalloc(mtd->erasesize, GFP_KERNEL);
+	if (!iobuf_orig)
+		goto out;
+
+	prandom_bytes_state(&rnd_state, iobuf_orig, mtd->erasesize);
+
+	bit_flips = kcalloc(ebcnt, sizeof(unsigned long), GFP_KERNEL);
+	if (!bit_flips)
+		goto out;
+
+	bbt = kzalloc(ebcnt, GFP_KERNEL);
+	if (!bbt)
+		goto out;
+
+	err = mtdtest_scan_for_bad_eraseblocks(mtd, bbt, 0, ebcnt);
+	if (err)
+		goto out;
+
+	pr_info("erasing and programming flash\n");
+	for (i = 0; i < ebcnt; ++i) {
+		if (skip_blocks && i % skip_blocks != 0)
+			continue;
+
+		if (bbt[i])
+			continue;
+
+		ret = mtdtest_erase_eraseblock(mtd, i);
+		if (ret) {
+			err = ret;
+			goto out;
+		}
+
+		ret = mtdtest_write(mtd, i * mtd->erasesize, mtd->erasesize,
+				    iobuf_orig);
+		if (ret) {
+			err = ret;
+			goto out;
+		}
+
+		ret = mtdtest_relax();
+		if (ret)
+			goto out;
+	}
+
+	pr_info("starting read disturb test on every %ith block\n",
+		skip_blocks);
+	while (!ret) {
+		for (i = 0; i < ebcnt; ++i) {
+			if (skip_blocks && i % skip_blocks != 0)
+				continue;
+
+			if (bbt[i])
+				continue;
+
+			ret = read_eraseblock_by_page(i, iteration);
+
+			ret = mtdtest_relax();
+			if (ret)
+				goto out;
+		}
+
+		iteration++;
+		if (iteration % 1000 == 0)
+			pr_info("iteration %lu started\n", iteration);
+	}
+
+	if (err)
+		pr_info("finished with errors\n");
+	else
+		pr_info("finished\n");
+
+out:
+
+	kfree(bit_flips);
+	kfree(iobuf);
+	kfree(iobuf_orig);
+	kfree(bbt);
+	put_mtd_device(mtd);
+	if (err)
+		pr_info("error %i occurred\n", err);
+	pr_info("=================================================\n");
+	return err;
+}
+module_init(mtd_readdisturbtest_init);
+
+static void __exit mtd_readdisturbtest_exit(void)
+{
+}
+module_exit(mtd_readdisturbtest_exit);
+
+MODULE_DESCRIPTION("Read disturb test module");
+MODULE_AUTHOR("Richard Weinberger");
+MODULE_LICENSE("GPL");
-- 
1.8.4.5
