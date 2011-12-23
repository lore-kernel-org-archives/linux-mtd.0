Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9Zk-0005IH-RP
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:10:46 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 09/28] mtd: introduce mtd_panic_write interface
Date: Fri, 23 Dec 2011 20:11:01 +0200
Message-Id: <1324663880-22477-10-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
References: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdoops.c   |    4 ++--
 drivers/mtd/mtdpart.c   |    4 ++--
 include/linux/mtd/mtd.h |   25 +++++++++++++++----------
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 9c9d586..7be2018 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -222,8 +222,8 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	hdr[1] = MTDOOPS_KERNMSG_MAGIC;
 
 	if (panic)
-		ret = mtd->panic_write(mtd, cxt->nextpage * record_size,
-					record_size, &retlen, cxt->oops_buf);
+		ret = mtd_panic_write(mtd, cxt->nextpage * record_size,
+				      record_size, &retlen, cxt->oops_buf);
 	else
 		ret = mtd_write(mtd, cxt->nextpage * record_size,
 				record_size, &retlen, cxt->oops_buf);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 96574a0..9ed58f7 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -201,8 +201,8 @@ static int part_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 		len = 0;
 	else if (to + len > mtd->size)
 		len = mtd->size - to;
-	return part->master->panic_write(part->master, to + part->offset,
-				    len, retlen, buf);
+	return mtd_panic_write(part->master, to + part->offset, len, retlen,
+			       buf);
 }
 
 static int part_write_oob(struct mtd_info *mtd, loff_t to,
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 1da7f4a..2fb83cd3 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -186,6 +186,8 @@ struct mtd_info {
 		     size_t *retlen, u_char *buf);
 	int (*write) (struct mtd_info *mtd, loff_t to, size_t len,
 		      size_t *retlen, const u_char *buf);
+	int (*panic_write) (struct mtd_info *mtd, loff_t to, size_t len,
+			    size_t *retlen, const u_char *buf);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
@@ -193,16 +195,6 @@ struct mtd_info {
 	struct backing_dev_info *backing_dev_info;
 
 
-
-	/* In blackbox flight recorder like scenarios we want to make successful
-	   writes in interrupt context. panic_write() is only intended to be
-	   called when its known the kernel is about to panic and we need the
-	   write to succeed. Since the kernel is not going to be running for much
-	   longer, this function can break locks and delay to ensure the write
-	   succeeds (but not sleep). */
-
-	int (*panic_write) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
-
 	int (*read_oob) (struct mtd_info *mtd, loff_t from,
 			 struct mtd_oob_ops *ops);
 	int (*write_oob) (struct mtd_info *mtd, loff_t to,
@@ -315,6 +307,19 @@ static inline int mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return mtd->write(mtd, to, len, retlen, buf);
 }
 
+/*
+ * In blackbox flight recorder like scenarios we want to make successful writes
+ * in interrupt context. panic_write() is only intended to be called when its
+ * known the kernel is about to panic and we need the write to succeed. Since
+ * the kernel is not going to be running for much longer, this function can
+ * break locks and delay to ensure the write succeeds (but not sleep).
+ */
+static inline int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
+				  size_t *retlen, const u_char *buf)
+{
+	return mtd->panic_write(mtd, to, len, retlen, buf);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.3
