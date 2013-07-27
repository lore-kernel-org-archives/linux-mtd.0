Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V2u2W-0008FV-0v
 for linux-mtd@lists.infradead.org; Sat, 27 Jul 2013 02:15:24 +0000
Received: by mail-pd0-f174.google.com with SMTP id 3so2482760pdj.33
 for <linux-mtd@lists.infradead.org>; Fri, 26 Jul 2013 19:15:01 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next 1/7] mtd: tests: introduce mtd_test module
Date: Sat, 27 Jul 2013 11:14:10 +0900
Message-Id: <1374891256-20248-2-git-send-email-akinobu.mita@gmail.com>
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

This introduces mtd_test module which contains the following functions
used by several mtd/tests modules.

- mtdtest_erase_eraseblock()
- mtdtest_scan_for_bad_eraseblocks()
- mtdtest_erase_whole_device()

This mtd_test module also provides the following wrapper functions for
mtd_read() and mtd_write() in order to simplify the return value check
in mtd/tests modules.

- mtdtest_read()
- mtdtest_write()

These functions will be used for reducing code duplication among
mtd/tests modules later.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/tests/Makefile   |   1 +
 drivers/mtd/tests/mtd_test.c | 117 +++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/tests/mtd_test.h |  11 ++++
 3 files changed, 129 insertions(+)
 create mode 100644 drivers/mtd/tests/mtd_test.c
 create mode 100644 drivers/mtd/tests/mtd_test.h

diff --git a/drivers/mtd/tests/Makefile b/drivers/mtd/tests/Makefile
index bd0065c..3d642f4 100644
--- a/drivers/mtd/tests/Makefile
+++ b/drivers/mtd/tests/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_MTD_TESTS) += mtd_test.o
 obj-$(CONFIG_MTD_TESTS) += mtd_oobtest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_pagetest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_readtest.o
diff --git a/drivers/mtd/tests/mtd_test.c b/drivers/mtd/tests/mtd_test.c
new file mode 100644
index 0000000..1fa1d63
--- /dev/null
+++ b/drivers/mtd/tests/mtd_test.c
@@ -0,0 +1,117 @@
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/printk.h>
+
+#include "mtd_test.h"
+
+int mtdtest_erase_eraseblock(struct mtd_info *mtd, int ebnum)
+{
+	int err;
+	struct erase_info ei;
+	loff_t addr = ebnum * mtd->erasesize;
+
+	memset(&ei, 0, sizeof(struct erase_info));
+	ei.mtd  = mtd;
+	ei.addr = addr;
+	ei.len  = mtd->erasesize;
+
+	err = mtd_erase(mtd, &ei);
+	if (err) {
+		pr_info("error %d while erasing EB %d\n", err, ebnum);
+		return err;
+	}
+
+	if (ei.state == MTD_ERASE_FAILED) {
+		pr_info("some erase error occurred at EB %d\n", ebnum);
+		return -EIO;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtdtest_erase_eraseblock);
+
+static int is_block_bad(struct mtd_info *mtd, int ebnum)
+{
+	int ret;
+	loff_t addr = ebnum * mtd->erasesize;
+
+	ret = mtd_block_isbad(mtd, addr);
+	if (ret)
+		pr_info("block %d is bad\n", ebnum);
+
+	return ret;
+}
+
+int mtdtest_scan_for_bad_eraseblocks(struct mtd_info *mtd, unsigned char *bbt,
+					int ebcnt)
+{
+	int i, bad = 0;
+
+	if (!mtd_can_have_bb(mtd))
+		return 0;
+
+	pr_info("scanning for bad eraseblocks\n");
+	for (i = 0; i < ebcnt; ++i) {
+		bbt[i] = is_block_bad(mtd, i) ? 1 : 0;
+		if (bbt[i])
+			bad += 1;
+		cond_resched();
+	}
+	pr_info("scanned %d eraseblocks, %d are bad\n", i, bad);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtdtest_scan_for_bad_eraseblocks);
+
+int mtdtest_erase_whole_device(struct mtd_info *mtd, unsigned char *bbt,
+				int ebcnt)
+{
+	int err;
+	unsigned int i;
+
+	for (i = 0; i < ebcnt; ++i) {
+		if (bbt[i])
+			continue;
+		err = mtdtest_erase_eraseblock(mtd, i);
+		if (err)
+			return err;
+		cond_resched();
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtdtest_erase_whole_device);
+
+int mtdtest_read(struct mtd_info *mtd, loff_t addr, size_t size, void *buf)
+{
+	size_t read;
+	int err;
+
+	err = mtd_read(mtd, addr, size, &read, buf);
+	/* Ignore corrected ECC errors */
+	if (mtd_is_bitflip(err))
+		err = 0;
+	if (!err && read != size)
+		err = -EINVAL;
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(mtdtest_read);
+
+int mtdtest_write(struct mtd_info *mtd, loff_t addr, size_t size,
+		const void *buf)
+{
+	size_t written;
+	int err;
+
+	err = mtd_write(mtd, addr, size, &written, buf);
+	if (!err && written != size)
+		err = -EIO;
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(mtdtest_write);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/mtd/tests/mtd_test.h b/drivers/mtd/tests/mtd_test.h
new file mode 100644
index 0000000..e61fb67
--- /dev/null
+++ b/drivers/mtd/tests/mtd_test.h
@@ -0,0 +1,11 @@
+#include <linux/mtd/mtd.h>
+
+int mtdtest_erase_eraseblock(struct mtd_info *mtd, int ebnum);
+int mtdtest_scan_for_bad_eraseblocks(struct mtd_info *mtd, unsigned char *bbt,
+					int ebcnt);
+int mtdtest_erase_whole_device(struct mtd_info *mtd, unsigned char *bbt,
+				int ebcnt);
+
+int mtdtest_read(struct mtd_info *mtd, loff_t addr, size_t size, void *buf);
+int mtdtest_write(struct mtd_info *mtd, loff_t addr, size_t size,
+		const void *buf);
-- 
1.8.3.1
