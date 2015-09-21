Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ze7gg-0001xP-Ip
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2015 20:27:47 +0000
Received: by pacfv12 with SMTP id fv12so128411273pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2015 13:27:24 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH] mtd: provide proper 32/64-bit compat_ioctl() support for BLKPG
Date: Mon, 21 Sep 2015 13:26:59 -0700
Message-Id: <1442867219-147408-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1440814356-52070-1-git-send-email-computersforpeace@gmail.com>
References: <1440814356-52070-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After a bit of poking around wondering why my 32-bit user-space can't
seem to send a proper ioctl(BLKPG) to an MTD on my 64-bit kernel
(ARM64), I noticed that struct blkpg_ioctl_arg is actually pretty
unsuitable for use in the ioctl() ABI, due to its use of raw pointers,
and its lack of alignment/packing restrictions (32-bit arch'es tend to
pack the 4 fields into 4 32-bit words, whereas 64-bit arch'es would add
padding after the third int, and make this 6 32-bit words).

Anyway, this means BLKPG deserves some special compat_ioctl handling. Do
the conversion in a small shim for MTD.

block/compat_ioctl.c already has compat support for the block subsystem,
but it does so by a re-marshalling data to/from user-space (see
compat_blkpg_ioctl()). Personally, I think this approach is cleaner.

Tested only on MTD, with an ARM32 user space on an ARM64 kernel.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
You can find the initial bug report / patch here:

  http://article.gmane.org/gmane.linux.kernel/2028927
  https://lkml.org/lkml/2015/8/28/594

Changes since RFC:
 * create new non-UAPI header, instead of cluttering the UAPI header with
   compat stuff
 * remove mention of "same bug in block/", since block/ solves this problem
   already, just in a slightly different way

 drivers/mtd/mtdchar.c      | 42 +++++++++++++++++++++++++++++++++---------
 include/linux/blkpg.h      | 21 +++++++++++++++++++++
 include/uapi/linux/blkpg.h |  6 +++---
 3 files changed, 57 insertions(+), 12 deletions(-)
 create mode 100644 include/linux/blkpg.h

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 55fa27ecf4e1..bf966be09e79 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -498,21 +498,17 @@ static int shrink_ecclayout(const struct nand_ecclayout *from,
 }
 
 static int mtdchar_blkpg_ioctl(struct mtd_info *mtd,
-			   struct blkpg_ioctl_arg __user *arg)
+			       struct blkpg_ioctl_arg *arg)
 {
-	struct blkpg_ioctl_arg a;
 	struct blkpg_partition p;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	if (copy_from_user(&a, arg, sizeof(struct blkpg_ioctl_arg)))
+	if (copy_from_user(&p, arg->data, sizeof(p)))
 		return -EFAULT;
 
-	if (copy_from_user(&p, a.data, sizeof(struct blkpg_partition)))
-		return -EFAULT;
-
-	switch (a.op) {
+	switch (arg->op) {
 	case BLKPG_ADD_PARTITION:
 
 		/* Only master mtd device must be used to add partitions */
@@ -966,8 +962,13 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 
 	case BLKPG:
 	{
-		ret = mtdchar_blkpg_ioctl(mtd,
-		      (struct blkpg_ioctl_arg __user *)arg);
+		struct blkpg_ioctl_arg __user *blk_arg = argp;
+		struct blkpg_ioctl_arg a;
+
+		if (copy_from_user(&a, blk_arg, sizeof(a)))
+			ret = -EFAULT;
+		else
+			ret = mtdchar_blkpg_ioctl(mtd, &a);
 		break;
 	}
 
@@ -1046,6 +1047,29 @@ static long mtdchar_compat_ioctl(struct file *file, unsigned int cmd,
 				&buf_user->start);
 		break;
 	}
+
+	case BLKPG:
+	{
+		/* Convert from blkpg_compat_ioctl_arg to blkpg_ioctl_arg */
+		struct blkpg_compat_ioctl_arg __user *uarg = argp;
+		struct blkpg_compat_ioctl_arg arg;
+		struct blkpg_ioctl_arg a;
+
+		if (copy_from_user(&arg, uarg, sizeof(arg))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		memset(&a, 0, sizeof(a));
+		a.op = arg.op;
+		a.flags = arg.flags;
+		a.datalen = arg.datalen;
+		a.data = compat_ptr(arg.data);
+
+		ret = mtdchar_blkpg_ioctl(mtd, &a);
+		break;
+	}
+
 	default:
 		ret = mtdchar_ioctl(file, cmd, (unsigned long)argp);
 	}
diff --git a/include/linux/blkpg.h b/include/linux/blkpg.h
new file mode 100644
index 000000000000..bef124fde61e
--- /dev/null
+++ b/include/linux/blkpg.h
@@ -0,0 +1,21 @@
+#ifndef _LINUX_BLKPG_H
+#define _LINUX_BLKPG_H
+
+/*
+ * Partition table and disk geometry handling
+ */
+
+#include <linux/compat.h>
+#include <uapi/linux/blkpg.h>
+
+#ifdef CONFIG_COMPAT
+/* For 32-bit/64-bit compatibility of struct blkpg_ioctl_arg */
+struct blkpg_compat_ioctl_arg {
+	compat_int_t op;
+	compat_int_t flags;
+	compat_int_t datalen;
+	compat_uptr_t data;
+};
+#endif
+
+#endif /* _LINUX_BLKPG_H */
diff --git a/include/uapi/linux/blkpg.h b/include/uapi/linux/blkpg.h
index a8519446c111..63739a035085 100644
--- a/include/uapi/linux/blkpg.h
+++ b/include/uapi/linux/blkpg.h
@@ -1,5 +1,5 @@
-#ifndef _LINUX_BLKPG_H
-#define _LINUX_BLKPG_H
+#ifndef _UAPI__LINUX_BLKPG_H
+#define _UAPI__LINUX_BLKPG_H
 
 /*
  * Partition table and disk geometry handling
@@ -56,4 +56,4 @@ struct blkpg_partition {
 	char volname[BLKPG_VOLNAMELTH];	/* volume label */
 };
 
-#endif /* _LINUX_BLKPG_H */
+#endif /* _UAPI__LINUX_BLKPG_H */
-- 
2.6.0.rc0.131.gf624c3d
