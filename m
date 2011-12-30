Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgeRM-0006Mk-T4
 for linux-mtd@lists.infradead.org; Fri, 30 Dec 2011 15:32:17 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] mtd: clean-up the default_mtd_writev function
Date: Fri, 30 Dec 2011 17:34:13 +0200
Message-Id: <1325259254-21208-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325259254-21208-1-git-send-email-dedekind1@gmail.com>
References: <1325259254-21208-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

1. Teach 'mtd_write()' function to return '-EROFS' if the write method
   is undefined, and remove the corresponding check from
   'default_mtd_writev()'.
2. Do not test 'retlen' for NULL - it cannot be NULL.
3. Few minor coding stile clean-ups.
4. Add a kerneldoc comment

Additionally, minor fixes to the kerneldoc comments of the neighbor function.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdcore.c   |   41 ++++++++++++++++++++++-------------------
 include/linux/mtd/mtd.h |    2 ++
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 8bea2d0..85a3f19 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -683,10 +683,17 @@ void __put_mtd_device(struct mtd_info *mtd)
 	module_put(mtd->owner);
 }
 
-/* default_mtd_writev - default mtd writev method for MTD devices that
- *			don't implement their own
+/*
+ * default_mtd_writev - the default writev method
+ * @mtd: mtd device description object pointer
+ * @vecs: the vectors to write
+ * @count: count of vectors in @vecs
+ * @to: the MTD device offset to write to
+ * @retlen: on exit contains the count of bytes written to the MTD device.
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
  */
-
 int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 		       unsigned long count, loff_t to, size_t *retlen)
 {
@@ -694,28 +701,24 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	size_t totlen = 0, thislen;
 	int ret = 0;
 
-	if(!mtd->write) {
-		ret = -EROFS;
-	} else {
-		for (i=0; i<count; i++) {
-			if (!vecs[i].iov_len)
-				continue;
-			ret = mtd_write(mtd, to, vecs[i].iov_len, &thislen,
-					vecs[i].iov_base);
-			totlen += thislen;
-			if (ret || thislen != vecs[i].iov_len)
-				break;
-			to += vecs[i].iov_len;
-		}
+	for (i = 0; i < count; i++) {
+		if (!vecs[i].iov_len)
+			continue;
+		ret = mtd_write(mtd, to, vecs[i].iov_len, &thislen,
+				vecs[i].iov_base);
+		totlen += thislen;
+		if (ret || thislen != vecs[i].iov_len)
+			break;
+		to += vecs[i].iov_len;
 	}
-	if (retlen)
-		*retlen = totlen;
+	*retlen = totlen;
 	return ret;
 }
 
 /**
  * mtd_kmalloc_up_to - allocate a contiguous buffer up to the specified size
- * @size: A pointer to the ideal or maximum size of the allocation. Points
+ * @mtd: mtd device description object pointer
+ * @size: a pointer to the ideal or maximum size of the allocation, points
  *        to the actual allocation size on success.
  *
  * This routine attempts to allocate a contiguous kernel buffer up to
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 770982d..a994129 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -295,6 +295,8 @@ static inline int mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 			    size_t *retlen, const u_char *buf)
 {
 	*retlen = 0;
+	if (!mtd->write)
+		return -EROFS;
 	return mtd->write(mtd, to, len, retlen, buf);
 }
 
-- 
1.7.7.3
