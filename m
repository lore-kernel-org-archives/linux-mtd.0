Received: from mail-qy0-f109.google.com ([209.85.221.109])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LkmrQ-0000pk-52
	for linux-mtd@lists.infradead.org; Fri, 20 Mar 2009 22:06:47 +0000
Received: by mail-qy0-f109.google.com with SMTP id 7so1826458qyk.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 Mar 2009 15:06:40 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 20 Mar 2009 15:06:39 -0700
Message-ID: <a95a62fe0903201506p56548fecm652f50059d24a669@mail.gmail.com>
Subject: [PATCH 1/2] [MTD] CORE: New ioctl calls for >4GiB device support
	(take 3)
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

New ioctls: MEMABIINFO MEMGETINFO64 MEMERASE64 MEMWRITEOOB64 MEMREADOOB64
            MEMLOCK64 MEMUNLOCK64 MEMGETREGIONINFO64

Compat ioctls: MEMWRITEOOB64_32 MEMREADOOB64_32

Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>
---
 drivers/mtd/mtdchar.c  |  153 ++++++++++++++++++++++++++++++++++++++++++------
 fs/compat_ioctl.c      |   52 ++++++++++++++++-
 include/mtd/mtd-abi.h  |   57 ++++++++++++++++--
 include/mtd/mtd-user.h |    4 +
 4 files changed, 239 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index e9ec59e..6738c83 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -387,6 +387,7 @@ static int mtd_ioctl(struct inode *inode, struct file *file,
 	int ret = 0;
 	u_long size;
 	struct mtd_info_user info;
+	struct mtd_info_user64 info64;

 	DEBUG(MTD_DEBUG_LEVEL0, "MTD_ioctl\n");

@@ -425,6 +426,26 @@ static int mtd_ioctl(struct inode *inode, struct
file *file,
 		break;
 	}

+	case MEMGETREGIONINFO64:
+	{
+		uint32_t ur_idx;
+		struct mtd_erase_region_info *kr;
+		struct region_info_user64 *ur =
+			(struct region_info_user64 *) argp;
+
+		if (get_user(ur_idx, &(ur->regionindex)))
+			return -EFAULT;
+
+		kr = &(mtd->eraseregions[ur_idx]);
+
+		if (put_user(kr->offset, &(ur->offset))
+		    || put_user(kr->erasesize, &(ur->erasesize))
+		    || put_user(kr->numblocks, &(ur->numblocks)))
+			return -EFAULT;
+
+		break;
+	}
+
 	case MEMGETINFO:
 		info.type	= mtd->type;
 		info.flags	= mtd->flags;
@@ -439,7 +460,19 @@ static int mtd_ioctl(struct inode *inode, struct
file *file,
 			return -EFAULT;
 		break;

+	case MEMGETINFO64:
+		info64.type	= mtd->type;
+		info64.flags	= mtd->flags;
+		info64.size	= mtd->size;
+		info64.erasesize = mtd->erasesize;
+		info64.writesize = mtd->writesize;
+		info64.oobsize	= mtd->oobsize;
+		if (copy_to_user(argp, &info64, sizeof(struct mtd_info_user64)))
+			return -EFAULT;
+		break;
+
 	case MEMERASE:
+	case MEMERASE64:
 	{
 		struct erase_info *erase;

@@ -450,20 +483,32 @@ static int mtd_ioctl(struct inode *inode, struct
file *file,
 		if (!erase)
 			ret = -ENOMEM;
 		else {
-			struct erase_info_user einfo;
-
 			wait_queue_head_t waitq;
 			DECLARE_WAITQUEUE(wait, current);

 			init_waitqueue_head(&waitq);

-			if (copy_from_user(&einfo, argp,
-				    sizeof(struct erase_info_user))) {
-				kfree(erase);
-				return -EFAULT;
+			if(cmd == MEMERASE64) {
+				struct erase_info_user64 einfo64;
+
+				if (copy_from_user(&einfo64, argp,
+					    sizeof(struct erase_info_user64))) {
+					kfree(erase);
+					return -EFAULT;
+				}
+				erase->addr = einfo64.start;
+				erase->len = einfo64.length;
+			} else {
+				struct erase_info_user einfo32;
+
+				if (copy_from_user(&einfo32, argp,
+					    sizeof(struct erase_info_user))) {
+					kfree(erase);
+					return -EFAULT;
+				}
+				erase->addr = einfo32.start;
+				erase->len = einfo32.length;
 			}
-			erase->addr = einfo.start;
-			erase->len = einfo.length;
 			erase->mtd = mtd;
 			erase->callback = mtdchar_erase_callback;
 			erase->priv = (unsigned long)&waitq;
@@ -495,17 +540,37 @@ static int mtd_ioctl(struct inode *inode, struct
file *file,
 	}

 	case MEMWRITEOOB:
+	case MEMWRITEOOB64:
 	{
-		struct mtd_oob_buf buf;
+		struct mtd_oob_buf64 buf;
 		struct mtd_oob_ops ops;
-		struct mtd_oob_buf __user *user_buf = argp;
 	        uint32_t retlen;
+		uint32_t __user *retp;

 		if(!(file->f_mode & FMODE_WRITE))
 			return -EPERM;

-		if (copy_from_user(&buf, argp, sizeof(struct mtd_oob_buf)))
-			return -EFAULT;
+		if (cmd == MEMWRITEOOB64) {
+			struct mtd_oob_buf64 __user *user_buf = argp;
+
+			if (copy_from_user(&buf, argp,
+				    sizeof(struct mtd_oob_buf64)))
+				return -EFAULT;
+			retp = &user_buf->length;
+		} else {
+			struct mtd_oob_buf __user *user_buf = argp;
+			struct mtd_oob_buf buf32;
+
+			if (copy_from_user(&buf32, argp,
+				    sizeof(struct mtd_oob_buf)))
+				return -EFAULT;
+
+			buf.start = buf32.start;
+			buf.length = buf32.length;
+			buf.ptr = buf32.ptr;
+
+			retp = &user_buf->length;
+		}

 		if (buf.length > 4096)
 			return -EINVAL;
@@ -536,13 +601,13 @@ static int mtd_ioctl(struct inode *inode, struct
file *file,
 			return -EFAULT;
 		}

-		buf.start &= ~(mtd->oobsize - 1);
+		buf.start &= ~((uint64_t)mtd->oobsize - 1);
 		ret = mtd->write_oob(mtd, buf.start, &ops);

 		if (ops.oobretlen > 0xFFFFFFFFU)
 			ret = -EOVERFLOW;
 		retlen = ops.oobretlen;
-		if (copy_to_user(&user_buf->length, &retlen, sizeof(buf.length)))
+		if (copy_to_user(retp, &retlen, sizeof(buf.length)))
 			ret = -EFAULT;

 		kfree(ops.oobbuf);
@@ -551,12 +616,34 @@ static int mtd_ioctl(struct inode *inode, struct
file *file,
 	}

 	case MEMREADOOB:
+	case MEMREADOOB64:
 	{
-		struct mtd_oob_buf buf;
+		struct mtd_oob_buf64 buf;
 		struct mtd_oob_ops ops;
+		uint32_t __user *retp;

-		if (copy_from_user(&buf, argp, sizeof(struct mtd_oob_buf)))
-			return -EFAULT;
+		if (cmd == MEMREADOOB64) {
+			struct mtd_oob_buf64 __user *user_buf = argp;
+
+			if (copy_from_user(&buf, user_buf,
+				    sizeof(struct mtd_oob_buf64)))
+				return -EFAULT;
+
+			retp = &user_buf->length;
+		} else {
+			struct mtd_oob_buf __user *user_buf = argp;
+			struct mtd_oob_buf buf32;
+
+			if (copy_from_user(&buf32, user_buf,
+				    sizeof(struct mtd_oob_buf)))
+				return -EFAULT;
+			buf.start = buf32.start;
+			buf.length = buf32.length;
+			buf.ptr = buf32.ptr;
+
+			/* MEMREADOOB returned length goes in "start" field */
+			retp = &user_buf->start;
+		}

 		if (buf.length > 4096)
 			return -EINVAL;
@@ -581,10 +668,10 @@ static int mtd_ioctl(struct inode *inode, struct
file *file,
 		if (!ops.oobbuf)
 			return -ENOMEM;

-		buf.start &= ~(mtd->oobsize - 1);
+		buf.start &= ~((uint64_t)mtd->oobsize - 1);
 		ret = mtd->read_oob(mtd, buf.start, &ops);

-		if (put_user(ops.oobretlen, (uint32_t __user *)argp))
+		if (put_user(ops.oobretlen, retp))
 			ret = -EFAULT;
 		else if (ops.oobretlen && copy_to_user(buf.ptr, ops.oobbuf,
 						    ops.oobretlen))
@@ -608,6 +695,20 @@ static int mtd_ioctl(struct inode *inode, struct
file *file,
 		break;
 	}

+	case MEMLOCK64:
+	{
+		struct erase_info_user64 einfo64;
+
+		if (copy_from_user(&einfo64, argp, sizeof(einfo64)))
+			return -EFAULT;
+
+		if (!mtd->lock)
+			ret = -EOPNOTSUPP;
+		else
+			ret = mtd->lock(mtd, einfo64.start, einfo64.length);
+		break;
+	}
+
 	case MEMUNLOCK:
 	{
 		struct erase_info_user einfo;
@@ -622,6 +723,20 @@ static int mtd_ioctl(struct inode *inode, struct
file *file,
 		break;
 	}

+	case MEMUNLOCK64:
+	{
+		struct erase_info_user64 einfo64;
+
+		if (copy_from_user(&einfo64, argp, sizeof(einfo64)))
+			return -EFAULT;
+
+		if (!mtd->unlock)
+			ret = -EOPNOTSUPP;
+		else
+			ret = mtd->unlock(mtd, einfo64.start, einfo64.length);
+		break;
+	}
+
 	/* Legacy interface */
 	case MEMGETOOBSEL:
 	{
diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
index 45e59d3..bb1f310 100644
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@ -1412,8 +1412,18 @@ struct mtd_oob_buf32 {
 	compat_caddr_t ptr;	/* unsigned char* */
 };

-#define MEMWRITEOOB32 	_IOWR('M',3,struct mtd_oob_buf32)
-#define MEMREADOOB32 	_IOWR('M',4,struct mtd_oob_buf32)
+struct mtd_oob_buf64_32 {
+	u_int64_t start;
+	u_int32_t res0;
+	u_int32_t length;
+	compat_caddr_t ptr;
+	u_int32_t res1[8];
+} __aligned(4) __packed;
+
+#define MEMWRITEOOB32		_IOWR('M',  3, struct mtd_oob_buf32)
+#define MEMREADOOB32		_IOWR('M',  4, struct mtd_oob_buf32)
+#define MEMWRITEOOB64_32	_IOWR('M', 22, struct mtd_oob_buf64_32)
+#define MEMREADOOB64_32		_IOWR('M', 23, struct mtd_oob_buf64_32)

 static int mtd_rw_oob(unsigned int fd, unsigned int cmd, unsigned long arg)
 {
@@ -1446,6 +1456,37 @@ static int mtd_rw_oob(unsigned int fd, unsigned
int cmd, unsigned long arg)
 	return err;
 }	

+static int mtd_rw_oob64(unsigned int fd, unsigned int cmd, unsigned long arg)
+{
+	struct mtd_oob_buf64 __user *buf =
+		compat_alloc_user_space(sizeof(*buf));
+	struct mtd_oob_buf64_32 __user *buf32 = compat_ptr(arg);
+	u32 data;
+	char __user *datap;
+	unsigned int real_cmd;
+	int err;
+
+	real_cmd = (cmd == MEMREADOOB64_32) ?
+		MEMREADOOB64 : MEMWRITEOOB64;
+
+	if (copy_in_user(&buf->start, &buf32->start, 2 * sizeof(u64)) ||
+	    get_user(data, &buf32->ptr))
+		return -EFAULT;
+	datap = compat_ptr(data);
+	if (put_user(datap, &buf->ptr))
+		return -EFAULT;
+
+	err = sys_ioctl(fd, real_cmd, (unsigned long) buf);
+
+	if (!err) {
+		if (copy_in_user(&buf32->length, &buf->length,
+				 sizeof(u32)))
+			err = -EFAULT;
+	}
+
+	return err;
+}	
+
 #ifdef CONFIG_BLOCK
 struct raw32_config_request
 {
@@ -2434,6 +2475,11 @@ COMPATIBLE_IOCTL(MEMGETREGIONCOUNT)
 COMPATIBLE_IOCTL(MEMGETREGIONINFO)
 COMPATIBLE_IOCTL(MEMGETBADBLOCK)
 COMPATIBLE_IOCTL(MEMSETBADBLOCK)
+COMPATIBLE_IOCTL(MEMGETINFO64)
+COMPATIBLE_IOCTL(MEMERASE64)
+COMPATIBLE_IOCTL(MEMLOCK64)
+COMPATIBLE_IOCTL(MEMUNLOCK64)
+COMPATIBLE_IOCTL(MEMGETREGIONINFO64)
 /* NBD */
 ULONG_IOCTL(NBD_SET_SOCK)
 ULONG_IOCTL(NBD_SET_BLKSIZE)
@@ -2545,6 +2591,8 @@ COMPATIBLE_IOCTL(JSIOCGNAME(0))
 /* now things that need handlers */
 HANDLE_IOCTL(MEMREADOOB32, mtd_rw_oob)
 HANDLE_IOCTL(MEMWRITEOOB32, mtd_rw_oob)
+HANDLE_IOCTL(MEMREADOOB64_32, mtd_rw_oob64)
+HANDLE_IOCTL(MEMWRITEOOB64_32, mtd_rw_oob64)
 #ifdef CONFIG_NET
 HANDLE_IOCTL(SIOCGIFNAME, dev_ifname32)
 HANDLE_IOCTL(SIOCGIFCONF, dev_ifconf)
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index c6c61cd..c437410 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -10,12 +10,26 @@ struct erase_info_user {
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
+	uint32_t res1[8];
+};
+
 #define MTD_ABSENT		0
 #define MTD_RAM			1
 #define MTD_ROM			2
@@ -50,14 +64,25 @@ struct mtd_oob_buf {
 struct mtd_info_user {
 	uint8_t type;
 	uint32_t flags;
-	uint32_t size;	 // Total size of the MTD
+	uint32_t size;			/* Total size of the MTD */
+	uint32_t erasesize;
+	uint32_t writesize;
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
 	uint32_t erasesize;
+	uint32_t res1;
 	uint32_t writesize;
-	uint32_t oobsize;   // Amount of OOB data per block (e.g. 16)
-	/* The below two fields are obsolete and broken, do not use them
-	 * (TODO: remove at some point) */
-	uint32_t ecctype;
-	uint32_t eccsize;
+	uint32_t res2;
+	uint32_t oobsize;		/* OOB bytes per page (e.g. 16) */
+	uint32_t res3[32];
 };

 struct region_info_user {
@@ -68,6 +93,18 @@ struct region_info_user {
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
@@ -94,6 +131,14 @@ struct otp_info {
 #define ECCGETSTATS		_IOR('M', 18, struct mtd_ecc_stats)
 #define MTDFILEMODE		_IO('M', 19)

+#define MEMGETINFO64		_IOR ('M', 20, struct mtd_info_user64)
+#define MEMERASE64		_IOW ('M', 21, struct erase_info_user64)
+#define MEMWRITEOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
+#define MEMREADOOB64		_IOWR('M', 23, struct mtd_oob_buf64)
+#define MEMLOCK64		_IOW ('M', 24, struct erase_info_user64)
+#define MEMUNLOCK64		_IOW ('M', 25, struct erase_info_user64)
+#define MEMGETREGIONINFO64	_IOWR('M', 26, struct region_info_user64)
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
