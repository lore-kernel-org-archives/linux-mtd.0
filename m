Received: from iksaif.net ([88.191.73.63])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MsLbO-0004jT-Ja
	for linux-mtd@lists.infradead.org; Mon, 28 Sep 2009 19:09:43 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: dedekind1@gmail.com
Subject: [PATCH 1/2] UBI: Add ubi_open_volume_path()
Date: Mon, 28 Sep 2009 21:10:11 +0200
Message-Id: <1254165012-10798-1-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>, linux-mtd@lists.infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add an ubi_open_volume_path(path, mode) function which works like
open_bdev_exclusive(path, mode, ...) where path is the special file
representing the UBI volume, typically /dev/ubi0_0.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/mtd/ubi/kapi.c  |   40 ++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/ubi.h |    2 ++
 2 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 88a72e9..d711aa7 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -22,6 +22,8 @@
 
 #include <linux/module.h>
 #include <linux/err.h>
+#include <linux/namei.h>
+#include <linux/fs.h>
 #include <asm/div64.h>
 #include "ubi.h"
 
@@ -280,6 +282,44 @@ struct ubi_volume_desc *ubi_open_volume_nm(int ubi_num, const char *name,
 EXPORT_SYMBOL_GPL(ubi_open_volume_nm);
 
 /**
+ * ubi_open_volume_path - open UBI volume by path.
+ * @ubi_num: UBI device number
+ * @pathname: volume path
+ * @mode: open mode
+ *
+ * This function is similar to 'ubi_open_volume()', but opens a volume by name.
+ */
+struct ubi_volume_desc *ubi_open_volume_path(const char *pathname, int mode)
+{
+	int error, ubi_num, vol_id;
+	struct ubi_volume_desc *ret;
+	struct inode *inode;
+	struct path path;
+
+	dbg_gen("open volume %s, mode %d", pathname, mode);
+
+	if (!pathname || !*pathname)
+		return ERR_PTR(-EINVAL);
+
+	error = kern_path(pathname, LOOKUP_FOLLOW, &path);
+	if (error)
+		return ERR_PTR(error);
+
+	inode = path.dentry->d_inode;
+	ubi_num = ubi_major2num(imajor(inode));
+	vol_id = iminor(inode) - 1;
+
+	if (vol_id >= 0 && ubi_num >= 0)
+		ret = ubi_open_volume(ubi_num, vol_id, mode);
+	else
+		ret = ERR_PTR(-ENODEV);
+
+	path_put(&path);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ubi_open_volume_path);
+
+/**
  * ubi_close_volume - close UBI volume.
  * @desc: volume descriptor
  */
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index 6913b71..b31bd9e 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -174,6 +174,8 @@ void ubi_get_volume_info(struct ubi_volume_desc *desc,
 struct ubi_volume_desc *ubi_open_volume(int ubi_num, int vol_id, int mode);
 struct ubi_volume_desc *ubi_open_volume_nm(int ubi_num, const char *name,
 					   int mode);
+struct ubi_volume_desc *ubi_open_volume_path(const char *pathname, int mode);
+
 int ubi_register_volume_notifier(struct notifier_block *nb,
 				 int ignore_existing);
 int ubi_unregister_volume_notifier(struct notifier_block *nb);
-- 
1.6.5.rc1
