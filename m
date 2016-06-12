Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCECF-0003bW-Ik
 for linux-mtd@lists.infradead.org; Sun, 12 Jun 2016 22:49:36 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, dwmw2@infradead.org, dedekind1@gmail.com,
 Richard Weinberger <richard@nod.at>, Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH] ubi: Don't bypass ->getattr()
Date: Mon, 13 Jun 2016 00:49:04 +0200
Message-Id: <1465771744-16926-2-git-send-email-richard@nod.at>
In-Reply-To: <1465771744-16926-1-git-send-email-richard@nod.at>
References: <1465771744-16926-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Directly accessing inode fields bypasses ->getattr()
and can cause problems when the underlying filesystem
does not have the default ->getattr() implementation.

So instead of obtaining the backing inode via d_backing_inode()
use vfs_getattr() and obtain what we need from the kstat struct.

Cc: Al Viro <viro@zeniv.linux.org.uk>
Reported-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c | 16 ++++++++++------
 drivers/mtd/ubi/kapi.c  | 17 ++++++++++-------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 7091fca..ef36182 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1147,22 +1147,26 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
  */
 static struct mtd_info * __init open_mtd_by_chdev(const char *mtd_dev)
 {
-	int err, major, minor, mode;
+	int err, minor;
 	struct path path;
+	struct kstat stat;
 
 	/* Probably this is an MTD character device node path */
 	err = kern_path(mtd_dev, LOOKUP_FOLLOW, &path);
 	if (err)
 		return ERR_PTR(err);
 
-	/* MTD device number is defined by the major / minor numbers */
-	major = imajor(d_backing_inode(path.dentry));
-	minor = iminor(d_backing_inode(path.dentry));
-	mode = d_backing_inode(path.dentry)->i_mode;
+	err = vfs_getattr(&path, &stat);
 	path_put(&path);
-	if (major != MTD_CHAR_MAJOR || !S_ISCHR(mode))
+	if (err)
+		return ERR_PTR(err);
+
+	/* MTD device number is defined by the major / minor numbers */
+	if (MAJOR(stat.rdev) != MTD_CHAR_MAJOR || !S_ISCHR(stat.mode))
 		return ERR_PTR(-EINVAL);
 
+	minor = MINOR(stat.rdev);
+
 	if (minor & 1)
 		/*
 		 * Just do not think the "/dev/mtdrX" devices support is need,
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index cc6fa01..a9e2cef 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -301,9 +301,9 @@ EXPORT_SYMBOL_GPL(ubi_open_volume_nm);
  */
 struct ubi_volume_desc *ubi_open_volume_path(const char *pathname, int mode)
 {
-	int error, ubi_num, vol_id, mod;
-	struct inode *inode;
+	int error, ubi_num, vol_id;
 	struct path path;
+	struct kstat stat;
 
 	dbg_gen("open volume %s, mode %d", pathname, mode);
 
@@ -314,14 +314,17 @@ struct ubi_volume_desc *ubi_open_volume_path(const char *pathname, int mode)
 	if (error)
 		return ERR_PTR(error);
 
-	inode = d_backing_inode(path.dentry);
-	mod = inode->i_mode;
-	ubi_num = ubi_major2num(imajor(inode));
-	vol_id = iminor(inode) - 1;
+	error = vfs_getattr(&path, &stat);
 	path_put(&path);
+	if (error)
+		return ERR_PTR(error);
 
-	if (!S_ISCHR(mod))
+	if (!S_ISCHR(stat.mode))
 		return ERR_PTR(-EINVAL);
+
+	ubi_num = ubi_major2num(MAJOR(stat.rdev));
+	vol_id = MINOR(stat.rdev) - 1;
+
 	if (vol_id >= 0 && ubi_num >= 0)
 		return ubi_open_volume(ubi_num, vol_id, mode);
 	return ERR_PTR(-ENODEV);
-- 
2.7.3
