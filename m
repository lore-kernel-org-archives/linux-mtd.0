Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OyxT4-0006q5-R2
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 01:52:56 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id BEF6B1B40FD
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 01:52:53 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] libmtd: add lock/unlock helpers
Date: Thu, 23 Sep 2010 21:53:38 -0400
Message-Id: <1285293221-25028-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 include/libmtd.h |   24 ++++++++++++++++++++++++
 lib/libmtd.c     |   32 ++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/include/libmtd.h b/include/libmtd.h
index afaba42..f73af4c 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -138,6 +138,30 @@ int mtd_get_dev_info(libmtd_t desc, const char *node, struct mtd_dev_info *mtd);
 int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd);
 
 /**
+ * mtd_lock - lock eraseblocks
+ * @desc: MTD library descriptor
+ * @mtd: MTD device description object
+ * @fd: MTD device node file descriptor
+ * @eb: eraseblock to lock
+ *
+ * This function locks eraseblock @eb. Returns %0 in case of success and %-1
+ * in case of failure.
+ */
+int mtd_lock(const struct mtd_dev_info *mtd, int fd, int eb);
+
+/**
+ * mtd_unlock - unlock eraseblocks
+ * @desc: MTD library descriptor
+ * @mtd: MTD device description object
+ * @fd: MTD device node file descriptor
+ * @eb: eraseblock to lock
+ *
+ * This function unlocks eraseblock @eb. Returns %0 in case of success and %-1
+ * in case of failure.
+ */
+int mtd_unlock(const struct mtd_dev_info *mtd, int fd, int eb);
+
+/**
  * mtd_erase - erase an eraseblock.
  * @desc: MTD library descriptor
  * @mtd: MTD device description object
diff --git a/lib/libmtd.c b/lib/libmtd.c
index d57ae8f..1b3d597 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -802,6 +802,38 @@ static int mtd_valid_erase_block(const struct mtd_dev_info *mtd, int eb)
 	return 0;
 }
 
+static int mtd_xlock(const struct mtd_dev_info *mtd, int fd, int eb, int req,
+		     const char *sreq)
+{
+	int ret;
+	struct erase_info_user ei;
+
+	ret = mtd_valid_erase_block(mtd, eb);
+	if (ret)
+		return ret;
+
+	ei.start = eb * mtd->eb_size;
+	ei.length = mtd->eb_size;
+
+	ret = ioctl(fd, req, &ei);
+	if (ret < 0)
+		return sys_errmsg("%s ioctl failed for eraseblock %d "
+				  "(mtd%d)", sreq, eb, mtd->mtd_num);
+
+	return 0;
+}
+#define mtd_xlock(mtd, fd, eb, req) mtd_xlock(mtd, fd, eb, req, #req)
+
+int mtd_lock(const struct mtd_dev_info *mtd, int fd, int eb)
+{
+	return mtd_xlock(mtd, fd, eb, MEMLOCK);
+}
+
+int mtd_unlock(const struct mtd_dev_info *mtd, int fd, int eb)
+{
+	return mtd_xlock(mtd, fd, eb, MEMUNLOCK);
+}
+
 int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
 {
 	int ret;
-- 
1.7.3
