Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSORf-0001qg-8q
 for linux-mtd@lists.infradead.org; Fri, 22 Dec 2017 14:37:09 +0000
Received: by mail-wm0-x242.google.com with SMTP id f9so22138713wmh.0
 for <linux-mtd@lists.infradead.org>; Fri, 22 Dec 2017 06:36:54 -0800 (PST)
From: Dongsu Park <dongsu@kinvolk.io>
To: linux-kernel@vger.kernel.org
Cc: containers@lists.linux-foundation.org, Alban Crequy <alban@kinvolk.io>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Miklos Szeredi <mszeredi@redhat.com>,
 Seth Forshee <seth.forshee@canonical.com>,
 Sargun Dhillon <sargun@sargun.me>, Dongsu Park <dongsu@kinvolk.io>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 02/11] mtd: Check permissions towards mtd block device inode
 when mounting
Date: Fri, 22 Dec 2017 15:32:26 +0100
Message-Id: <945d325a2239efcd55273abb2bac41cfc7264fea.1512041070.git.dongsu@kinvolk.io>
In-Reply-To: <cover.1512741134.git.dongsu@kinvolk.io>
References: <cover.1512741134.git.dongsu@kinvolk.io>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Seth Forshee <seth.forshee@canonical.com>

Unprivileged users should not be able to mount mtd block devices
when they lack sufficient privileges towards the block device
inode.  Update mount_mtd() to validate that the user has the
required access to the inode at the specified path. The check
will be skipped for CAP_SYS_ADMIN, so privileged mounts will
continue working as before.

Patch v3 is available: https://patchwork.kernel.org/patch/7640011/

Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
Signed-off-by: Dongsu Park <dongsu@kinvolk.io>
---
 drivers/mtd/mtdsuper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
index 4a4d40c0..3c8734f3 100644
--- a/drivers/mtd/mtdsuper.c
+++ b/drivers/mtd/mtdsuper.c
@@ -129,6 +129,7 @@ struct dentry *mount_mtd(struct file_system_type *fs_type, int flags,
 #ifdef CONFIG_BLOCK
 	struct block_device *bdev;
 	int ret, major;
+	int perm;
 #endif
 	int mtdnr;
 
@@ -180,7 +181,10 @@ struct dentry *mount_mtd(struct file_system_type *fs_type, int flags,
 	/* try the old way - the hack where we allowed users to mount
 	 * /dev/mtdblock$(n) but didn't actually _use_ the blockdev
 	 */
-	bdev = lookup_bdev(dev_name, 0);
+	perm = MAY_READ;
+	if (!(flags & MS_RDONLY))
+		perm |= MAY_WRITE;
+	bdev = lookup_bdev(dev_name, perm);
 	if (IS_ERR(bdev)) {
 		ret = PTR_ERR(bdev);
 		pr_debug("MTDSB: lookup_bdev() returned %d\n", ret);
-- 
2.13.6
