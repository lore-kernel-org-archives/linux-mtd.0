Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QyZwC-00059D-Jk
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 01:49:57 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 07/12] mtd: add MEMWRITE ioctl
Date: Tue, 30 Aug 2011 18:45:42 -0700
Message-ID: <1314755147-17756-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
References: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, b35362@freescale.com,
	linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implement a new ioctl for writing both page data and OOB to flash at the
same time. This ioctl is intended to be a generic interface that can
replace other ioctls (MEMWRITEOOB and MEMWRITEOOB64) and cover the
functionality of several other old ones, e.g., MEMWRITE can:

* write autoplaced OOB instead of using ECCGETLAYOUT (deprecated) and
  working around the reserved areas
* write raw (no ECC) OOB instead of using MTDFILEMODE to set the
  per-file-descriptor MTD_FILE_MODE_RAW
* write raw (no ECC) data instead of using MTDFILEMODE
  (MTD_FILE_MODE_RAW) and using standard character device "write"

This ioctl is especially useful for MLC NAND, which cannot be written
twice (i.e., we cannot successfully write the page data and OOB in two
separate operations). Instead, MEMWRITE can write both in a single
operation.

Note that this ioctl is not affected by the MTD file mode (i.e.,
MTD_FILE_MODE_RAW vs. MTD_FILE_MODE_NORMAL), since it receives its write
mode as an input parameter.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
RFC -> PATCH "v1": * the ioctl is now named MEMWRITE instead of
                     MEMWRITEDATAOOB for simplicity and to emphasize its
                     generic, multi-purpose functionality.
                   * ioctl functionality was moved inside its own
                     function to help with readability.
                   * padding was added to the renamed
                     `struct mtd_write_req'
                   * user buffers were split into separate OOB and data
                     buffers
                   * other small fixes?

 drivers/mtd/mtdchar.c |   56 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/mtd/mtd-abi.h |   11 +++++++++
 2 files changed, 67 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 4004f2b..1547e2a 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -566,6 +566,55 @@ static int mtd_blkpg_ioctl(struct mtd_info *mtd,
 	}
 }
 
+static int mtd_write_ioctl(struct mtd_info *mtd,
+		struct mtd_write_req __user *argp)
+{
+	struct mtd_write_req req;
+	struct mtd_oob_ops ops;
+	void __user *usr_data, *usr_oob;
+	int ret;
+
+	if (copy_from_user(&req, argp, sizeof(req)) ||
+			!access_ok(VERIFY_READ, req.usr_data, req.len) ||
+			!access_ok(VERIFY_READ, req.usr_oob, req.ooblen))
+		return -EFAULT;
+	if (!mtd->write_oob)
+		return -EOPNOTSUPP;
+
+	ops.mode = req.mode;
+	ops.len = (size_t)req.len;
+	ops.ooblen = (size_t)req.ooblen;
+	ops.ooboffs = 0;
+
+	usr_data = (void __user *)(uintptr_t)req.usr_data;
+	usr_oob = (void __user *)(uintptr_t)req.usr_oob;
+
+	if (req.usr_data) {
+		ops.datbuf = memdup_user(usr_data, ops.len);
+		if (IS_ERR(ops.datbuf))
+			return PTR_ERR(ops.datbuf);
+	} else {
+		ops.datbuf = NULL;
+	}
+
+	if (req.usr_oob) {
+		ops.oobbuf = memdup_user(usr_oob, ops.ooblen);
+		if (IS_ERR(ops.oobbuf)) {
+			kfree(ops.datbuf);
+			return PTR_ERR(ops.oobbuf);
+		}
+	} else {
+		ops.oobbuf = NULL;
+	}
+
+	ret = mtd->write_oob(mtd, (loff_t)req.start, &ops);
+
+	kfree(ops.datbuf);
+	kfree(ops.oobbuf);
+
+	return ret;
+}
+
 static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 {
 	struct mtd_file_info *mfi = file->private_data;
@@ -753,6 +802,13 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		break;
 	}
 
+	case MEMWRITE:
+	{
+		ret = mtd_write_ioctl(mtd,
+		      (struct mtd_write_req __user *)arg);
+		break;
+	}
+
 	case MEMLOCK:
 	{
 		struct erase_info_user einfo;
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index 1885aa9..0a21ef5 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -60,6 +60,16 @@ enum {
 	MTD_OPS_RAW = 2,
 };
 
+struct mtd_write_req {
+	__u64 start;
+	__u32 len;
+	__u32 ooblen;
+	__u64 usr_data;
+	__u64 usr_oob;
+	__u8 mode;
+	__u8 padding[7];
+};
+
 #define MTD_ABSENT		0
 #define MTD_RAM			1
 #define MTD_ROM			2
@@ -147,6 +157,7 @@ struct otp_info {
 #define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
 #define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
 #define MEMISLOCKED		_IOR('M', 23, struct erase_info_user)
+#define MEMWRITE		_IOWR('M', 24, struct mtd_write_req)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
-- 
1.7.5.4
