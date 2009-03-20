Received: from mail-qy0-f116.google.com ([209.85.221.116])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LkXPq-0001dd-Qi
	for linux-mtd@lists.infradead.org; Fri, 20 Mar 2009 05:37:17 +0000
Received: by qyk14 with SMTP id 14so178157qyk.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Mar 2009 22:37:10 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 19 Mar 2009 22:37:09 -0700
Message-ID: <a95a62fe0903192237u64b67efdubd328c8f0cd61b49@mail.gmail.com>
Subject: [PATCH 1/2] [MTD] CORE: New ioctl calls for >4GiB device support
	(take 2)
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Extend the MTD user ABI to access >4GiB devices using 64-bit offsets.
Add compat_ioctl support to the MTD ABI.

New ioctls: MEMABIINFO MEMGETINFO64 MEMERASE64 MEMWRITEOOB64 MEMREADOOB64
            MEMLOCK64 MEMUNLOCK64 MEMGETREGIONINFO64

Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>
---
 drivers/mtd/compat_ioctl.c |  233 +++++++++++++
 drivers/mtd/compat_ioctl.h |   89 +++++
 drivers/mtd/mtdchar.c      |  817 ++++++++++++++++++++++++++++---------------
 include/mtd/mtd-abi.h      |   69 ++++-
 include/mtd/mtd-user.h     |    4 +
 5 files changed, 921 insertions(+), 291 deletions(-)
 create mode 100644 drivers/mtd/compat_ioctl.c
 create mode 100644 drivers/mtd/compat_ioctl.h

