Message-Id: <200905122106.n4CL6G8x009488@imap1.linux-foundation.org>
Subject: [patch 09/14] mtd: delete final remnants of MTD ioctls from
	fs/compat_ioctl.c
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 12 May 2009 13:47:01 -0700
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kevin Cernekee <kpc.mtd@gmail.com>

Move all MTD compat_ioctl logic into drivers/mtd/mtdchar.c

Depends on this patch set:

http://lkml.org/lkml/2009/4/9/52
http://lkml.org/lkml/2009/4/9/53
http://lkml.org/lkml/2009/4/9/54
http://lkml.org/lkml/2009/4/9/55

Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/mtdchar.c |    3 ++-
 fs/compat_ioctl.c     |   22 ----------------------
 2 files changed, 2 insertions(+), 23 deletions(-)

diff -puN drivers/mtd/mtdchar.c~mtd-delete-final-remnants-of-mtd-ioctls-from-fs-compat_ioctlc drivers/mtd/mtdchar.c
--- a/drivers/mtd/mtdchar.c~mtd-delete-final-remnants-of-mtd-ioctls-from-fs-compat_ioctlc
+++ a/drivers/mtd/mtdchar.c
@@ -836,6 +836,7 @@ struct mtd_oob_buf32 {
 static long mtd_compat_ioctl(struct file *file, unsigned int cmd,
 	unsigned long arg)
 {
+	struct inode *inode = file->f_path.dentry->d_inode;
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
 	void __user *argp = (void __user *)arg;
@@ -873,7 +874,7 @@ static long mtd_compat_ioctl(struct file
 		break;
 	}
 	default:
-		ret = -ENOIOCTLCMD;
+		ret = mtd_ioctl(inode, file, cmd, arg);
 	}
 
 	unlock_kernel();
diff -puN fs/compat_ioctl.c~mtd-delete-final-remnants-of-mtd-ioctls-from-fs-compat_ioctlc fs/compat_ioctl.c
--- a/fs/compat_ioctl.c~mtd-delete-final-remnants-of-mtd-ioctls-from-fs-compat_ioctlc
+++ a/fs/compat_ioctl.c
@@ -94,7 +94,6 @@
 #include <linux/atm_tcp.h>
 #include <linux/sonet.h>
 #include <linux/atm_suni.h>
-#include <linux/mtd/mtd.h>
 
 #include <linux/usb.h>
 #include <linux/usbdevice_fs.h>
@@ -2392,27 +2391,6 @@ COMPATIBLE_IOCTL(USBDEVFS_SUBMITURB32)
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
-COMPATIBLE_IOCTL(MEMSETOOBSEL)
-COMPATIBLE_IOCTL(MEMGETOOBSEL)
-COMPATIBLE_IOCTL(MEMGETBADBLOCK)
-COMPATIBLE_IOCTL(MEMSETBADBLOCK)
-COMPATIBLE_IOCTL(OTPSELECT)
-COMPATIBLE_IOCTL(OTPGETREGIONCOUNT)
-COMPATIBLE_IOCTL(OTPGETREGIONINFO)
-COMPATIBLE_IOCTL(OTPLOCK)
-COMPATIBLE_IOCTL(ECCGETLAYOUT)
-COMPATIBLE_IOCTL(ECCGETSTATS)
-COMPATIBLE_IOCTL(MTDFILEMODE)
-COMPATIBLE_IOCTL(MEMERASE64)
-COMPATIBLE_IOCTL(MEMREADOOB64)
-COMPATIBLE_IOCTL(MEMWRITEOOB64)
 /* NBD */
 ULONG_IOCTL(NBD_SET_SOCK)
 ULONG_IOCTL(NBD_SET_BLKSIZE)
_
