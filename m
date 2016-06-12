Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCECF-0003bX-Ik
 for linux-mtd@lists.infradead.org; Sun, 12 Jun 2016 22:49:36 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, dwmw2@infradead.org, dedekind1@gmail.com,
 Richard Weinberger <richard@nod.at>, Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH] Revert "mtd: switch open_mtd_by_chdev() to use of vfs_stat()"
Date: Mon, 13 Jun 2016 00:49:03 +0200
Message-Id: <1465771744-16926-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This reverts commit 87f15d4add758fb7fc76655721af94be57a4c17d.

vfs_stat() can only be used on user supplied buffers.

Cc: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 16baeb5..7091fca 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1147,19 +1147,22 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
  */
 static struct mtd_info * __init open_mtd_by_chdev(const char *mtd_dev)
 {
-	struct kstat stat;
-	int err, minor;
+	int err, major, minor, mode;
+	struct path path;
 
 	/* Probably this is an MTD character device node path */
-	err = vfs_stat(mtd_dev, &stat);
+	err = kern_path(mtd_dev, LOOKUP_FOLLOW, &path);
 	if (err)
 		return ERR_PTR(err);
 
 	/* MTD device number is defined by the major / minor numbers */
-	if (MAJOR(stat.rdev) != MTD_CHAR_MAJOR || !S_ISCHR(stat.mode))
+	major = imajor(d_backing_inode(path.dentry));
+	minor = iminor(d_backing_inode(path.dentry));
+	mode = d_backing_inode(path.dentry)->i_mode;
+	path_put(&path);
+	if (major != MTD_CHAR_MAJOR || !S_ISCHR(mode))
 		return ERR_PTR(-EINVAL);
 
-	minor = MINOR(stat.rdev);
 	if (minor & 1)
 		/*
 		 * Just do not think the "/dev/mtdrX" devices support is need,
-- 
2.7.3
