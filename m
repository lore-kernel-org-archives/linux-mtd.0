Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqJnR-0005wd-Py
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 07:31:02 +0000
Received: by dadv40 with SMTP id v40so314063dad.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Jan 2012 23:30:59 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] libubi: make `ubi_dev_present()' a library function
Date: Wed, 25 Jan 2012 23:31:49 -0800
Message-Id: <1327563110-23966-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We will use this function in ubinfo.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 ubi-utils/include/libubi.h |    9 +++++++++
 ubi-utils/libubi.c         |   12 +++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/ubi-utils/include/libubi.h b/ubi-utils/include/libubi.h
index 02017e8..dc03d02 100644
--- a/ubi-utils/include/libubi.h
+++ b/ubi-utils/include/libubi.h
@@ -346,6 +346,15 @@ int ubi_get_dev_info(libubi_t desc, const char *node,
 		     struct ubi_dev_info *info);
 
 /**
+ * ubi_dev_present - check whether an UBI device is present.
+ * @desc: UBI library descriptor
+ * @dev_num: UBI device number to check
+ *
+ * This function returns %1 if UBI device is present and %0 if not.
+ */
+int ubi_dev_present(libubi_t desc, int dev_num);
+
+/**
  * ubi_get_dev_info1 - get UBI device information.
  * @desc: UBI library descriptor
  * @dev_num: UBI device number to fetch information about
diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
index 4d5f316..c898e36 100644
--- a/ubi-utils/libubi.c
+++ b/ubi-utils/libubi.c
@@ -1121,16 +1121,10 @@ int ubi_leb_change_start(libubi_t desc, int fd, int lnum, int bytes, int dtype)
 	return 0;
 }
 
-/**
- * dev_present - check whether an UBI device is present.
- * @lib: libubi descriptor
- * @dev_num: UBI device number to check
- *
- * This function returns %1 if UBI device is present and %0 if not.
- */
-static int dev_present(struct libubi *lib, int dev_num)
+int ubi_dev_present(libubi_t desc, int dev_num)
 {
 	struct stat st;
+	struct libubi *lib = (struct libubi *)desc;
 	char file[strlen(lib->ubi_dev) + 50];
 
 	sprintf(file, lib->ubi_dev, dev_num);
@@ -1146,7 +1140,7 @@ int ubi_get_dev_info1(libubi_t desc, int dev_num, struct ubi_dev_info *info)
 	memset(info, 0, sizeof(struct ubi_dev_info));
 	info->dev_num = dev_num;
 
-	if (!dev_present(lib, dev_num))
+	if (!ubi_dev_present(desc, dev_num))
 		return -1;
 
 	sysfs_ubi = opendir(lib->sysfs_ubi);
-- 
1.7.5.4
