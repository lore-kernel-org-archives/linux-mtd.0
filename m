Received: from sand.ocn.ne.jp ([122.28.30.136] helo=smtp.sand.ocn.ne.jp)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P3KaQ-0004Fm-Dh
	for linux-mtd@lists.infradead.org; Wed, 06 Oct 2010 03:22:36 +0000
From: Jon Povey <jon.povey@racelogic.co.uk>
To: linux-mtd@lists.infradead.org
Subject: [RFC] mtd: add MEMSETGOODBLOCK ioctl
Date: Wed,  6 Oct 2010 12:21:58 +0900
Message-Id: <1286335318-17542-1-git-send-email-jon.povey@racelogic.co.uk>
Cc: Jon Povey <jon.povey@racelogic.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adds the MEMSETGOODBLOCK ioctl, inverse operation of MEMSETBADBLOCK for
times when you really are sure that a block is good, but was marked bad
in error.

WARNING: This ioctl should not be casually used, you can't magically
fix unreliable blocks, and causing the system to try and use them may
cause you problems. Manufacturer-marked bad blocks may be forgotten
and impossible to find again later. Be careful.

This ioctl is for situations where you know what you are doing, for
example your bootloader has to be written with a different OOB layout
and scanned as bad when the BBT was generated, but you know it's good
and want to rewrite it from Linux.

Signed-off-by: Jon Povey <jon.povey@racelogic.co.uk>
---
This is a request for comment on this approach to bad blocks, this patch
only considers the nand driver and only versions with a BBT on flash.

This works for me on davinci DM355 with 2K page NAND flash.

 drivers/mtd/mtdchar.c        |   13 +++++++++
 drivers/mtd/mtdpart.c        |   18 ++++++++++++
 drivers/mtd/nand/nand_base.c |   60 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h      |    1 +
 include/linux/mtd/nand.h     |    2 +
 include/mtd/mtd-abi.h        |    1 +
 6 files changed, 95 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index a825002..20250ae 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -750,6 +750,19 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		break;
 	}
 
+	case MEMSETGOODBLOCK:
+	{
+		loff_t offs;
+
+		if (copy_from_user(&offs, argp, sizeof(loff_t)))
+			return -EFAULT;
+		if (!mtd->block_markgood)
+			ret = -EOPNOTSUPP;
+		else
+			return mtd->block_markgood(mtd, offs);
+		break;
+	}
+
 #ifdef CONFIG_HAVE_MTD_OTP
 	case OTPSELECT:
 	{
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 0090690..cd03c29 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -327,6 +327,22 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	return res;
 }
 
+static int part_block_markgood(struct mtd_info *mtd, loff_t ofs)
+{
+	struct mtd_part *part = PART(mtd);
+	int res;
+
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
+	if (ofs >= mtd->size)
+		return -EINVAL;
+	ofs += part->offset;
+	res = part->master->block_markgood(part->master, ofs);
+	if (!res)
+		mtd->ecc_stats.badblocks--;
+	return res;
+}
+
 /*
  * This function unregisters and destroy all slave MTD objects which are
  * attached to the given master MTD object.
@@ -464,6 +480,8 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 		slave->mtd.block_isbad = part_block_isbad;
 	if (master->block_markbad)
 		slave->mtd.block_markbad = part_block_markbad;
+	if (master->block_markgood)
+		slave->mtd.block_markgood = part_block_markgood;
 	slave->mtd.erase = part_erase;
 	slave->master = master;
 	slave->offset = part->offset;
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b3469a7..c2c6211 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -444,6 +444,40 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 }
 
 /**
+ * nand_default_block_markgood - [DEFAULT] mark a block good
+ * @mtd:	MTD device structure
+ * @ofs:	offset from device start
+ *
+ * This is the default implementation, which can be overridden by
+ * a hardware specific driver.
+*/
+static int nand_default_block_markgood(struct mtd_info *mtd, loff_t ofs)
+{
+	struct nand_chip *chip = mtd->priv;
+	int block, ret;
+
+	if (chip->options & NAND_BBT_SCANLASTPAGE)
+		ofs += mtd->erasesize - mtd->writesize;
+
+	/* Get block number */
+	block = (int)(ofs >> chip->bbt_erase_shift);
+	if (chip->bbt)
+		chip->bbt[block >> 2] &= ~(0x03 << ((block & 0x03) << 1));
+
+	/* Do we have a flash based bad block table ? */
+	if (chip->options & NAND_USE_FLASH_BBT) {
+		ret = nand_update_bbt(mtd, ofs);
+	} else {
+		WARN_ONCE(1, "Attempt to NAND markgood without flash BBT");
+		ret = -EOPNOTSUPP;
+	}
+	if (!ret)
+		mtd->ecc_stats.badblocks--;
+
+	return ret;
+}
+
+/**
  * nand_check_wp - [GENERIC] check if the chip is write protected
  * @mtd:	MTD device structure
  * Check, if the device is write protected
@@ -2736,6 +2770,29 @@ static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 }
 
 /**
+ * nand_block_markgood - [MTD Interface] Mark block at the given offset as good
+ * @mtd:	MTD device structure
+ * @ofs:	offset relative to mtd start
+ */
+static int nand_block_markgood(struct mtd_info *mtd, loff_t ofs)
+{
+	struct nand_chip *chip = mtd->priv;
+	int ret;
+
+	printk(KERN_INFO "markgood 0x%llx\n", ofs);
+	ret = nand_block_isbad(mtd, ofs);
+	if (ret < 0)
+		return ret;
+	else if (ret == 0) {
+		printk(KERN_INFO "is good, do nothing\n");
+		/* Good already, return success and do nothing */
+		return 0;
+	}
+
+	return chip->block_markgood(mtd, ofs);
+}
+
+/**
  * nand_suspend - [MTD Interface] Suspend the NAND flash
  * @mtd:	MTD device structure
  */
