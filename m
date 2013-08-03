Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5YWd-0006Xu-OI
 for linux-mtd@lists.infradead.org; Sat, 03 Aug 2013 09:53:29 +0000
Received: by mail-pd0-f177.google.com with SMTP id u10so1492933pdi.36
 for <linux-mtd@lists.infradead.org>; Sat, 03 Aug 2013 02:53:06 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next v2 01/10] mtd: tests: introduce helper functions
Date: Sat,  3 Aug 2013 18:52:07 +0900
Message-Id: <1375523536-32671-2-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1375523536-32671-1-git-send-email-akinobu.mita@gmail.com>
References: <1375523536-32671-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Vikram Narayanan <vikram186@gmail.com>, Akinobu Mita <akinobu.mita@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This introduces the helper functions which can be used by several
mtd/tests modules.

The following three functions are used all over the test modules.

- mtdtest_erase_eraseblock()
- mtdtest_scan_for_bad_eraseblocks()
- mtdtest_erase_good_eraseblocks()

The following are wrapper functions for mtd_read() and mtd_write()
which can simplify the return value check.

- mtdtest_read()
- mtdtest_write()

All helpers are put into a single .c file and it will be linked to
every test module later.  The code will actually be copied to every
test module, but it is fine for our small test infrastructure.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Vikram Narayanan <vikram186@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
* Changes from v1
- link a signle object including helper functions to the test modules,
  instead of providing a separate module.
- extend mtdtest_scan_for_bad_eraseblocks() so that it can specify any
  contiguous erase blocks.
- rename mtdtest_erase_whole_device() to mtdtest_erase_good_eraseblocks()
  and extend it so that it can specify any contiguous erase blocks.

 drivers/mtd/tests/mtd_test.c | 110 +++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/tests/mtd_test.h |  11 +++++
 2 files changed, 121 insertions(+)
 create mode 100644 drivers/mtd/tests/mtd_test.c
 create mode 100644 drivers/mtd/tests/mtd_test.h

diff --git a/drivers/mtd/tests/mtd_test.c b/drivers/mtd/tests/mtd_test.c
new file mode 100644
index 0000000..9e63896
--- /dev/null
+++ b/drivers/mtd/tests/mtd_test.c
@@ -0,0 +1,110 @@
+#define pr_fmt(fmt) "mtd_test: " fmt
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/printk.h>
+
+#include "mtd_test.h"
+
+int mtdtest_erase_eraseblock(struct mtd_info *mtd, unsigned int ebnum)
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
+
+static int is_block_bad(struct mtd_info *mtd, unsigned int ebnum)
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
+					unsigned int eb, int ebcnt)
+{
+	int i, bad = 0;
+
+	if (!mtd_can_have_bb(mtd))
+		return 0;
+
+	pr_info("scanning for bad eraseblocks\n");
+	for (i = 0; i < ebcnt; ++i) {
+		bbt[i] = is_block_bad(mtd, eb + i) ? 1 : 0;
+		if (bbt[i])
+			bad += 1;
+		cond_resched();
+	}
+	pr_info("scanned %d eraseblocks, %d are bad\n", i, bad);
+
+	return 0;
+}
+
+int mtdtest_erase_good_eraseblocks(struct mtd_info *mtd, unsigned char *bbt,
+				unsigned int eb, int ebcnt)
+{
+	int err;
+	unsigned int i;
+
+	for (i = 0; i < ebcnt; ++i) {
+		if (bbt[i])
+			continue;
+		err = mtdtest_erase_eraseblock(mtd, eb + i);
+		if (err)
+			return err;
+		cond_resched();
+	}
+
+	return 0;
+}
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
diff --git a/drivers/mtd/tests/mtd_test.h b/drivers/mtd/tests/mtd_test.h
new file mode 100644
index 0000000..f437c77
--- /dev/null
+++ b/drivers/mtd/tests/mtd_test.h
@@ -0,0 +1,11 @@
+#include <linux/mtd/mtd.h>
+
+int mtdtest_erase_eraseblock(struct mtd_info *mtd, unsigned int ebnum);
+int mtdtest_scan_for_bad_eraseblocks(struct mtd_info *mtd, unsigned char *bbt,
+					unsigned int eb, int ebcnt);
+int mtdtest_erase_good_eraseblocks(struct mtd_info *mtd, unsigned char *bbt,
+				unsigned int eb, int ebcnt);
+
+int mtdtest_read(struct mtd_info *mtd, loff_t addr, size_t size, void *buf);
+int mtdtest_write(struct mtd_info *mtd, loff_t addr, size_t size,
+		const void *buf);
-- 
1.8.3.1
