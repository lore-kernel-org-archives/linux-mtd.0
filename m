Received: from mail-qy0-f122.google.com ([209.85.221.122])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LrnCQ-0004Pp-9V
	for linux-mtd@lists.infradead.org; Thu, 09 Apr 2009 05:53:24 +0000
Received: by qyk28 with SMTP id 28so909170qyk.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Apr 2009 22:53:17 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 8 Apr 2009 22:53:13 -0700
Message-ID: <a95a62fe0904082253i119f8660y6a73835a163394f5@mail.gmail.com>
Subject: [PATCH 3/4] [MTD] compat_ioctl cleanup
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

1) Move the MEMREADOOB/MEMWRITEOOB compat_ioctl wrappers from
fs/compat_ioctl.c into mtdchar.c .  Original request was here:

http://lkml.org/lkml/2009/4/1/295

2) Add missing COMPATIBLE_IOCTL lines, so that mtd-utils does not error
out when running in 64/32 compatibility mode.

Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>

---
 drivers/mtd/mtdchar.c |  255 +++++++++++++++++++++++++++++++++----------------
 fs/compat_ioctl.c     |   51 ++--------
 2 files changed, 180 insertions(+), 126 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index ad4b861..51bb0b0 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -14,6 +14,7 @@
 #include <linux/sched.h>
 #include <linux/smp_lock.h>
 #include <linux/backing-dev.h>
+#include <linux/compat.h>

 #include <linux/mtd/mtd.h>
 #include <linux/mtd/compatmac.h>
@@ -355,6 +356,100 @@ static int otp_select_filemode(struct
mtd_file_info *mfi, int mode)
 # define otp_select_filemode(f,m)	-EOPNOTSUPP
 #endif

