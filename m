Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OPYVA-0000H0-4m
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2010 10:08:48 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o5IA5lJ5021843
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jun 2010 13:08:41 +0300
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] mtd: add MTDREPARTITION ioctl
Date: Fri, 18 Jun 2010 13:08:30 +0300
Message-Id: <1276855711-18570-4-git-send-email-roman.tereshonkov@nokia.com>
In-Reply-To: <1276855711-18570-3-git-send-email-roman.tereshonkov@nokia.com>
References: <1276855711-18570-1-git-send-email-roman.tereshonkov@nokia.com>
	<1276855711-18570-2-git-send-email-roman.tereshonkov@nokia.com>
	<1276855711-18570-3-git-send-email-roman.tereshonkov@nokia.com>
Cc: Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add MTDREPARTITION ioctl to modify all partitions for given mtd
master device. The partitions having the same master are modified
all at once: all previous are deleted and the new set is created.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/mtdchar.c |  110 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 109 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 91c8013..ccdccad 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -19,7 +19,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/compatmac.h>
-
+#include <linux/mtd/partitions.h>
 #include <asm/uaccess.h>
 
 #define MTD_INODE_FS_MAGIC 0x11307854
@@ -463,6 +463,65 @@ static int mtd_do_readoob(struct mtd_info *mtd, uint64_t start,
 	return ret;
 }
 
+#ifdef CONFIG_MTD_PARTITIONS
+static int mtd_do_repartition(struct file *file, struct mtd_info *mtd,
+				uint32_t nparts, void __user *ptr)
+{
+	struct mtd_partition *parts;
+	struct mtd_partition_user *up;
+	int size, i, ret = -ENOMEM;
+
+	if (!(file->f_mode & FMODE_WRITE))
+		return -EPERM;
+
+	size = nparts * sizeof(struct mtd_partition_user);
+	if (!size)
+		return -EINVAL;
+
+	if (!access_ok(VERIFY_READ, ptr, size))
+		return -EFAULT;
+
+	up = kmalloc(size, GFP_KERNEL);
+	if (!up)
+		return -ENOMEM;
+
+	if (copy_from_user(up, ptr, size)) {
+		ret = -EFAULT;
+		goto err_free_up;
+	}
+
+	size = nparts * sizeof(struct mtd_partition);
+	parts = kzalloc(size, GFP_KERNEL);
+	if (!parts)
+		goto err_free_up;
+
+	for (i = 0; i < nparts; i++) {
+		parts[i].offset = up[i].offset;
+		parts[i].size = up[i].size;
+		parts[i].mask_flags = up[i].mask_flags;
+
+		parts[i].name = kstrndup(up[i].name, MTD_MAX_PARTITION_NAME_LEN,
+					 GFP_KERNEL);
+		if (!parts[i].name)
+			goto err_free;
+	}
+
+	ret = del_mtd_partitions(mtd);
+	if (!ret)
+		ret = add_mtd_partitions(mtd, parts, nparts);
+
+ err_free:
+	for (i = 0; i < nparts; i++)
+		kfree(parts[i].name);
+	kfree(parts);
+ err_free_up:
+	kfree(up);
+
+	return ret;
+}
+#endif
+
+
 static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 {
 	struct mtd_file_info *mfi = file->private_data;
@@ -826,7 +885,25 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		file->f_pos = 0;
 		break;
 	}
+#ifdef CONFIG_MTD_PARTITIONS
+	case MTDREPARTITION:
+	{
+		struct mtd_partitions p;
+		struct mtd_info *master;
+
+		/* only root (no assigned master) device can be accessed */
+		master = part_get_mtd_master(mtd);
+		if (master)
+			return -EACCES;
+
+		if (copy_from_user(&p, argp, sizeof(p)))
+			return -EFAULT;
+
+		ret = mtd_do_repartition(file, mtd, p.nparts, p.parts);
 
+		break;
+	}
+#endif
 	default:
 		ret = -ENOTTY;
 	}
@@ -856,6 +933,15 @@ struct mtd_oob_buf32 {
 #define MEMWRITEOOB32		_IOWR('M', 3, struct mtd_oob_buf32)
 #define MEMREADOOB32		_IOWR('M', 4, struct mtd_oob_buf32)
 
+#ifdef CONFIG_MTD_PARTITIONS
+struct mtd_partitions32 {
+	uint32_t nparts;
+	compat_caddr_t ptr;
+};
+
+#define MTDREPARTITION32	_IOW('M', 23, struct mtd_partitions32)
+#endif
+
 static long mtd_compat_ioctl(struct file *file, unsigned int cmd,
 	unsigned long arg)
 {
@@ -895,6 +981,28 @@ static long mtd_compat_ioctl(struct file *file, unsigned int cmd,
 				&buf_user->start);
 		break;
 	}
+
+#ifdef CONFIG_MTD_PARTITIONS
+	case MTDREPARTITION32:
+	{
+		struct mtd_partitions32 p;
+		struct mtd_info *master;
+
+		/* only root (no assigned master) device can be accessed */
+		master = part_get_mtd_master(mtd);
+		if (!master) {
+			if (copy_from_user(&p, argp, sizeof(p)))
+				ret = -EFAULT;
+			else
+				ret = mtd_do_repartition(file, mtd, p.nparts,
+							 compat_ptr(p.ptr));
+		} else {
+			ret = -EACCES;
+		}
+
+		break;
+	}
+#endif
 	default:
 		ret = mtd_ioctl(file, cmd, (unsigned long)argp);
 	}
-- 
1.6.2.4
