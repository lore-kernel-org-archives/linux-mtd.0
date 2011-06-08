From: Artem.Bityutskiy@nokia.com (Artem Bityutskiy)
Date: Wed, 8 Jun 2011 16:21:40 +0300
Subject: [PATCH] mtdinfo: separate out ubi information printing
Message-ID: <mailman.11.1307540753.24103.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

We are going to add some more code which prints eraseblocks map, so we need to
make 'print_dev_info()' a bit smaller to keep the code readable.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 ubi-utils/src/mtdinfo.c |   41 +++++++++++++++++++++++------------------
 1 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/ubi-utils/src/mtdinfo.c b/ubi-utils/src/mtdinfo.c
index 666d739..ca0ad71 100644
--- a/ubi-utils/src/mtdinfo.c
+++ b/ubi-utils/src/mtdinfo.c
@@ -160,6 +160,27 @@ static int translate_dev(libmtd_t libmtd, const char *node)
 	return 0;
 }
 
+static void print_ubi_info(const struct mtd_info *mtd_info,
+			   const struct mtd_dev_info *mtd)
+{
+	struct ubigen_info ui;
+
+	if (!mtd_info->sysfs_supported) {
+		errmsg("cannot provide UBI info, becasue sub-page size is "
+		       "not known");
+		return;
+	}
+
+	ubigen_info_init(&ui, mtd->eb_size, mtd->min_io_size, mtd->subpage_size,
+			 0, 1, 0);
+	printf("Default UBI VID header offset:  %d\n", ui.vid_hdr_offs);
+	printf("Default UBI data offset:        %d\n", ui.data_offs);
+	printf("Default UBI LEB size:           ");
+	ubiutils_print_bytes(ui.leb_size, 0);
+	printf("\n");
+	printf("Maximum UBI volumes count:      %d\n", ui.max_volumes);
+}
+
 static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int mtdn)
 {
 	int err;
@@ -206,25 +227,9 @@ static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int
 	printf("Device is writable:             %s\n",
 	      mtd.writable ? "true" : "false");
 
-	if (!args.ubinfo)
-		goto out;
-
-	if (!mtd_info->sysfs_supported) {
-		errmsg("cannot provide UBI info, becasue sub-page size is "
-		       "not known");
-		goto out;
-	}
-
-	ubigen_info_init(&ui, mtd.eb_size, mtd.min_io_size, mtd.subpage_size,
-			 0, 1, 0);
-	printf("Default UBI VID header offset:  %d\n", ui.vid_hdr_offs);
-	printf("Default UBI data offset:        %d\n", ui.data_offs);
-	printf("Default UBI LEB size:           ");
-	ubiutils_print_bytes(ui.leb_size, 0);
-	printf("\n");
-	printf("Maximum UBI volumes count:      %d\n", ui.max_volumes);
+	if (args.ubinfo)
+		print_ubi_info(mtd_info, &mtd);
 
-out:
 	printf("\n");
 	return 0;
 }
-- 
1.7.2.3


-- 
Best Regards,
Artem Bityutskiy (?????????? ????????????????)
