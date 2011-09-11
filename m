From: artem.bityutskiy@intel.com (Artem Bityutskiy)
Date: Sun, 11 Sep 2011 13:52:08 +0300
Subject: [PATCH] ubiformat: handle write errors correctly
Message-ID: <mailman.126.1315738619.20020.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

This issue was reported and analyzed by
Anton Olofsson <anol.martinsson@gmail.com>:

when ubiformat encounters a write error while flashing the UBI image (which may
come from a file of from stdout), it correctly marks the faulty eraseblock as
bad and skips it. However, it also incorrectly drops the data buffer which was
supposed to be written, and reads next block of data.

This patch fixes this issue - in case of a write error, we preserve the current
data and write it to the next eraseblock, instead of dropping it.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@intel.com>
---
 ubi-utils/ubiformat.c |   22 ++++++++++++++++------
 1 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index bfa1730..c396b09 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -442,7 +442,7 @@ static int mark_bad(const struct mtd_dev_info *mtd, struct ubi_scan_info *si, in
 static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 		       const struct ubigen_info *ui, struct ubi_scan_info *si)
 {
-	int fd, img_ebs, eb, written_ebs = 0, divisor;
+	int fd, img_ebs, eb, written_ebs = 0, divisor, skip_data_read = 0;
 	off_t st_size;
 
 	fd = open_file(&st_size);
@@ -501,12 +501,15 @@ static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 			continue;
 		}
 
-		err = read_all(fd, buf, mtd->eb_size);
-		if (err) {
-			sys_errmsg("failed to read eraseblock %d from \"%s\"",
-				   written_ebs, args.image);
-			goto out_close;
+		if (!skip_data_read) {
+			err = read_all(fd, buf, mtd->eb_size);
+			if (err) {
+				sys_errmsg("failed to read eraseblock %d from \"%s\"",
+					   written_ebs, args.image);
+				goto out_close;
+			}
 		}
+		skip_data_read = 0;
 
 		if (args.override_ec)
 			ec = args.ec;
@@ -546,6 +549,13 @@ static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 				if (mark_bad(mtd, si, eb))
 					goto out_close;
 			}
+
+			/*
+			 * We have to make sure that we do not read next block
+			 * of data from the input image or stdin - we have to
+			 * write buf first instead.
+			 */
+			skip_data_read = 1;
 			continue;
 		}
 		if (++written_ebs >= img_ebs)
-- 
1.7.6

-- 
Best Regards,
Artem Bityutskiy
