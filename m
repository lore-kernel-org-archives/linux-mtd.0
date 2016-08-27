Date: Sat, 27 Aug 2016 21:44:16 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 Zoltan HERPAI <wigyori@uid0.hu>, Hauke Mehrtens <hauke@hauke-m.de>,
 lede-dev@lists.infradead.org, openwrt-devel@lists.openwrt.org
Subject: [PATCH 2/3] mtd: ubiblock: introduce ubiblock_create_dev
Message-ID: <20160827194407.GA17559@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Define function ubiblock_create_dev(char *name, dev_t *bdev)
which returns the created device by setting the point bdev.
This is useful for in-kernel users creating a ubiblock device
in order to mount the root filesystem.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/block.c | 11 ++++++++++-
 drivers/mtd/ubi/ubi.h   |  2 ++
 include/linux/mtd/ubi.h | 16 ++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index ebf46ad..58b818f 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -49,6 +49,7 @@
 #include <linux/hdreg.h>
 #include <linux/scatterlist.h>
 #include <linux/idr.h>
+#include <linux/kdev_t.h>
 #include <asm/div64.h>
 
 #include "ubi-media.h"
@@ -356,7 +357,11 @@ static struct blk_mq_ops ubiblock_mq_ops = {
 
 static DEFINE_IDR(ubiblock_minor_idr);
 
-int ubiblock_create(struct ubi_volume_info *vi)
+int ubiblock_create(struct ubi_volume_info *vi) {
+	return ubiblock_create_dev(vi, NULL);
+}
+
+int ubiblock_create_dev(struct ubi_volume_info *vi, dev_t *bdev)
 {
 	struct ubiblock *dev;
 	struct gendisk *gd;
@@ -448,6 +453,10 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	add_disk(dev->gd);
 	dev_info(disk_to_dev(dev->gd), "created from ubi%d:%d(%s)",
 		 dev->ubi_num, dev->vol_id, vi->name);
+
+	if (bdev)
+		*bdev = MKDEV(gd->major, gd->first_minor);
+
 	return 0;
 
 out_free_queue:
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index de1ea2e4..7700752 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -39,6 +39,7 @@
 #include <linux/notifier.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/ubi.h>
+#include <linux/kdev_t.h>
 #include <asm/pgtable.h>
 
 #include "ubi-media.h"
@@ -917,6 +918,7 @@ static inline int ubi_update_fastmap(struct ubi_device *ubi) { return 0; }
 int ubiblock_init(void);
 void ubiblock_exit(void);
 int ubiblock_create(struct ubi_volume_info *vi);
+int ubiblock_create_dev(struct ubi_volume_info *vi, dev_t *bdev);
 int ubiblock_remove(struct ubi_volume_info *vi);
 #else
 static inline int ubiblock_init(void) { return 0; }
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index 0b92aa5..3d6444f 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -21,7 +21,9 @@
 #ifndef __LINUX_UBI_H__
 #define __LINUX_UBI_H__
 
+#include <linux/errno.h>
 #include <linux/ioctl.h>
+#include <linux/kdev_t.h>
 #include <linux/types.h>
 #include <linux/scatterlist.h>
 #include <mtd/ubi-user.h>
@@ -282,4 +284,18 @@ static inline int ubi_read_sg(struct ubi_volume_desc *desc, int lnum,
 {
 	return ubi_leb_read_sg(desc, lnum, sgl, offset, len, 0);
 }
+
+
+/*
+ * This function allows in-kernel users to create a ubiblock device and
+ * get to know about the created device.
+ */
+#ifdef CONFIG_MTD_UBI_BLOCK
+int ubiblock_create_dev(struct ubi_volume_info *vi, dev_t *bdev);
+#else
+int ubiblock_create_dev(struct ubi_volume_info *vi, dev_t *bdev) {
+	return -ENOTSUPP;
+}
+#endif
+
 #endif /* !__LINUX_UBI_H__ */
-- 
2.9.3
