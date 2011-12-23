Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9ZY-0005Er-FS
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:10:25 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/28] mtd: mtdchar: rename functions
Date: Fri, 23 Dec 2011 20:10:54 +0200
Message-Id: <1324663880-22477-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
References: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

We are going to re-work the MTD interface and change 'mtd->write()' to
'mtd_write()', 'mtd->read()' to 'mtd_read()' and so forth for all functions
in the 'struct mtd_info' structure.

However, mtdchar.c has its own 'mtd_read()', 'mtd_write()', etc functions
which collide with our changes. This patch renames these functions
to 'mtdchar_read()', 'mtdchar_write()', etc.

Additionally, to make the 'mtdchar.c' file look consistent, rename
similarly all the other functions starting with 'mtd_'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdchar.c |   76 +++++++++++++++++++++++++------------------------
 1 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index e7dc732..00423cc 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -51,7 +51,7 @@ struct mtd_file_info {
 	enum mtd_file_modes mode;
 };
 
-static loff_t mtd_lseek (struct file *file, loff_t offset, int orig)
+static loff_t mtdchar_lseek(struct file *file, loff_t offset, int orig)
 {
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
@@ -77,7 +77,7 @@ static loff_t mtd_lseek (struct file *file, loff_t offset, int orig)
 
 
 
-static int mtd_open(struct inode *inode, struct file *file)
+static int mtdchar_open(struct inode *inode, struct file *file)
 {
 	int minor = iminor(inode);
 	int devnum = minor >> 1;
@@ -142,11 +142,11 @@ static int mtd_open(struct inode *inode, struct file *file)
 out:
 	mutex_unlock(&mtd_mutex);
 	return ret;
-} /* mtd_open */
+} /* mtdchar_open */
 
 /*====================================================================*/
 
-static int mtd_close(struct inode *inode, struct file *file)
+static int mtdchar_close(struct inode *inode, struct file *file)
 {
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
@@ -164,7 +164,7 @@ static int mtd_close(struct inode *inode, struct file *file)
 	kfree(mfi);
 
 	return 0;
-} /* mtd_close */
+} /* mtdchar_close */
 
 /* Back in June 2001, dwmw2 wrote:
  *
@@ -184,7 +184,8 @@ static int mtd_close(struct inode *inode, struct file *file)
  * alignment requirements are not met in the NAND subdriver.
  */
 
-static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t *ppos)
+static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
+			loff_t *ppos)
 {
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
@@ -265,9 +266,10 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 
 	kfree(kbuf);
 	return total_retlen;
-} /* mtd_read */
+} /* mtdchar_read */
 
-static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count,loff_t *ppos)
+static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t count,
+			loff_t *ppos)
 {
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
@@ -345,7 +347,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 
 	kfree(kbuf);
 	return total_retlen;
-} /* mtd_write */
+} /* mtdchar_write */
 
 /*======================================================================
 
@@ -387,7 +389,7 @@ static int otp_select_filemode(struct mtd_file_info *mfi, int mode)
 # define otp_select_filemode(f,m)	-EOPNOTSUPP
 #endif
 
-static int mtd_do_writeoob(struct file *file, struct mtd_info *mtd,
+static int mtdchar_writeoob(struct file *file, struct mtd_info *mtd,
 	uint64_t start, uint32_t length, void __user *ptr,
 	uint32_t __user *retp)
 {
@@ -436,7 +438,7 @@ static int mtd_do_writeoob(struct file *file, struct mtd_info *mtd,
 	return ret;
 }
 
-static int mtd_do_readoob(struct file *file, struct mtd_info *mtd,
+static int mtdchar_readoob(struct file *file, struct mtd_info *mtd,
 	uint64_t start, uint32_t length, void __user *ptr,
 	uint32_t __user *retp)
 {
@@ -530,7 +532,7 @@ static int shrink_ecclayout(const struct nand_ecclayout *from,
 	return 0;
 }
 
-static int mtd_blkpg_ioctl(struct mtd_info *mtd,
+static int mtdchar_blkpg_ioctl(struct mtd_info *mtd,
 			   struct blkpg_ioctl_arg __user *arg)
 {
 	struct blkpg_ioctl_arg a;
@@ -566,7 +568,7 @@ static int mtd_blkpg_ioctl(struct mtd_info *mtd,
 	}
 }
 
-static int mtd_write_ioctl(struct mtd_info *mtd,
+static int mtdchar_write_ioctl(struct mtd_info *mtd,
 		struct mtd_write_req __user *argp)
 {
 	struct mtd_write_req req;
@@ -615,7 +617,7 @@ static int mtd_write_ioctl(struct mtd_info *mtd,
 	return ret;
 }
 
-static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
+static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 {
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
@@ -755,7 +757,7 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (copy_from_user(&buf, argp, sizeof(buf)))
 			ret = -EFAULT;
 		else
-			ret = mtd_do_writeoob(file, mtd, buf.start, buf.length,
+			ret = mtdchar_writeoob(file, mtd, buf.start, buf.length,
 				buf.ptr, &buf_user->length);
 		break;
 	}
@@ -769,7 +771,7 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (copy_from_user(&buf, argp, sizeof(buf)))
 			ret = -EFAULT;
 		else
-			ret = mtd_do_readoob(file, mtd, buf.start, buf.length,
+			ret = mtdchar_readoob(file, mtd, buf.start, buf.length,
 				buf.ptr, &buf_user->start);
 		break;
 	}
@@ -782,7 +784,7 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (copy_from_user(&buf, argp, sizeof(buf)))
 			ret = -EFAULT;
 		else
-			ret = mtd_do_writeoob(file, mtd, buf.start, buf.length,
+			ret = mtdchar_writeoob(file, mtd, buf.start, buf.length,
 				(void __user *)(uintptr_t)buf.usr_ptr,
 				&buf_user->length);
 		break;
@@ -796,7 +798,7 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (copy_from_user(&buf, argp, sizeof(buf)))
 			ret = -EFAULT;
 		else
-			ret = mtd_do_readoob(file, mtd, buf.start, buf.length,
+			ret = mtdchar_readoob(file, mtd, buf.start, buf.length,
 				(void __user *)(uintptr_t)buf.usr_ptr,
 				&buf_user->length);
 		break;
@@ -804,7 +806,7 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 
 	case MEMWRITE:
 	{
-		ret = mtd_write_ioctl(mtd,
+		ret = mtdchar_write_ioctl(mtd,
 		      (struct mtd_write_req __user *)arg);
 		break;
 	}
@@ -1014,7 +1016,7 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 
 	case BLKPG:
 	{
-		ret = mtd_blkpg_ioctl(mtd,
+		ret = mtdchar_blkpg_ioctl(mtd,
 		      (struct blkpg_ioctl_arg __user *)arg);
 		break;
 	}
@@ -1033,12 +1035,12 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 	return ret;
 } /* memory_ioctl */
 
