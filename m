From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: add BLKPG API based repartition support
Date: Fri, 17 Sep 2010 13:31:42 +0300
Message-Id: <1284719502-24183-3-git-send-email-roman.tereshonkov@nokia.com>
In-Reply-To: <1284719502-24183-2-git-send-email-roman.tereshonkov@nokia.com>
References: <1284719502-24183-1-git-send-email-roman.tereshonkov@nokia.com>
	<1284719502-24183-2-git-send-email-roman.tereshonkov@nokia.com>
Cc: dwmw2@infradead.org, Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for mtd repartition based on the block
device BLKPG interface:
BLKPG_ADD_PARTITION - for partition creation;
BLKPG_DEL_PARTITION - for partition delete

The usage is based on BLKPG ioctl called with
struct blkpg_ioctl_arg argument which includes the
reference to struct blkpg_partition discribing the
partition offset and length.

Disadvantage: there is no implementation for mtd
flags control. The flags are always borrowed from
the master device.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/mtdchar.c |   62 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index a825002..3171a4d 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -30,8 +30,9 @@
 #include <linux/backing-dev.h>
 #include <linux/compat.h>
 #include <linux/mount.h>
-
+#include <linux/blkpg.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
 #include <linux/mtd/map.h>
 
 #include <asm/uaccess.h>
@@ -477,6 +478,47 @@ static int mtd_do_readoob(struct mtd_info *mtd, uint64_t start,
 	return ret;
 }
 
+#ifdef CONFIG_MTD_PARTITIONS
+static int mtd_blkpg_ioctl(struct mtd_info *mtd,
+			   struct blkpg_ioctl_arg __user *arg)
+{
+	struct blkpg_ioctl_arg a;
+	struct blkpg_partition p;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	/* Only master mtd device must be used to control partitions */
+	if (!mtd_is_master(mtd))
+		return -EACCES;
+
+	if (copy_from_user(&a, arg, sizeof(struct blkpg_ioctl_arg)))
+		return -EFAULT;
+
+	if (!access_ok(VERIFY_READ, a.data, sizeof(struct blkpg_partition)))
+		return -EFAULT;
+	if (copy_from_user(&p, a.data, sizeof(struct blkpg_partition)))
+		return -EFAULT;
+
+	switch (a.op) {
+	case BLKPG_ADD_PARTITION:
+
+		return mtd_add_partition(mtd, p.devname, p.start, p.length);
+
+	case BLKPG_DEL_PARTITION:
+
+		if (p.pno < 0)
+			return -EINVAL;
+
+		return mtd_del_partition(mtd, p.pno);
+
+	default:
+		return -EINVAL;
+	}
+}
+#endif
+
+
 static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 {
 	struct mtd_file_info *mfi = file->private_data;
@@ -855,6 +897,22 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		break;
 	}
 
+#ifdef CONFIG_MTD_PARTITIONS
+	case BLKPG:
+	{
+		ret = mtd_blkpg_ioctl(mtd,
+		      (struct blkpg_ioctl_arg __user *)arg);
+		break;
+	}
+
+	case BLKRRPART:
+	{
+		/* No reread partition feature. Just return ok */
+		ret = 0;
+		break;
+	}
+#endif
+
 	default:
 		ret = -ENOTTY;
 	}
@@ -1033,7 +1091,7 @@ static int mtd_inodefs_get_sb(struct file_system_type *fs_type, int flags,
                                const char *dev_name, void *data,
                                struct vfsmount *mnt)
 {
-        return get_sb_pseudo(fs_type, "mtd_inode:", NULL, MTD_INODE_FS_MAGIC,
+	return get_sb_pseudo(fs_type, "mtd_inode:", NULL, MTD_INODE_FS_MAGIC,
                              mnt);
 }
 
-- 
1.6.2.4
