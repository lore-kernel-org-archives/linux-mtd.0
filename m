Message-Id: <20091015202758.523050101@linutronix.de>
Date: Thu, 15 Oct 2009 20:28:48 -0000
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 4/5] mtd: Remove BKL and convert to unlocked_ioctl
References: <20091015202722.372890083@linutronix.de>
Content-Disposition: inline;
	filename=mtd-remove-bkl-and-convert-to-unlocked-ioctl.patch
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>, ALan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_open() got lock/unlock kernel from the big BKL push down, but it
never relied on the BKL serialization as get_mtd_device() takes care
of serialization vs. device init/teardown.

mtd_ioctl() is safe w/o the BKL as well. The data which is copied from
the mtd data structure is either set up during device initialization
or statistics which have never been protected by the BKL against
concurrent modification. The mtd functions which are called from
various ioctl commands are safe as well.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/mtdchar.c |   30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

Index: linux-2.6-tip/drivers/mtd/mtdchar.c
===================================================================
--- linux-2.6-tip.orig/drivers/mtd/mtdchar.c
+++ linux-2.6-tip/drivers/mtd/mtdchar.c
@@ -12,7 +12,6 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
-#include <linux/smp_lock.h>
 #include <linux/backing-dev.h>
 #include <linux/compat.h>
 
@@ -74,18 +73,14 @@ static int mtd_open(struct inode *inode,
 	if ((file->f_mode & FMODE_WRITE) && (minor & 1))
 		return -EACCES;
 
-	lock_kernel();
 	mtd = get_mtd_device(NULL, devnum);
 
-	if (IS_ERR(mtd)) {
-		ret = PTR_ERR(mtd);
-		goto out;
-	}
+	if (IS_ERR(mtd))
+		return PTR_ERR(mtd);
 
 	if (mtd->type == MTD_ABSENT) {
 		put_mtd_device(mtd);
-		ret = -ENODEV;
-		goto out;
+		return -ENODEV;
 	}
 
 	if (mtd->backing_dev_info)
@@ -94,21 +89,17 @@ static int mtd_open(struct inode *inode,
 	/* You can't open it RW if it's not a writeable device */
 	if ((file->f_mode & FMODE_WRITE) && !(mtd->flags & MTD_WRITEABLE)) {
 		put_mtd_device(mtd);
-		ret = -EACCES;
-		goto out;
+		return -EACCES;
 	}
 
 	mfi = kzalloc(sizeof(*mfi), GFP_KERNEL);
 	if (!mfi) {
 		put_mtd_device(mtd);
-		ret = -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}
 	mfi->mtd = mtd;
 	file->private_data = mfi;
 
-out:
-	unlock_kernel();
 	return ret;
 } /* mtd_open */
 
@@ -450,13 +441,12 @@ static int mtd_do_readoob(struct mtd_inf
 	return ret;
 }
 
-static int mtd_ioctl(struct inode *inode, struct file *file,
-		     u_int cmd, u_long arg)
+static long mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 {
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
 	void __user *argp = (void __user *)arg;
-	int ret = 0;
+	long ret = 0;
 	u_long size;
 	struct mtd_info_user info;
 
@@ -842,8 +832,6 @@ static long mtd_compat_ioctl(struct file
 	void __user *argp = compat_ptr(arg);
 	int ret = 0;
 
-	lock_kernel();
-
 	switch (cmd) {
 	case MEMWRITEOOB32:
 	{
@@ -877,8 +865,6 @@ static long mtd_compat_ioctl(struct file
 		ret = mtd_ioctl(inode, file, cmd, (unsigned long)argp);
 	}
 
-	unlock_kernel();
-
 	return ret;
 }
 
@@ -942,7 +928,7 @@ static const struct file_operations mtd_
 	.llseek		= mtd_lseek,
 	.read		= mtd_read,
 	.write		= mtd_write,
-	.ioctl		= mtd_ioctl,
+	.unlocked_ioctl	= mtd_ioctl,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl	= mtd_compat_ioctl,
 #endif