-static long mtd_unlocked_ioctl(struct file *file, u_int cmd, u_long arg)
+static long mtdchar_unlocked_ioctl(struct file *file, u_int cmd, u_long arg)
 {
 	int ret;
 
 	mutex_lock(&mtd_mutex);
-	ret = mtd_ioctl(file, cmd, arg);
+	ret = mtdchar_ioctl(file, cmd, arg);
 	mutex_unlock(&mtd_mutex);
 
 	return ret;
@@ -1055,7 +1057,7 @@ struct mtd_oob_buf32 {
 #define MEMWRITEOOB32		_IOWR('M', 3, struct mtd_oob_buf32)
 #define MEMREADOOB32		_IOWR('M', 4, struct mtd_oob_buf32)
 
-static long mtd_compat_ioctl(struct file *file, unsigned int cmd,
+static long mtdchar_compat_ioctl(struct file *file, unsigned int cmd,
 	unsigned long arg)
 {
 	struct mtd_file_info *mfi = file->private_data;
@@ -1074,7 +1076,7 @@ static long mtd_compat_ioctl(struct file *file, unsigned int cmd,
 		if (copy_from_user(&buf, argp, sizeof(buf)))
 			ret = -EFAULT;
 		else
-			ret = mtd_do_writeoob(file, mtd, buf.start,
+			ret = mtdchar_writeoob(file, mtd, buf.start,
 				buf.length, compat_ptr(buf.ptr),
 				&buf_user->length);
 		break;
@@ -1089,13 +1091,13 @@ static long mtd_compat_ioctl(struct file *file, unsigned int cmd,
 		if (copy_from_user(&buf, argp, sizeof(buf)))
 			ret = -EFAULT;
 		else
-			ret = mtd_do_readoob(file, mtd, buf.start,
+			ret = mtdchar_readoob(file, mtd, buf.start,
 				buf.length, compat_ptr(buf.ptr),
 				&buf_user->start);
 		break;
 	}
 	default:
-		ret = mtd_ioctl(file, cmd, (unsigned long)argp);
+		ret = mtdchar_ioctl(file, cmd, (unsigned long)argp);
 	}
 
 	mutex_unlock(&mtd_mutex);
@@ -1111,7 +1113,7 @@ static long mtd_compat_ioctl(struct file *file, unsigned int cmd,
  *   mappings)
  */
 #ifndef CONFIG_MMU
-static unsigned long mtd_get_unmapped_area(struct file *file,
+static unsigned long mtdchar_get_unmapped_area(struct file *file,
 					   unsigned long addr,
 					   unsigned long len,
 					   unsigned long pgoff,
@@ -1144,7 +1146,7 @@ static unsigned long mtd_get_unmapped_area(struct file *file,
 /*
  * set up a mapping for shared memory segments
  */
-static int mtd_mmap(struct file *file, struct vm_area_struct *vma)
+static int mtdchar_mmap(struct file *file, struct vm_area_struct *vma)
 {
 #ifdef CONFIG_MMU
 	struct mtd_file_info *mfi = file->private_data;
@@ -1185,18 +1187,18 @@ static int mtd_mmap(struct file *file, struct vm_area_struct *vma)
 
 static const struct file_operations mtd_fops = {
 	.owner		= THIS_MODULE,
-	.llseek		= mtd_lseek,
-	.read		= mtd_read,
-	.write		= mtd_write,
-	.unlocked_ioctl	= mtd_unlocked_ioctl,
+	.llseek		= mtdchar_lseek,
+	.read		= mtdchar_read,
+	.write		= mtdchar_write,
+	.unlocked_ioctl	= mtdchar_unlocked_ioctl,
 #ifdef CONFIG_COMPAT
-	.compat_ioctl	= mtd_compat_ioctl,
+	.compat_ioctl	= mtdchar_compat_ioctl,
 #endif
-	.open		= mtd_open,
-	.release	= mtd_close,
-	.mmap		= mtd_mmap,
+	.open		= mtdchar_open,
+	.release	= mtdchar_close,
+	.mmap		= mtdchar_mmap,
 #ifndef CONFIG_MMU
-	.get_unmapped_area = mtd_get_unmapped_area,
+	.get_unmapped_area = mtdchar_get_unmapped_area,
 #endif
 };
 
-- 
1.7.7.3
