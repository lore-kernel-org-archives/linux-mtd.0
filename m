Received: from inet-tsb5.toshiba.co.jp ([202.33.96.24] helo=imx2.toshiba.co.jp)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rairw-00072s-J9
 for linux-mtd@lists.infradead.org; Wed, 14 Dec 2011 07:03:17 +0000
From: <katsuki.uwatoko@toshiba.co.jp>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] NAND : SFTL (Simple Flash Transration Layer)
Date: Wed, 14 Dec 2011 07:03:03 +0000
Message-ID: <4CCCBA2E6B78F3katsuki.uwatoko@toshiba.co.jp>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-ID: <DB6BBFB7C5EFD448970A3B86EF235B6C@toshiba.local>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This is a new Flash Translation Layer for NAND Flash on mtd.

mtd: SFTL (Simple Flash Translation Layer)

Introduction
------------

SFTL is a flash translation layer for NAND Flash on mtd_blkdevs
interface.  This is mainly-useful for read-oriented use (ex. a storage
for a boot image) because this provides simple wear-leveling and
scrubbing. The features are:

 * sftl provides wear-leveling (not static wear-leveling) and scrubbing.
 * sftl has one erase block size cache.
 * sftl uses 6 bytes in OOB for a logical address, status, version.
 * the erase block scan at init is fast.
 * a unit of read/write from/to MTD is an erase block.

Module parameters
-----------------

  mtd=3D		MTD devices to attach.
		Parameter format: mtd=3D<num>
		Multiple mtd parameters may be specified.

  rb=3D		percents of reserved eraseblocks for bad blocks.
		This parameter must be from 1 to 90. The default is 2.
		The number of reserved blocks must be more than 5.

Signed-off-by: UWATOKO Katsuki <katsuki.uwatoko@toshiba.co.jp>
---
 drivers/mtd/Kconfig  |   17 +
 drivers/mtd/Makefile |    1 +
 drivers/mtd/sftl.c   | 1152 ++++++++++++++++++++++++++++++++++++++++++++++=
++++
 3 files changed, 1170 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/sftl.c

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 318a869..b8435f8 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -309,6 +309,23 @@ config MTD_SWAP
 	  The driver provides wear leveling by storing erase counter into the
 	  OOB.
=20
+config SFTL
+	tristate "SFTL (Simple Translation Layer) support"
+	depends on BLOCK && MTD_NAND
+	default n
+	select MTD_BLKDEVS
+	help
+	  Provides block device driver for NAND flash and simple wear-leveling
+	  and scrubbing.
+	  This is mainly-useful for read-oriented use.
+	  (ex. a storage for a boot image and so on.)
+
+config SFTL_RESERVE_BLK_PERCENT
+	int "percents of reserved erasedblocks for bad blocks."
+	depends on SFTL
+	range 1 90
+	default "2"
+
 source "drivers/mtd/chips/Kconfig"
=20
 source "drivers/mtd/maps/Kconfig"
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 9aaac3a..7fb2933 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_SSFDC)		+=3D ssfdc.o
 obj-$(CONFIG_SM_FTL)		+=3D sm_ftl.o
 obj-$(CONFIG_MTD_OOPS)		+=3D mtdoops.o
 obj-$(CONFIG_MTD_SWAP)		+=3D mtdswap.o
+obj-$(CONFIG_SFTL)		+=3D sftl.o
=20
 nftl-objs		:=3D nftlcore.o nftlmount.o
 inftl-objs		:=3D inftlcore.o inftlmount.o
