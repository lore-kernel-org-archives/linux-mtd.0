Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wjd0b-0002sY-5a
 for linux-mtd@lists.infradead.org; Sun, 11 May 2014 23:18:18 +0000
From: Luka Perkov <luka@openwrt.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: add a ubi forced detach ioctl
Date: Mon, 12 May 2014 01:17:30 +0200
Message-Id: <1399850250-24616-1-git-send-email-luka@openwrt.org>
Cc: luka@openwrt.org, Artem Bityutskiy <dedekind1@gmail.com>,
 John Crispin <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: John Crispin <blogic@openwrt.org>

Signed-off-by: John Crispin <blogic@openwrt.org>
Tested-by: Luka Perkov <luka@openwrt.org>
CC: Artem Bityutskiy <dedekind1@gmail.com>
---
 drivers/mtd/ubi/cdev.c      | 7 +++++--
 include/uapi/mtd/ubi-user.h | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index f54562a..dce1171 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -970,7 +970,7 @@ static long ubi_cdev_ioctl(struct file *file, unsigned int cmd,
 static long ctrl_cdev_ioctl(struct file *file, unsigned int cmd,
 			    unsigned long arg)
 {
-	int err = 0;
+	int err = 0, force = 0;
 	void __user *argp = (void __user *)arg;
 
 	if (!capable(CAP_SYS_RESOURCE))
@@ -1020,6 +1020,9 @@ static long ctrl_cdev_ioctl(struct file *file, unsigned int cmd,
 	}
 
 	/* Detach an MTD device command */
+	case UBI_IOCFDET:
+		force = 1;
+		/* fallthrough */
 	case UBI_IOCDET:
 	{
 		int ubi_num;
@@ -1032,7 +1035,7 @@ static long ctrl_cdev_ioctl(struct file *file, unsigned int cmd,
 		}
 
 		mutex_lock(&ubi_devices_mutex);
-		err = ubi_detach_mtd_dev(ubi_num, 0);
+		err = ubi_detach_mtd_dev(ubi_num, force);
 		mutex_unlock(&ubi_devices_mutex);
 		break;
 	}
diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index 1927b0d..7600e18 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -178,6 +178,7 @@
 #define UBI_IOCATT _IOW(UBI_CTRL_IOC_MAGIC, 64, struct ubi_attach_req)
 /* Detach an MTD device */
 #define UBI_IOCDET _IOW(UBI_CTRL_IOC_MAGIC, 65, __s32)
+#define UBI_IOCFDET _IOW(UBI_CTRL_IOC_MAGIC, 66, __s32)
 
 /* ioctl commands of UBI volume character devices */
 
-- 
1.9.2
