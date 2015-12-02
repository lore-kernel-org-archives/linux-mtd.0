Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a43G6-0004D2-K5
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 08:59:32 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id BE8FB16B4D16
 for <linux-mtd@lists.infradead.org>; Wed,  2 Dec 2015 09:59:06 +0100 (CET)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH] mtd-utils: Fix return status in mtd_torture test function
Date: Wed,  2 Dec 2015 09:58:24 +0100
Message-Id: <1449046704-4783-1-git-send-email-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes the return status of the mtd_torture function
in libmtd.

The torture test function is currently only used by the ubiformat
utilitiy to check if a block is bad after a write fails (blocks are
marked bad if the function returns an error status). However, the
way the function was written, it ALWAYS returns an error value
irregardless of whether it failed or not.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 lib/libmtd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index bf6d71f..1717468 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -939,7 +939,7 @@ static uint8_t patterns[] = {0xa5, 0x5a, 0x0};
  * @patt: the pattern to check
  * @size: buffer size in bytes
  *
- * This function returns %1 in there are only @patt bytes in @buf, and %0 if
+ * This function returns %0 if there are only @patt bytes in @buf, and %-1 if
  * something else was also found.
  */
 static int check_pattern(const void *buf, uint8_t patt, int size)
@@ -948,8 +948,8 @@ static int check_pattern(const void *buf, uint8_t patt, int size)
 
 	for (i = 0; i < size; i++)
 		if (((const uint8_t *)buf)[i] != patt)
-			return 0;
-	return 1;
+			return -1;
+	return 0;
 }
 
 int mtd_torture(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
@@ -973,7 +973,7 @@ int mtd_torture(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
 			goto out;
 
 		err = check_pattern(buf, 0xFF, mtd->eb_size);
-		if (err == 0) {
+		if (err) {
 			errmsg("erased PEB %d, but a non-0xFF byte found", eb);
 			errno = EIO;
 			goto out;
@@ -992,7 +992,7 @@ int mtd_torture(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
 			goto out;
 
 		err = check_pattern(buf, patterns[i], mtd->eb_size);
-		if (err == 0) {
+		if (err) {
 			errmsg("pattern %x checking failed for PEB %d",
 				patterns[i], eb);
 			errno = EIO;
@@ -1005,7 +1005,7 @@ int mtd_torture(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
 
 out:
 	free(buf);
-	return -1;
+	return err;
 }
 
 int mtd_is_bad(const struct mtd_dev_info *mtd, int fd, int eb)
-- 
2.6.2