diff --git a/drivers/mtd/sftl.c b/drivers/mtd/sftl.c
new file mode 100644
index 0000000..0984f02
--- /dev/null
+++ b/drivers/mtd/sftl.c
@@ -0,0 +1,1152 @@
+/*
+ * Simple Flash Translation Layer (sftl)
+ *
+ * (C) Copyright TOSHIBA CORPORATION 2011
+ * All Rights Reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  =
USA
+ */
+
+/*
+
+Introduction
+------------
+
+SFTL is a flash translation layer for NAND Flash on mtd_blkdevs
+interface.  This is mainly-useful for read-oriented use (ex. a storage
+for a boot image) because this provides simple wear-leveling and
+scrubbing. The features are:
+
+ * sftl provides wear-leveling (not static wear-leveling) and scrubbing.
+ * sftl has one erase block size cache.
+ * sftl uses 6 bytes in OOB for a logical address, status, version.
+ * the erase block scan at init is fast.
+ * a unit of read/write from/to MTD is an erase block.
+
+Module parameters
+-----------------
+
+  mtd=3D		MTD devices to attach.
+		Parameter format: mtd=3D<num>
+		Multiple mtd parameters may be specified.
+
+  rb=3D		percents of reserved eraseblocks for bad blocks.
+		This parameter must be from 1 to 90. The default is 2.
+		The number of reserved blocks must be more than 5.
+*/
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/seq_file.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/list.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/blktrans.h>
+#include <linux/blkdev.h>
+#include <linux/sched.h>
+#include <linux/sysfs.h>
+
+/* definitions */
+
+#define SFTL_VERSION "1.0"
+
+#define SFTL_MAX_DEVICES   32
+#define SFTL_PARTN_BITS 3
+
+static int mtd_devs;
+static int mtd_dev_param[SFTL_MAX_DEVICES];
+
+static int reserve_blk_percent =3D CONFIG_SFTL_RESERVE_BLK_PERCENT;
+static int sftl_read_retries =3D 10;
+static int sftl_write_retries =3D 10;
+static int sftl_erase_retries =3D 5;
+
+#define SFTL_SECTOR_SIZE	512
+#define SFTL_SECTOR_SHIFT	9
+
+#define MINIMUM_PBLOCKS         32
+#define MINIMUM_RESERVE_PBLOCKS 5
+
+/* sftl oob data format */
+
+struct sftl_oobdata {
+	__le32 lnum;
+	uint8_t version;
+	uint8_t status;
+} __packed;
+
+#define SFTL_LNUM_PBIT     0x80000000
+#define SFTL_PNUM_NOASSIGN 0x80000000	/* this is used in laddr_tbl. */
+#define SFTL_VERS_PBIT     0x80
+
+#define STATUS_ASSIGN      (0xff)	/* ASSIGN */
+#define STATUS_FREE        (0x00)	/* FREE */
+#define STATUS_BITFLIP     (0x55)	/* bitfliped OOB, this is a SW status */
+#define STATUS_BAD         (0xaa)	/* badblock, this is a SW status */
+
+struct sftl_pdata {
+	struct list_head list;
+	struct sftl_oobdata oobd;
+};
+
+/* sftl device structure */
+
+struct sftl_dev {
+	struct mtd_blktrans_dev *mbd;
+	struct mtd_info *mtd;           /* mtd device */
+
+	uint32_t *laddr_tbl;            /* pnum table indexed by lnum */
+	struct sftl_pdata *pdata_tbl;	/* physical data table */
+
+	/*  every physical block must be on one of following lists. */
+	struct list_head assign_list;
+	struct list_head bad_list;
+	struct list_head free_list;
+
+	int pblocks;		        /* number of physical blocks */
+	int lblocks;		        /* number of logical blocks */
+	int badblocks;		        /* number of badblocks */
+
+	/* cache */
+	char *cache_buf;
+	uint32_t cache_lnum;
+	uint8_t cache_state;
+};
+
+#define CACHE_EMPTY       0x00
+#define CACHE_VALID       0x01
+#define CACHE_DIRTY       0x02
+#define CACHE_STATUS_MASK 0x03
+
+#define sftl_err(format, ...) \
+	pr_err("sftl:mtd%d: " format, sftl->mtd->index, ##__VA_ARGS__)
+
+#define sftl_info(format, ...) \
+	pr_info("sftl:mtd%d: " format, sftl->mtd->index, ##__VA_ARGS__)
+
+#define sftl_warn(format, ...) \
+	pr_warn("sftl:mtd%d: " format, sftl->mtd->index, ##__VA_ARGS__)
+
+#define sftl_dbg(format, ...) \
+	pr_debug("sftl:mtd%d: " format, sftl->mtd->index, ##__VA_ARGS__)
+
+/*************************************************************************=
***
+ *
+ * disk_attributes
+ *
+ *************************************************************************=
***/
+
+#define SFTL_ATTR(_name)                                                  =
\
+static ssize_t sftl_attr_##_name##_show(struct device *device,            =
\
+				     struct device_attribute *attr,       \
+				     char *buf)                           \
+{                                                                         =
\
+	struct gendisk *gd =3D dev_to_disk(device);                         \
+	struct mtd_blktrans_dev *dev =3D gd->private_data;                  \
+	struct sftl_dev *sftl =3D dev->priv;                                \
+	return sprintf(buf, "%d\n", sftl->_name);                         \
+}                                                                         =
\
+static DEVICE_ATTR(_name, S_IRUGO, sftl_attr_##_name##_show, NULL);
+
+SFTL_ATTR(lblocks);
+SFTL_ATTR(pblocks);
+SFTL_ATTR(badblocks);
+
+static struct attribute *sftl_attrs[] =3D {
+	&dev_attr_lblocks.attr,
+	&dev_attr_pblocks.attr,
+	&dev_attr_badblocks.attr,
+	NULL,
+};
+
+static struct attribute_group sftl_attribute_group =3D {
+	.name =3D "sftl",
+	.attrs =3D sftl_attrs,
+};
+
+/*************************************************************************=
***
+ *
+ * pnum/lnum/snum helper functions/macros
+ *
+ *************************************************************************=
***/
+
+static inline uint32_t get_pnum_by_pdata(struct sftl_dev *sftl,
+					 struct sftl_pdata *pdata)
+{
+	return pdata - &sftl->pdata_tbl[0];
+}
+
+static inline uint32_t get_pnum_by_lnum(struct sftl_dev *sftl, uint32_t ln=
um)
+{
+	return sftl->laddr_tbl[lnum];
+}
+
+static inline int get_lnum_by_snum(struct sftl_dev *sftl,
+				   uint32_t *lnum, uint32_t *offs,
+				   uint32_t snum)
+{
+	uint32_t sectors_per_block =3D sftl->mtd->erasesize >> SFTL_SECTOR_SHIFT;
+
+	*offs =3D (snum % sectors_per_block) * SFTL_SECTOR_SIZE;
+	*lnum =3D (snum / sectors_per_block);
+
+	if (*lnum >=3D sftl->lblocks) {
+		sftl_err("%s: sector 0x%08x is too big.\n",  __func__, snum);
+		return -1;
+	}
+
+	sftl_dbg("%s: L:0x%08x::S:0x%08x::O:0x%08x\n", __func__, *lnum, snum,
+		 *offs);
+
+	return 0;
+}
+
+#define PDATA_LNUM(p)      (le32_to_cpu((p)->oobd.lnum))
+#define PDATA_VERSION(p)   ((p)->oobd.version)
+#define PDATA_STATUS(p)    ((p)->oobd.status)
+
+/*************************************************************************=
***
+ *
+ * OOB helper functions/macro
+ *
+ *************************************************************************=
***/
+
+static inline uint32_t lnum_parity(uint32_t lnum)
+{
+	return (hweight32(lnum & ~SFTL_LNUM_PBIT) & 1) << 31;
+}
+
+static inline uint8_t version_parity(uint8_t version)
+{
+	return (hweight8(version & ~SFTL_VERS_PBIT) & 1) << 7;
+}
+
+static int check_oobdata(struct sftl_dev *sftl, struct sftl_oobdata *oobd)
+{
+	if (oobd->status =3D=3D STATUS_FREE)
+		return 0;
+
+	if (oobd->status !=3D STATUS_ASSIGN)
+		return -1;
+
+	if (lnum_parity(le32_to_cpu(oobd->lnum)) !=3D
+	    (le32_to_cpu(oobd->lnum) & SFTL_LNUM_PBIT))
+		return -2;
+
+	if ((le32_to_cpu(oobd->lnum) & ~SFTL_LNUM_PBIT) >=3D sftl->lblocks)
+		return -3;
+
+	if (version_parity(oobd->version) !=3D (oobd->version & SFTL_VERS_PBIT))
+		return -4;
+
+	return 0;
+}
+
+static inline int check_version(struct sftl_dev *sftl,
+				struct sftl_pdata *old, struct sftl_pdata *new)
+{
+	uint8_t check =3D (PDATA_VERSION(old) - PDATA_VERSION(new));
+
+	if (PDATA_STATUS(old) =3D=3D STATUS_ASSIGN
+	    && PDATA_STATUS(new) =3D=3D STATUS_BITFLIP)
+		return 1;	/* choose old */
+
+	if (PDATA_STATUS(old) =3D=3D STATUS_BITFLIP
+	    && PDATA_STATUS(new) =3D=3D STATUS_ASSIGN)
+		return 0;	/* choose new */
+
+	/* both BITFLIP or both ASSIGN */
+
+	if (check & 0x40)
+		return 1;	/* choose old */
+	else
+		return 0;	/* choose new */
+}
+
+#define INITOPS_OOB(ops, oobd)  do {	                                \
+		memset(&ops, 0, sizeof(struct mtd_oob_ops));	        \
+		ops.mode	=3D MTD_OPS_AUTO_OOB;			\
+		ops.ooblen	=3D sizeof(struct sftl_oobdata);		\
+		ops.oobbuf	=3D (uint8_t *) oobd;			\
+	} while (0);
+
+/*************************************************************************=
***
+ *
+ * mtd wrapper functions
+ *
+ *************************************************************************=
***/
+
+/* Read physical block */
+static int read_pb(struct sftl_dev *sftl, uint32_t pnum, uint8_t * buf)
+{
+	struct mtd_info *mtd =3D sftl->mtd;
+	struct sftl_oobdata *oobd =3D &sftl->pdata_tbl[pnum].oobd;
+	struct mtd_oob_ops ops;
+	int ret, subret =3D 0;
+	size_t retlen;
+
+	sftl_dbg("%s: P:0x%08x\n", __func__, pnum);
+
+	/* read the first page data with oob and check the oob,
+	   because the oob was not read in init (build_lblock_map) */
+
+	INITOPS_OOB(ops, oobd);
+	ops.len =3D mtd->writesize;
+	ops.datbuf =3D buf;
+
+	ret =3D mtd->read_oob(mtd, pnum * mtd->erasesize, &ops);
+
+	if (mtd_is_bitflip(ret))
+		subret =3D ret;
+	else if (ret) {
+		sftl_err("%s 1st page: P:0x%08x::%d\n",
+			  __func__, pnum, ret);
+		goto out;
+	}
+
+	/* check oob */
+
+	if (check_oobdata(sftl, oobd)) {
+		sftl_err("%s 1st page: check_oobdata fail P:0x%08x\n",
+			  __func__, pnum);
+		subret =3D -EUCLEAN;
+	}
+
+	/* read the others without oob */
+
+	ret =3D mtd->read(mtd, pnum * mtd->erasesize + mtd->writesize,
+			mtd->erasesize - mtd->writesize, &retlen,
+			buf + mtd->writesize);
+
+	if (ret)
+		sftl_err("read_pb: P:0x%08x::%d\n", pnum, ret);
+
+ out:
+	if (!ret)
+		ret =3D subret;
+
+	return ret;
+}
+
+/* Write physical block w/ version */
+static int write_pb(struct sftl_dev *sftl,
+		    uint32_t pnum, int32_t lnum, uint8_t version, uint8_t *buf)
+{
+	struct mtd_info *mtd =3D sftl->mtd;
+	struct sftl_oobdata *oobd =3D &sftl->pdata_tbl[pnum].oobd;
+	struct mtd_oob_ops ops;
+	size_t retlen;
+	int ret;
+
+	sftl_dbg("%s: P:0x%08x::L:0x%08x\n", __func__, pnum, lnum);
+
+	oobd->lnum =3D cpu_to_le32(lnum_parity(lnum) | lnum);
+	oobd->version =3D version_parity(version) | version;
+	oobd->status =3D STATUS_ASSIGN;
+
+	/* set up ops for the first and the last page */
+
+	INITOPS_OOB(ops, oobd);
+	ops.len =3D mtd->writesize;
+
+	/* First Page w/ the info in oob */
+
+	ops.datbuf =3D buf;
+	ret =3D mtd->write_oob(mtd, pnum * mtd->erasesize, &ops);
+
+	if (ret) {
+		sftl_err("%s: 1st page error\n", __func__);
+		goto out;
+	}
+
+	/* Middle Pages w/o the info in oob */
+
+	ret =3D mtd->write(mtd, pnum * mtd->erasesize + mtd->writesize,
+			 mtd->erasesize - (mtd->writesize * 2),
+			 &retlen, buf + mtd->writesize);
+
+	if (ret) {
+		sftl_err("%s: middle pages error\n", __func__);
+		goto out;
+	}
+
+	/* Last Page w/ the info in oob */
+
+	ops.datbuf =3D buf + mtd->erasesize - mtd->writesize;
+	ret =3D
+	    mtd->write_oob(mtd, (pnum + 1) * mtd->erasesize - mtd->writesize,
+			   &ops);
+ out:
+	if (ret)
+		sftl_err("%s: P:0x%08x::%d\n", __func__, pnum, ret);
+
+	return ret;
+}
+
+/* read physical block oob w/ offset */
+static int read_pb_off_oob(struct sftl_dev *sftl, uint32_t pnum, loff_t of=
fs)
+{
+	struct mtd_info *mtd =3D sftl->mtd;
+	struct sftl_oobdata *oobd =3D &sftl->pdata_tbl[pnum].oobd;
+	struct mtd_oob_ops ops;
+	int ret;
+
+	sftl_dbg("%s: P:0x%08x::O:0x%08llx\n", __func__, pnum, offs);
+
+	INITOPS_OOB(ops, oobd);
+
+	offs +=3D (loff_t) pnum * mtd->erasesize;
+
+	ret =3D mtd->read_oob(mtd, offs, &ops);
+
+	return ret;
+}
+
+/* write physical block oob w/ offset */
+static int write_pb_off_oob(struct sftl_dev *sftl,
+			    uint32_t pnum,
+			    loff_t offs, struct sftl_oobdata *oobd)
+{
+	struct mtd_info *mtd =3D sftl->mtd;
+	struct mtd_oob_ops ops;
+	int ret;
+
+	sftl_dbg("%s: P:0x%08x::O:0x%08llx\n", __func__, pnum, offs);
+
+	INITOPS_OOB(ops, oobd);
+
+	offs +=3D (loff_t) pnum * mtd->erasesize;
+
+	ret =3D mtd->write_oob(mtd, offs, &ops);
+
+	return ret;
+}
+
+static void erase_pb_callback(struct erase_info *instr)
+{
+	wake_up((wait_queue_head_t *) instr->priv);
+}
+
+/* erase physical block */
+static int erase_pb(struct sftl_dev *sftl, uint32_t pnum)
+{
+	struct mtd_info *mtd =3D sftl->mtd;
+	struct erase_info erase;
+	wait_queue_head_t waitq;
+	int ret =3D 0, retries =3D 0;
+
+	sftl_dbg("%s: P:0x%08x\n", __func__, pnum);
+
+ retry:
+	init_waitqueue_head(&waitq);
+	memset(&erase, 0, sizeof(struct erase_info));
+
+	erase.mtd =3D mtd;
+	erase.callback =3D erase_pb_callback;
+	erase.priv =3D (unsigned long) &waitq;
+	erase.addr =3D pnum * mtd->erasesize;
+	erase.len =3D mtd->erasesize;
+	ret =3D mtd->erase(mtd, &erase);
+
+	if (ret)
+		goto out;
+
+	ret =3D wait_event_interruptible(waitq,
+				       erase.state =3D=3D MTD_ERASE_DONE ||
+				       erase.state =3D=3D MTD_ERASE_FAILED);
+	if (ret) {
+		sftl_err("Interrupted erase block P:0x%08x::%d\n",
+			 pnum, ret);
+		ret =3D -EINTR;
+		goto out;
+	}
+
+	if (erase.state =3D=3D MTD_ERASE_FAILED) {
+		if (retries++ < sftl_erase_retries) {
+			yield();
+			sftl_warn("erase retry at P:0x%08x\n", pnum);
+			goto retry;
+		}
+		ret =3D -EIO;
+	}
+
+ out:
+	if (ret)
+		sftl_err("%s error: P:0x%08x::%d\n", __func__, pnum, ret);
+
+	return ret;
+}
+
+/* mark physical block as bad */
+static int markbad_pb(struct sftl_dev *sftl, uint32_t pnum)
+{
+	struct sftl_pdata *pdata =3D &sftl->pdata_tbl[pnum];
+	struct mtd_info *mtd =3D sftl->mtd;
+	int ret;
+
+	PDATA_STATUS(pdata) =3D STATUS_BAD;
+	ret =3D mtd->block_markbad(mtd, pnum * mtd->erasesize);
+
+	if (ret)
+		sftl_err("%s error: P:0x%08x::%d\n", __func__, pnum, ret);
+
+	return ret;
+}
+
+/*************************************************************************=
***
+ *
+ * other functions
+ *
+ *************************************************************************=
***/
+
+static int read_pb_oob(struct sftl_dev *sftl, uint32_t pnum)
+{
+	struct mtd_info *mtd =3D sftl->mtd;
+	struct sftl_pdata *pdata =3D &sftl->pdata_tbl[pnum];
+	struct sftl_oobdata *oobd =3D &pdata->oobd;
+	int ret;
+
+	sftl_dbg("%s: P:0x%08x\n", __func__, pnum);
+
+	/* read the last page */
+
+	ret =3D read_pb_off_oob(sftl, pnum,
+			      (loff_t) (mtd->erasesize - mtd->writesize));
+
+	if (!ret)
+		/* Check bitflip */
+		if (!check_oobdata(sftl, oobd))
+			goto out;
+
+	/* the last page data is bitfliped, so try to read the first page */
+
+	ret =3D read_pb_off_oob(sftl, pnum, (loff_t) 0);
+
+	if (!ret) {
+		/* Check bitflip */
+		ret =3D check_oobdata(sftl, oobd);
+		if (!ret) {
+			oobd->status =3D STATUS_BITFLIP;
+		} else {
+			if (oobd->status !=3D 0xff)
+				sftl_warn("check_oobdata error at P:0x%08x:%d\n",
+					  pnum, ret);
+			ret =3D -EIO;
+			goto out;
+		}
+	} else
+		sftl_err("read_pb_oob error at P:0x%08x:%d\n", pnum, ret);
+
+ out:
+	oobd->lnum &=3D cpu_to_le32(~SFTL_LNUM_PBIT);
+	oobd->version &=3D ~SFTL_VERS_PBIT;
+
+	return ret;
+}
+
+static int markerase_pb_putlist(struct sftl_dev *sftl, uint32_t pnum)
+{
+	struct mtd_info *mtd =3D sftl->mtd;
+	struct sftl_pdata *pdata =3D &sftl->pdata_tbl[pnum];
+	struct sftl_oobdata *oobd =3D &pdata->oobd;
+	int ret;
+
+	sftl_dbg("%s: P:0x%08x\n", __func__, pnum);
+
+	memset(oobd, 0xff, sizeof(struct sftl_oobdata));
+	PDATA_STATUS(pdata) =3D STATUS_FREE;
+
+	ret =3D write_pb_off_oob(sftl, pnum, 0, oobd);	/* first page */
+
+	if (!ret)
+		/* last page */
+		ret =3D write_pb_off_oob(sftl, pnum,
+				       mtd->erasesize - mtd->writesize, oobd);
+
+	if (ret) {
+		sftl_err("markerase error at P:0x%08x::%d\n", pnum, ret);
+		if (erase_pb(sftl, pnum))
+			markbad_pb(sftl, pnum);	/* ret value is not handled */
+	}
+
+	list_del(&pdata->list);
+
+	if (!ret)
+		/* put this to free_list */
+		list_add_tail(&pdata->list, &sftl->free_list);
+	else {
+		/* put this to bad_list, when write error. */
+		sftl->badblocks++;
+		list_add_tail(&pdata->list, &sftl->bad_list);
+	}
+
+	return ret;
+}
+
+static int write_lnum(struct sftl_dev *sftl, uint32_t lnum, uint8_t * buf)
+{
+	struct sftl_pdata *erase_candidate;
+	uint32_t pnum, oldpnum;
+	int ret;
+	uint8_t version =3D 0x7f;
+	int retries =3D 0;
+
+	sftl_dbg("%s: L:0x%08x\n", __func__, lnum);
+
+ retry:
+	/* pick a candidate block for erase */
+
+	if (list_empty(&sftl->free_list)) {
+		sftl_err("%s: depletion of free blocks\n", __func__);
+		ret =3D -1;
+		goto out;
+	}
+
+	erase_candidate =3D list_first_entry(&sftl->free_list,
+					   struct sftl_pdata, list);
+
+	/* erase */
+
+	pnum =3D get_pnum_by_pdata(sftl, erase_candidate);
+	ret =3D erase_pb(sftl, pnum);
+	if (ret) {
+		sftl_err("%s: erase error\n", __func__);
+		markerase_pb_putlist(sftl, pnum);
+		if (retries++ < sftl_write_retries) {
+			yield();
+			sftl_warn("%s: erase retry at P:0x%08x\n",
+				  __func__, pnum);
+			goto retry;
+		}
+		sftl_err("%s: erase error at P:0x%08x\n", __func__, pnum);
+		goto out;
+	}
+
+	/* write w/ version */
+
+	oldpnum =3D sftl->laddr_tbl[lnum];
+	if (!(oldpnum & SFTL_PNUM_NOASSIGN)) {
+		/* decrement the version */
+		version =3D ((sftl->pdata_tbl[oldpnum].oobd.version) - 1)
+			& ~SFTL_VERS_PBIT;
+	}
+
+	ret =3D write_pb(sftl, pnum, lnum, version, buf);
+	if (ret) {
+		sftl_err("%s: write error\n", __func__);
+		markerase_pb_putlist(sftl, pnum);
+		if (retries++ < sftl_write_retries) {
+			yield();
+			sftl_warn("%s: write retry at P:0x%08x\n",
+				  __func__, pnum);
+			goto retry;
+		}
+		sftl_err("%s: write error at P:0x%08x\n", __func__, pnum);
+		goto out;
+	}
+
+	if (!(oldpnum & SFTL_PNUM_NOASSIGN)) {
+		/* this lnum is already assigned */
+		markerase_pb_putlist(sftl, oldpnum);
+	}
+
+	/* update laddr_tbl and put this to assign_list */
+	sftl->laddr_tbl[lnum] =3D pnum;
+	list_del(&erase_candidate->list);
+	list_add(&erase_candidate->list, &sftl->assign_list);
+ out:
+	return ret;
+}
+
+static int read_lnum(struct sftl_dev *sftl, uint32_t lnum, uint8_t * buf)
+{
+	struct mtd_info *mtd =3D sftl->mtd;
+	uint32_t pnum =3D get_pnum_by_lnum(sftl, lnum);
+	int retries =3D sftl_read_retries;
+	int ret;
+
+	sftl_dbg("%s: L:0x%08x\n", __func__, lnum);
+
+	if (pnum & SFTL_PNUM_NOASSIGN) {
+		memset(buf, 0xff, mtd->erasesize);
+		ret =3D 0;
+		goto out;
+	}
+
+	do {
+		ret =3D read_pb(sftl, pnum, buf);
+		if (!ret || mtd_is_bitflip(ret))
+			break;
+	} while (retries--);
+
+ out:
+	return ret;
+}
+
+static int read_lnum_scrub(struct sftl_dev *sftl, uint32_t lnum, uint8_t *=
 buf)
+{
+	int ret;
+
+	sftl_dbg("%s: L:0x%08x\n", __func__, lnum);
+
+	ret =3D read_lnum(sftl, lnum, buf);
+
+	if (mtd_is_bitflip(ret)) {
+		sftl_info("scrub at P:0x%08x::L:0x%08x\n",
+			  get_pnum_by_lnum(sftl, lnum), lnum);
+		ret =3D write_lnum(sftl, lnum, buf);
+	}
+
+	return ret;
+}
+
+/* Build the logic block map */
+static int build_lblock_map(struct sftl_dev *sftl)
+{
+	struct mtd_info *mtd =3D sftl->mtd;
+	uint32_t pnum;
+	int ret;
+	struct list_head erase_list, bitflip_list;
+	struct list_head *pos, *next;
+
+	INIT_LIST_HEAD(&erase_list);
+	INIT_LIST_HEAD(&bitflip_list);
+
+	for (pnum =3D 0; pnum < sftl->pblocks; pnum++) {
+		struct sftl_pdata *this_pdata =3D &sftl->pdata_tbl[pnum];
+
+		/* skip bad blocks */
+
+		if (mtd->block_isbad(mtd, pnum * mtd->erasesize)) {
+			PDATA_STATUS(this_pdata) =3D STATUS_BAD;
+			sftl_info("P:0x%08x: bad block\n", pnum);
+			sftl->badblocks++;
+			list_add_tail(&this_pdata->list, &sftl->bad_list);
+			continue;
+		}
+
+		ret =3D read_pb_oob(sftl, pnum);
+
+		if (ret) {
+			list_add(&this_pdata->list, &erase_list);
+			continue;
+		}
+
+		if (PDATA_STATUS(this_pdata) =3D=3D STATUS_FREE) {
+			list_add(&this_pdata->list, &sftl->free_list);
+			continue;
+		}
+
+		/* get logical address, STATUS_ASSIGN/STATUS_BITFLIP */
+
+		if (!(sftl->laddr_tbl[PDATA_LNUM(this_pdata)]
+		      & SFTL_PNUM_NOASSIGN)) {
+			struct sftl_pdata *old_pdata =3D
+				&sftl->pdata_tbl[get_pnum_by_lnum(sftl,
+						  PDATA_LNUM(this_pdata))];
+
+			/* the lnum is already assigned. */
+
+			if (check_version(sftl, old_pdata, this_pdata)) {
+				/* Just put this to erase list */
+				list_add(&this_pdata->list, &erase_list);
+				continue;
+			} else {
+				/* Replace it, so put the old to erase list */
+				list_del(&old_pdata->list);
+				list_add(&old_pdata->list, &erase_list);
+			}
+		}
+
+		/* assign this */
+
+		sftl->laddr_tbl[PDATA_LNUM(this_pdata)] =3D pnum;
+
+		if (PDATA_STATUS(this_pdata) =3D=3D STATUS_BITFLIP) {
+			sftl_info("P:0x%08x: bitflip block\n", pnum);
+			list_add(&this_pdata->list, &bitflip_list);
+		} else
+			list_add(&this_pdata->list, &sftl->assign_list);
+	}
+
+	/* handle erase blocks */
+
+	list_for_each_safe(pos, next, &erase_list) {
+		struct sftl_pdata *this_pdata =3D
+			list_entry(pos, struct sftl_pdata, list);
+		markerase_pb_putlist(sftl, get_pnum_by_pdata(sftl, this_pdata));
+	}
+
+	/* handle bitfliped blocks */
+
+	list_for_each_safe(pos, next, &bitflip_list) {
+		struct sftl_pdata *this_pdata =3D
+		    list_entry(pos, struct sftl_pdata, list);
+		read_lnum(sftl, PDATA_LNUM(this_pdata), sftl->cache_buf);
+		write_lnum(sftl, PDATA_LNUM(this_pdata), sftl->cache_buf);
+	}
+
+	return 0;
+}
+
+/*************************************************************************=
***
+ *
+ * read/write w/ cache management functions
+ *
+ *************************************************************************=
***/
+
+static int sftl_cache_flush(struct sftl_dev *sftl)
+{
+	int ret =3D 0;
+
+	sftl_dbg("%s: L:0x%08x:STATUS 0x%02x\n", __func__,
+		sftl->cache_lnum, sftl->cache_state);
+
+	if ((sftl->cache_state & CACHE_STATUS_MASK) =3D=3D
+	    (CACHE_VALID | CACHE_DIRTY))
+		/* cache flush */
+		ret =3D write_lnum(sftl, sftl->cache_lnum, sftl->cache_buf);
+
+	sftl->cache_state =3D CACHE_EMPTY;	/* invalid, anyway. */
+
+	return ret;
+}
+
+static int fill_lnum_cache(struct sftl_dev *sftl, uint32_t lnum)
+{
+	int ret;
+
+	sftl_dbg("%s: L:0x%08x:STATUS 0x%02x\n", __func__,
+		sftl->cache_lnum, sftl->cache_state);
+
+	if ((sftl->cache_state & CACHE_VALID) && sftl->cache_lnum =3D=3D lnum)
+		/* do nothing becase cache hit */
+		return 0;
+
+	ret =3D sftl_cache_flush(sftl);
+	if (ret)
+		goto out;
+
+	ret =3D read_lnum_scrub(sftl, lnum, sftl->cache_buf);
+
+ out:
+	if (!ret) {
+		sftl->cache_state =3D CACHE_VALID;
+		sftl->cache_lnum =3D lnum;
+	} else
+		sftl->cache_state =3D CACHE_EMPTY;
+
+	return ret;
+}
+
+/***** the following functions are mtd_blktrans_ops functions *****/
+
+static int sftl_readsect(struct mtd_blktrans_dev *dev, unsigned long snum,
+			 char *buf)
+{
+	struct sftl_dev *sftl =3D dev->priv;
+	uint32_t lnum, offs;
+	int ret;
+
+	if (get_lnum_by_snum(sftl, &lnum, &offs, snum)) {
+		ret =3D -EIO;
+		goto out;
+	}
+
+	sftl_dbg("%s: L:0x%08x::S:0x%08lx\n", __func__, lnum, snum);
+
+	if (get_pnum_by_lnum(sftl, lnum) & SFTL_PNUM_NOASSIGN) {
+		sftl_dbg("%s: NOASSIGN lnum\n", __func__);
+		memset(buf, 0xff, SFTL_SECTOR_SIZE);
+		ret =3D 0;
+		goto out;
+	}
+
+	ret =3D fill_lnum_cache(sftl, lnum);
+	if (ret)
+		goto out;
+
+	memcpy(buf, &sftl->cache_buf[offs], SFTL_SECTOR_SIZE);
+
+ out:
+	if (ret)
+		sftl_err("readsect error S:0x%8x::%d\n", (uint32_t) snum, ret);
+
+	return ret;
+}
+
+static int sftl_writesect(struct mtd_blktrans_dev *dev, unsigned long snum=
,
+			  char *buf)
+{
+	struct sftl_dev *sftl =3D dev->priv;
+	uint32_t lnum, offs;
+	int ret;
+
+	if (get_lnum_by_snum(sftl, &lnum, &offs, snum)) {
+		ret =3D -EIO;
+		goto out;
+	}
+
+	sftl_dbg("%s: L:0x%08x::S:0x%08lx\n", __func__, lnum, snum);
+
+	ret =3D fill_lnum_cache(sftl, lnum);
+	if (ret)
+		goto out;
+
+	sftl->cache_state |=3D CACHE_DIRTY;
+	memcpy(&sftl->cache_buf[offs], buf, SFTL_SECTOR_SIZE);
+ out:
+	if (ret)
+		sftl_err("writesect error S:0x%08x::%d\n", (uint32_t) snum,
+			 ret);
+
+	return ret;
+}
+
+static void sftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd=
)
+{
+	int i =3D 0;
+	struct sftl_dev *sftl;
+
+	for (i =3D 0; i < mtd_devs; i++)
+		if (mtd->index =3D=3D mtd_dev_param[i])
+			break;
+
+	if (i =3D=3D mtd_devs) {
+		pr_debug("sftl: not found a registered mtd%d\n", mtd->index);
+		return;
+	}
+
+	/* Check if this is NAND flash */
+	if (mtd->type !=3D MTD_NANDFLASH) {
+		pr_err("sftl: mtd%d is not NAND Flash\n", mtd->index);
+		return;
+	}
+
+	sftl =3D kzalloc(sizeof(struct sftl_dev), GFP_KERNEL);
+	if (!sftl) {
+		pr_err("sftl:mtd%d: out of memory for data structures\n",
+		       mtd->index);
+		return;
+	}
+
+	sftl->mtd =3D mtd;
+
+	sftl->mbd =3D kzalloc(sizeof(struct mtd_blktrans_dev), GFP_KERNEL);
+	if (!sftl->mbd) {
+		sftl_err("out of memory for data structures\n");
+		goto out;
+	}
+	sftl->mbd->priv =3D sftl;
+	sftl->mbd->mtd =3D mtd;
+	sftl->mbd->devnum =3D mtd->index;
+	sftl->mbd->tr =3D tr;
+
+	sftl->mbd->disk_attributes =3D &sftl_attribute_group;
+
+	sftl->pblocks =3D (uint32_t) (mtd->size >> mtd->erasesize_shift);
+
+	if (sftl->pblocks < MINIMUM_PBLOCKS) {
+		sftl_err("%d PBLOCK is too small, larger than %d\n",
+			 sftl->pblocks, MINIMUM_PBLOCKS);
+		goto out;
+	}
+
+	sftl->lblocks =3D
+	    sftl->pblocks - (sftl->pblocks / 100) * reserve_blk_percent;
+
+	if (sftl->pblocks - sftl->lblocks < MINIMUM_RESERVE_PBLOCKS) {
+		sftl_warn("%d reserve block is too small, larger than %d\n",
+			  sftl->pblocks - sftl->lblocks,
+			  MINIMUM_RESERVE_PBLOCKS);
+		sftl->lblocks =3D sftl->pblocks - MINIMUM_RESERVE_PBLOCKS;
+	}
+
+	/* Initialize cache */
+	sftl->cache_state =3D CACHE_EMPTY;
+	sftl->cache_lnum =3D SFTL_PNUM_NOASSIGN;
+	sftl->cache_buf =3D kzalloc(mtd->erasesize, GFP_KERNEL);
+	if (!sftl->cache_buf) {
+		sftl_err("out of memory for data structures\n");
+		goto out;
+	}
+
+	sftl->mbd->size =3D (sftl->lblocks << mtd->erasesize_shift)
+		/ SFTL_SECTOR_SIZE;
+	sftl->badblocks =3D 0;
+
+	INIT_LIST_HEAD(&sftl->assign_list);
+	INIT_LIST_HEAD(&sftl->bad_list);
+	INIT_LIST_HEAD(&sftl->free_list);
+
+	/* Allocate pnum table indexed by lnum */
+	sftl->laddr_tbl =3D kmalloc(sizeof(uint32_t) * sftl->lblocks,
+				  GFP_KERNEL);
+	if (!sftl->laddr_tbl) {
+		sftl_err("out of memory for data structures\n");
+		goto out;
+	}
+
+	memset(sftl->laddr_tbl, 0xff, sizeof(uint32_t) * sftl->lblocks);
+
+	/* Allocate physical data table */
+	sftl->pdata_tbl =3D kzalloc(sizeof(struct sftl_pdata) * sftl->pblocks,
+				  GFP_KERNEL);
+
+	if (!sftl->pdata_tbl) {
+		sftl_err("out of memory for data structures\n");
+		goto out;
+	}
+
+	/* Build logical block map */
+	if (build_lblock_map(sftl) < 0) {
+		sftl_err("build_lblock_map failed\n");
+		goto out;
+	}
+
+	/* Register block device */
+	if (add_mtd_blktrans_dev(sftl->mbd)) {
+		sftl_err("add_mtd_blktrans_dev failed\n");
+		goto out;
+	}
+
+	sftl_info("%s: Physical Block %d, Logical blocks %d, "
+		  "Reserved blocks %d, Bad blocks %d\n",
+		  sftl->mbd->disk->disk_name, sftl->pblocks, sftl->lblocks,
+		  sftl->pblocks - sftl->lblocks, sftl->badblocks);
+
+	return;
+
+ out:
+	kfree(sftl->mbd);
+	kfree(sftl->pdata_tbl);
+	kfree(sftl->laddr_tbl);
+	kfree(sftl->cache_buf);
+	kfree(sftl);
+}
+
+static void sftl_remove_dev(struct mtd_blktrans_dev *dev)
+{
+	struct sftl_dev *sftl =3D dev->priv;
+	struct mtd_info *mtd =3D sftl->mtd;
+	int i;
+
+	sftl_dbg("sftl: remove_dev (%d)\n", dev->devnum);
+
+	for (i =3D 0; i < mtd_devs; i++)
+		if (mtd->index =3D=3D mtd_dev_param[i])
+			break;
+
+	if (i =3D=3D mtd_devs) {
+		sftl_warn("not found a registered mtd%d\n", mtd->index);
+		return;
+	}
+
+	del_mtd_blktrans_dev(dev);
+	kfree(sftl->pdata_tbl);
+	kfree(sftl->laddr_tbl);
+	kfree(sftl->cache_buf);
+	kfree(sftl);
+}
+
+static int sftl_release(struct mtd_blktrans_dev *dev)
+{
+	struct sftl_dev *sftl =3D dev->priv;
+
+	sftl_dbg("%s\n", __func__);
+
+	return sftl_cache_flush(sftl);
+}
+
+static int sftl_flush(struct mtd_blktrans_dev *dev)
+{
+	struct sftl_dev *sftl =3D dev->priv;
+
+	sftl_dbg("%s\n", __func__);
+
+	return sftl_cache_flush(sftl);
+}
+
+/*************************************************************************=
***
+ *
+ * Module stuff
+ *
+ *************************************************************************=
***/
+
+static struct mtd_blktrans_ops sftl_tr =3D {
+	.name =3D "sftl",
+	.blksize =3D SFTL_SECTOR_SIZE,
+	.part_bits =3D SFTL_PARTN_BITS,
+	.flush =3D sftl_flush,
+	.release =3D sftl_release,
+	.readsect =3D sftl_readsect,
+	.writesect =3D sftl_writesect,
+	.add_mtd =3D sftl_add_mtd,
+	.remove_dev =3D sftl_remove_dev,
+	.owner =3D THIS_MODULE,
+};
+
+static int __init init_sftl(void)
+{
+	pr_info("SFTL version %s\n", SFTL_VERSION);
+
+	if (reserve_blk_percent > 90 || reserve_blk_percent < 1) {
+		pr_warn("sftl: the specified reserve_blk_percent is out of range.\n");
+		reserve_blk_percent =3D CONFIG_SFTL_RESERVE_BLK_PERCENT;
+		pr_warn("set default reserve_blk_percent %d\n",
+			reserve_blk_percent);
+	}
+
+	return register_mtd_blktrans(&sftl_tr);
+}
+
+static void __exit cleanup_sftl(void)
+{
+	deregister_mtd_blktrans(&sftl_tr);
+}
+
+static int __init sftl_mtd_parse(const char *val, struct kernel_param *kp)
+{
+	if (!val)
+		return -EINVAL;
+
+	if (mtd_devs =3D=3D SFTL_MAX_DEVICES) {
+		pr_err("sftl: too many parameters, max. is %d\n",
+		       SFTL_MAX_DEVICES);
+		return -EINVAL;
+	}
+
+	if (kstrtoint(val, 0, &mtd_dev_param[mtd_devs]))
+		return -EINVAL;
+
+	mtd_devs++;
+
+	return 0;
+}
+
+module_param_call(mtd, sftl_mtd_parse, NULL, NULL, 000);
+MODULE_PARM_DESC(mtd, "MTD devices to attach. ");
+
+module_param_named(rb, reserve_blk_percent, int, 0);
+MODULE_PARM_DESC(rb, "percents of reserved blocks for bad blocks.");
+
+module_init(init_sftl);
+module_exit(cleanup_sftl);
+
+MODULE_AUTHOR("TOSHIBA Corporation");
+MODULE_DESCRIPTION("SFTL");
+MODULE_LICENSE("GPL");
--=20
1.7.4.1