diff --git a/drivers/mtd/compat_ioctl.c b/drivers/mtd/compat_ioctl.c
new file mode 100644
index 0000000..ee98f71
--- /dev/null
+++ b/drivers/mtd/compat_ioctl.c
@@ -0,0 +1,233 @@
+/*
+ * MTD compat_ioctl implementation
+ */
+
+#include <linux/compat.h>
+#include <linux/ioctl.h>
+#include <linux/smp_lock.h>
+#include <linux/uaccess.h>
+#include <linux/fs.h>
+#include <linux/mtd/mtd.h>
+#include "compat_ioctl.h"
+
+static long mtd_compat_ioctl(struct file *file, unsigned int cmd,
+	unsigned long arg)
+{
+	struct mtd_file_info *mfi = file->private_data;
+	struct mtd_info *mtd = mfi->mtd;
+	void __user *argp = (void __user *)arg;
+	int ret = 0;
+	u_long size;
+
+	DEBUG(MTD_DEBUG_LEVEL0, "MTD_ioctl\n");
+
+	lock_kernel();	/* just because mtd_ioctl() holds the BKL too */
+
+	size = (cmd & IOCSIZE_MASK) >> IOCSIZE_SHIFT;
+	if (cmd & IOC_IN) {
+		if (!access_ok(VERIFY_READ, argp, size)) {
+			unlock_kernel();
+			return -EFAULT;
+		}
+	}
+	if (cmd & IOC_OUT) {
+		if (!access_ok(VERIFY_WRITE, argp, size)) {
+			unlock_kernel();
+			return -EFAULT;
+		}
+	}
+
+	switch (cmd) {
+	case MEMGETREGIONCOUNT_32:
+	{
+		compat_int_t numeraseregions = mtd->numeraseregions;
+		if (copy_to_user(argp, &numeraseregions, sizeof(compat_int_t)))
+			ret = -EFAULT;
+		break;
+	}
+
+	case MEMGETREGIONINFO_32:
+		ret = mtd_ioctl_getregioninfo(mtd, argp);
+		break;
+
+	case MEMGETREGIONINFO64_32:
+		ret = mtd_ioctl_getregioninfo64(mtd, argp);
+		break;
+
+	case MEMABIINFO_32:
+		ret = mtd_ioctl_getabiinfo(argp);
+		break;
+
+	case MEMGETINFO_32:
+		ret = mtd_ioctl_getinfo(mtd, argp);
+		break;
+
+	case MEMGETINFO64_32:
+		ret = mtd_ioctl_getinfo64(mtd, argp);
+		break;
+
+	case MEMERASE_32:
+		ret = mtd_ioctl_erase(file, mtd, argp);
+		break;
+
+	case MEMERASE64_32:
+		ret = mtd_ioctl_erase64(file, mtd, argp);
+		break;
+
+	case MEMWRITEOOB_32:
+	{
+		struct mtd_oob_buf_32 buf;
+		struct mtd_oob_buf_32 __user *buf_user = argp;
+
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+		else
+			ret = mtd_do_writeoob(file, mtd, buf.start, buf.length,
+				compat_ptr(buf.ptr), &buf_user->length);
+		break;
+	}
+
+	case MEMWRITEOOB64_32:
+	{
+		struct mtd_oob_buf64_32 buf;
+		struct mtd_oob_buf64_32 __user *buf_user = argp;
+
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+		else
+			ret = mtd_do_writeoob(file, mtd, buf.start, buf.length,
+				compat_ptr(buf.ptr), &buf_user->length);
+		break;
+	}
+
+	case MEMREADOOB_32:
+	{
+		struct mtd_oob_buf_32 buf;
+		struct mtd_oob_buf_32 __user *buf_user = argp;
+
+		/* NOTE: old ABI writes return length to buf->start */
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+		else
+			ret = mtd_do_readoob(mtd, buf.start, buf.length,
+				compat_ptr(buf.ptr), &buf_user->start);
+		break;
+	}
+
+	case MEMREADOOB64_32:
+	{
+		struct mtd_oob_buf64_32 buf;
+		struct mtd_oob_buf64_32 __user *buf_user = argp;
+
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+		else
+			ret = mtd_do_readoob(mtd, buf.start, buf.length,
+				compat_ptr(buf.ptr), &buf_user->length);
+		break;
+	}
+
+	case MEMLOCK_32:
+		ret = mtd_ioctl_lock(mtd, argp);
+		break;
+
+	case MEMLOCK64_32:
+		ret = mtd_ioctl_lock64(mtd, argp);
+		break;
+
+	case MEMUNLOCK_32:
+		ret = mtd_ioctl_unlock(mtd, argp);
+		break;
+
+	case MEMUNLOCK64_32:
+		ret = mtd_ioctl_unlock64(mtd, argp);
+		break;
+
+	/* Legacy interface */
+	case MEMGETOOBSEL_32:
+		ret = mtd_ioctl_oobsel(mtd, argp);
+		break;
+
+	case MEMGETBADBLOCK_32:
+	{
+		compat_loff_t offs;
+
+		if (copy_from_user(&offs, argp, sizeof(offs)))
+			ret = -EFAULT;
+		else {
+			if (!mtd->block_isbad)
+				ret = -EOPNOTSUPP;
+			else
+				ret = mtd->block_isbad(mtd, offs);
+		}
+		break;
+	}
+
+	case MEMSETBADBLOCK_32:
+	{
+		compat_loff_t offs;
+
+		if (copy_from_user(&offs, argp, sizeof(offs)))
+			ret = -EFAULT;
+		else {
+			if (!mtd->block_markbad)
+				ret = -EOPNOTSUPP;
+			else
+				ret = mtd->block_markbad(mtd, offs);
+		}
+		break;
+	}
+
+#ifdef CONFIG_HAVE_MTD_OTP
+	case OTPSELECT_32:
+	{
+		compat_int_t mode;
+		if (copy_from_user(&mode, argp, sizeof(mode)))
+			ret = -EFAULT;
+		else {
+			mfi->mode = MTD_MODE_NORMAL;
+			ret = otp_select_filemode(mfi, mode);
+			file->f_pos = 0;
+		}
+		break;
+	}
+
+	case OTPGETREGIONCOUNT_32:
+	{
+		int count;
+		compat_int_t __user *ucount = argp;
+
+		ret = mtd_ioctl_otpregioninfo(mfi, mtd, &count, NULL);
+		if(ret == 0 && put_user(count, ucount))
+			ret = -EFAULT;
+		break;
+	}
+
+	case OTPGETREGIONINFO_32:
+		ret = mtd_ioctl_otpregioninfo(mfi, mtd, NULL, argp);
+		break;
+
+	case OTPLOCK_32:
+		ret = mtd_ioctl_otplock(mfi, mtd, argp);
+		break;
+#endif
+
+	case ECCGETLAYOUT_32:
+		ret = mtd_ioctl_ecclayout(mtd, argp);
+		break;
+
+	case ECCGETSTATS_32:
+		ret = mtd_ioctl_eccstats(mtd, argp);
+		break;
+
+	case MTDFILEMODE_32:
+		ret = mtd_ioctl_filemode(file, mfi, mtd, arg);
+		break;
+
+	default:
+		ret = -ENOTTY;
+	}
+
+	unlock_kernel();
+	return(ret);
+}
diff --git a/drivers/mtd/compat_ioctl.h b/drivers/mtd/compat_ioctl.h
new file mode 100644
index 0000000..bdc429f
--- /dev/null
+++ b/drivers/mtd/compat_ioctl.h
@@ -0,0 +1,89 @@
+/*
+ * MTD compat_ioctl definitions
+ */
+
+#ifndef _MTD_COMPAT_IOCTL_H
+#define _MTD_COMPAT_IOCTL_H
+
+#ifdef CONFIG_COMPAT
+
+#include <linux/compat.h>
+#include <linux/ioctl.h>
+#include <linux/compiler.h>
+#include <linux/mtd/mtd.h>
+
+struct erase_info_user64_32 {
+	uint64_t start;
+	uint64_t length;
+	uint32_t res0[8];
+} __aligned(4) __packed; /* prevents tail padding */
+
+struct mtd_oob_buf_32 {
+	uint32_t start;
+	uint32_t length;
+	compat_uptr_t ptr;
+} __aligned(4) __packed;
+
+struct mtd_oob_buf64_32 {
+	uint64_t start;
+	uint32_t res0;
+	uint32_t length;
+	compat_uptr_t ptr;
+	uint32_t res2[8];
+} __aligned(4) __packed;
+
+struct mtd_info_user64_32 {
+	uint32_t type;
+	uint32_t flags;
+	uint64_t size;
+	uint32_t res0;
+	uint32_t erasesize;
+	uint32_t res1;
+	uint32_t writesize;
+	uint32_t res2;
+	uint32_t oobsize;
+	uint32_t res3[32];
+} __aligned(4) __packed;
+
+struct region_info_user64_32 {
+	uint64_t offset;
+	uint32_t res0;
+	uint32_t erasesize;
+	uint32_t res1;
+	uint32_t numblocks;
+	uint32_t res2;
+	uint32_t regionindex;
+	uint32_t res3[16];
+} __aligned(4) __packed;
+
+#define MEMGETINFO_32		_IOR ('M', 1, struct mtd_info_user)
+#define MEMERASE_32		_IOW ('M', 2, struct erase_info_user)
+#define MEMWRITEOOB_32		_IOWR('M', 3, struct mtd_oob_buf_32)
+#define MEMREADOOB_32		_IOWR('M', 4, struct mtd_oob_buf_32)
+#define MEMLOCK_32		_IOW ('M', 5, struct erase_info_user)
+#define MEMUNLOCK_32		_IOW ('M', 6, struct erase_info_user)
+#define MEMGETREGIONCOUNT_32	_IOR ('M', 7, compat_int_t)
+#define MEMGETREGIONINFO_32	_IOWR('M', 8, struct region_info_user)
+#define MEMSETOOBSEL_32		_IOW ('M', 9, struct nand_oobinfo)
+#define MEMGETOOBSEL_32		_IOR ('M', 10, struct nand_oobinfo)
+#define MEMGETBADBLOCK_32	_IOW ('M', 11, compat_loff_t)
+#define MEMSETBADBLOCK_32	_IOW ('M', 12, compat_loff_t)
+#define OTPSELECT_32		_IOR ('M', 13, compat_int_t)
+#define OTPGETREGIONCOUNT_32	_IOW ('M', 14, compat_int_t)
+#define OTPGETREGIONINFO_32	_IOW ('M', 15, struct otp_info)
+#define OTPLOCK_32		_IOR ('M', 16, struct otp_info)
+#define ECCGETLAYOUT_32		_IOR ('M', 17, struct nand_ecclayout)
+#define ECCGETSTATS_32		_IOR ('M', 18, struct mtd_ecc_stats)
+#define MTDFILEMODE_32		_IO  ('M', 19)
+#define MEMABIINFO_32		_IOR ('M', 20, struct mtd_abi_info)
+#define MEMGETINFO64_32		_IOR ('M', 21, struct mtd_info_user64_32)
+#define MEMERASE64_32		_IOW ('M', 22, struct erase_info_user64_32)
+#define MEMWRITEOOB64_32	_IOWR('M', 23, struct mtd_oob_buf64_32)
+#define MEMREADOOB64_32		_IOWR('M', 24, struct mtd_oob_buf64_32)
+#define MEMLOCK64_32		_IOW ('M', 25, struct erase_info_user64_32)
+#define MEMUNLOCK64_32		_IOW ('M', 26, struct erase_info_user64_32)
+#define MEMGETREGIONINFO64_32	_IOWR('M', 27, struct region_info_user64_32)
+
+#endif /* CONFIG_COMPAT */
+
+#endif /* !_MTD_COMPAT_IOCTL_H */
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index e9ec59e..eb89edd 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -19,6 +19,8 @@

 #include <asm/uaccess.h>

