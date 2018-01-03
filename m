Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eWYlB-00047V-Pw
 for linux-mtd@lists.infradead.org; Wed, 03 Jan 2018 02:26:31 +0000
Received: by mail-yb0-x244.google.com with SMTP id q3so114363ybg.9
 for <linux-mtd@lists.infradead.org>; Tue, 02 Jan 2018 18:26:18 -0800 (PST)
From: Bradley Bolen <bradleybolen@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: cyrille.pitchen@wedev4u.fr, marek.vasut@gmail.com,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, richard@nod.at, dedekind1@gmail.com,
 Bradley Bolen <bradleybolen@gmail.com>
Subject: [PATCH] UBI: block: Must use a mutex when using idr_alloc/idr_remove
Date: Tue,  2 Jan 2018 21:26:09 -0500
Message-Id: <1514946369-3674-1-git-send-email-bradleybolen@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes a race condition where running ubiblock on multiple volumes
simultaneously produces the following splat.

kernel BUG at kernel-source/fs/sysfs/group.c:113!
Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
[<c01e4160>] (internal_create_group) from [<c01e43fc>]
(sysfs_create_group+0x20/0x24)
[<c01e43fc>] (sysfs_create_group) from [<c00e4800>]
(blk_trace_init_sysfs+0x18/0x20)
[<c00e4800>] (blk_trace_init_sysfs) from [<c02bc734>]
(blk_register_queue+0x6c/0x154)
[<c02bc734>] (blk_register_queue) from [<c02cd610>]
(device_add_disk+0x2c8/0x450)
[<c02cd610>] (device_add_disk) from [<c0430fac>]
(ubiblock_create+0x254/0x2e4)
[<c0430fac>] (ubiblock_create) from [<c0421a3c>]
(vol_cdev_ioctl+0x3e0/0x564)
[<c0421a3c>] (vol_cdev_ioctl) from [<c018a55c>] (vfs_ioctl+0x30/0x44)
[<c018a55c>] (vfs_ioctl) from [<c018ad2c>] (do_vfs_ioctl+0x694/0x798)
[<c018ad2c>] (do_vfs_ioctl) from [<c018ae74>] (SyS_ioctl+0x44/0x6c)
[<c018ae74>] (SyS_ioctl) from [<c0010720>] (ret_fast_syscall+0x0/0x34)

Signed-off-by: Bradley Bolen <bradleybolen@gmail.com>
---
 drivers/mtd/ubi/block.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index b210fdb..1c12370 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -390,7 +390,9 @@ int ubiblock_create(struct ubi_volume_info *vi)
 
 	gd->fops = &ubiblock_ops;
 	gd->major = ubiblock_major;
+	mutex_lock(&devices_mutex);
 	gd->first_minor = idr_alloc(&ubiblock_minor_idr, dev, 0, 0, GFP_KERNEL);
+	mutex_unlock(&devices_mutex);
 	if (gd->first_minor < 0) {
 		dev_err(disk_to_dev(gd),
 			"block: dynamic minor allocation failed");
@@ -452,7 +454,9 @@ int ubiblock_create(struct ubi_volume_info *vi)
 out_free_tags:
 	blk_mq_free_tag_set(&dev->tag_set);
 out_remove_minor:
+	mutex_lock(&devices_mutex);
 	idr_remove(&ubiblock_minor_idr, gd->first_minor);
+	mutex_unlock(&devices_mutex);
 out_put_disk:
 	put_disk(dev->gd);
 out_free_dev:
@@ -471,7 +475,9 @@ static void ubiblock_cleanup(struct ubiblock *dev)
 	blk_cleanup_queue(dev->rq);
 	blk_mq_free_tag_set(&dev->tag_set);
 	dev_info(disk_to_dev(dev->gd), "released");
+	mutex_lock(&devices_mutex);
 	idr_remove(&ubiblock_minor_idr, dev->gd->first_minor);
+	mutex_unlock(&devices_mutex);
 	put_disk(dev->gd);
 }
 
-- 
1.9.3
