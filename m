Received: from mail-qy0-f122.google.com ([209.85.221.122])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LrnCw-0004Pp-70
	for linux-mtd@lists.infradead.org; Thu, 09 Apr 2009 05:54:01 +0000
Received: by mail-qy0-f122.google.com with SMTP id 28so909170qyk.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Apr 2009 22:53:50 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 8 Apr 2009 22:53:49 -0700
Message-ID: <a95a62fe0904082253k56288e1ag114d9e3f1fdc9d98@mail.gmail.com>
Subject: [PATCH 4/4] [MTD] Add OOB ioctls for >4GiB devices
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

Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>

---
 drivers/mtd/mtdchar.c |   28 ++++++++++++++++++++++++++++
 fs/compat_ioctl.c     |    2 ++
 include/mtd/mtd-abi.h |    9 +++++++++
 3 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 51bb0b0..99d1fbc 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -607,6 +607,34 @@ static int mtd_ioctl(struct inode *inode, struct
file *file,
 		break;
 	}

+	case MEMWRITEOOB64:
+	{
+		struct mtd_oob_buf64 buf;
+		struct mtd_oob_buf64 __user *buf_user = argp;
+
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+		else
+			ret = mtd_do_writeoob(file, mtd, buf.start, buf.length,
+				(void __user *)(uintptr_t)buf.usr_ptr,
+				&buf_user->length);
+		break;
+	}
+
+	case MEMREADOOB64:
+	{
+		struct mtd_oob_buf64 buf;
+		struct mtd_oob_buf64 __user *buf_user = argp;
+
+		if (copy_from_user(&buf, argp, sizeof(buf)))
+			ret = -EFAULT;
+		else
+			ret = mtd_do_readoob(mtd, buf.start, buf.length,
+				(void __user *)(uintptr_t)buf.usr_ptr,
+				&buf_user->length);
+		break;
+	}
+
 	case MEMLOCK:
 	{
 		struct erase_info_user einfo;
diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
index 1db8d41..5f7b8a1 100644
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@ -2411,6 +2411,8 @@ COMPATIBLE_IOCTL(ECCGETLAYOUT)
 COMPATIBLE_IOCTL(ECCGETSTATS)
 COMPATIBLE_IOCTL(MTDFILEMODE)
 COMPATIBLE_IOCTL(MEMERASE64)
+COMPATIBLE_IOCTL(MEMREADOOB64)
+COMPATIBLE_IOCTL(MEMWRITEOOB64)
 /* NBD */
 ULONG_IOCTL(NBD_SET_SOCK)
 ULONG_IOCTL(NBD_SET_BLKSIZE)
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index 2e32be1..be51ae2 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -23,6 +23,13 @@ struct mtd_oob_buf {
 	unsigned char __user *ptr;
 };

+struct mtd_oob_buf64 {
+	__u64 start;
+	__u32 pad;
+	__u32 length;
+	__u64 usr_ptr;
+};
+
 #define MTD_ABSENT		0
 #define MTD_RAM			1
 #define MTD_ROM			2
@@ -101,6 +108,8 @@ struct otp_info {
 #define ECCGETSTATS		_IOR('M', 18, struct mtd_ecc_stats)
 #define MTDFILEMODE		_IO('M', 19)
 #define MEMERASE64		_IOW('M', 20, struct erase_info_user64)
+#define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
+#define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)

 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
-- 
1.5.4.3
