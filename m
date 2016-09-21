Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmpZC-0008Rt-31
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 22:00:35 +0000
Received: by mail-wm0-x241.google.com with SMTP id w84so10893122wmg.0
 for <linux-mtd@lists.infradead.org>; Wed, 21 Sep 2016 15:00:13 -0700 (PDT)
From: Pascal Eberhard <pascal.eberhard@gmail.com>
To: richard@nod.at
Cc: linux-mtd@lists.infradead.org, Pascal Eberhard <pascal.eberhard@gmail.com>
Subject: [PATCH] ubifs: fix host xattr_len when changing xattr
Date: Wed, 21 Sep 2016 23:57:30 +0200
Message-Id: <1474495050-13529-1-git-send-email-pascal.eberhard@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When an extended attribute is changed, xattr_len of host inode is
recalculated. ui->data_len is updated before computation and result
is wrong. This patch adds a temporary variable to fix computation.

To reproduce the issue:

~# > a.txt
~# attr -s an-attr -V a-value a.txt
~# attr -s an-attr -V a-bit-bigger-value a.txt

Now host inode xattr_len is wrong. Forcing dbg_check_filesystem()
generates the following error:

[  130.620140] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" started, PID 565
[  131.470790] UBIFS error (ubi0:2 pid 564): check_inodes: inode 646 has xattr size 240, but calculated size is 256
[  131.481697] UBIFS (ubi0:2): dump of the inode 646 sitting in LEB 29:114688
[  131.488953]  magic          0x6101831
[  131.492876]  crc            0x9fce9091
[  131.496836]  node_type      0 (inode node)
[  131.501193]  group_type     1 (in node group)
[  131.505788]  sqnum          9278
[  131.509191]  len            160
[  131.512549]  key            (646, inode)
[  131.516688]  creat_sqnum    9270
[  131.520133]  size           0
[  131.523264]  nlink          1
[  131.526398]  atime          1053025857.0
[  131.530574]  mtime          1053025857.0
[  131.534714]  ctime          1053025906.0
[  131.538849]  uid            0
[  131.542009]  gid            0
[  131.545140]  mode           33188
[  131.548636]  flags          0x1
[  131.551977]  xattr_cnt      1
[  131.555108]  xattr_size     240
[  131.558420]  xattr_names    12
[  131.561670]  compr_type     0x1
[  131.564983]  data len       0
[  131.568125] UBIFS error (ubi0:2 pid 564): dbg_check_filesystem: file-system check failed with error -22
[  131.578074] CPU: 0 PID: 564 Comm: mount Not tainted 4.4.12-g3639bea54a #24
[  131.585352] Hardware name: Generic AM33XX (Flattened Device Tree)
[  131.591918] [<c00151c0>] (unwind_backtrace) from [<c0012acc>] (show_stack+0x10/0x14)
[  131.600177] [<c0012acc>] (show_stack) from [<c01c950c>] (dbg_check_filesystem+0x464/0x4d0)
[  131.608934] [<c01c950c>] (dbg_check_filesystem) from [<c019f36c>] (ubifs_mount+0x14f8/0x2130)
[  131.617991] [<c019f36c>] (ubifs_mount) from [<c00d7088>] (mount_fs+0x14/0x98)
[  131.625572] [<c00d7088>] (mount_fs) from [<c00ed674>] (vfs_kern_mount+0x4c/0xd4)
[  131.633435] [<c00ed674>] (vfs_kern_mount) from [<c00efb5c>] (do_mount+0x988/0xb50)
[  131.641471] [<c00efb5c>] (do_mount) from [<c00f004c>] (SyS_mount+0x74/0xa0)
[  131.648837] [<c00f004c>] (SyS_mount) from [<c000fe20>] (ret_fast_syscall+0x0/0x3c)
[  131.665315] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" stops

Signed-off-by: Pascal Eberhard <pascal.eberhard@gmail.com>
---
 fs/ubifs/xattr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 11a0041..6c2f4d4 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -200,6 +200,7 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
 	struct ubifs_inode *host_ui = ubifs_inode(host);
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	void *buf = NULL;
+	int old_size;
 	struct ubifs_budget_req req = { .dirtied_ino = 2,
 		.dirtied_ino_d = ALIGN(size, 8) + ALIGN(host_ui->data_len, 8) };
 
@@ -217,12 +218,13 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
 	kfree(ui->data);
 	ui->data = buf;
 	inode->i_size = ui->ui_size = size;
+	old_size = ui->data_len;
 	ui->data_len = size;
 	mutex_unlock(&ui->ui_mutex);
 
 	mutex_lock(&host_ui->ui_mutex);
 	host->i_ctime = ubifs_current_time(host);
-	host_ui->xattr_size -= CALC_XATTR_BYTES(ui->data_len);
+	host_ui->xattr_size -= CALC_XATTR_BYTES(old_size);
 	host_ui->xattr_size += CALC_XATTR_BYTES(size);
 
 	/*
@@ -241,7 +243,7 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
 
 out_cancel:
 	host_ui->xattr_size -= CALC_XATTR_BYTES(size);
-	host_ui->xattr_size += CALC_XATTR_BYTES(ui->data_len);
+	host_ui->xattr_size += CALC_XATTR_BYTES(old_size);
 	mutex_unlock(&host_ui->ui_mutex);
 	make_bad_inode(inode);
 out_free:
-- 
2.7.4
