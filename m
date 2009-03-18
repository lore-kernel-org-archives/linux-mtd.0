Received: from mail-gx0-f157.google.com ([209.85.217.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LjkLW-0003m0-Ik
	for linux-mtd@lists.infradead.org; Wed, 18 Mar 2009 01:13:33 +0000
Received: by gxk1 with SMTP id 1so109408gxk.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 Mar 2009 18:13:25 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 17 Mar 2009 18:13:24 -0700
Message-ID: <a95a62fe0903171813g141cea70g5d984b4649bfcad4@mail.gmail.com>
Subject: [PATCH] [MTD] CORE: New ioctl calls for >4GiB device support
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

New ioctls: MEMGETINFO64 MEMERASE64 MEMWRITEOOB64 MEMREADOOB64 MEMLOCK64
            MEMUNLOCK64 MEMGETREGIONINFO64

Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>
---
 drivers/mtd/mtdchar.c  |  128 ++++++++++++++++++++++++++++++++++++++++++-----
 include/mtd/mtd-abi.h  |   36 +++++++++++++
 include/mtd/mtd-user.h |    2 +
 3 files changed, 152 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index e9ec59e..4bde913 100644
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
@@ -495,8 +540,9 @@ static int mtd_ioctl(struct inode *inode, struct file *file,
 	}

 	case MEMWRITEOOB:
+	case MEMWRITEOOB64:
 	{
-		struct mtd_oob_buf buf;
+		struct mtd_oob_buf64 buf;
 		struct mtd_oob_ops ops;
 		struct mtd_oob_buf __user *user_buf = argp;
 	        uint32_t retlen;
@@ -504,8 +550,21 @@ static int mtd_ioctl(struct inode *inode, struct
file *file,
 		if(!(file->f_mode & FMODE_WRITE))
 			return -EPERM;

-		if (copy_from_user(&buf, argp, sizeof(struct mtd_oob_buf)))
-			return -EFAULT;
+		if (cmd == MEMWRITEOOB64) {
+			if (copy_from_user(&buf, argp,
+				    sizeof(struct mtd_oob_buf64)))
+				return -EFAULT;
+		} else {
+			struct mtd_oob_buf buf32;
+
+			if (copy_from_user(&buf32, argp,
+				    sizeof(struct mtd_oob_buf)))
+				return -EFAULT;
+
+			buf.start = buf32.start;
+			buf.length = buf32.length;
+			buf.ptr = buf32.ptr;
+		}

 		if (buf.length > 4096)
 			return -EINVAL;
@@ -551,12 +610,25 @@ static int mtd_ioctl(struct inode *inode, struct
file *file,
 	}

 	case MEMREADOOB:
+	case MEMREADOOB64:
 	{
-		struct mtd_oob_buf buf;
+		struct mtd_oob_buf64 buf;
 		struct mtd_oob_ops ops;

-		if (copy_from_user(&buf, argp, sizeof(struct mtd_oob_buf)))
-			return -EFAULT;
+		if (cmd == MEMREADOOB64) {
+			if (copy_from_user(&buf, argp,
+				    sizeof(struct mtd_oob_buf64)))
+				return -EFAULT;
+		} else {
+			struct mtd_oob_buf buf32;
+
+			if (copy_from_user(&buf32, argp,
+				    sizeof(struct mtd_oob_buf)))
+				return -EFAULT;
+			buf.start = buf32.start;
+			buf.length = buf32.length;
+			buf.ptr = buf32.ptr;
+		}

 		if (buf.length > 4096)
 			return -EINVAL;
@@ -608,6 +680,20 @@ static int mtd_ioctl(struct inode *inode, struct
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
@@ -622,6 +708,20 @@ static int mtd_ioctl(struct inode *inode, struct
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
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index c6c61cd..10ebb7c 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -10,12 +10,23 @@ struct erase_info_user {
 	uint32_t length;
 };

+struct erase_info_user64 {
+	uint64_t start;
+	uint64_t length;
+};
+
 struct mtd_oob_buf {
 	uint32_t start;
 	uint32_t length;
 	unsigned char __user *ptr;
 };

+struct mtd_oob_buf64 {
+	uint64_t start;
+	uint32_t length;
+	unsigned char __user *ptr;
+};
+
 #define MTD_ABSENT		0
 #define MTD_RAM			1
 #define MTD_ROM			2
@@ -60,6 +71,15 @@ struct mtd_info_user {
 	uint32_t eccsize;
 };

+struct mtd_info_user64 {
+	uint32_t type;
+	uint32_t flags;
+	uint64_t size;	 // Total size of the MTD
+	uint32_t erasesize;
+	uint32_t writesize;
+	uint32_t oobsize;   // Amount of OOB data per block (e.g. 16)
+};
+
 struct region_info_user {
 	uint32_t offset;		/* At which this region starts,
 					 * from the beginning of the MTD */
@@ -68,6 +88,14 @@ struct region_info_user {
 	uint32_t regionindex;
 };

+struct region_info_user64 {
+	uint64_t offset;		/* At which this region starts,
+					 * from the beginning of the MTD */
+	uint32_t erasesize;		/* For this region */
+	uint32_t numblocks;		/* Number of blocks in this region */
+	uint32_t regionindex;
+};
+
 struct otp_info {
 	uint32_t start;
 	uint32_t length;
@@ -94,6 +122,14 @@ struct otp_info {
 #define ECCGETSTATS		_IOR('M', 18, struct mtd_ecc_stats)
 #define MTDFILEMODE		_IO('M', 19)

+#define MEMGETINFO64		_IOR('M', 20, struct mtd_info_user64)
+#define MEMERASE64		_IOW('M', 21, struct erase_info_user64)
+#define MEMWRITEOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
+#define MEMREADOOB64		_IOWR('M', 23, struct mtd_oob_buf64)
+#define MEMLOCK64		_IOW('M', 24, struct erase_info_user64)
+#define MEMUNLOCK64		_IOW('M', 25, struct erase_info_user64)
+#define MEMGETREGIONINFO64	_IOWR('M', 26, struct region_info_user64)
+
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
  * interfaces
diff --git a/include/mtd/mtd-user.h b/include/mtd/mtd-user.h
index 170ceca..30e55a2 100644
--- a/include/mtd/mtd-user.h
+++ b/include/mtd/mtd-user.h
@@ -7,6 +7,8 @@

 #include <stdint.h>

+#define __user
+
 /* This file is blessed for inclusion by userspace */
 #include <mtd/mtd-abi.h>

-- 
1.5.6.3
