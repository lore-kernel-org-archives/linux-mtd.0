Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RvYWH-0005ES-GT
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2012 18:14:58 +0000
Received: by mail-pw0-f49.google.com with SMTP id un1so605964pbc.36
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2012 10:14:57 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/3] limbtd: implement mtd_dev_present for old kernels
Date: Thu,  9 Feb 2012 10:13:29 -0800
Message-Id: <1328811211-13653-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1328811211-13653-1-git-send-email-computersforpeace@gmail.com>
References: <1328811211-13653-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Foster <brian.foster@maxim-ic.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Implement the 'legacy_dev_present()' function which will check whether an MTD
device is present by scanning the /proc/mtd file when the MTD subsystem does
not support sysfs (the case for pre-2.6.30 kernels).

This patch also moves the 'mtd_dev_present()' function to a slightly more
logical position.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 lib/libmtd.c        |   25 ++++++++++++-------------
 lib/libmtd_int.h    |    1 +
 lib/libmtd_legacy.c |   25 +++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index da9da00..2bb4e57 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -641,6 +641,18 @@ void libmtd_close(libmtd_t desc)
 	free(lib);
 }
 
+int mtd_dev_present(libmtd_t desc, int mtd_num) {
+	struct stat st;
+	struct libmtd *lib = (struct libmtd *)desc;
+	char file[strlen(lib->mtd) + 10];
+
+	if (!lib->sysfs_supported)
+		return legacy_dev_present(mtd_num);
+
+	sprintf(file, lib->mtd, mtd_num);
+	return !stat(file, &st);
+}
+
 int mtd_get_info(libmtd_t desc, struct mtd_info *info)
 {
 	DIR *sysfs_mtd;
@@ -713,19 +725,6 @@ out_close:
 	return -1;
 }
 
-int mtd_dev_present(libmtd_t desc, int mtd_num) {
-	struct stat st;
-	struct libmtd *lib = (struct libmtd *)desc;
-	char file[strlen(lib->mtd) + 10];
-
-	if (!lib->sysfs_supported)
-		/* TODO: add legacy_dev_present() function */
-		return 1;
-
-	sprintf(file, lib->mtd, mtd_num);
-	return !stat(file, &st);
-}
-
 int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
 {
 	int ret;
diff --git a/lib/libmtd_int.h b/lib/libmtd_int.h
index bb48d35..7913e67 100644
--- a/lib/libmtd_int.h
+++ b/lib/libmtd_int.h
@@ -95,6 +95,7 @@ struct libmtd
 };
 
 int legacy_libmtd_open(void);
+int legacy_dev_present(int mtd_num);
 int legacy_mtd_get_info(struct mtd_info *info);
 int legacy_get_dev_info(const char *node, struct mtd_dev_info *mtd);
 int legacy_get_dev_info1(int dev_num, struct mtd_dev_info *mtd);
diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
index f0646f3..1ae9946 100644
--- a/lib/libmtd_legacy.c
+++ b/lib/libmtd_legacy.c
@@ -170,6 +170,31 @@ int legacy_libmtd_open(void)
 }
 
 /**
+ * legacy_dev_presentl - legacy version of 'mtd_dev_present()'.
+ * @info: the MTD device information is returned here
+ *
+ * When the kernel does not provide sysfs files for the MTD subsystem,
+ * fall-back to parsing the /proc/mtd file to determine whether an mtd device
+ * number @mtd_num is present.
+ */
+int legacy_dev_present(int mtd_num)
+{
+	int ret;
+	struct proc_parse_info pi;
+
+	ret = proc_parse_start(&pi);
+	if (ret)
+		return -1;
+
+	while (proc_parse_next(&pi)) {
+		if (pi.mtd_num == mtd_num)
+			return 1;
+	}
+
+	return 0;
+}
+
+/**
  * legacy_mtd_get_info - legacy version of 'mtd_get_info()'.
  * @info: the MTD device information is returned here
  *
-- 
1.7.5.4
