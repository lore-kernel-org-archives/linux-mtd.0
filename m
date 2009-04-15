From: kpc.mtd@gmail.com (Kevin Cernekee)
Date: Tue, 14 Apr 2009 21:59:22 -0700
Subject: [PATCH] mtd: Delete final remnants of MTD ioctls from
	fs/compat_ioctl.c
Message-ID: <mailman.4.1239773644.2876.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Move all MTD compat_ioctl logic into drivers/mtd/mtdchar.c

Depends on this patch set:

http://lkml.org/lkml/2009/4/9/52
http://lkml.org/lkml/2009/4/9/53
http://lkml.org/lkml/2009/4/9/54
http://lkml.org/lkml/2009/4/9/55

Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>
---
 drivers/mtd/mtdchar.c |    3 ++-
 fs/compat_ioctl.c     |   22 ----------------------
 2 files changed, 2 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 99d1fbc..5fff04f 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -836,6 +836,7 @@ struct mtd_oob_buf32 {
 static long mtd_compat_ioctl(struct file *file, unsigned int cmd,
 	unsigned long arg)
 {
+	struct inode *inode = file->f_path.dentry->d_inode;
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
 	void __user *argp = (void __user *)arg;
@@ -873,7 +874,7 @@ static long mtd_compat_ioctl(struct file *file, unsigned int cmd,
 		break;
 	}
 	default:
-		ret = -ENOIOCTLCMD;
+		ret = mtd_ioctl(inode, file, cmd, arg);
 	}
 
 	unlock_kernel();
diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
index 5f7b8a1..8256cda 100644
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
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
-- 
1.5.4.3
