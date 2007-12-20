Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J5Kn7-0003Xk-Nz
	for linux-mtd@lists.infradead.org; Thu, 20 Dec 2007 12:46:28 +0000
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Date: Thu, 20 Dec 2007 16:23:22 +0200
Message-Id: <20071220142322.30834.89667.sendpatchset@golum>
In-Reply-To: <20071220142251.30834.86791.sendpatchset@golum>
References: <20071220142251.30834.86791.sendpatchset@golum>
Subject: [PATCH v2 5/6] UBI: handle attach ioctl
Cc: Frank Haverkamp <haver@vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From f3a2178d8b632f712992d5a62f5d4b78440df527 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Tue, 18 Dec 2007 18:23:39 +0200
Subject: [PATCH] UBI: handle attach ioctl

Actually implement the MTD device attach/detach handlers.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/cdev.c |   84 +++++++++++++++++++++++++++++++++++++++--------
 1 files changed, 69 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 01978b5..493bfb9 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -44,17 +44,6 @@
 #include <asm/div64.h>
 #include "ubi.h"
 
-/*
- * Maximum sequence numbers of UBI and volume character device IOCTLs (direct
- * logical eraseblock erase is a debug-only feature).
- */
-#define UBI_CDEV_IOC_MAX_SEQ 2
-#ifndef CONFIG_MTD_UBI_DEBUG_USERSPACE_IO
-#define VOL_CDEV_IOC_MAX_SEQ 1
-#else
-#define VOL_CDEV_IOC_MAX_SEQ 2
-#endif
-
 /**
  * get_exclusive - get exclusive access to an UBI volume.
  * @desc: volume descriptor
@@ -582,8 +571,7 @@ static int ubi_cdev_ioctl(struct inode *inode, struct file *file,
 		struct ubi_mkvol_req req;
 
 		dbg_msg("create volume");
-		err = copy_from_user(&req, argp,
-				       sizeof(struct ubi_mkvol_req));
+		err = copy_from_user(&req, argp, sizeof(struct ubi_mkvol_req));
 		if (err) {
 			err = -EFAULT;
 			break;
@@ -647,8 +635,7 @@ static int ubi_cdev_ioctl(struct inode *inode, struct file *file,
 		struct ubi_rsvol_req req;
 
 		dbg_msg("re-size volume");
-		err = copy_from_user(&req, argp,
-				       sizeof(struct ubi_rsvol_req));
+		err = copy_from_user(&req, argp, sizeof(struct ubi_rsvol_req));
 		if (err) {
 			err = -EFAULT;
 			break;
@@ -684,8 +671,75 @@ static int ubi_cdev_ioctl(struct inode *inode, struct file *file,
 	return err;
 }
 
+static int ctrl_cdev_ioctl(struct inode *inode, struct file *file,
+			   unsigned int cmd, unsigned long arg)
+{
+	int err = 0;
+	void __user *argp = (void __user *)arg;
+
+	if (!capable(CAP_SYS_RESOURCE))
+		return -EPERM;
+
+	switch (cmd) {
+	/* Attach an MTD device command */
+	case UBI_IOCATT:
+	{
+		struct ubi_attach_req req;
+		struct mtd_info *mtd;
+
+		dbg_msg("attach MTD device");
+		err = copy_from_user(&req, argp, sizeof(struct ubi_attach_req));
+		if (err) {
+			err = -EFAULT;
+			break;
+		}
+
+		if (req.mtd_num < 0)
+			return -EINVAL;
+
+		mtd = get_mtd_device(NULL, req.mtd_num);
+		if (IS_ERR(mtd))
+			return PTR_ERR(mtd);
+
+		/* Note, request verification is done by the attach function */
+		mutex_lock(&ubi_devices_mutex);
+		err = ubi_attach_mtd_dev(mtd, req.vid_hdr_offset,
+					 req.data_offset);
+		mutex_unlock(&ubi_devices_mutex);
+		if (err < 0)
+			put_mtd_device(mtd);
+		break;
+	}
+
+	/* Detach an MTD device command */
+	case UBI_IOCDET:
+	{
+		int ubi_num;
+
+		dbg_msg("dettach MTD device");
+		err = get_user(ubi_num, (__user int32_t *)argp);
+		if (err) {
+			err = -EFAULT;
+			break;
+		}
+
+		mutex_lock(&ubi_devices_mutex);
+		err = ubi_detach_mtd_dev(ubi_num, 0);
+		mutex_unlock(&ubi_devices_mutex);
+		break;
+	}
+
+	default:
+		err = -ENOTTY;
+		break;
+	}
+
+	return err;
+}
+
 /* UBI control character device operations */
 struct file_operations ubi_ctrl_cdev_operations = {
+	.ioctl = ctrl_cdev_ioctl,
 	.owner = THIS_MODULE,
 };
 
-- 
1.5.3.4
