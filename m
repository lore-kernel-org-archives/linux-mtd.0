Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjZV0-00039V-MJ
 for linux-mtd@lists.infradead.org; Wed, 16 Jan 2019 00:56:08 +0000
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>
CC: <richard@nod.at>, <dedekind1@gmail.com>, <boris.brezillon@bootlin.com>
Subject: [PATCH] ubi: account the fastmap data blocks when checking found_pebs
Date: Wed, 16 Jan 2019 08:59:35 +0800
Message-ID: <20190116005935.141529-1-houtao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now the data blocks used by current fastmap are not tracked by
wear-leveling subsystem. So taking these blocks into account
when checking found_pebs in ubi_wl_init(), else there will
be ubi assertion as shown below when fastmap is enabled on
a large NAND Flash (e.g. 2GB):

[  335.877389] UBI assert failed in ubi_wl_init at 1705 (pid 2349)
[  335.878315] CPU: 7 PID: 2349 Comm: ubiattach Not tainted 4.20.0-10912-gd5d655675196-dirty #1
[  335.879436] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
[  335.881012] Call Trace:
[  335.881402]  dump_stack+0x5b/0x8b
[  335.881869]  ubi_wl_init+0xf8b/0x1500
[  335.882960]  ubi_attach+0x63b/0xaa0
[  335.883889]  ubi_attach_mtd_dev+0x107f/0x2e50
[  335.887300]  ctrl_cdev_ioctl+0x13e/0x1d0
[  335.888910]  do_vfs_ioctl+0x197/0xe60
[  335.893337]  ksys_ioctl+0x66/0x70
[  335.893788]  __x64_sys_ioctl+0x6f/0xb0
[  335.894309]  do_syscall_64+0x91/0x270
[  335.895337]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 drivers/mtd/ubi/ubi.h | 13 +++++++++++++
 drivers/mtd/ubi/wl.c  |  3 ++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index d47b9e436e67..90c28522aa07 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -1235,4 +1235,17 @@ static inline struct ubi_wl_entry *ubi_find_fm_block(const struct ubi_device *ub
 	return NULL;
 }
 
+/**
+ * ubi_fm_data_blocks - return the number of data blocks used by fastmap
+ * @ubi: UBI device description object
+ *
+ * This function returns zero if fastmap is not available.
+ */
+static inline int ubi_fm_data_blocks(struct ubi_device *ubi)
+{
+	/* the first block is the super block of fastmap */
+	if (ubi->fm)
+		return ubi->fm->used_blocks - 1;
+	return 0;
+}
 #endif /* !__UBI_UBI_H__ */
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 6f2ac865ff05..1b8f37ed8063 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1702,7 +1702,8 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 
 	dbg_wl("found %i PEBs", found_pebs);
 
-	ubi_assert(ubi->good_peb_count == found_pebs);
+	ubi_assert(ubi->good_peb_count ==
+		   found_pebs + ubi_fm_data_blocks(ubi));
 
 	reserved_pebs = WL_RESERVED_PEBS;
 	ubi_fastmap_init(ubi, &reserved_pebs);
-- 
2.16.2.dirty
