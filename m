Received: from qw-out-1920.google.com ([74.125.92.150])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LrnBd-0004Mj-VU
	for linux-mtd@lists.infradead.org; Thu, 09 Apr 2009 05:52:38 +0000
Received: by qw-out-1920.google.com with SMTP id 5so355144qwf.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Apr 2009 22:52:28 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 8 Apr 2009 22:52:28 -0700
Message-ID: <a95a62fe0904082252h41afa872j2ef6fb9d1d76dc27@mail.gmail.com>
Subject: [PATCH 2/4] [MTD] Add MEMERASE64 ioctl for >4GiB devices
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
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

New MEMERASE/MEMREADOOB/MEMWRITEOOB ioctls are needed in order to support
64-bit offsets into large NAND flash devices.

Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>

---
 drivers/mtd/mtdchar.c |   29 +++++++++++++++++++++--------
 fs/compat_ioctl.c     |    1 +
 include/mtd/mtd-abi.h |    6 ++++++
 3 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 763d3f0..ad4b861 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -417,6 +417,7 @@ static int mtd_ioctl(struct inode *inode, struct file *file,
 		break;

 	case MEMERASE:
+	case MEMERASE64:
 	{
 		struct erase_info *erase;

@@ -427,20 +428,32 @@ static int mtd_ioctl(struct inode *inode, struct
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
+			if (cmd == MEMERASE64) {
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
diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
index 3e87ce4..06d4e0c 100644
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@ -2441,6 +2441,7 @@ COMPATIBLE_IOCTL(MEMGETREGIONCOUNT)
 COMPATIBLE_IOCTL(MEMGETREGIONINFO)
 COMPATIBLE_IOCTL(MEMGETBADBLOCK)
 COMPATIBLE_IOCTL(MEMSETBADBLOCK)
+COMPATIBLE_IOCTL(MEMERASE64)
 /* NBD */
 ULONG_IOCTL(NBD_SET_SOCK)
 ULONG_IOCTL(NBD_SET_BLKSIZE)
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index b6595b3..2e32be1 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -12,6 +12,11 @@ struct erase_info_user {
 	__u32 length;
 };

+struct erase_info_user64 {
+	__u64 start;
+	__u64 length;
+};
+
 struct mtd_oob_buf {
 	__u32 start;
 	__u32 length;
@@ -95,6 +100,7 @@ struct otp_info {
 #define ECCGETLAYOUT		_IOR('M', 17, struct nand_ecclayout)
 #define ECCGETSTATS		_IOR('M', 18, struct mtd_ecc_stats)
 #define MTDFILEMODE		_IO('M', 19)
+#define MEMERASE64		_IOW('M', 20, struct erase_info_user64)

 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
-- 
1.5.4.3
