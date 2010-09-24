Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OyxRM-0004zX-9o
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 01:51:09 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 372641B40BB
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 01:51:05 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] libmtd: unify erase block argument checking
Date: Thu, 23 Sep 2010 21:51:53 -0400
Message-Id: <1285293113-24844-1-git-send-email-vapier@gentoo.org>
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
 lib/libmtd.c |   68 +++++++++++++++++++++++++++------------------------------
 1 files changed, 32 insertions(+), 36 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index 0010790..d57ae8f 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -791,19 +791,27 @@ int mtd_get_dev_info(libmtd_t desc, const char *node, struct mtd_dev_info *mtd)
 	return mtd_get_dev_info1(desc, mtd_num, mtd);
 }
 
-int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
+static int mtd_valid_erase_block(const struct mtd_dev_info *mtd, int eb)
 {
-	int ret;
-	struct libmtd *lib = (struct libmtd *)desc;
-	struct erase_info_user64 ei64;
-	struct erase_info_user ei;
-
 	if (eb < 0 || eb >= mtd->eb_cnt) {
 		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
 		       eb, mtd->mtd_num, mtd->eb_cnt);
 		errno = EINVAL;
 		return -1;
 	}
+	return 0;
+}
+
+int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
+{
+	int ret;
+	struct libmtd *lib = (struct libmtd *)desc;
+	struct erase_info_user64 ei64;
+	struct erase_info_user ei;
+
+	ret = mtd_valid_erase_block(mtd, eb);
+	if (ret)
+		return ret;
 
 	ei64.start = (__u64)eb * mtd->eb_size;
 	ei64.length = mtd->eb_size;
@@ -930,12 +938,9 @@ int mtd_is_bad(const struct mtd_dev_info *mtd, int fd, int eb)
 	int ret;
 	loff_t seek;
 
-	if (eb < 0 || eb >= mtd->eb_cnt) {
-		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
-		       eb, mtd->mtd_num, mtd->eb_cnt);
-		errno = EINVAL;
-		return -1;
-	}
+	ret = mtd_valid_erase_block(mtd, eb);
+	if (ret)
+		return ret;
 
 	if (!mtd->bb_allowed)
 		return 0;
@@ -958,12 +963,9 @@ int mtd_mark_bad(const struct mtd_dev_info *mtd, int fd, int eb)
 		return -1;
 	}
 
-	if (eb < 0 || eb >= mtd->eb_cnt) {
-		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
-		       eb, mtd->mtd_num, mtd->eb_cnt);
-		errno = EINVAL;
-		return -1;
-	}
+	ret = mtd_valid_erase_block(mtd, eb);
+	if (ret)
+		return ret;
 
 	seek = (loff_t)eb * mtd->eb_size;
 	ret = ioctl(fd, MEMSETBADBLOCK, &seek);
@@ -979,12 +981,10 @@ int mtd_read(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
 	int ret, rd = 0;
 	off_t seek;
 
-	if (eb < 0 || eb >= mtd->eb_cnt) {
-		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
-		       eb, mtd->mtd_num, mtd->eb_cnt);
-		errno = EINVAL;
-		return -1;
-	}
+	ret = mtd_valid_erase_block(mtd, eb);
+	if (ret)
+		return ret;
+
 	if (offs < 0 || offs + len > mtd->eb_size) {
 		errmsg("bad offset %d or length %d, mtd%d eraseblock size is %d",
 		       offs, len, mtd->mtd_num, mtd->eb_size);
@@ -1015,12 +1015,10 @@ int mtd_write(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
 	int ret;
 	off_t seek;
 
-	if (eb < 0 || eb >= mtd->eb_cnt) {
-		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
-		       eb, mtd->mtd_num, mtd->eb_cnt);
-		errno = EINVAL;
-		return -1;
-	}
+	ret = mtd_valid_erase_block(mtd, eb);
+	if (ret)
+		return ret;
+
 	if (offs < 0 || offs + len > mtd->eb_size) {
 		errmsg("bad offset %d or length %d, mtd%d eraseblock size is %d",
 		       offs, len, mtd->mtd_num, mtd->eb_size);
@@ -1157,12 +1155,10 @@ int mtd_write_img(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
 	struct stat st;
 	char *buf;
 
-	if (eb < 0 || eb >= mtd->eb_cnt) {
-		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
-		       eb, mtd->mtd_num, mtd->eb_cnt);
-		errno = EINVAL;
-		return -1;
-	}
+	ret = mtd_valid_erase_block(mtd, eb);
+	if (ret)
+		return ret;
+
 	if (offs < 0 || offs >= mtd->eb_size) {
 		errmsg("bad offset %d, mtd%d eraseblock size is %d",
 		       offs, mtd->mtd_num, mtd->eb_size);
-- 
1.7.3
