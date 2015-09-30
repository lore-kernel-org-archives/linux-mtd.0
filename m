Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zh5sv-0000HY-AM
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 01:08:41 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 2/3] mtd: test: refactor mtdtest_erase_eraseblock to
 introduce a new mtdtest_erase function
Date: Wed, 30 Sep 2015 09:01:20 +0800
Message-ID: <1443574881-12319-3-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1443574881-12319-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <20150930002958.GC143959@google.com>
 <1443574881-12319-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In original mtd_test, there is only one function to erase a block, but
we need a function to accept [addr, size] to erase mtd device for
mtd_erasetest. So refactor the original mtdtest_erase_eraseblock
to introduce a new mtdtest_erase.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 drivers/mtd/tests/mtd_test.c | 44 ++++++++++++++++++++++++++++++++------------
 drivers/mtd/tests/mtd_test.h |  1 +
 2 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/tests/mtd_test.c b/drivers/mtd/tests/mtd_test.c
index 34736bb..4c4320c 100644
--- a/drivers/mtd/tests/mtd_test.c
+++ b/drivers/mtd/tests/mtd_test.c
@@ -9,24 +9,14 @@
 int mtdtest_erase_eraseblock(struct mtd_info *mtd, unsigned int ebnum)
 {
 	int err;
-	struct erase_info ei;
 	loff_t addr = (loff_t)ebnum * mtd->erasesize;
 
-	memset(&ei, 0, sizeof(struct erase_info));
-	ei.mtd  = mtd;
-	ei.addr = addr;
-	ei.len  = mtd->erasesize;
-
-	err = mtd_erase(mtd, &ei);
+	err = mtdtest_erase(mtd, addr, mtd->erasesize, 0);
 	if (err) {
-		pr_info("error %d while erasing EB %d\n", err, ebnum);
+		pr_info("failed to erase EB %d\n", ebnum);
 		return err;
 	}
 
-	if (ei.state == MTD_ERASE_FAILED) {
-		pr_info("some erase error occurred at EB %d\n", ebnum);
-		return -EIO;
-	}
 	return 0;
 }
 
@@ -111,3 +101,33 @@ int mtdtest_write(struct mtd_info *mtd, loff_t addr, size_t size,
 
 	return err;
 }
+
+/*
+ * There is a parameter named as quiet, it's useful to clean the output
+ * when we are testing some negative cases.
+ */
+int mtdtest_erase(struct mtd_info *mtd, loff_t addr, size_t size, int quiet)
+{
+	int err;
+	struct erase_info ei;
+
+	memset(&ei, 0, sizeof(struct erase_info));
+	ei.mtd  = mtd;
+	ei.addr = addr;
+	ei.len  = size;
+
+	err = mtd_erase(mtd, &ei);
+	if (err) {
+		if (!quiet)
+			pr_err("error %d while erasing (addr: %#llx, size: %lu)\n", err, addr, size);
+		return err;
+	}
+
+	if (ei.state == MTD_ERASE_FAILED) {
+		if (!quiet)
+			pr_err("some erase error occurred in erasing (addr: %#llx, size: %lu)\n", addr, size);
+		return -EIO;
+	}
+
+	return err;
+}
diff --git a/drivers/mtd/tests/mtd_test.h b/drivers/mtd/tests/mtd_test.h
index 4b7bee1..c53558c 100644
--- a/drivers/mtd/tests/mtd_test.h
+++ b/drivers/mtd/tests/mtd_test.h
@@ -21,3 +21,4 @@ int mtdtest_erase_good_eraseblocks(struct mtd_info *mtd, unsigned char *bbt,
 int mtdtest_read(struct mtd_info *mtd, loff_t addr, size_t size, void *buf);
 int mtdtest_write(struct mtd_info *mtd, loff_t addr, size_t size,
 		const void *buf);
+int mtdtest_erase(struct mtd_info *mtd, loff_t addr, size_t size, int quiet);
-- 
1.8.4.2