+static int mtd_do_writeoob(struct file *file, struct mtd_info *mtd,
+	uint64_t start, uint32_t length, void __user *ptr,
+	uint32_t __user *retp)
+{
+	struct mtd_oob_ops ops;
+	uint32_t retlen;
+	int ret = 0;
+
+	if (!(file->f_mode & FMODE_WRITE))
+		return -EPERM;
+
+	if (length > 4096)
+		return -EINVAL;
+
+	if (!mtd->write_oob)
+		ret = -EOPNOTSUPP;
+	else
+		ret = access_ok(VERIFY_READ, ptr, length) ? 0 : EFAULT;
+
+	if (ret)
+		return ret;
+
+	ops.ooblen = length;
+	ops.ooboffs = start & (mtd->oobsize - 1);
+	ops.datbuf = NULL;
+	ops.mode = MTD_OOB_PLACE;
+
+	if (ops.ooboffs && ops.ooblen > (mtd->oobsize - ops.ooboffs))
+		return -EINVAL;
+
+	ops.oobbuf = kmalloc(length, GFP_KERNEL);
+	if (!ops.oobbuf)
+		return -ENOMEM;
+
+	if (copy_from_user(ops.oobbuf, ptr, length)) {
+		kfree(ops.oobbuf);
+		return -EFAULT;
+	}
+
+	start &= ~((uint64_t)mtd->oobsize - 1);
+	ret = mtd->write_oob(mtd, start, &ops);
+
+	if (ops.oobretlen > 0xFFFFFFFFU)
+		ret = -EOVERFLOW;
+	retlen = ops.oobretlen;
+	if (copy_to_user(retp, &retlen, sizeof(length)))
+		ret = -EFAULT;
+
+	kfree(ops.oobbuf);
+	return ret;
+}
+
+static int mtd_do_readoob(struct mtd_info *mtd, uint64_t start,
+	uint32_t length, void __user *ptr, uint32_t __user *retp)
+{
+	struct mtd_oob_ops ops;
+	int ret = 0;
+
+	if (length > 4096)
+		return -EINVAL;
+
+	if (!mtd->read_oob)
+		ret = -EOPNOTSUPP;
+	else
+		ret = access_ok(VERIFY_WRITE, ptr,
+				length) ? 0 : -EFAULT;
+	if (ret)
+		return ret;
+
+	ops.ooblen = length;
+	ops.ooboffs = start & (mtd->oobsize - 1);
+	ops.datbuf = NULL;
+	ops.mode = MTD_OOB_PLACE;
+
+	if (ops.ooboffs && ops.ooblen > (mtd->oobsize - ops.ooboffs))
+		return -EINVAL;
+
+	ops.oobbuf = kmalloc(length, GFP_KERNEL);
+	if (!ops.oobbuf)
+		return -ENOMEM;
+
+	start &= ~((uint64_t)mtd->oobsize - 1);
+	ret = mtd->read_oob(mtd, start, &ops);
+
+	if (put_user(ops.oobretlen, retp))
+		ret = -EFAULT;
+	else if (ops.oobretlen && copy_to_user(ptr, ops.oobbuf,
+					    ops.oobretlen))
+		ret = -EFAULT;
+
+	kfree(ops.oobbuf);
+	return ret;
+}
+
 static int mtd_ioctl(struct inode *inode, struct file *file,
 		     u_int cmd, u_long arg)
 {
@@ -487,100 +582,28 @@ static int mtd_ioctl(struct inode *inode,
struct file *file,
 	case MEMWRITEOOB:
 	{
 		struct mtd_oob_buf buf;
-		struct mtd_oob_ops ops;
-		struct mtd_oob_buf __user *user_buf = argp;
-	        uint32_t retlen;
-
-		if(!(file->f_mode & FMODE_WRITE))
-			return -EPERM;
-
-		if (copy_from_user(&buf, argp, sizeof(struct mtd_oob_buf)))
-			return -EFAULT;
-
-		if (buf.length > 4096)
-			return -EINVAL;
-
-		if (!mtd->write_oob)
-			ret = -EOPNOTSUPP;
-		else
-			ret = access_ok(VERIFY_READ, buf.ptr,
-					buf.length) ? 0 : EFAULT;
-
-		if (ret)
-			return ret;
-
-		ops.ooblen = buf.length;
-		ops.ooboffs = buf.start & (mtd->oobsize - 1);
-		ops.datbuf = NULL;
-		ops.mode = MTD_OOB_PLACE;
-
-		if (ops.ooboffs && ops.ooblen > (mtd->oobsize - ops.ooboffs))
-			return -EINVAL;
-
-		ops.oobbuf = kmalloc(buf.length, GFP_KERNEL);
-		if (!ops.oobbuf)
-			return -ENOMEM;
-
-		if (copy_from_user(ops.oobbuf, buf.ptr, buf.length)) {
-			kfree(ops.oobbuf);
-			return -EFAULT;
-		}
-
-		buf.start &= ~(mtd->oobsize - 1);
-		ret = mtd->write_oob(mtd, buf.start, &ops);
+		struct mtd_oob_buf __user *buf_user = argp;

-		if (ops.oobretlen > 0xFFFFFFFFU)
-			ret = -EOVERFLOW;
-		retlen = ops.oobretlen;
-		if (copy_to_user(&user_buf->length, &retlen, sizeof(buf.length)))
+		/* NOTE: writes return length to buf_user->length */
+		if (copy_from_user(&buf, argp, sizeof(buf)))
 			ret = -EFAULT;
-
-		kfree(ops.oobbuf);
+		else
+			ret = mtd_do_writeoob(file, mtd, buf.start, buf.length,
+				buf.ptr, &buf_user->length);
 		break;
-
 	}

 	case MEMREADOOB:
 	{
 		struct mtd_oob_buf buf;
-		struct mtd_oob_ops ops;
-
-		if (copy_from_user(&buf, argp, sizeof(struct mtd_oob_buf)))
-			return -EFAULT;
-
-		if (buf.length > 4096)
-			return -EINVAL;
-
-		if (!mtd->read_oob)
-			ret = -EOPNOTSUPP;
-		else
-			ret = access_ok(VERIFY_WRITE, buf.ptr,
-					buf.length) ? 0 : -EFAULT;
-		if (ret)
-			return ret;
-
-		ops.ooblen = buf.length;
-		ops.ooboffs = buf.start & (mtd->oobsize - 1);
-		ops.datbuf = NULL;
-		ops.mode = MTD_OOB_PLACE;
+		struct mtd_oob_buf __user *buf_user = argp;

-		if (ops.ooboffs && ops.ooblen > (mtd->oobsize - ops.ooboffs))
-			return -EINVAL;
-
-		ops.oobbuf = kmalloc(buf.length, GFP_KERNEL);
-		if (!ops.oobbuf)
-			return -ENOMEM;
-
-		buf.start &= ~(mtd->oobsize - 1);
-		ret = mtd->read_oob(mtd, buf.start, &ops);
-
-		if (put_user(ops.oobretlen, (uint32_t __user *)argp))
-			ret = -EFAULT;
-		else if (ops.oobretlen && copy_to_user(buf.ptr, ops.oobbuf,
-						    ops.oobretlen))
+		/* NOTE: writes return length to buf_user->start */
+		if (copy_from_user(&buf, argp, sizeof(buf)))
 			ret = -EFAULT;
-
-		kfree(ops.oobbuf);
+		else
+			ret = mtd_do_readoob(mtd, buf.start, buf.length,
+				buf.ptr, &buf_user->start);
 		break;
 	}

@@ -771,6 +794,67 @@ static int mtd_ioctl(struct inode *inode, struct
file *file,
 	return ret;
 } /* memory_ioctl */

+#ifdef CONFIG_COMPAT
+
+struct mtd_oob_buf32 {
+	u_int32_t start;
+	u_int32_t length;
+	compat_caddr_t ptr;	/* unsigned char* */
+};
+
+#define MEMWRITEOOB32		_IOWR('M', 3, struct mtd_oob_buf32)
+#define MEMREADOOB32		_IOWR('M', 4, struct mtd_oob_buf32)
+
+static long mtd_compat_ioctl(struct file *file, unsigned int cmd,
+	unsigned long arg)
+{
+	struct mtd_file_info *mfi = file->private_data;
+	struct mtd_info *mtd = mfi->mtd;
+	void __user *argp = (void __user *)arg;
+	int ret = 0;
+
+	lock_kernel();
+
+	switch (cmd) {
+	case MEMWRITEOOB32:
+	{
+		struct mtd_oob_buf32 buf;
+		struct mtd_oob_buf32 __user *buf_user = argp;
+
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+		else
+			ret = mtd_do_writeoob(file, mtd, buf.start,
+				buf.length, compat_ptr(buf.ptr),
+				&buf_user->length);
+		break;
+	}
+
+	case MEMREADOOB32:
+	{
+		struct mtd_oob_buf32 buf;
+		struct mtd_oob_buf32 __user *buf_user = argp;
+
+		/* NOTE: writes return length to buf->start */
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+		else
+			ret = mtd_do_readoob(mtd, buf.start,
+				buf.length, compat_ptr(buf.ptr),
+				&buf_user->start);
+		break;
+	}
+	default:
+		ret = -ENOIOCTLCMD;
+	}
+
+	unlock_kernel();
+
+	return ret;
+}
+
+#endif /* CONFIG_COMPAT */
+
 /*
  * try to determine where a shared mapping can be made
  * - only supported for NOMMU at the moment (MMU can't doesn't copy private
@@ -830,6 +914,9 @@ static const struct file_operations mtd_fops = {
 	.read		= mtd_read,
 	.write		= mtd_write,
 	.ioctl		= mtd_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl	= mtd_compat_ioctl,
+#endif
 	.open		= mtd_open,
 	.release	= mtd_close,
 	.mmap		= mtd_mmap,
diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
index 06d4e0c..1db8d41 100644
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@ -1411,46 +1411,6 @@ static int ioc_settimeout(unsigned int fd,
unsigned int cmd, unsigned long arg)
 #define HIDPGETCONNLIST	_IOR('H', 210, int)
 #define HIDPGETCONNINFO	_IOR('H', 211, int)

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
 #ifdef CONFIG_BLOCK
 struct raw32_config_request
 {
@@ -2439,8 +2399,17 @@ COMPATIBLE_IOCTL(MEMLOCK)
 COMPATIBLE_IOCTL(MEMUNLOCK)
 COMPATIBLE_IOCTL(MEMGETREGIONCOUNT)
 COMPATIBLE_IOCTL(MEMGETREGIONINFO)
+COMPATIBLE_IOCTL(MEMSETOOBSEL)
+COMPATIBLE_IOCTL(MEMGETOOBSEL)
 COMPATIBLE_IOCTL(MEMGETBADBLOCK)
 COMPATIBLE_IOCTL(MEMSETBADBLOCK)
+COMPATIBLE_IOCTL(OTPSELECT)
+COMPATIBLE_IOCTL(OTPGETREGIONCOUNT)
+COMPATIBLE_IOCTL(OTPGETREGIONINFO)
+COMPATIBLE_IOCTL(OTPLOCK)
+COMPATIBLE_IOCTL(ECCGETLAYOUT)
+COMPATIBLE_IOCTL(ECCGETSTATS)
+COMPATIBLE_IOCTL(MTDFILEMODE)
 COMPATIBLE_IOCTL(MEMERASE64)
 /* NBD */
 ULONG_IOCTL(NBD_SET_SOCK)
@@ -2551,8 +2520,6 @@ COMPATIBLE_IOCTL(JSIOCGBUTTONS)
 COMPATIBLE_IOCTL(JSIOCGNAME(0))

 /* now things that need handlers */
-HANDLE_IOCTL(MEMREADOOB32, mtd_rw_oob)
-HANDLE_IOCTL(MEMWRITEOOB32, mtd_rw_oob)
 #ifdef CONFIG_NET
 HANDLE_IOCTL(SIOCGIFNAME, dev_ifname32)
 HANDLE_IOCTL(SIOCGIFCONF, dev_ifconf)
-- 
1.5.4.3
