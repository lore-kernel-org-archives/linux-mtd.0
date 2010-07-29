Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OeRKM-0006oy-1v
	for linux-mtd@lists.infradead.org; Thu, 29 Jul 2010 11:31:07 +0000
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L6B005JUHBRK520@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 29 Jul 2010 20:31:03 +0900 (KST)
Received: from roh83 ([107.108.214.183])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L6B00802HBNYF@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 29 Jul 2010 20:31:03 +0900 (KST)
Date: Thu, 29 Jul 2010 17:00:59 +0530
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Subject: [PATCH 1/1][MTD] Adding IOCTLs for run-time partitioning support
To: linux-mtd@lists.infradead.org
Message-id: <000101cb2f11$86c3f5d0$944be170$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-language: en-us
Content-transfer-encoding: 7BIT
Cc: v.dalal@samsung.com, 'David Woodhouse' <dwmw2@infradead.org>,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All

Sending the patch on MTD for adding four IOCTLs.
MTDPARTITIONCREATE
MTDPARTITIONDELETE
MTDPARTITIONSETPERMISSION
MTDPARTITIONMERGE



Signed-off-by: Rohit HS <rohit.hs@samsung.com>
---
drivers/mtd/mtdchar.c |  126 ++++++++++++++++++++++++++++++++++++++++++++++++++
include/mtd/mtd-abi.h |   17 ++++++
2 files changed, 142 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 8b223c0..704788c 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -22,6 +22,10 @@
 
 #include <asm/uaccess.h>
 
+#ifdef CONFIG_MTD_PARTITIONS
+#include <linux/mtd/partitions.h>
+#endif
+
 #define MTD_INODE_FS_MAGIC 0x11307854
 static struct vfsmount *mtd_inode_mnt __read_mostly;
 
@@ -826,6 +830,128 @@ static int mtd_ioctl(struct inode *inode, struct file *file,
 		}
 		file->f_pos = 0;
 		break;
+#ifdef CONFIG_MTD_PARTITIONS
+
+		case MTDPARTITIONCREATE:
+		{
+		struct mtd_partition *pst_minfo = NULL;
+		struct mtd_partition *pst_minfo_hold = NULL;
+		struct mtd_partition st_free;
+		uint64_t u64_userfreeoffset = 0;
+		uint64_t u64_userfreesize = 0;
+		struct user_mtd *puser_partitions = NULL;
+		struct user_mtd_info upartition;
+		int i;
+
+			if (copy_from_user(&upartition, argp,
+				sizeof(struct user_mtd_info))) {
+				ret = -EFAULT;
+				break;
+			}
+			puser_partitions = kzalloc(sizeof(struct user_mtd)*
+						upartition.num_partitions
+						, GFP_KERNEL);
+			pst_minfo = kzalloc(sizeof(struct mtd_partition)*
+					upartition.num_partitions,
+					GFP_KERNEL);
+			pst_minfo_hold = pst_minfo;
+			if (puser_partitions == NULL) {
+				ret = -EFAULT;
+				break;
+			}
+			if (copy_from_user(puser_partitions,
+					upartition.pst_user_partitions,
+					sizeof(struct user_mtd)*
+					upartition.num_partitions)) {
+				ret = -EFAULT;
+				break;
+			}
+			for (i = 0; i < upartition.num_partitions; i++) {
+				pst_minfo->name  = puser_partitions->name;
+				pst_minfo->size  =
+					puser_partitions->partition_size;
+				u64_userfreesize += pst_minfo->size;
+				pst_minfo->offset =
+					puser_partitions->partition_offset;
+				u64_userfreeoffset += pst_minfo->offset;
+				pst_minfo->mask_flags =
+					puser_partitions->partition_mask;
+
+				puser_partitions++;
+				pst_minfo++;
+			}
+			add_mtd_partitions(mtd, pst_minfo_hold,
+						upartition.num_partitions);
+			if ((mtd->size - u64_userfreesize) > 0) {
+				st_free.name	= "FREE";
+				st_free.size	= mtd->size - u64_userfreesize;
+				st_free.offset	= u64_userfreesize;
+				st_free.mask_flags = 0;
+				add_mtd_partitions(mtd, &st_free, 1);
+			}
+		break;
+		}
+		case MTDPARTITIONDELETE:
+		{
+		struct mtd_info *pst_del_info = NULL;
+		uint32_t mtd_partition_number;
+
+			if (copy_from_user(&mtd_partition_number, argp,
+					sizeof(mtd_partition_number))) {
+				ret = -EFAULT;
+				break;
+			}
+			pst_del_info = get_mtd_device(NULL,
+					mtd_partition_number);
+
+			if (pst_del_info != NULL) {
+				put_mtd_device(pst_del_info);
+				del_mtd_device(pst_del_info);
+			}
+			break;
+		}
+		case MTDPARTITIONSETPERMISSION:
+		{
+		uint32_t u32_mask_flags;
+		struct mtd_info *pst_device = NULL;
+		int i32_dev_num;
+
+			if (copy_from_user(&u32_mask_flags, argp,
+					sizeof(u32_mask_flags))) {
+				ret = -EFAULT;
+				break;
+			}
+			i32_dev_num = (u32_mask_flags & 0x0000FFFF);
+			u32_mask_flags = (u32_mask_flags & 0xFFFF0000) >> 16;
+			pst_device = get_mtd_device(NULL, i32_dev_num);
+			pst_device->flags = u32_mask_flags;
+			break;
+		}
+		case MTDPARTITIONMERGE:
+		{
+		struct mtd_info *pst_merge_device1 = NULL;
+		struct mtd_info *pst_merge_device2 = NULL;
+		unsigned char partition_number[2];
+
+			if (copy_from_user(partition_number, argp, 2)) {
+				ret = -EFAULT;
+				break;
+			}
+			pst_merge_device1 = get_mtd_device(NULL,
+							partition_number[0]);
+			pst_merge_device2 = get_mtd_device(NULL,
+							partition_number[1]);
+			if ((pst_merge_device1 != NULL) &&
+				(pst_merge_device2 != NULL)) {
+				pst_merge_device1->size +=
+						pst_merge_device2->size;
+				put_mtd_device(pst_merge_device2);
+				del_mtd_device(pst_merge_device2);
+			}
+			break;
+		}
+#endif
+
 	}
 
 	default:
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index be51ae2..85168f2 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -30,6 +30,18 @@ struct mtd_oob_buf64 {
 	__u64 usr_ptr;
 };
 
+struct user_mtd {
+	char name[32];
+	 __u64 partition_size;
+	 __u64 partition_offset;
+	 __u32 partition_mask;
+};
+
+struct user_mtd_info {
+	struct user_mtd *pst_user_partitions;
+	__u32 num_partitions;
+};
+
 #define MTD_ABSENT		0
 #define MTD_RAM			1
 #define MTD_ROM			2
@@ -110,7 +122,10 @@ struct otp_info {
 #define MEMERASE64		_IOW('M', 20, struct erase_info_user64)
 #define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
 #define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
-
+#define MTDPARTITIONCREATE      _IOW('M', 23, int)
+#define MTDPARTITIONDELETE      _IOW('M', 24, int)
+#define MTDPARTITIONSETPERMISSION _IOW('M', 26, int)
+#define MTDPARTITIONMERGE       _IOW('M', 27, int)
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
  * interfaces
---
