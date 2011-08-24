Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QwKlD-0000EP-OF
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 21:13:21 +0000
Received: by yxk8 with SMTP id 8so1453051yxk.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Aug 2011 14:13:17 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/2] mtd: support reading OOB without ECC
Date: Wed, 24 Aug 2011 14:12:24 -0700
Message-Id: <1314220344-10986-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314220344-10986-1-git-send-email-computersforpeace@gmail.com>
References: <1314220344-10986-1-git-send-email-computersforpeace@gmail.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, Jim Quinlan <jim2101024@gmail.com>,
	linux-mtd@lists.infradead.org, liu.h.jason@gmail.com,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes issues with `nanddump -n' and the MEMREADOOB[64] ioctls on
hardware that performs error correction when reading only OOB data. A
driver for such hardware needs to know when we're doing a RAW vs. a
normal write, but mtd_do_read_oob does not pass such information to the
lower layers (e.g., NAND). We should pass MTD_OOB_RAW or MTD_OOB_PLACE
based on the MTD file mode.

For now, most drivers can get away with just setting:

  chip->ecc.read_oob_raw = chip->ecc.read_oob

This is done by default; but for systems that behave as described above,
you must supply your own replacement function.

This was tested with nandsim as well as on actual SLC NAND.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdchar.c        |   14 ++++++++------
 drivers/mtd/nand/nand_base.c |    7 ++++++-
 include/linux/mtd/nand.h     |    3 +++
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index bcb7f05..d0eaef6 100644
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
 	ops.ooboffs = start & (mtd->writesize - 1);
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
index 2ab8aa3..66b0eff 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1787,7 +1787,10 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	page = realpage & chip->pagemask;
 
 	while (1) {
-		sndcmd = chip->ecc.read_oob(mtd, chip, page, sndcmd);
+		if (ops->mode == MTD_OOB_RAW)
+			sndcmd = chip->ecc.read_oob_raw(mtd, chip, page, sndcmd);
+		else
+			sndcmd = chip->ecc.read_oob(mtd, chip, page, sndcmd);
 
 		len = min(len, readlen);
 		buf = nand_transfer_oob(chip, buf, ops, len);
@@ -3383,6 +3386,8 @@ int nand_scan_tail(struct mtd_info *mtd)
 	}
 
 	/* For many systems, the standard OOB write also works for raw */
+	if (!chip->ecc.read_oob_raw)
+		chip->ecc.read_oob_raw = chip->ecc.read_oob;
 	if (!chip->ecc.write_oob_raw)
 		chip->ecc.write_oob_raw = chip->ecc.write_oob;
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 5f3fdd9..17964c9 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -341,6 +341,7 @@ struct nand_hw_control {
  * @write_page:	function to write a page according to the ECC generator
  *		requirements.
  * @write_oob_raw:	function to write chip OOB data without ECC
+ * @read_oob_raw:	function to read chip OOB data without ECC
  * @read_oob:	function to read chip OOB data
  * @write_oob:	function to write chip OOB data
  */
@@ -371,6 +372,8 @@ struct nand_ecc_ctrl {
 			const uint8_t *buf);
 	int (*write_oob_raw)(struct mtd_info *mtd, struct nand_chip *chip,
 			int page);
+	int (*read_oob_raw)(struct mtd_info *mtd, struct nand_chip *chip,
+			int page, int sndcmd);
 	int (*read_oob)(struct mtd_info *mtd, struct nand_chip *chip, int page,
 			int sndcmd);
 	int (*write_oob)(struct mtd_info *mtd, struct nand_chip *chip,
-- 
1.7.5.4
