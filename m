Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Na9g4-00043X-RA
	for linux-mtd@lists.infradead.org; Wed, 27 Jan 2010 15:19:37 +0000
Received: from vaebh106.NOE.Nokia.com (vaebh106.europe.nokia.com
	[10.160.244.32])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o0RFIsZP015424
	for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2010 09:19:32 -0600
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/5] UBI: support attaching by MTD character device name
Date: Wed, 27 Jan 2010 17:18:57 +0200
Message-Id: <1264605540-13144-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1264605540-13144-1-git-send-email-dedekind1@gmail.com>
References: <1264605540-13144-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch adds a capability to attach MTD devices by their character
device paths. For example, one can do:

$ modprobe ubi mtd=/dev/mtd0

to attach /dev/mtd0.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/build.c |   66 +++++++++++++++++++++++++++++++++++++++--------
 1 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index eb8f19f..99ff57d 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -37,6 +37,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/stringify.h>
+#include <linux/namei.h>
 #include <linux/stat.h>
 #include <linux/miscdevice.h>
 #include <linux/log2.h>
@@ -50,7 +51,8 @@
 
 /**
  * struct mtd_dev_param - MTD device parameter description data structure.
- * @name: MTD device name or number string
+ * @name: MTD character device node path, MTD device name, or MTD device number
+ *        string
  * @vid_hdr_offs: VID header offset
  */
 struct mtd_dev_param {
@@ -1116,13 +1118,50 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 }
 
 /**
- * find_mtd_device - open an MTD device by its name or number.
- * @mtd_dev: name or number of the device
+ * open_mtd_by_chdev - open an MTD device by its character device node path.
+ * @mtd_dev: MTD character device node path
+ *
+ * This helper function opens an MTD device by its character node device path.
+ * Returns MTD device description object in case of success and a negative
+ * error code in case of failure.
+ */
+static struct mtd_info * __init open_mtd_by_chdev(const char *mtd_dev)
+{
+	int err, major, minor, mode;
+	struct path path;
+
+	/* Probably this is an MTD character device node path */
+	err = kern_path(mtd_dev, LOOKUP_FOLLOW, &path);
+	if (err)
+		return ERR_PTR(err);
+
+	/* MTD device number is defined by the major / minor numbers */
+	major = imajor(path.dentry->d_inode);
+	minor = iminor(path.dentry->d_inode);
+	mode = path.dentry->d_inode->i_mode;
+	path_put(&path);
+	if (major != MTD_CHAR_MAJOR || !S_ISCHR(mode))
+		return ERR_PTR(-EINVAL);
+
+	if (minor & 1)
+		/*
+		 * Just do not think the "/dev/mtdrX" devices support is need,
+		 * so do not support them to avoid doing extra work.
+		 */
+		return ERR_PTR(-EINVAL);
+
+	return get_mtd_device(NULL, minor / 2);
+}
+
+/**
+ * open_mtd_device - open MTD device by name, character device path, or number.
+ * @mtd_dev: name, character device node path, or MTD device device number
  *
  * This function tries to open and MTD device described by @mtd_dev string,
- * which is first treated as an ASCII number, and if it is not true, it is
- * treated as MTD device name. Returns MTD device description object in case of
- * success and a negative error code in case of failure.
+ * which is first treated as ASCII MTD device number, and if it is not true, it
+ * is treated as MTD device name, and if that is also not true, it is treated
+ * as MTD character device node path. Returns MTD device description object in
+ * case of success and a negative error code in case of failure.
  */
 static struct mtd_info * __init open_mtd_device(const char *mtd_dev)
 {
@@ -1137,6 +1176,9 @@ static struct mtd_info * __init open_mtd_device(const char *mtd_dev)
 		 * MTD device name.
 		 */
 		mtd = get_mtd_device_nm(mtd_dev);
+		if (IS_ERR(mtd) && PTR_ERR(mtd) == -ENODEV)
+			/* Probably this is an MTD character device node path */
+			mtd = open_mtd_by_chdev(mtd_dev);
 	} else
 		mtd = get_mtd_device(NULL, mtd_num);
 
@@ -1352,13 +1394,15 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 
 module_param_call(mtd, ubi_mtd_param_parse, NULL, NULL, 000);
 MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: "
-		      "mtd=<name|num>[,<vid_hdr_offs>].\n"
+		      "mtd=<name|num|path>[,<vid_hdr_offs>].\n"
 		      "Multiple \"mtd\" parameters may be specified.\n"
-		      "MTD devices may be specified by their number or name.\n"
+		      "MTD devices may be specified by their number, name, or "
+		      "path to the MTD character device node.\n"
 		      "Optional \"vid_hdr_offs\" parameter specifies UBI VID "
-		      "header position and data starting position to be used "
-		      "by UBI.\n"
-		      "Example: mtd=content,1984 mtd=4 - attach MTD device"
+		      "header position to be used by UBI.\n"
+		      "Example 1: mtd=/dev/mtd0 - attach MTD device "
+		      "/dev/mtd0.\n"
+		      "Example 2: mtd=content,1984 mtd=4 - attach MTD device "
 		      "with name \"content\" using VID header offset 1984, and "
 		      "MTD device number 4 with default VID header offset.");
 
-- 
1.6.6
