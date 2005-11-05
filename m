Received: from moutng.kundenserver.de ([212.227.126.186])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EYQzs-00085A-5x
	for linux-mtd@lists.infradead.org; Sat, 05 Nov 2005 11:34:41 -0500
Message-Id: <20051105162712.921102000@b551138y.boeblingen.de.ibm.com>
References: <20051105162650.620266000@b551138y.boeblingen.de.ibm.com>
Date: Sat, 05 Nov 2005 17:26:56 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: linux-kernel@vger.kernel.org
Content-Disposition: inline; filename=mtd-ioctl.diff
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 06/25] mtd: move ioctl32 code to mtdchar.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The MTD ioctls are all specific to mtdchar.c, so the
compat code for them should be there as well.

Also, some of the ioctl commands used in that driver
were previously not marked as compatible.

The conversion handlers could be further simplified
by not using compat_alloc_user_space any more.

CC: dwmw2@infradead.org
CC: linux-mtd@lists.infradead.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Index: linux-2.6.14-rc/drivers/mtd/mtdchar.c
===================================================================
--- linux-2.6.14-rc.orig/drivers/mtd/mtdchar.c	2005-11-05 02:41:10.000000000 +0100
+++ linux-2.6.14-rc/drivers/mtd/mtdchar.c	2005-11-05 02:41:30.000000000 +0100
@@ -6,6 +6,7 @@
  */
 
 #include <linux/config.h>
+#include <linux/compat.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
@@ -300,8 +301,7 @@
 	wake_up((wait_queue_head_t *)instr->priv);
 }
 
-static int mtd_ioctl(struct inode *inode, struct file *file,
-		     u_int cmd, u_long arg)
+static int mtd_do_ioctl(struct file *file, u_int cmd, u_long arg)
 {
 	struct mtd_info *mtd = TO_MTD(file);
 	void __user *argp = (void __user *)arg;
@@ -626,12 +626,100 @@
 	return ret;
 } /* memory_ioctl */
 
+static long mtd_ioctl(struct inode *inode, struct file *file,
+			unsigned int cmd, unsigned long arg)
+{
+	int ret;
+	lock_kernel();
+	ret = mtd_do_ioctl(file, cmd, arg);
+	unlock_kernel();
+	return ret;
+}
+
+#ifdef CONFIG_COMPAT
+struct mtd_oob_buf32 {
+	u_int32_t start;
+	u_int32_t length;
+	compat_caddr_t ptr;	/* unsigned char* */
+};
+
+#define MEMWRITEOOB32 	_IOWR('M',3,struct mtd_oob_buf32)
+#define MEMREADOOB32 	_IOWR('M',4,struct mtd_oob_buf32)
+
+static int compat_mtd_rw_oob(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct mtd_oob_buf __user *buf = compat_alloc_user_space(sizeof(*buf));
+	struct mtd_oob_buf32 __user *buf32 = compat_ptr(arg);
+	u32 data;
+	char __user *datap;
+	unsigned int real_cmd;
+	int err;
+
+	real_cmd = (cmd == MEMREADOOB32) ?
+		MEMREADOOB : MEMWRITEOOB;
+
+	if (copy_in_user(&buf->start, &buf32->start,
+			 2 * sizeof(u32)) ||
+	    get_user(data, &buf32->ptr))
+		return -EFAULT;
+	datap = compat_ptr(data);
+	if (put_user(datap, &buf->ptr))
+		return -EFAULT;
+
+	err = mtd_do_ioctl(file, real_cmd, (unsigned long) buf);
+
+	if (!err) {
+		if (copy_in_user(&buf32->start, &buf->start,
+				 2 * sizeof(u32)))
+			err = -EFAULT;
+	}
+
+	return err;
+}
+
+static long compat_mtd_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	int ret = -ENOIOCTLCMD;
+
+	lock_kernel();
+	switch (cmd) {
+	case MEMWRITEOOB32:
+	case MEMREADOOB32:
+		ret = compat_mtd_rw_oob(file, cmd, arg);
+		break;
+
+	case MEMGETINFO:
+	case MEMERASE:
+	case MEMLOCK:
+	case MEMUNLOCK:
+	case MEMGETREGIONCOUNT:
+	case MEMGETREGIONINFO:
+	case MEMSETOOBSEL:
+	case MEMGETOOBSEL:
+	case MEMGETBADBLOCK:
+	case MEMSETBADBLOCK:
+	case OTPSELECT:
+	case OTPGETREGIONCOUNT:
+	case OTPGETREGIONINFO:
+	case OTPLOCK:
+		ret = mtd_do_ioctl(file, cmd, arg);
+		break;
+	}
+	unlock_kernel();
+
+	return ret;
+}
+#endif
+
 static struct file_operations mtd_fops = {
 	.owner		= THIS_MODULE,
 	.llseek		= mtd_lseek,
 	.read		= mtd_read,
 	.write		= mtd_write,
-	.ioctl		= mtd_ioctl,
+	.unlocked_ioctl	= mtd_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl	= compat_mtd_ioctl,
+#endif
 	.open		= mtd_open,
 	.release	= mtd_close,
 };
