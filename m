Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QtptI-0001BL-NC
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2011 23:51:21 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [RFC 2/5] mtd: support MTD_MODE_RAW for reading OOB
Date: Wed, 17 Aug 2011 16:50:26 -0700
Message-ID: <1313625029-19546-3-git-send-email-computersforpeace@gmail.com>
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

mtd_do_read_oob does not pass information about whether to read in RAW
mode to the lower layers (e.g., NAND). We should pass MTD_OOB_RAW or
MTD_OOB_PLACE based on the MTD file mode.

This fixes issues with `nanddump -n' and the MEMREADOOB[64] ioctls.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdchar.c        |   14 ++++++++------
 drivers/mtd/nand/nand_base.c |    7 ++++++-
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 7ca4361..4488e9a 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -435,9 +435,11 @@ static int mtd_do_writeoob(struct file *file, struct mtd_info *mtd,
 	return ret;
 }
 
-static int mtd_do_readoob(struct mtd_info *mtd, uint64_t start,
-	uint32_t length, void __user *ptr, uint32_t __user *retp)
+static int mtd_do_readoob(struct file *file, struct mtd_info *mtd,
+	uint64_t start, uint32_t length, void __user *ptr,
+	uint32_t __user *retp)
 {
+	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_oob_ops ops;
 	int ret = 0;
 
@@ -455,7 +457,7 @@ static int mtd_do_readoob(struct mtd_info *mtd, uint64_t start,
 	ops.ooblen = length;
 	ops.ooboffs = start & (mtd->oobsize - 1);
 	ops.datbuf = NULL;
-	ops.mode = MTD_OOB_PLACE;
+	ops.mode = (mfi->mode == MTD_MODE_RAW) ? MTD_OOB_RAW : MTD_OOB_PLACE;
 
 	if (ops.ooboffs && ops.ooblen > (mtd->oobsize - ops.ooboffs))
 		return -EINVAL;
@@ -716,7 +718,7 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (copy_from_user(&buf, argp, sizeof(buf)))
 			ret = -EFAULT;
 		else
-			ret = mtd_do_readoob(mtd, buf.start, buf.length,
+			ret = mtd_do_readoob(file, mtd, buf.start, buf.length,
 				buf.ptr, &buf_user->start);
 		break;
 	}
@@ -743,7 +745,7 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (copy_from_user(&buf, argp, sizeof(buf)))
 			ret = -EFAULT;
 		else
-			ret = mtd_do_readoob(mtd, buf.start, buf.length,
+			ret = mtd_do_readoob(file, mtd, buf.start, buf.length,
 				(void __user *)(uintptr_t)buf.usr_ptr,
 				&buf_user->length);
 		break;
@@ -1029,7 +1031,7 @@ static long mtd_compat_ioctl(struct file *file, unsigned int cmd,
 		if (copy_from_user(&buf, argp, sizeof(buf)))
 			ret = -EFAULT;
 		else
-			ret = mtd_do_readoob(mtd, buf.start,
+			ret = mtd_do_readoob(file, mtd, buf.start,
 				buf.length, compat_ptr(buf.ptr),
 				&buf_user->start);
 		break;
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e2b1c90..9c4df4a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1787,7 +1787,12 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	page = realpage & chip->pagemask;
 
 	while (1) {
-		sndcmd = chip->ecc.read_oob(mtd, chip, page, sndcmd);
+		if (ops->mode == MTD_OOB_RAW) {
+			sndcmd = 0;
+			chip->ecc.read_page_raw(mtd, chip, NULL, page);
+		} else {
+			sndcmd = chip->ecc.read_oob(mtd, chip, page, sndcmd);
+		}
 
 		len = min(len, readlen);
 		buf = nand_transfer_oob(chip, buf, ops, len);
-- 
1.7.0.4
