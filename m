Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCD5U-00055Z-4T
 for linux-mtd@lists.infradead.org; Sun, 12 Jun 2016 21:38:33 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, dwmw2@infradead.org, dedekind1@gmail.com,
 Richard Weinberger <richard@nod.at>, Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH] Revert "mtd: switch ubi_open_volume_path() to vfs_stat()"
Date: Sun, 12 Jun 2016 23:37:53 +0200
Message-Id: <1465767473-30117-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This reverts commit 322ea0bbf3003df17b6253f76e572c37d79a6810.

vfs_stat() can only be used on user supplied buffers.
UBI's kapi.c is the API to the kernel and therefore vfs_stat()
is inappropriate.

This solves the problem that mounting any UBIFS will immediately
fail with -EINVAL.

Cc: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/kapi.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 348dbbc..cc6fa01 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -301,24 +301,27 @@ EXPORT_SYMBOL_GPL(ubi_open_volume_nm);
  */
 struct ubi_volume_desc *ubi_open_volume_path(const char *pathname, int mode)
 {
-	int error, ubi_num, vol_id;
-	struct kstat stat;
+	int error, ubi_num, vol_id, mod;
+	struct inode *inode;
+	struct path path;
 
 	dbg_gen("open volume %s, mode %d", pathname, mode);
 
 	if (!pathname || !*pathname)
 		return ERR_PTR(-EINVAL);
 
-	error = vfs_stat(pathname, &stat);
+	error = kern_path(pathname, LOOKUP_FOLLOW, &path);
 	if (error)
 		return ERR_PTR(error);
 
-	if (!S_ISCHR(stat.mode))
-		return ERR_PTR(-EINVAL);
-
-	ubi_num = ubi_major2num(MAJOR(stat.rdev));
-	vol_id = MINOR(stat.rdev) - 1;
+	inode = d_backing_inode(path.dentry);
+	mod = inode->i_mode;
+	ubi_num = ubi_major2num(imajor(inode));
+	vol_id = iminor(inode) - 1;
+	path_put(&path);
 
+	if (!S_ISCHR(mod))
+		return ERR_PTR(-EINVAL);
 	if (vol_id >= 0 && ubi_num >= 0)
 		return ubi_open_volume(ubi_num, vol_id, mode);
 	return ERR_PTR(-ENODEV);
-- 
2.7.3