Index: linux-2.6.14-rc/fs/compat_ioctl.c
===================================================================
--- linux-2.6.14-rc.orig/fs/compat_ioctl.c	2005-11-05 02:41:18.000000000 +0100
+++ linux-2.6.14-rc/fs/compat_ioctl.c	2005-11-05 02:41:30.000000000 +0100
@@ -1551,46 +1551,6 @@
 	return err;
 }
 
-struct mtd_oob_buf32 {
-	u_int32_t start;
-	u_int32_t length;
-	compat_caddr_t ptr;	/* unsigned char* */
-};
-
-#define MEMWRITEOOB32 	_IOWR('M',3,struct mtd_oob_buf32)
-#define MEMREADOOB32 	_IOWR('M',4,struct mtd_oob_buf32)
-
-static int mtd_rw_oob(unsigned int fd, unsigned int cmd, unsigned long arg)
-{
-	struct mtd_oob_buf __user *buf = compat_alloc_user_space(sizeof(*buf));
-	struct mtd_oob_buf32 __user *buf32 = compat_ptr(arg);
-	u32 data;
-	char __user *datap;
-	unsigned int real_cmd;
-	int err;
-
-	real_cmd = (cmd == MEMREADOOB32) ?
-		MEMREADOOB : MEMWRITEOOB;
-
-	if (copy_in_user(&buf->start, &buf32->start,
-			 2 * sizeof(u32)) ||
-	    get_user(data, &buf32->ptr))
-		return -EFAULT;
-	datap = compat_ptr(data);
-	if (put_user(datap, &buf->ptr))
-		return -EFAULT;
-
-	err = sys_ioctl(fd, real_cmd, (unsigned long) buf);
-
-	if (!err) {
-		if (copy_in_user(&buf32->start, &buf->start,
-				 2 * sizeof(u32)))
-			err = -EFAULT;
-	}
-
-	return err;
-}	
-
 #define	VFAT_IOCTL_READDIR_BOTH32	_IOR('r', 1, struct compat_dirent[2])
 #define	VFAT_IOCTL_READDIR_SHORT32	_IOR('r', 2, struct compat_dirent[2])
 
@@ -2144,8 +2104,6 @@
 #endif
 
 #ifdef DECLARES
-HANDLE_IOCTL(MEMREADOOB32, mtd_rw_oob)
-HANDLE_IOCTL(MEMWRITEOOB32, mtd_rw_oob)
 HANDLE_IOCTL(HDIO_GETGEO, hdio_getgeo)
 HANDLE_IOCTL(BLKRAGET, w_long)
 HANDLE_IOCTL(BLKGETSIZE, w_long)
Index: linux-2.6.14-rc/include/linux/compat_ioctl.h
===================================================================
--- linux-2.6.14-rc.orig/include/linux/compat_ioctl.h	2005-11-05 02:41:18.000000000 +0100
+++ linux-2.6.14-rc/include/linux/compat_ioctl.h	2005-11-05 02:41:30.000000000 +0100
@@ -656,13 +656,6 @@
 COMPATIBLE_IOCTL(USBDEVFS_REAPURB32)
 COMPATIBLE_IOCTL(USBDEVFS_REAPURBNDELAY32)
 COMPATIBLE_IOCTL(USBDEVFS_CLEAR_HALT)
-/* MTD */
-COMPATIBLE_IOCTL(MEMGETINFO)
-COMPATIBLE_IOCTL(MEMERASE)
-COMPATIBLE_IOCTL(MEMLOCK)
-COMPATIBLE_IOCTL(MEMUNLOCK)
-COMPATIBLE_IOCTL(MEMGETREGIONCOUNT)
-COMPATIBLE_IOCTL(MEMGETREGIONINFO)
 /* NBD */
 ULONG_IOCTL(NBD_SET_SOCK)
 ULONG_IOCTL(NBD_SET_BLKSIZE)

--
