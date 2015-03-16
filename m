Received: from mail-ig0-x22d.google.com ([2607:f8b0:4001:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXc33-0004to-Ou
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 20:55:46 +0000
Received: by igbue6 with SMTP id ue6so54684017igb.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2015 13:55:19 -0700 (PDT)
Sender: Daniel Ehrenberg <dehrenberg@google.com>
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: computersforpeace@gmail.com,
	linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: block: Add option for dynamic minor number
Date: Mon, 16 Mar 2015 13:55:15 -0700
Message-Id: <1426539315-17392-1-git-send-email-dehrenberg@chromium.org>
Cc: gwendal@chromium.org, Dan Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds a new config option, MTD_UBI_BLOCK_DYNAMIC_MINOR, which
makes minor numbers dynamically allocated for ubiblock devices, starting
at 0.

>From the new Kconfig:
    This option makes ubiblock devices have minor numbers beginning from
    0, allocated dynamically independently of the ubi device/volume
    number. For users who don't refer to an ubiblock device directly by
    the major:minor number (e.g., with udev and/or devtmpfs), this option
    is useful if the device number is rather high (>1) and when executing
    on a 32-bit platform without LFS enabled in all userspace binaries.

While enabling LFS is clearly a nicer solution, it's often difficult to turn
on in practice globally as many widely distributed packages don't work with
LFS on. While dev_t is 32-bit even without LFS, stat will return -EOVERFLOW
with a minor number which doesn't fit in 8 bits for ABI compatability reasons.

Other storage systems have their own workarounds, with SCSI making multiple
device majors and MMC having a config option for the number of partitions
per device. A completely dynamic minor numbering is simpler than these and
suitable for the majority of ubiblock users who don't depend on a minor
numbering (the major is dynamic anyway).

Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
---
 drivers/mtd/ubi/Kconfig | 11 +++++++++++
 drivers/mtd/ubi/block.c | 34 +++++++++++++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index f0855ce..c0e9a73 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -103,4 +103,15 @@ config MTD_UBI_BLOCK
 
 	   If in doubt, say "N".
 
+config MTD_UBI_BLOCK_DYNAMIC_MINOR
+	bool "Dynamically allocate minor numbers for ubiblock"
+	default n
+	help
+	  This option makes ubiblock devices have minor numbers beginning from
+	  0, allocated dynamically independently of the ubi device/volume
+	  number. For users who don't refer to an ubiblock device directly by
+	  the major:minor number (e.g., with udev and/or devtmpfs), this option
+	  is useful if the device number is rather high (>1) and when executing
+	  on a 32-bit platform without LFS.
+
 endif # MTD_UBI
diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index db2c05b..bcd164d 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -48,6 +48,7 @@
 #include <linux/blk-mq.h>
 #include <linux/hdreg.h>
 #include <linux/scatterlist.h>
+#include <linux/idr.h>
 #include <asm/div64.h>
 
 #include "ubi-media.h"
@@ -351,6 +352,20 @@ static struct blk_mq_ops ubiblock_mq_ops = {
 	.map_queue      = blk_mq_map_queue,
 };
 
+#ifdef CONFIG_MTD_UBI_BLOCK_DYNAMIC_MINOR
+static DEFINE_IDR(ubiblock_minor_idr);
+
+static int ubiblock_alloc_minor(struct ubiblock *dev)
+{
+	return idr_alloc(&ubiblock_minor_idr, dev, 0, 0, GFP_KERNEL);
+}
+
+static void ubiblock_remove_minor(int minor)
+{
+	idr_remove(&ubiblock_minor_idr, minor);
+}
+#endif
+
 int ubiblock_create(struct ubi_volume_info *vi)
 {
 	struct ubiblock *dev;
@@ -388,7 +403,17 @@ int ubiblock_create(struct ubi_volume_info *vi)
 
 	gd->fops = &ubiblock_ops;
 	gd->major = ubiblock_major;
+#ifdef CONFIG_MTD_UBI_BLOCK_DYNAMIC_MINOR
+	gd->first_minor = ubiblock_alloc_minor(dev);
+	if (gd->first_minor < 0) {
+		dev_err(disk_to_dev(gd),
+			"block: dynamic minor allocation failed");
+		ret = -ENODEV;
+		goto out_put_disk;
+	}
+#else
 	gd->first_minor = dev->ubi_num * UBI_MAX_VOLUMES + dev->vol_id;
+#endif
 	gd->private_data = dev;
 	sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
 	set_capacity(gd, disk_capacity);
@@ -405,7 +430,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	ret = blk_mq_alloc_tag_set(&dev->tag_set);
 	if (ret) {
 		dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
-		goto out_put_disk;
+		goto out_remove_minor;
 	}
 
 	dev->rq = blk_mq_init_queue(&dev->tag_set);
@@ -443,6 +468,10 @@ out_free_queue:
 	blk_cleanup_queue(dev->rq);
 out_free_tags:
 	blk_mq_free_tag_set(&dev->tag_set);
+out_remove_minor:
+#ifdef CONFIG_MTD_UBI_BLOCK_DYNAMIC_MINOR
+	ubiblock_remove_minor(gd->first_minor);
+#endif
 out_put_disk:
 	put_disk(dev->gd);
 out_free_dev:
@@ -461,6 +490,9 @@ static void ubiblock_cleanup(struct ubiblock *dev)
 	blk_cleanup_queue(dev->rq);
 	blk_mq_free_tag_set(&dev->tag_set);
 	dev_info(disk_to_dev(dev->gd), "released");
+#ifdef CONFIG_MTD_UBI_BLOCK_DYNAMIC_MINOR
+	ubiblock_remove_minor(dev->gd->first_minor);
+#endif
 	put_disk(dev->gd);
 }
 
-- 
2.2.0.rc0.207.ga3a616c