+#include "compat_ioctl.h"
+
 static struct class *mtd_class;

 static void mtd_notify_add(struct mtd_info* mtd)
@@ -378,6 +380,436 @@ static int otp_select_filemode(struct
mtd_file_info *mfi, int mode)
 # define otp_select_filemode(f,m)	-EOPNOTSUPP
 #endif

+static int mtd_ioctl_getregioninfo(struct mtd_info *mtd, void __user *argp)
+{
+	uint32_t ur_idx;
+	struct mtd_erase_region_info *kr;
+	struct region_info_user *ur = (struct region_info_user *) argp;
+
+	if (get_user(ur_idx, &(ur->regionindex)))
+		return -EFAULT;
+
+	kr = &(mtd->eraseregions[ur_idx]);
+
+	if (put_user(kr->offset, &(ur->offset))
+	    || put_user(kr->erasesize, &(ur->erasesize))
+	    || put_user(kr->numblocks, &(ur->numblocks)))
+		return -EFAULT;
+
+	return(0);
+}
+
+static int mtd_ioctl_getregioninfo64(struct mtd_info *mtd, void __user *argp)
+{
+	uint32_t ur_idx;
+	struct mtd_erase_region_info *kr;
+	struct region_info_user64 *ur =
+		(struct region_info_user64 *) argp;
+
+	if (get_user(ur_idx, &(ur->regionindex)))
+		return -EFAULT;
+
+	kr = &(mtd->eraseregions[ur_idx]);
+
+	if (put_user(kr->offset, &(ur->offset))
+	    || put_user(kr->erasesize, &(ur->erasesize))
+	    || put_user(kr->numblocks, &(ur->numblocks)))
+		return -EFAULT;
+	
+	return(0);
+}
+
+static int mtd_ioctl_getabiinfo(void __user *argp)
+{
+	struct mtd_abi_info abiinfo;
+
+	abiinfo.major = MTD_MAJOR_VERSION;
+	abiinfo.minor = MTD_MINOR_VERSION;
+	abiinfo.patchlevel = MTD_PATCHLEVEL_VERSION;
+
+	if(copy_to_user(argp, &abiinfo, sizeof(abiinfo)))
+		return(-EFAULT);
+	return(0);
+}
+
+static int mtd_ioctl_getinfo(struct mtd_info *mtd, void __user *argp)
+{
+	struct mtd_info_user info;
+
+	info.type	= mtd->type;
+	info.flags	= mtd->flags;
+	info.size	= mtd->size;
+	info.erasesize	= mtd->erasesize;
+	info.writesize	= mtd->writesize;
+	info.oobsize	= mtd->oobsize;
+	/* The below fields are obsolete */
+	info.ecctype	= -1;
+	info.eccsize	= 0;
+	if (copy_to_user(argp, &info, sizeof(struct mtd_info_user)))
+		return -EFAULT;
+	return(0);
+}
+
+static int mtd_ioctl_getinfo64(struct mtd_info *mtd, void __user *argp)
+{
+	struct mtd_info_user64 info;
+
+	info.type	= mtd->type;
+	info.flags	= mtd->flags;
+	info.size	= mtd->size;
+	info.erasesize = mtd->erasesize;
+	info.writesize = mtd->writesize;
+	info.oobsize	= mtd->oobsize;
+
+	if (copy_to_user(argp, &info, sizeof(struct mtd_info_user64)))
+		return -EFAULT;
+	return(0);
+}
+
+static int mtd_do_erase(struct file *file, struct mtd_info *mtd,
+	uint64_t start, uint64_t length)
+{
+	struct erase_info *erase;
+	int ret = 0;
+
+	if(!(file->f_mode & FMODE_WRITE))
+		return -EPERM;
+
+	erase=kzalloc(sizeof(struct erase_info),GFP_KERNEL);
+	if (!erase)
+		ret = -ENOMEM;
+	else {
+		wait_queue_head_t waitq;
+		DECLARE_WAITQUEUE(wait, current);
+
+		init_waitqueue_head(&waitq);
+
+		erase->addr = start;
+		erase->len = length;
+		erase->mtd = mtd;
+		erase->callback = mtdchar_erase_callback;
+		erase->priv = (unsigned long)&waitq;
+
+		/*
+		  FIXME: Allow INTERRUPTIBLE. Which means
+		  not having the wait_queue head on the stack.
+
+		  If the wq_head is on the stack, and we
+		  leave because we got interrupted, then the
+		  wq_head is no longer there when the
+		  callback routine tries to wake us up.
+		*/
+		ret = mtd->erase(mtd, erase);
+		if (!ret) {
+			set_current_state(TASK_UNINTERRUPTIBLE);
+			add_wait_queue(&waitq, &wait);
+			if (erase->state != MTD_ERASE_DONE &&
+			    erase->state != MTD_ERASE_FAILED)
+				schedule();
+			remove_wait_queue(&waitq, &wait);
+			set_current_state(TASK_RUNNING);
+
+			ret = (erase->state == MTD_ERASE_FAILED)?-EIO:0;
+		}
+		kfree(erase);
+	}
+	return(ret);
+}
+
+static int mtd_ioctl_erase(struct file *file, struct mtd_info *mtd,
+	void __user *argp)
+{
+	struct erase_info_user einfo;
+
+	if (copy_from_user(&einfo, argp, sizeof(struct erase_info_user)))
+		return -EFAULT;
+	return(mtd_do_erase(file, mtd, einfo.start, einfo.length));
+}
+
+static int mtd_ioctl_erase64(struct file *file, struct mtd_info *mtd,
+	void __user *argp)
+{
+	struct erase_info_user64 einfo;
+
+	if (copy_from_user(&einfo, argp, sizeof(struct erase_info_user64)))
+		return -EFAULT;
+	return(mtd_do_erase(file, mtd, einfo.start, einfo.length));
+}
+
+static int mtd_do_writeoob(struct file *file, struct mtd_info *mtd,
+	uint64_t start, uint32_t length, void __user *ptr,
+	uint32_t __user *retp)
+{
+	struct mtd_oob_ops ops;
+	uint32_t retlen;
+	int ret = 0;
+
+	if(!(file->f_mode & FMODE_WRITE))
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
+	return(ret);
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
+	return(ret);
+}
+
+static int mtd_ioctl_lock(struct mtd_info *mtd, void __user *argp)
+{
+	struct erase_info_user einfo;
+	int ret;
+
+	if (copy_from_user(&einfo, argp, sizeof(einfo)))
+		return -EFAULT;
+
+	if (!mtd->lock)
+		ret = -EOPNOTSUPP;
+	else
+		ret = mtd->lock(mtd, einfo.start, einfo.length);
+	return(ret);
+}
+
+static int mtd_ioctl_lock64(struct mtd_info *mtd, void __user *argp)
+{
+	struct erase_info_user64 einfo;
+	int ret;
+
+	if (copy_from_user(&einfo, argp, sizeof(einfo)))
+		return -EFAULT;
+
+	if (!mtd->lock)
+		ret = -EOPNOTSUPP;
+	else
+		ret = mtd->lock(mtd, einfo.start, einfo.length);
+	return(ret);
+}
+
+static int mtd_ioctl_unlock(struct mtd_info *mtd, void __user *argp)
+{
+	struct erase_info_user einfo;
+	int ret;
+
+	if (copy_from_user(&einfo, argp, sizeof(einfo)))
+		return -EFAULT;
+
+	if (!mtd->unlock)
+		ret = -EOPNOTSUPP;
+	else
+		ret = mtd->unlock(mtd, einfo.start, einfo.length);
+	return(ret);
+}
+
+static int mtd_ioctl_unlock64(struct mtd_info *mtd, void __user *argp)
+{
+	struct erase_info_user64 einfo;
+	int ret;
+
+	if (copy_from_user(&einfo, argp, sizeof(einfo)))
+		return -EFAULT;
+
+	if (!mtd->unlock)
+		ret = -EOPNOTSUPP;
+	else
+		ret = mtd->unlock(mtd, einfo.start, einfo.length);
+	return(ret);
+}
+
+static int mtd_ioctl_oobsel(struct mtd_info *mtd, void __user *argp)
+{
+	struct nand_oobinfo oi;
+
+	if (!mtd->ecclayout)
+		return -EOPNOTSUPP;
+	if (mtd->ecclayout->eccbytes > ARRAY_SIZE(oi.eccpos))
+		return -EINVAL;
+
+	oi.useecc = MTD_NANDECC_AUTOPLACE;
+	memcpy(&oi.eccpos, mtd->ecclayout->eccpos, sizeof(oi.eccpos));
+	memcpy(&oi.oobfree, mtd->ecclayout->oobfree,
+	       sizeof(oi.oobfree));
+	oi.eccbytes = mtd->ecclayout->eccbytes;
+
+	if (copy_to_user(argp, &oi, sizeof(struct nand_oobinfo)))
+		return -EFAULT;
+	return(0);
+}
+
+#ifdef CONFIG_HAVE_MTD_OTP
+static int mtd_ioctl_otpregioninfo(struct mtd_file_info *mfi,
+	struct mtd_info *mtd, int *count, void __user *argp)
+{
+	struct otp_info *buf = kmalloc(4096, GFP_KERNEL);
+	int ret;
+
+	if (!buf)
+		return -ENOMEM;
+	ret = -EOPNOTSUPP;
+	switch (mfi->mode) {
+	case MTD_MODE_OTP_FACTORY:
+		if (mtd->get_fact_prot_info)
+			ret = mtd->get_fact_prot_info(mtd, buf, 4096);
+		break;
+	case MTD_MODE_OTP_USER:
+		if (mtd->get_user_prot_info)
+			ret = mtd->get_user_prot_info(mtd, buf, 4096);
+		break;
+	default:
+		break;
+	}
+	if (ret >= 0) {
+		if (count) {
+			*count = ret / sizeof(struct otp_info);
+			ret = 0;
+		}
+		if (argp)
+			ret = copy_to_user(argp, buf, ret);
+		if (ret)
+			ret = -EFAULT;
+	}
+	kfree(buf);
+	return(ret);
+}
+
+static int mtd_ioctl_otplock(struct mtd_file_info *mfi, struct mtd_info *mtd,
+	void __user *argp)
+{
+	struct otp_info oinfo;
+	int ret;
+
+	if (mfi->mode != MTD_MODE_OTP_USER)
+		return -EINVAL;
+	if (copy_from_user(&oinfo, argp, sizeof(oinfo)))
+		return -EFAULT;
+	if (!mtd->lock_user_prot_reg)
+		return -EOPNOTSUPP;
+	ret = mtd->lock_user_prot_reg(mtd, oinfo.start, oinfo.length);
+	return(ret);
+}
+#endif /* CONFIG_HAVE_MTD_OTP */
+
+static int mtd_ioctl_ecclayout(struct mtd_info *mtd, void __user *argp)
+{
+	if (!mtd->ecclayout)
+		return -EOPNOTSUPP;
+
+	if (copy_to_user(argp, mtd->ecclayout,
+			 sizeof(struct nand_ecclayout)))
+		return -EFAULT;
+	return(0);
+}
+
+static int mtd_ioctl_eccstats(struct mtd_info *mtd, void __user *argp)
+{
+	if (copy_to_user(argp, &mtd->ecc_stats,
+			 sizeof(struct mtd_ecc_stats)))
+		return -EFAULT;
+	return(0);
+}
+
+static int mtd_ioctl_filemode(struct file *file, struct mtd_file_info *mfi,
+	struct mtd_info *mtd, unsigned long arg)
+{
+	int ret = 0;
+
+	mfi->mode = 0;
+
+	switch(arg) {
+	case MTD_MODE_OTP_FACTORY:
+	case MTD_MODE_OTP_USER:
+		ret = otp_select_filemode(mfi, arg);
+		break;
+
+	case MTD_MODE_RAW:
+		if (!mtd->read_oob || !mtd->write_oob)
+			return -EOPNOTSUPP;
+		mfi->mode = arg;
+
+	case MTD_MODE_NORMAL:
+		break;
+	default:
+		ret = -EINVAL;
+	}
+	file->f_pos = 0;
+
+	return(ret);
+}
+
 static int mtd_ioctl(struct inode *inode, struct file *file,
 		     u_int cmd, u_long arg)
 {
@@ -386,7 +818,6 @@ static int mtd_ioctl(struct inode *inode, struct file *file,
 	void __user *argp = (void __user *)arg;
 	int ret = 0;
 	u_long size;
-	struct mtd_info_user info;

 	DEBUG(MTD_DEBUG_LEVEL0, "MTD_ioctl\n");

@@ -403,256 +834,123 @@ static int mtd_ioctl(struct inode *inode,
struct file *file,
 	switch (cmd) {
 	case MEMGETREGIONCOUNT:
 		if (copy_to_user(argp, &(mtd->numeraseregions), sizeof(int)))
-			return -EFAULT;
+			ret = -EFAULT;
 		break;

 	case MEMGETREGIONINFO:
-	{
-		uint32_t ur_idx;
-		struct mtd_erase_region_info *kr;
-		struct region_info_user *ur = (struct region_info_user *) argp;
-
-		if (get_user(ur_idx, &(ur->regionindex)))
-			return -EFAULT;
-
-		kr = &(mtd->eraseregions[ur_idx]);
+		ret = mtd_ioctl_getregioninfo(mtd, argp);
+		break;

-		if (put_user(kr->offset, &(ur->offset))
-		    || put_user(kr->erasesize, &(ur->erasesize))
-		    || put_user(kr->numblocks, &(ur->numblocks)))
-			return -EFAULT;
+	case MEMGETREGIONINFO64:
+		ret = mtd_ioctl_getregioninfo64(mtd, argp);
+		break;

+	case MEMABIINFO:
+		ret = mtd_ioctl_getabiinfo(argp);
 		break;
-	}

 	case MEMGETINFO:
-		info.type	= mtd->type;
-		info.flags	= mtd->flags;
-		info.size	= mtd->size;
-		info.erasesize	= mtd->erasesize;
-		info.writesize	= mtd->writesize;
-		info.oobsize	= mtd->oobsize;
-		/* The below fields are obsolete */
-		info.ecctype	= -1;
-		info.eccsize	= 0;
-		if (copy_to_user(argp, &info, sizeof(struct mtd_info_user)))
-			return -EFAULT;
+		ret = mtd_ioctl_getinfo(mtd, argp);
 		break;

-	case MEMERASE:
-	{
-		struct erase_info *erase;
-
-		if(!(file->f_mode & FMODE_WRITE))
-			return -EPERM;
-
-		erase=kzalloc(sizeof(struct erase_info),GFP_KERNEL);
-		if (!erase)
-			ret = -ENOMEM;
-		else {
-			struct erase_info_user einfo;
-
-			wait_queue_head_t waitq;
-			DECLARE_WAITQUEUE(wait, current);
+	case MEMGETINFO64:
+		ret = mtd_ioctl_getinfo64(mtd, argp);
+		break;

-			init_waitqueue_head(&waitq);
+	case MEMERASE:
+		ret = mtd_ioctl_erase(file, mtd, argp);
+		break;

-			if (copy_from_user(&einfo, argp,
-				    sizeof(struct erase_info_user))) {
-				kfree(erase);
-				return -EFAULT;
-			}
-			erase->addr = einfo.start;
-			erase->len = einfo.length;
-			erase->mtd = mtd;
-			erase->callback = mtdchar_erase_callback;
-			erase->priv = (unsigned long)&waitq;
-
-			/*
-			  FIXME: Allow INTERRUPTIBLE. Which means
-			  not having the wait_queue head on the stack.
-
-			  If the wq_head is on the stack, and we
-			  leave because we got interrupted, then the
-			  wq_head is no longer there when the
-			  callback routine tries to wake us up.
-			*/
-			ret = mtd->erase(mtd, erase);
-			if (!ret) {
-				set_current_state(TASK_UNINTERRUPTIBLE);
-				add_wait_queue(&waitq, &wait);
-				if (erase->state != MTD_ERASE_DONE &&
-				    erase->state != MTD_ERASE_FAILED)
-					schedule();
-				remove_wait_queue(&waitq, &wait);
-				set_current_state(TASK_RUNNING);
-
-				ret = (erase->state == MTD_ERASE_FAILED)?-EIO:0;
-			}
-			kfree(erase);
-		}
+	case MEMERASE64:
+		ret = mtd_ioctl_erase64(file, mtd, argp);
 		break;
-	}

 	case MEMWRITEOOB:
 	{
 		struct mtd_oob_buf buf;
-		struct mtd_oob_ops ops;
-		struct mtd_oob_buf __user *user_buf = argp;
-	        uint32_t retlen;
+		struct mtd_oob_buf __user *buf_user = argp;

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
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
 		else
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
+			ret = mtd_do_writeoob(file, mtd, buf.start, buf.length,
+				buf.ptr, &buf_user->length);
+		break;
+	}

-		buf.start &= ~(mtd->oobsize - 1);
-		ret = mtd->write_oob(mtd, buf.start, &ops);
+	case MEMWRITEOOB64:
+	{
+		struct mtd_oob_buf64 buf;
+		struct mtd_oob_buf64 __user *buf_user = argp;

-		if (ops.oobretlen > 0xFFFFFFFFU)
-			ret = -EOVERFLOW;
-		retlen = ops.oobretlen;
-		if (copy_to_user(&user_buf->length, &retlen, sizeof(buf.length)))
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
+		struct mtd_oob_buf __user *buf_user = argp;

-		if (buf.length > 4096)
-			return -EINVAL;
-
-		if (!mtd->read_oob)
-			ret = -EOPNOTSUPP;
+		/* NOTE: old ABI writes return length to buf->start */
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
 		else
-			ret = access_ok(VERIFY_WRITE, buf.ptr,
-					buf.length) ? 0 : -EFAULT;
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
+			ret = mtd_do_readoob(mtd, buf.start, buf.length,
+				buf.ptr, &buf_user->start);
+		break;
+	}

-		buf.start &= ~(mtd->oobsize - 1);
-		ret = mtd->read_oob(mtd, buf.start, &ops);
+	case MEMREADOOB64:
+	{
+		struct mtd_oob_buf64 buf;
+		struct mtd_oob_buf64 __user *buf_user = argp;

-		if (put_user(ops.oobretlen, (uint32_t __user *)argp))
-			ret = -EFAULT;
-		else if (ops.oobretlen && copy_to_user(buf.ptr, ops.oobbuf,
-						    ops.oobretlen))
+		if (copy_from_user(&buf, argp, sizeof(buf)))
 			ret = -EFAULT;
-
-		kfree(ops.oobbuf);
+		else
+			ret = mtd_do_readoob(mtd, buf.start, buf.length,
+				buf.ptr, &buf_user->length);
 		break;
 	}

 	case MEMLOCK:
-	{
-		struct erase_info_user einfo;
-
-		if (copy_from_user(&einfo, argp, sizeof(einfo)))
-			return -EFAULT;
+		ret = mtd_ioctl_lock(mtd, argp);
+		break;

-		if (!mtd->lock)
-			ret = -EOPNOTSUPP;
-		else
-			ret = mtd->lock(mtd, einfo.start, einfo.length);
+	case MEMLOCK64:
+		ret = mtd_ioctl_lock64(mtd, argp);
 		break;
-	}

 	case MEMUNLOCK:
-	{
-		struct erase_info_user einfo;
-
-		if (copy_from_user(&einfo, argp, sizeof(einfo)))
-			return -EFAULT;
+		ret = mtd_ioctl_unlock(mtd, argp);
+		break;

-		if (!mtd->unlock)
-			ret = -EOPNOTSUPP;
-		else
-			ret = mtd->unlock(mtd, einfo.start, einfo.length);
+	case MEMUNLOCK64:
+		ret = mtd_ioctl_unlock64(mtd, argp);
 		break;
-	}

 	/* Legacy interface */
 	case MEMGETOOBSEL:
-	{
-		struct nand_oobinfo oi;
-
-		if (!mtd->ecclayout)
-			return -EOPNOTSUPP;
-		if (mtd->ecclayout->eccbytes > ARRAY_SIZE(oi.eccpos))
-			return -EINVAL;
-
-		oi.useecc = MTD_NANDECC_AUTOPLACE;
-		memcpy(&oi.eccpos, mtd->ecclayout->eccpos, sizeof(oi.eccpos));
-		memcpy(&oi.oobfree, mtd->ecclayout->oobfree,
-		       sizeof(oi.oobfree));
-		oi.eccbytes = mtd->ecclayout->eccbytes;
-
-		if (copy_to_user(argp, &oi, sizeof(struct nand_oobinfo)))
-			return -EFAULT;
+		ret = mtd_ioctl_oobsel(mtd, argp);
 		break;
-	}

 	case MEMGETBADBLOCK:
 	{
 		loff_t offs;

-		if (copy_from_user(&offs, argp, sizeof(loff_t)))
-			return -EFAULT;
-		if (!mtd->block_isbad)
-			ret = -EOPNOTSUPP;
-		else
-			return mtd->block_isbad(mtd, offs);
+		if (copy_from_user(&offs, argp, sizeof(offs)))
+			ret = -EFAULT;
+		else {
+			if (!mtd->block_isbad)
+				ret = -EOPNOTSUPP;
+			else
+				ret = mtd->block_isbad(mtd, offs);
+		}
 		break;
 	}

@@ -660,12 +958,14 @@ static int mtd_ioctl(struct inode *inode, struct
file *file,
 	{
 		loff_t offs;

-		if (copy_from_user(&offs, argp, sizeof(loff_t)))
-			return -EFAULT;
-		if (!mtd->block_markbad)
-			ret = -EOPNOTSUPP;
-		else
-			return mtd->block_markbad(mtd, offs);
+		if (copy_from_user(&offs, argp, sizeof(offs)))
+			ret = -EFAULT;
+		else {
+			if (!mtd->block_markbad)
+				ret = -EOPNOTSUPP;
+			else
+				ret = mtd->block_markbad(mtd, offs);
+		}
 		break;
 	}

@@ -673,106 +973,46 @@ static int mtd_ioctl(struct inode *inode,
struct file *file,
 	case OTPSELECT:
 	{
 		int mode;
-		if (copy_from_user(&mode, argp, sizeof(int)))
-			return -EFAULT;
-
-		mfi->mode = MTD_MODE_NORMAL;
-
-		ret = otp_select_filemode(mfi, mode);
-
-		file->f_pos = 0;
+		if (copy_from_user(&mode, argp, sizeof(mode)))
+			ret = -EFAULT;
+		else {
+			mfi->mode = MTD_MODE_NORMAL;
+			ret = otp_select_filemode(mfi, mode);
+			file->f_pos = 0;
+		}
 		break;
 	}

 	case OTPGETREGIONCOUNT:
-	case OTPGETREGIONINFO:
 	{
-		struct otp_info *buf = kmalloc(4096, GFP_KERNEL);
-		if (!buf)
-			return -ENOMEM;
-		ret = -EOPNOTSUPP;
-		switch (mfi->mode) {
-		case MTD_MODE_OTP_FACTORY:
-			if (mtd->get_fact_prot_info)
-				ret = mtd->get_fact_prot_info(mtd, buf, 4096);
-			break;
-		case MTD_MODE_OTP_USER:
-			if (mtd->get_user_prot_info)
-				ret = mtd->get_user_prot_info(mtd, buf, 4096);
-			break;
-		default:
-			break;
-		}
-		if (ret >= 0) {
-			if (cmd == OTPGETREGIONCOUNT) {
-				int nbr = ret / sizeof(struct otp_info);
-				ret = copy_to_user(argp, &nbr, sizeof(int));
-			} else
-				ret = copy_to_user(argp, buf, ret);
-			if (ret)
-				ret = -EFAULT;
-		}
-		kfree(buf);
+		int count;
+
+		ret = mtd_ioctl_otpregioninfo(mfi, mtd, &count, NULL);
+		if(ret == 0 && copy_to_user(argp, &count, sizeof(count)))
+			ret = -EFAULT;
 		break;
 	}

-	case OTPLOCK:
-	{
-		struct otp_info oinfo;
+	case OTPGETREGIONINFO:
+		ret = mtd_ioctl_otpregioninfo(mfi, mtd, NULL, argp);
+		break;

-		if (mfi->mode != MTD_MODE_OTP_USER)
-			return -EINVAL;
-		if (copy_from_user(&oinfo, argp, sizeof(oinfo)))
-			return -EFAULT;
-		if (!mtd->lock_user_prot_reg)
-			return -EOPNOTSUPP;
-		ret = mtd->lock_user_prot_reg(mtd, oinfo.start, oinfo.length);
+	case OTPLOCK:
+		ret = mtd_ioctl_otplock(mfi, mtd, argp);
 		break;
-	}
 #endif

 	case ECCGETLAYOUT:
-	{
-		if (!mtd->ecclayout)
-			return -EOPNOTSUPP;
-
-		if (copy_to_user(argp, mtd->ecclayout,
-				 sizeof(struct nand_ecclayout)))
-			return -EFAULT;
+		ret = mtd_ioctl_ecclayout(mtd, argp);
 		break;
-	}

 	case ECCGETSTATS:
-	{
-		if (copy_to_user(argp, &mtd->ecc_stats,
-				 sizeof(struct mtd_ecc_stats)))
-			return -EFAULT;
+		ret = mtd_ioctl_eccstats(mtd, argp);
 		break;
-	}

 	case MTDFILEMODE:
-	{
-		mfi->mode = 0;
-
-		switch(arg) {
-		case MTD_MODE_OTP_FACTORY:
-		case MTD_MODE_OTP_USER:
-			ret = otp_select_filemode(mfi, arg);
-			break;
-
-		case MTD_MODE_RAW:
-			if (!mtd->read_oob || !mtd->write_oob)
-				return -EOPNOTSUPP;
-			mfi->mode = arg;
-
-		case MTD_MODE_NORMAL:
-			break;
-		default:
-			ret = -EINVAL;
-		}
-		file->f_pos = 0;
+		ret = mtd_ioctl_filemode(file, mfi, mtd, arg);
 		break;
-	}

 	default:
 		ret = -ENOTTY;
@@ -781,12 +1021,19 @@ static int mtd_ioctl(struct inode *inode,
struct file *file,
 	return ret;
 } /* memory_ioctl */

+#ifdef CONFIG_COMPAT
+#include "compat_ioctl.c"
+#endif
+
 static const struct file_operations mtd_fops = {
 	.owner		= THIS_MODULE,
 	.llseek		= mtd_lseek,
 	.read		= mtd_read,
 	.write		= mtd_write,
 	.ioctl		= mtd_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl	= mtd_compat_ioctl,
+#endif
 	.open		= mtd_open,
 	.release	= mtd_close,
 };
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index c6c61cd..ae76363 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -5,17 +5,35 @@
 #ifndef __MTD_ABI_H__
 #define __MTD_ABI_H__

+#define MTD_MAJOR_VERSION	2
+#define MTD_MINOR_VERSION	0
+#define MTD_PATCHLEVEL_VERSION	0
+
 struct erase_info_user {
 	uint32_t start;
 	uint32_t length;
 };

+struct erase_info_user64 {
+	uint64_t start;
+	uint64_t length;
+	uint32_t res0[8];
+};
+
 struct mtd_oob_buf {
 	uint32_t start;
 	uint32_t length;
 	unsigned char __user *ptr;
 };

+struct mtd_oob_buf64 {
+	uint64_t start;
+	uint32_t res0;
+	uint32_t length;
+	unsigned char __user *ptr;
+	uint32_t res2[8];
+};
+
 #define MTD_ABSENT		0
 #define MTD_RAM			1
 #define MTD_ROM			2
@@ -50,14 +68,25 @@ struct mtd_oob_buf {
 struct mtd_info_user {
 	uint8_t type;
 	uint32_t flags;
-	uint32_t size;	 // Total size of the MTD
+	uint32_t size;			/* Total size of the MTD */
 	uint32_t erasesize;
 	uint32_t writesize;
-	uint32_t oobsize;   // Amount of OOB data per block (e.g. 16)
-	/* The below two fields are obsolete and broken, do not use them
-	 * (TODO: remove at some point) */
-	uint32_t ecctype;
-	uint32_t eccsize;
+	uint32_t oobsize;		/* OOB bytes per page (e.g. 16) */
+	uint32_t ecctype;		/* Obsolete, always reports -1 */
+	uint32_t eccsize;		/* Obsolete, always reports 0 */
+};
+
+struct mtd_info_user64 {
+	uint32_t type;
+	uint32_t flags;
+	uint64_t size;			/* Total size of the MTD */
+	uint32_t res0;
+	uint32_t erasesize;
+	uint32_t res1;
+	uint32_t writesize;
+	uint32_t res2;
+	uint32_t oobsize;		/* OOB bytes per page (e.g. 16) */
+	uint32_t res3[32];
 };

 struct region_info_user {
@@ -68,12 +97,31 @@ struct region_info_user {
 	uint32_t regionindex;
 };

+struct region_info_user64 {
+	uint64_t offset;		/* At which this region starts,
+					 * from the beginning of the MTD */
+	uint32_t res0;
+	uint32_t erasesize;		/* For this region */
+	uint32_t res1;
+	uint32_t numblocks;		/* Number of blocks in this region */
+	uint32_t res2;
+	uint32_t regionindex;
+	uint32_t res3[16];
+};
+
 struct otp_info {
 	uint32_t start;
 	uint32_t length;
 	uint32_t locked;
 };

+struct mtd_abi_info {
+	uint32_t major;
+	uint32_t minor;
+	uint32_t patchlevel;
+	uint32_t res0[8];
+};
+
 #define MEMGETINFO		_IOR('M', 1, struct mtd_info_user)
 #define MEMERASE		_IOW('M', 2, struct erase_info_user)
 #define MEMWRITEOOB		_IOWR('M', 3, struct mtd_oob_buf)
@@ -94,6 +142,15 @@ struct otp_info {
 #define ECCGETSTATS		_IOR('M', 18, struct mtd_ecc_stats)
 #define MTDFILEMODE		_IO('M', 19)

+#define MEMABIINFO		_IOR ('M', 20, struct mtd_abi_info)
+#define MEMGETINFO64		_IOR ('M', 21, struct mtd_info_user64)
+#define MEMERASE64		_IOW ('M', 22, struct erase_info_user64)
+#define MEMWRITEOOB64		_IOWR('M', 23, struct mtd_oob_buf64)
+#define MEMREADOOB64		_IOWR('M', 24, struct mtd_oob_buf64)
+#define MEMLOCK64		_IOW ('M', 25, struct erase_info_user64)
+#define MEMUNLOCK64		_IOW ('M', 26, struct erase_info_user64)
+#define MEMGETREGIONINFO64	_IOWR('M', 27, struct region_info_user64)
+
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
  * interfaces
diff --git a/include/mtd/mtd-user.h b/include/mtd/mtd-user.h
index 170ceca..1b0da98 100644
--- a/include/mtd/mtd-user.h
+++ b/include/mtd/mtd-user.h
@@ -16,4 +16,8 @@ typedef struct region_info_user region_info_t;
 typedef struct nand_oobinfo nand_oobinfo_t;
 typedef struct nand_ecclayout nand_ecclayout_t;

+typedef struct mtd_info_user64 mtd_info64_t;
+typedef struct erase_info_user64 erase_info64_t;
+typedef struct region_info_user64 region_info64_t;
+
 #endif /* __MTD_USER_H__ */
-- 
1.5.6.3
