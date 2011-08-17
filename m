Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QtpuH-0001FM-00
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2011 23:52:21 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [RFC 5/5] mtd: add MEMWRITEDATAOOB ioctl
Date: Wed, 17 Aug 2011 16:50:29 -0700
Message-ID: <1313625029-19546-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implement a new ioctl for writing both page data and OOB to flash at the
same time.  This is especially useful for MLC NAND, which cannot be
written twice (i.e., we cannot successfully write the page data and OOB
in two separate operations).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdchar.c |   31 +++++++++++++++++++++++++++++++
 include/mtd/mtd-abi.h |    9 +++++++++
 2 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index a0c404b..bef8462 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -749,6 +749,37 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		break;
 	}
 
+	case MEMWRITEDATAOOB:
+	{
+		struct mtd_data_oob_buf buf;
+
+		if (copy_from_user(&buf, argp, sizeof(buf)) ||
+				!access_ok(VERIFY_READ, buf.usr_ptr, buf.len)) {
+			ret = -EFAULT;
+		} else if (!mtd->write_oob) {
+			ret = -EOPNOTSUPP;
+		} else {
+			struct mtd_oob_ops ops;
+
+			ops.mode = buf.mode;
+			ops.len = (size_t)buf.len;
+			ops.ooblen = (size_t)buf.ooblen;
+			ops.ooboffs = 0;
+
+			ops.datbuf = memdup_user(
+					(void __user *)(uintptr_t)buf.usr_ptr,
+					ops.len + ops.ooblen);
+			if (IS_ERR(ops.datbuf))
+				return PTR_ERR(ops.datbuf);
+
+			ops.oobbuf = ops.datbuf + ops.len;
+
+			ret = mtd->write_oob(mtd, (loff_t)buf.start, &ops);
+			kfree(ops.datbuf);
+		}
+		break;
+	}
+
 	case MEMLOCK:
 	{
 		struct erase_info_user einfo;
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index f850d9a..20df299 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -59,6 +59,14 @@ typedef enum {
 	MTD_OOB_RAW,
 } mtd_oob_mode_t;
 
+struct mtd_data_oob_buf {
+	__u64 start;
+	__u32 len;
+	__u32 ooblen;
+	__u64 usr_ptr;
+	mtd_oob_mode_t __user mode;
+};
+
 #define MTD_ABSENT		0
 #define MTD_RAM			1
 #define MTD_ROM			2
@@ -141,6 +149,7 @@ struct otp_info {
 #define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
 #define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
 #define MEMISLOCKED		_IOR('M', 23, struct erase_info_user)
+#define MEMWRITEDATAOOB		_IOWR('M', 24, struct mtd_data_oob_buf)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
-- 
1.7.0.4
