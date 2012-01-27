Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqqYQ-00080b-FZ
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 18:29:42 +0000
Received: by dadz9 with SMTP id z9so783370dad.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 10:29:41 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] libmtd: add `mtd_dev_present()' library function
Date: Fri, 27 Jan 2012 10:30:45 -0800
Message-Id: <1327689046-1450-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Foster <brian.foster@maxim-ic.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Will be used for `mtdinfo --all'

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/libmtd.h |    9 +++++++++
 lib/libmtd.c     |   22 ++++++++++++----------
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/include/libmtd.h b/include/libmtd.h
index 07c304a..a78c8cb 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -106,6 +106,15 @@ libmtd_t libmtd_open(void);
 void libmtd_close(libmtd_t desc);
 
 /**
+ * mtd_dev_present - check whether a MTD device is present.
+ * @desc: MTD library descriptor
+ * @mtd_num: MTD device number to check
+ *
+ * This function returns %1 if MTD device is present and %0 if not.
+ */
+int mtd_dev_present(libmtd_t desc, int mtd_num);
+
+/**
  * mtd_get_info - get general MTD information.
  * @desc: MTD library descriptor
  * @info: the MTD device information is returned here
diff --git a/lib/libmtd.c b/lib/libmtd.c
index c6e5b20..9786e83 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -713,10 +713,18 @@ out_close:
 	return -1;
 }
 
+int mtd_dev_present(libmtd_t desc, int mtd_num) {
+	struct stat st;
+	struct libmtd *lib = (struct libmtd *)desc;
+	char file[strlen(lib->mtd) + 10];
+
+	sprintf(file, lib->mtd, mtd_num);
+	return !stat(file, &st);
+}
+
 int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
 {
 	int ret;
-	struct stat st;
 	struct libmtd *lib = (struct libmtd *)desc;
 
 	memset(mtd, 0, sizeof(struct mtd_dev_info));
@@ -724,15 +732,9 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
 
 	if (!lib->sysfs_supported)
 		return legacy_get_dev_info1(mtd_num, mtd);
-	else {
-		char file[strlen(lib->mtd) + 10];
-
-		sprintf(file, lib->mtd, mtd_num);
-		if (stat(file, &st)) {
-			if (errno == ENOENT)
-				errno = ENODEV;
-			return -1;
-		}
+	else if (!mtd_dev_present(desc, mtd_num)) {
+		errno = ENODEV;
+		return -1;
 	}
 
 	if (dev_get_major(lib, mtd_num, &mtd->major, &mtd->minor))
-- 
1.7.5.4
