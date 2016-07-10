Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bMGAw-0002P8-QX
 for linux-mtd@lists.infradead.org; Sun, 10 Jul 2016 14:57:43 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [RESEND PATCH] mtd-utils: Fix return status in mtd_torture test
 function
Date: Sun, 10 Jul 2016 16:54:02 +0200
Message-Id: <20160710145402.2974-1-david.oberhollenzer@sigma-star.at>
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
2.9.0
