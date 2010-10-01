Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1YR8-0007zs-0o
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 05:45:38 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id BA4A81B4001
	for <linux-mtd@lists.infradead.org>;
	Fri,  1 Oct 2010 05:45:36 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] libmtd: unify some error messages
Date: Fri,  1 Oct 2010 01:46:34 -0400
Message-Id: <1285911994-9747-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

By using the same error message string, we only need one copy of it
in memory at runtime.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 lib/libmtd.c |   27 ++++++++++++++-------------
 1 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index 1839192..e0c0934 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -785,6 +785,13 @@ int mtd_get_dev_info(libmtd_t desc, const char *node, struct mtd_dev_info *mtd)
 	return mtd_get_dev_info1(desc, mtd_num, mtd);
 }
 
+static inline int mtd_ioctl_error(const struct mtd_dev_info *mtd, int eb,
+				  const char *sreq)
+{
+	return sys_errmsg("%s ioctl failed for eraseblock %d (mtd%d)",
+			  sreq, eb, mtd->mtd_num);
+}
+
 static int mtd_valid_erase_block(const struct mtd_dev_info *mtd, int eb)
 {
 	if (eb < 0 || eb >= mtd->eb_cnt) {
@@ -811,8 +818,7 @@ static int mtd_xlock(const struct mtd_dev_info *mtd, int fd, int eb, int req,
 
 	ret = ioctl(fd, req, &ei);
 	if (ret < 0)
-		return sys_errmsg("%s ioctl failed for eraseblock %d "
-				  "(mtd%d)", sreq, eb, mtd->mtd_num);
+		return mtd_ioctl_error(mtd, eb, sreq);
 
 	return 0;
 }
@@ -850,9 +856,7 @@ int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
 
 		if (errno != ENOTTY ||
 		    lib->offs64_ioctls != OFFS64_IOCTLS_UNKNOWN)
-			return sys_errmsg("MEMERASE64 ioctl failed for "
-					  "eraseblock %d (mtd%d)",
-					  eb, mtd->mtd_num);
+			return mtd_ioctl_error(mtd, eb, "MEMERASE64");
 
 		/*
 		 * MEMERASE64 support was added in kernel version 2.6.31, so
@@ -873,8 +877,7 @@ int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
 	ei.length = ei64.length;
 	ret = ioctl(fd, MEMERASE, &ei);
 	if (ret < 0)
-		return sys_errmsg("MEMERASE ioctl failed for eraseblock %d "
-				  "(mtd%d)", eb, mtd->mtd_num);
+		return mtd_ioctl_error(mtd, eb, "MEMERASE");
 	return 0;
 }
 
@@ -970,8 +973,7 @@ int mtd_is_bad(const struct mtd_dev_info *mtd, int fd, int eb)
 	seek = (loff_t)eb * mtd->eb_size;
 	ret = ioctl(fd, MEMGETBADBLOCK, &seek);
 	if (ret == -1)
-		return sys_errmsg("MEMGETBADBLOCK ioctl failed for "
-				  "eraseblock %d (mtd%d)", eb, mtd->mtd_num);
+		return mtd_ioctl_error(mtd, eb, "MEMGETBADBLOCK");
 	return ret;
 }
 
@@ -992,8 +994,7 @@ int mtd_mark_bad(const struct mtd_dev_info *mtd, int fd, int eb)
 	seek = (loff_t)eb * mtd->eb_size;
 	ret = ioctl(fd, MEMSETBADBLOCK, &seek);
 	if (ret == -1)
-		return sys_errmsg("MEMSETBADBLOCK ioctl failed for "
-			          "eraseblock %d (mtd%d)", eb, mtd->mtd_num);
+		return mtd_ioctl_error(mtd, eb, "MEMSETBADBLOCK");
 	return 0;
 }
 
@@ -1196,7 +1197,7 @@ int mtd_write_img(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
 
 	in_fd = open(img_name, O_RDONLY);
 	if (in_fd == -1)
-		return sys_errmsg("cannot open %s", img_name);
+		return sys_errmsg("cannot open \"%s\"", img_name);
 
 	if (fstat(in_fd, &st)) {
 		sys_errmsg("cannot stat %s", img_name);
@@ -1237,7 +1238,7 @@ int mtd_write_img(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
 		do {
 			ret = read(in_fd, buf, mtd->eb_size - offs - rd);
 			if (ret == -1) {
-				sys_errmsg("cannot read from %s", img_name);
+				sys_errmsg("cannot read \"%s\"", img_name);
 				goto out_free;
 			}
 			rd += ret;
-- 
1.7.3.1