@@ -2788,6 +2845,8 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
 		chip->block_bad = nand_block_bad;
 	if (!chip->block_markbad)
 		chip->block_markbad = nand_default_block_markbad;
+	if (!chip->block_markgood)
+		chip->block_markgood = nand_default_block_markgood;
 	if (!chip->write_buf)
 		chip->write_buf = busw ? nand_write_buf16 : nand_write_buf;
 	if (!chip->read_buf)
@@ -3302,6 +3361,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->resume = nand_resume;
 	mtd->block_isbad = nand_block_isbad;
 	mtd->block_markbad = nand_block_markbad;
+	mtd->block_markgood = nand_block_markgood;
 
 	/* propagate ecc.layout to mtd_info */
 	mtd->ecclayout = chip->ecc.layout;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8485e42..c71276f 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -237,6 +237,7 @@ struct mtd_info {
 	/* Bad block management functions */
 	int (*block_isbad) (struct mtd_info *mtd, loff_t ofs);
 	int (*block_markbad) (struct mtd_info *mtd, loff_t ofs);
+	int (*block_markgood) (struct mtd_info *mtd, loff_t ofs);
 
 	struct notifier_block reboot_notifier;  /* default mode before reboot */
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index e41d377..9744a51 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -332,6 +332,7 @@ struct nand_buffers {
  * @select_chip:	[REPLACEABLE] select chip nr
  * @block_bad:		[REPLACEABLE] check, if the block is bad
  * @block_markbad:	[REPLACEABLE] mark the block bad
+ * @block_markgood:	[REPLACEABLE] mark the block good
  * @cmd_ctrl:		[BOARDSPECIFIC] hardwarespecific funtion for controlling
  *			ALE/CLE/nCE. Also used to write command and address
  * @dev_ready:		[BOARDSPECIFIC] hardwarespecific function for accesing device ready/busy line
@@ -386,6 +387,7 @@ struct nand_chip {
 	void		(*select_chip)(struct mtd_info *mtd, int chip);
 	int		(*block_bad)(struct mtd_info *mtd, loff_t ofs, int getchip);
 	int		(*block_markbad)(struct mtd_info *mtd, loff_t ofs);
+	int		(*block_markgood)(struct mtd_info *mtd, loff_t ofs);
 	void		(*cmd_ctrl)(struct mtd_info *mtd, int dat,
 				    unsigned int ctrl);
 	int		(*dev_ready)(struct mtd_info *mtd);
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index 4debb45..d32bea8 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -126,6 +126,7 @@ struct otp_info {
 #define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
 #define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
 #define MEMISLOCKED		_IOR('M', 23, struct erase_info_user)
+#define MEMSETGOODBLOCK		_IOW('M', 24, __kernel_loff_t)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
-- 
1.6.3.3
