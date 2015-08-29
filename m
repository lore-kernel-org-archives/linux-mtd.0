Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZVVdv-0002vJ-Qb
 for linux-mtd@lists.infradead.org; Sat, 29 Aug 2015 02:13:20 +0000
Received: by pabzx8 with SMTP id zx8so79705955pab.1
 for <linux-mtd@lists.infradead.org>; Fri, 28 Aug 2015 19:12:58 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [RFC / BUG] mtd: provide proper 32/64-bit compat_ioctl() support for
 BLKPG
Date: Fri, 28 Aug 2015 19:12:36 -0700
Message-Id: <1440814356-52070-1-git-send-email-computersforpeace@gmail.com>
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

The same bug applies to block/ioctl.c, but I wanted to get some comments
first. I can send a non-RFC with the same approach for the block
subsystem. But then: which tree should it go in?

Tested only on MTD, with an ARM32 user space on an ARM64 kernel.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdchar.c      | 42 +++++++++++++++++++++++++++++++++---------
 include/uapi/linux/blkpg.h | 10 ++++++++++
 2 files changed, 43 insertions(+), 9 deletions(-)

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
diff --git a/include/uapi/linux/blkpg.h b/include/uapi/linux/blkpg.h
index a8519446c111..0574147f4490 100644
--- a/include/uapi/linux/blkpg.h
+++ b/include/uapi/linux/blkpg.h
@@ -26,6 +26,7 @@
  */
 #include <linux/compiler.h>
 #include <linux/ioctl.h>
+#include <linux/compat.h>
 
 #define BLKPG      _IO(0x12,105)
 
@@ -37,6 +38,15 @@ struct blkpg_ioctl_arg {
         void __user *data;
 };
 
+#ifdef CONFIG_COMPAT
+struct blkpg_compat_ioctl_arg {
+	compat_int_t op;
+	compat_int_t flags;
+	compat_int_t datalen;
+	compat_uptr_t data;
+};
+#endif
+
 /* The subfunctions (for the op field) */
 #define BLKPG_ADD_PARTITION	1
 #define BLKPG_DEL_PARTITION	2
-- 
2.5.0.457.gab17608
