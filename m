Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXfnk-0004Jz-Cn
 for linux-mtd@lists.infradead.org; Tue, 17 Mar 2015 00:56:09 +0000
Received: by iecsl2 with SMTP id sl2so185595102iec.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2015 17:55:46 -0700 (PDT)
Sender: Daniel Ehrenberg <dehrenberg@google.com>
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: [PATCH v2] UBI: block: Dynamically allocate minor numbers
Date: Mon, 16 Mar 2015 17:55:43 -0700
Message-Id: <1426553743-5398-1-git-send-email-dehrenberg@chromium.org>
Cc: gwendal@chromium.org, Dan Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch makes ubiblock devices have minor numbers beginning from
0, allocated dynamically independently of the ubi device/volume
number. This property becomes useful because, on 32-bit architectures
with LFS turned off in a userspace program, device minor numbers
over 8 bits cause stat to return -EOVERFLOW. If the device number is
high (>1) due to multiple MTD partitions, such an overflow will occur.
While enabling LFS is clearly a nicer solution, it's often difficult
to turn on in practice globally as many widely distributed packages
don't work with LFS on.

Other storage systems have their own workarounds, with SCSI making
multiple device majors and MMC having a config option for the number
of partitions per device. A completely dynamic minor numbering is
simpler than these. It is unlikely that anyone is depending on a
static minor number since the major is dynamic anyway. In addition,
ubiblock is still relatively new, so now is the time to make such
changes.

Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>

---
Changes in v2: Removed config option and made dynamic minor universal

 drivers/mtd/ubi/block.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index db2c05b..6faf268 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -48,6 +48,7 @@
 #include <linux/blk-mq.h>
 #include <linux/hdreg.h>
 #include <linux/scatterlist.h>
+#include <linux/idr.h>
 #include <asm/div64.h>
 
 #include "ubi-media.h"
@@ -351,6 +352,18 @@ static struct blk_mq_ops ubiblock_mq_ops = {
 	.map_queue      = blk_mq_map_queue,
 };
 
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
+
 int ubiblock_create(struct ubi_volume_info *vi)
 {
 	struct ubiblock *dev;
@@ -388,7 +401,13 @@ int ubiblock_create(struct ubi_volume_info *vi)
 
 	gd->fops = &ubiblock_ops;
 	gd->major = ubiblock_major;
-	gd->first_minor = dev->ubi_num * UBI_MAX_VOLUMES + dev->vol_id;
+	gd->first_minor = ubiblock_alloc_minor(dev);
+	if (gd->first_minor < 0) {
+		dev_err(disk_to_dev(gd),
+			"block: dynamic minor allocation failed");
+		ret = -ENODEV;
+		goto out_put_disk;
+	}
 	gd->private_data = dev;
 	sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
 	set_capacity(gd, disk_capacity);
@@ -405,7 +424,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	ret = blk_mq_alloc_tag_set(&dev->tag_set);
 	if (ret) {
 		dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
-		goto out_put_disk;
+		goto out_remove_minor;
 	}
 
 	dev->rq = blk_mq_init_queue(&dev->tag_set);
@@ -443,6 +462,8 @@ out_free_queue:
 	blk_cleanup_queue(dev->rq);
 out_free_tags:
 	blk_mq_free_tag_set(&dev->tag_set);
+out_remove_minor:
+	ubiblock_remove_minor(gd->first_minor);
 out_put_disk:
 	put_disk(dev->gd);
 out_free_dev:
@@ -461,6 +482,7 @@ static void ubiblock_cleanup(struct ubiblock *dev)
 	blk_cleanup_queue(dev->rq);
 	blk_mq_free_tag_set(&dev->tag_set);
 	dev_info(disk_to_dev(dev->gd), "released");
+	ubiblock_remove_minor(dev->gd->first_minor);
 	put_disk(dev->gd);
 }
 
-- 
2.2.0.rc0.207.ga3a616c
