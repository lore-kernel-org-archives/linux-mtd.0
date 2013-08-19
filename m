Received: from longford.logfs.org ([213.229.74.203])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBSHX-0003EY-FW
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 16:26:27 +0000
Date: Mon, 19 Aug 2013 10:52:34 -0400
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: remove alauda driver
Message-ID: <20130819145234.GB24136@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver has very low utility.  Devices in question are limited to
about 400kB/s and the only known user (me) discarded the hardware
several years back.

Signed-off-by: Joern Engel <joern@logfs.org>
---
 arch/x86/mm/fault.c                        |    2 +-
 drivers/mtd/nand/Kconfig                   |    7 -
 drivers/mtd/nand/Makefile                  |    1 -
 drivers/mtd/nand/alauda.c                  |  723 ----------------------------
 drivers/target/target_core_tmr.c           |    3 +-
 fs/compat_ioctl.c                          |    1 -
 fs/logfs/readwrite.c                       |    5 +-
 fs/proc/array.c                            |    4 +-
 include/linux/sched.h                      |    2 +-
 kernel/acct.c                              |    2 +-
 kernel/exit.c                              |    4 +-
 kernel/fork.c                              |    2 +-
 kernel/sys.c                               |    2 +-
 kernel/tsacct.c                            |    2 +-
 mm/memory.c                                |   13 -
 tools/testing/selftests/vm/hugetlbfstest.c |   22 +-
 16 files changed, 34 insertions(+), 761 deletions(-)
 delete mode 100644 drivers/mtd/nand/alauda.c

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 0e88336..959c22e 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1203,7 +1203,7 @@ good_area:
 			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ, 1,
 				      regs, address);
 		} else {
-			tsk->min_flt++;
+			tsk->_min_flt++;
 			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN, 1,
 				      regs, address);
 		}
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 81bf5e5..2d46663 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -462,13 +462,6 @@ config MTD_NAND_PLATFORM
 	  devices. You will need to provide platform-specific functions
 	  via platform_data.
 
-config MTD_ALAUDA
-	tristate "MTD driver for Olympus MAUSB-10 and Fujifilm DPC-R1"
-	depends on USB
-	help
-	  These two (and possibly other) Alauda-based cardreaders for
-	  SmartMedia and xD allow raw flash access.
-
 config MTD_NAND_ORION
 	tristate "NAND Flash support for Marvell Orion SoC"
 	depends on PLAT_ORION
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index d76d912..20746a5 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -34,7 +34,6 @@ obj-$(CONFIG_MTD_NAND_CM_X270)		+= cmx270_nand.o
 obj-$(CONFIG_MTD_NAND_PXA3xx)		+= pxa3xx_nand.o
 obj-$(CONFIG_MTD_NAND_TMIO)		+= tmio_nand.o
 obj-$(CONFIG_MTD_NAND_PLATFORM)		+= plat_nand.o
-obj-$(CONFIG_MTD_ALAUDA)		+= alauda.o
 obj-$(CONFIG_MTD_NAND_PASEMI)		+= pasemi_nand.o
 obj-$(CONFIG_MTD_NAND_ORION)		+= orion_nand.o
 obj-$(CONFIG_MTD_NAND_FSL_ELBC)		+= fsl_elbc_nand.o
diff --git a/drivers/mtd/nand/alauda.c b/drivers/mtd/nand/alauda.c
deleted file mode 100644
index 60a0dfd..0000000
--- a/drivers/mtd/nand/alauda.c
+++ /dev/null
@@ -1,723 +0,0 @@
-/*
- * MTD driver for Alauda chips
- *
- * Copyright (C) 2007 Joern Engel <joern@logfs.org>
- *
- * Based on drivers/usb/usb-skeleton.c which is:
- * Copyright (C) 2001-2004 Greg Kroah-Hartman (greg@kroah.com)
- * and on drivers/usb/storage/alauda.c, which is:
- *   (c) 2005 Daniel Drake <dsd@gentoo.org>
- *
- * Idea and initial work by Arnd Bergmann <arnd@arndb.de>
- */
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/module.h>
-#include <linux/kref.h>
-#include <linux/usb.h>
-#include <linux/mutex.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/nand_ecc.h>
-
-/* Control commands */
-#define ALAUDA_GET_XD_MEDIA_STATUS	0x08
-#define ALAUDA_ACK_XD_MEDIA_CHANGE	0x0a
-#define ALAUDA_GET_XD_MEDIA_SIG		0x86
-
-/* Common prefix */
-#define ALAUDA_BULK_CMD			0x40
-
-/* The two ports */
-#define ALAUDA_PORT_XD			0x00
-#define ALAUDA_PORT_SM			0x01
-
-/* Bulk commands */
-#define ALAUDA_BULK_READ_PAGE		0x84
-#define ALAUDA_BULK_READ_OOB		0x85 /* don't use, there's a chip bug */
-#define ALAUDA_BULK_READ_BLOCK		0x94
-#define ALAUDA_BULK_ERASE_BLOCK		0xa3
-#define ALAUDA_BULK_WRITE_PAGE		0xa4
-#define ALAUDA_BULK_WRITE_BLOCK		0xb4
-#define ALAUDA_BULK_RESET_MEDIA		0xe0
-
-/* Address shifting */
-#define PBA_LO(pba) ((pba & 0xF) << 5)
-#define PBA_HI(pba) (pba >> 3)
-#define PBA_ZONE(pba) (pba >> 11)
-
-#define TIMEOUT HZ
-
-static const struct usb_device_id alauda_table[] = {
-	{ USB_DEVICE(0x0584, 0x0008) },	/* Fujifilm DPC-R1 */
-	{ USB_DEVICE(0x07b4, 0x010a) },	/* Olympus MAUSB-10 */
-	{ }
-};
-MODULE_DEVICE_TABLE(usb, alauda_table);
-
-struct alauda_card {
-	u8	id;		/* id byte */
-	u8	chipshift;	/* 1<<chipshift total size */
-	u8	pageshift;	/* 1<<pageshift page size */
-	u8	blockshift;	/* 1<<blockshift block size */
-};
-
-struct alauda {
-	struct usb_device	*dev;
-	struct usb_interface	*interface;
-	struct mtd_info		*mtd;
-	struct alauda_card	*card;
-	struct mutex		card_mutex;
-	u32			pagemask;
-	u32			bytemask;
-	u32			blockmask;
-	unsigned int		write_out;
-	unsigned int		bulk_in;
-	unsigned int		bulk_out;
-	u8			port;
-	struct kref		kref;
-};
-
-static struct alauda_card alauda_card_ids[] = {
-	/* NAND flash */
-	{ 0x6e, 20, 8, 12},	/* 1 MB */
-	{ 0xe8, 20, 8, 12},	/* 1 MB */
-	{ 0xec, 20, 8, 12},	/* 1 MB */
-	{ 0x64, 21, 8, 12},	/* 2 MB */
-	{ 0xea, 21, 8, 12},	/* 2 MB */
-	{ 0x6b, 22, 9, 13},	/* 4 MB */
-	{ 0xe3, 22, 9, 13},	/* 4 MB */
-	{ 0xe5, 22, 9, 13},	/* 4 MB */
-	{ 0xe6, 23, 9, 13},	/* 8 MB */
-	{ 0x73, 24, 9, 14},	/* 16 MB */
-	{ 0x75, 25, 9, 14},	/* 32 MB */
-	{ 0x76, 26, 9, 14},	/* 64 MB */
-	{ 0x79, 27, 9, 14},	/* 128 MB */
-	{ 0x71, 28, 9, 14},	/* 256 MB */
-
-	/* MASK ROM */
-	{ 0x5d, 21, 9, 13},	/* 2 MB */
-	{ 0xd5, 22, 9, 13},	/* 4 MB */
-	{ 0xd6, 23, 9, 13},	/* 8 MB */
-	{ 0x57, 24, 9, 13},	/* 16 MB */
-	{ 0x58, 25, 9, 13},	/* 32 MB */
-	{ }
-};
-
-static struct alauda_card *get_card(u8 id)
-{
-	struct alauda_card *card;
-
-	for (card = alauda_card_ids; card->id; card++)
-		if (card->id == id)
-			return card;
-	return NULL;
-}
-
-static void alauda_delete(struct kref *kref)
-{
-	struct alauda *al = container_of(kref, struct alauda, kref);
-
-	if (al->mtd) {
-		mtd_device_unregister(al->mtd);
-		kfree(al->mtd);
-	}
-	usb_put_dev(al->dev);
-	kfree(al);
-}
-
-static int alauda_get_media_status(struct alauda *al, void *buf)
-{
-	int ret;
-
-	mutex_lock(&al->card_mutex);
-	ret = usb_control_msg(al->dev, usb_rcvctrlpipe(al->dev, 0),
-			ALAUDA_GET_XD_MEDIA_STATUS, 0xc0, 0, 1, buf, 2, HZ);
-	mutex_unlock(&al->card_mutex);
-	return ret;
-}
-
-static int alauda_ack_media(struct alauda *al)
-{
-	int ret;
-
-	mutex_lock(&al->card_mutex);
-	ret = usb_control_msg(al->dev, usb_sndctrlpipe(al->dev, 0),
-			ALAUDA_ACK_XD_MEDIA_CHANGE, 0x40, 0, 1, NULL, 0, HZ);
-	mutex_unlock(&al->card_mutex);
-	return ret;
-}
-
-static int alauda_get_media_signatures(struct alauda *al, void *buf)
-{
-	int ret;
-
-	mutex_lock(&al->card_mutex);
-	ret = usb_control_msg(al->dev, usb_rcvctrlpipe(al->dev, 0),
-			ALAUDA_GET_XD_MEDIA_SIG, 0xc0, 0, 0, buf, 4, HZ);
-	mutex_unlock(&al->card_mutex);
-	return ret;
-}
-
-static void alauda_reset(struct alauda *al)
-{
-	u8 command[] = {
-		ALAUDA_BULK_CMD, ALAUDA_BULK_RESET_MEDIA, 0, 0,
-		0, 0, 0, 0, al->port
-	};
-	mutex_lock(&al->card_mutex);
-	usb_bulk_msg(al->dev, al->bulk_out, command, 9, NULL, HZ);
-	mutex_unlock(&al->card_mutex);
-}
-
-static void correct_data(void *buf, void *read_ecc,
-		int *corrected, int *uncorrected)
-{
-	u8 calc_ecc[3];
-	int err;
-
-	nand_calculate_ecc(NULL, buf, calc_ecc);
-	err = nand_correct_data(NULL, buf, read_ecc, calc_ecc);
-	if (err) {
-		if (err > 0)
-			(*corrected)++;
-		else
-			(*uncorrected)++;
-	}
-}
-
-struct alauda_sg_request {
-	struct urb *urb[3];
-	struct completion comp;
-};
-
-static void alauda_complete(struct urb *urb)
-{
-	struct completion *comp = urb->context;
-
-	if (comp)
-		complete(comp);
-}
-
-static int __alauda_read_page(struct mtd_info *mtd, loff_t from, void *buf,
-		void *oob)
-{
-	struct alauda_sg_request sg;
-	struct alauda *al = mtd->priv;
-	u32 pba = from >> al->card->blockshift;
-	u32 page = (from >> al->card->pageshift) & al->pagemask;
-	u8 command[] = {
-		ALAUDA_BULK_CMD, ALAUDA_BULK_READ_PAGE, PBA_HI(pba),
-		PBA_ZONE(pba), 0, PBA_LO(pba) + page, 1, 0, al->port
-	};
-	int i, err;
-
-	for (i=0; i<3; i++)
-		sg.urb[i] = NULL;
-
-	err = -ENOMEM;
-	for (i=0; i<3; i++) {
-		sg.urb[i] = usb_alloc_urb(0, GFP_NOIO);
-		if (!sg.urb[i])
-			goto out;
-	}
-	init_completion(&sg.comp);
-	usb_fill_bulk_urb(sg.urb[0], al->dev, al->bulk_out, command, 9,
-			alauda_complete, NULL);
-	usb_fill_bulk_urb(sg.urb[1], al->dev, al->bulk_in, buf, mtd->writesize,
-			alauda_complete, NULL);
-	usb_fill_bulk_urb(sg.urb[2], al->dev, al->bulk_in, oob, 16,
-			alauda_complete, &sg.comp);
-
-	mutex_lock(&al->card_mutex);
-	for (i=0; i<3; i++) {
-		err = usb_submit_urb(sg.urb[i], GFP_NOIO);
-		if (err)
-			goto cancel;
-	}
-	if (!wait_for_completion_timeout(&sg.comp, TIMEOUT)) {
-		err = -ETIMEDOUT;
-cancel:
-		for (i=0; i<3; i++) {
-			usb_kill_urb(sg.urb[i]);
-		}
-	}
-	mutex_unlock(&al->card_mutex);
-
-out:
-	usb_free_urb(sg.urb[0]);
-	usb_free_urb(sg.urb[1]);
-	usb_free_urb(sg.urb[2]);
-	return err;
-}
-
-static int alauda_read_page(struct mtd_info *mtd, loff_t from,
-		void *buf, u8 *oob, int *corrected, int *uncorrected)
-{
-	int err;
-
-	err = __alauda_read_page(mtd, from, buf, oob);
-	if (err)
-		return err;
-	correct_data(buf, oob+13, corrected, uncorrected);
-	correct_data(buf+256, oob+8, corrected, uncorrected);
-	return 0;
-}
-
-static int alauda_write_page(struct mtd_info *mtd, loff_t to, void *buf,
-		void *oob)
-{
-	struct alauda_sg_request sg;
-	struct alauda *al = mtd->priv;
-	u32 pba = to >> al->card->blockshift;
-	u32 page = (to >> al->card->pageshift) & al->pagemask;
-	u8 command[] = {
-		ALAUDA_BULK_CMD, ALAUDA_BULK_WRITE_PAGE, PBA_HI(pba),
-		PBA_ZONE(pba), 0, PBA_LO(pba) + page, 32, 0, al->port
-	};
-	int i, err;
-
-	for (i=0; i<3; i++)
-		sg.urb[i] = NULL;
-
-	err = -ENOMEM;
-	for (i=0; i<3; i++) {
-		sg.urb[i] = usb_alloc_urb(0, GFP_NOIO);
-		if (!sg.urb[i])
-			goto out;
-	}
-	init_completion(&sg.comp);
-	usb_fill_bulk_urb(sg.urb[0], al->dev, al->bulk_out, command, 9,
-			alauda_complete, NULL);
-	usb_fill_bulk_urb(sg.urb[1], al->dev, al->write_out, buf,mtd->writesize,
-			alauda_complete, NULL);
-	usb_fill_bulk_urb(sg.urb[2], al->dev, al->write_out, oob, 16,
-			alauda_complete, &sg.comp);
-
-	mutex_lock(&al->card_mutex);
-	for (i=0; i<3; i++) {
-		err = usb_submit_urb(sg.urb[i], GFP_NOIO);
-		if (err)
-			goto cancel;
-	}
-	if (!wait_for_completion_timeout(&sg.comp, TIMEOUT)) {
-		err = -ETIMEDOUT;
-cancel:
-		for (i=0; i<3; i++) {
-			usb_kill_urb(sg.urb[i]);
-		}
-	}
-	mutex_unlock(&al->card_mutex);
-
-out:
-	usb_free_urb(sg.urb[0]);
-	usb_free_urb(sg.urb[1]);
-	usb_free_urb(sg.urb[2]);
-	return err;
-}
-
-static int alauda_erase_block(struct mtd_info *mtd, loff_t ofs)
-{
-	struct alauda_sg_request sg;
-	struct alauda *al = mtd->priv;
-	u32 pba = ofs >> al->card->blockshift;
-	u8 command[] = {
-		ALAUDA_BULK_CMD, ALAUDA_BULK_ERASE_BLOCK, PBA_HI(pba),
-		PBA_ZONE(pba), 0, PBA_LO(pba), 0x02, 0, al->port
-	};
-	u8 buf[2];
-	int i, err;
-
-	for (i=0; i<2; i++)
-		sg.urb[i] = NULL;
-
-	err = -ENOMEM;
-	for (i=0; i<2; i++) {
-		sg.urb[i] = usb_alloc_urb(0, GFP_NOIO);
-		if (!sg.urb[i])
-			goto out;
-	}
-	init_completion(&sg.comp);
-	usb_fill_bulk_urb(sg.urb[0], al->dev, al->bulk_out, command, 9,
-			alauda_complete, NULL);
-	usb_fill_bulk_urb(sg.urb[1], al->dev, al->bulk_in, buf, 2,
-			alauda_complete, &sg.comp);
-
-	mutex_lock(&al->card_mutex);
-	for (i=0; i<2; i++) {
-		err = usb_submit_urb(sg.urb[i], GFP_NOIO);
-		if (err)
-			goto cancel;
-	}
-	if (!wait_for_completion_timeout(&sg.comp, TIMEOUT)) {
-		err = -ETIMEDOUT;
-cancel:
-		for (i=0; i<2; i++) {
-			usb_kill_urb(sg.urb[i]);
-		}
-	}
-	mutex_unlock(&al->card_mutex);
-
-out:
-	usb_free_urb(sg.urb[0]);
-	usb_free_urb(sg.urb[1]);
-	return err;
-}
-
-static int alauda_read_oob(struct mtd_info *mtd, loff_t from, void *oob)
-{
-	static u8 ignore_buf[512]; /* write only */
-
-	return __alauda_read_page(mtd, from, ignore_buf, oob);
-}
-
-static int alauda_isbad(struct mtd_info *mtd, loff_t ofs)
-{
-	u8 oob[16];
-	int err;
-
-	err = alauda_read_oob(mtd, ofs, oob);
-	if (err)
-		return err;
-
-	/* A block is marked bad if two or more bits are zero */
-	return hweight8(oob[5]) >= 7 ? 0 : 1;
-}
-
-static int alauda_bounce_read(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char *buf)
-{
-	struct alauda *al = mtd->priv;
-	void *bounce_buf;
-	int err, corrected=0, uncorrected=0;
-
-	bounce_buf = kmalloc(mtd->writesize, GFP_KERNEL);
-	if (!bounce_buf)
-		return -ENOMEM;
-
-	*retlen = len;
-	while (len) {
-		u8 oob[16];
-		size_t byte = from & al->bytemask;
-		size_t cplen = min(len, mtd->writesize - byte);
-
-		err = alauda_read_page(mtd, from, bounce_buf, oob,
-				&corrected, &uncorrected);
-		if (err)
-			goto out;
-
-		memcpy(buf, bounce_buf + byte, cplen);
-		buf += cplen;
-		from += cplen;
-		len -= cplen;
-	}
-	err = 0;
-	if (corrected)
-		err = 1;	/* return max_bitflips per ecc step */
-	if (uncorrected)
-		err = -EBADMSG;
-out:
-	kfree(bounce_buf);
-	return err;
-}
-
-static int alauda_read(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, u_char *buf)
-{
-	struct alauda *al = mtd->priv;
-	int err, corrected=0, uncorrected=0;
-
-	if ((from & al->bytemask) || (len & al->bytemask))
-		return alauda_bounce_read(mtd, from, len, retlen, buf);
-
-	*retlen = len;
-	while (len) {
-		u8 oob[16];
-
-		err = alauda_read_page(mtd, from, buf, oob,
-				&corrected, &uncorrected);
-		if (err)
-			return err;
-
-		buf += mtd->writesize;
-		from += mtd->writesize;
-		len -= mtd->writesize;
-	}
-	err = 0;
-	if (corrected)
-		err = 1;	/* return max_bitflips per ecc step */
-	if (uncorrected)
-		err = -EBADMSG;
-	return err;
-}
-
-static int alauda_write(struct mtd_info *mtd, loff_t to, size_t len,
-		size_t *retlen, const u_char *buf)
-{
-	struct alauda *al = mtd->priv;
-	int err;
-
-	if ((to & al->bytemask) || (len & al->bytemask))
-		return -EINVAL;
-
-	*retlen = len;
-	while (len) {
-		u32 page = (to >> al->card->pageshift) & al->pagemask;
-		u8 oob[16] = {	'h', 'e', 'l', 'l', 'o', 0xff, 0xff, 0xff,
-				0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
-
-		/* don't write to bad blocks */
-		if (page == 0) {
-			err = alauda_isbad(mtd, to);
-			if (err) {
-				return -EIO;
-			}
-		}
-		nand_calculate_ecc(mtd, buf, &oob[13]);
-		nand_calculate_ecc(mtd, buf+256, &oob[8]);
-
-		err = alauda_write_page(mtd, to, (void*)buf, oob);
-		if (err)
-			return err;
-
-		buf += mtd->writesize;
-		to += mtd->writesize;
-		len -= mtd->writesize;
-	}
-	return 0;
-}
-
-static int __alauda_erase(struct mtd_info *mtd, struct erase_info *instr)
-{
-	struct alauda *al = mtd->priv;
-	u32 ofs = instr->addr;
-	u32 len = instr->len;
-	int err;
-
-	if ((ofs & al->blockmask) || (len & al->blockmask))
-		return -EINVAL;
-
-	while (len) {
-		/* don't erase bad blocks */
-		err = alauda_isbad(mtd, ofs);
-		if (err > 0)
-			err = -EIO;
-		if (err < 0)
-			return err;
-
-		err = alauda_erase_block(mtd, ofs);
-		if (err < 0)
-			return err;
-
-		ofs += mtd->erasesize;
-		len -= mtd->erasesize;
-	}
-	return 0;
-}
-
-static int alauda_erase(struct mtd_info *mtd, struct erase_info *instr)
-{
-	int err;
-
-	err = __alauda_erase(mtd, instr);
-	instr->state = err ? MTD_ERASE_FAILED : MTD_ERASE_DONE;
-	mtd_erase_callback(instr);
-	return err;
-}
-
-static int alauda_init_media(struct alauda *al)
-{
-	u8 buf[4], *b0=buf, *b1=buf+1;
-	struct alauda_card *card;
-	struct mtd_info *mtd;
-	int err;
-
-	mtd = kzalloc(sizeof(*mtd), GFP_KERNEL);
-	if (!mtd)
-		return -ENOMEM;
-
-	for (;;) {
-		err = alauda_get_media_status(al, buf);
-		if (err < 0)
-			goto error;
-		if (*b0 & 0x10)
-			break;
-		msleep(20);
-	}
-
-	err = alauda_ack_media(al);
-	if (err)
-		goto error;
-
-	msleep(10);
-
-	err = alauda_get_media_status(al, buf);
-	if (err < 0)
-		goto error;
-
-	if (*b0 != 0x14) {
-		/* media not ready */
-		err = -EIO;
-		goto error;
-	}
-	err = alauda_get_media_signatures(al, buf);
-	if (err < 0)
-		goto error;
-
-	card = get_card(*b1);
-	if (!card) {
-		printk(KERN_ERR"Alauda: unknown card id %02x\n", *b1);
-		err = -EIO;
-		goto error;
-	}
-	printk(KERN_INFO"pagesize=%x\nerasesize=%x\nsize=%xMiB\n",
-			1<<card->pageshift, 1<<card->blockshift,
-			1<<(card->chipshift-20));
-	al->card = card;
-	al->pagemask = (1 << (card->blockshift - card->pageshift)) - 1;
-	al->bytemask = (1 << card->pageshift) - 1;
-	al->blockmask = (1 << card->blockshift) - 1;
-
-	mtd->name = "alauda";
-	mtd->size = 1<<card->chipshift;
-	mtd->erasesize = 1<<card->blockshift;
-	mtd->writesize = 1<<card->pageshift;
-	mtd->type = MTD_NANDFLASH;
-	mtd->flags = MTD_CAP_NANDFLASH;
-	mtd->_read = alauda_read;
-	mtd->_write = alauda_write;
-	mtd->_erase = alauda_erase;
-	mtd->_block_isbad = alauda_isbad;
-	mtd->priv = al;
-	mtd->owner = THIS_MODULE;
-	mtd->ecc_strength = 1;
-
-	err = mtd_device_register(mtd, NULL, 0);
-	if (err) {
-		err = -ENFILE;
-		goto error;
-	}
-
-	al->mtd = mtd;
-	alauda_reset(al); /* no clue whether this is necessary */
-	return 0;
-error:
-	kfree(mtd);
-	return err;
-}
-
-static int alauda_check_media(struct alauda *al)
-{
-	u8 buf[2], *b0 = buf, *b1 = buf+1;
-	int err;
-
-	err = alauda_get_media_status(al, buf);
-	if (err < 0)
-		return err;
-
-	if ((*b1 & 0x01) == 0) {
-		/* door open */
-		return -EIO;
-	}
-	if ((*b0 & 0x80) || ((*b0 & 0x1F) == 0x10)) {
-		/* no media ? */
-		return -EIO;
-	}
-	if (*b0 & 0x08) {
-		/* media change ? */
-		return alauda_init_media(al);
-	}
-	return 0;
-}
-
-static int alauda_probe(struct usb_interface *interface,
-		const struct usb_device_id *id)
-{
-	struct alauda *al;
-	struct usb_host_interface *iface;
-	struct usb_endpoint_descriptor *ep,
-			*ep_in=NULL, *ep_out=NULL, *ep_wr=NULL;
-	int i, err = -ENOMEM;
-
-	al = kzalloc(2*sizeof(*al), GFP_KERNEL);
-	if (!al)
-		goto error;
-
-	kref_init(&al->kref);
-	usb_set_intfdata(interface, al);
-
-	al->dev = usb_get_dev(interface_to_usbdev(interface));
-	al->interface = interface;
-
-	iface = interface->cur_altsetting;
-	for (i = 0; i < iface->desc.bNumEndpoints; ++i) {
-		ep = &iface->endpoint[i].desc;
-
-		if (usb_endpoint_is_bulk_in(ep)) {
-			ep_in = ep;
-		} else if (usb_endpoint_is_bulk_out(ep)) {
-			if (i==0)
-				ep_wr = ep;
-			else
-				ep_out = ep;
-		}
-	}
-	err = -EIO;
-	if (!ep_wr || !ep_in || !ep_out)
-		goto error;
-
-	al->write_out = usb_sndbulkpipe(al->dev,
-			usb_endpoint_num(ep_wr));
-	al->bulk_in = usb_rcvbulkpipe(al->dev,
-			usb_endpoint_num(ep_in));
-	al->bulk_out = usb_sndbulkpipe(al->dev,
-			usb_endpoint_num(ep_out));
-
-	/* second device is identical up to now */
-	memcpy(al+1, al, sizeof(*al));
-
-	mutex_init(&al[0].card_mutex);
-	mutex_init(&al[1].card_mutex);
-
-	al[0].port = ALAUDA_PORT_XD;
-	al[1].port = ALAUDA_PORT_SM;
-
-	dev_info(&interface->dev, "alauda probed\n");
-	alauda_check_media(al);
-	alauda_check_media(al+1);
-
-	return 0;
-
-error:
-	if (al)
-		kref_put(&al->kref, alauda_delete);
-	return err;
-}
-
-static void alauda_disconnect(struct usb_interface *interface)
-{
-	struct alauda *al;
-
-	al = usb_get_intfdata(interface);
-	usb_set_intfdata(interface, NULL);
-
-	/* FIXME: prevent more I/O from starting */
-
-	/* decrement our usage count */
-	if (al)
-		kref_put(&al->kref, alauda_delete);
-
-	dev_info(&interface->dev, "alauda gone");
-}
-
-static struct usb_driver alauda_driver = {
-	.name =		"alauda",
-	.probe =	alauda_probe,
-	.disconnect =	alauda_disconnect,
-	.id_table =	alauda_table,
-};
-
-module_usb_driver(alauda_driver);
-
-MODULE_LICENSE("GPL");
diff --git a/drivers/target/target_core_tmr.c b/drivers/target/target_core_tmr.c
index d0b4dd9..94e6b57 100644
--- a/drivers/target/target_core_tmr.c
+++ b/drivers/target/target_core_tmr.c
@@ -186,7 +186,6 @@ static void core_tmr_drain_tmr_list(
 	struct se_tmr_req *tmr,
 	struct list_head *preempt_and_abort_list)
 {
-	LIST_HEAD(drain_tmr_list);
 	struct se_tmr_req *tmr_p, *tmr_pp;
 	struct se_cmd *cmd;
 	unsigned long flags;
@@ -224,9 +223,9 @@ static void core_tmr_drain_tmr_list(
 			spin_unlock(&cmd->t_state_lock);
 			continue;
 		}
+		cmd->transport_state |= CMD_T_ABORTED;
 		spin_unlock(&cmd->t_state_lock);
 
-		list_move_tail(&tmr_p->tmr_list, &drain_tmr_list);
 	}
 	spin_unlock_irqrestore(&dev->se_tmr_lock, flags);
 
diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
index 3ced75f..996cdc5 100644
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@ -608,7 +608,6 @@ struct serial_struct32 {
 static int serial_struct_ioctl(unsigned fd, unsigned cmd,
 			struct serial_struct32 __user *ss32)
 {
-        typedef struct serial_struct SS;
         typedef struct serial_struct32 SS32;
         int err;
         struct serial_struct ss;
diff --git a/fs/logfs/readwrite.c b/fs/logfs/readwrite.c
index 9a59cba..2547b8b 100644
--- a/fs/logfs/readwrite.c
+++ b/fs/logfs/readwrite.c
@@ -1279,9 +1279,8 @@ static void fill_shadow_tree(struct inode *inode, struct page *page,
 	struct shadow_tree *tree = &super->s_shadow_tree;
 
 	if (PagePrivate(page)) {
-		if (block->alias_map)
-			super->s_no_object_aliases -= bitmap_weight(
-					block->alias_map, LOGFS_BLOCK_FACTOR);
+		super->s_no_object_aliases -= bitmap_weight(
+				block->alias_map, LOGFS_BLOCK_FACTOR);
 		logfs_handle_transaction(inode, block->ta);
 		block->ops->free_block(inode->i_sb, block);
 	}
diff --git a/fs/proc/array.c b/fs/proc/array.c
index cbd0f1b..f7f6ce5 100644
--- a/fs/proc/array.c
+++ b/fs/proc/array.c
@@ -448,7 +448,7 @@ static int do_task_stat(struct seq_file *m, struct pid_namespace *ns,
 		if (whole) {
 			struct task_struct *t = task;
 			do {
-				min_flt += t->min_flt;
+				min_flt += t->_min_flt;
 				maj_flt += t->maj_flt;
 				gtime += task_gtime(t);
 				t = next_thread(t);
@@ -470,7 +470,7 @@ static int do_task_stat(struct seq_file *m, struct pid_namespace *ns,
 	if (permitted && (!whole || num_threads < 2))
 		wchan = get_wchan(task);
 	if (!whole) {
-		min_flt = task->min_flt;
+		min_flt = task->_min_flt;
 		maj_flt = task->maj_flt;
 		task_cputime_adjusted(task, &utime, &stime);
 		gtime = task_gtime(task);
diff --git a/include/linux/sched.h b/include/linux/sched.h
index e692a02..8516bbe 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1344,7 +1344,7 @@ struct task_struct {
 	struct timespec start_time; 		/* monotonic time */
 	struct timespec real_start_time;	/* boot based time */
 /* mm fault and swap info: this can arguably be seen as either mm-specific or thread-specific */
-	unsigned long min_flt, maj_flt;
+	unsigned long _min_flt, maj_flt;
 
 	struct task_cputime cputime_expires;
 	struct list_head cpu_timers[3];
diff --git a/kernel/acct.c b/kernel/acct.c
index b9bd7f0..505d760 100644
--- a/kernel/acct.c
+++ b/kernel/acct.c
@@ -597,7 +597,7 @@ void acct_collect(long exitcode, int group_dead)
 	task_cputime(current, &utime, &stime);
 	pacct->ac_utime += utime;
 	pacct->ac_stime += stime;
-	pacct->ac_minflt += current->min_flt;
+	pacct->ac_minflt += current->_min_flt;
 	pacct->ac_majflt += current->maj_flt;
 	spin_unlock_irq(&current->sighand->siglock);
 }
diff --git a/kernel/exit.c b/kernel/exit.c
index 60bc027..346abe7 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -128,7 +128,7 @@ static void __exit_signal(struct task_struct *tsk)
 		sig->utime += utime;
 		sig->stime += stime;
 		sig->gtime += task_gtime(tsk);
-		sig->min_flt += tsk->min_flt;
+		sig->min_flt += tsk->_min_flt;
 		sig->maj_flt += tsk->maj_flt;
 		sig->nvcsw += tsk->nvcsw;
 		sig->nivcsw += tsk->nivcsw;
@@ -1096,7 +1096,7 @@ static int wait_task_zombie(struct wait_opts *wo, struct task_struct *p)
 		psig->cstime += tgstime + sig->cstime;
 		psig->cgtime += task_gtime(p) + sig->gtime + sig->cgtime;
 		psig->cmin_flt +=
-			p->min_flt + sig->min_flt + sig->cmin_flt;
+			p->_min_flt + sig->min_flt + sig->cmin_flt;
 		psig->cmaj_flt +=
 			p->maj_flt + sig->maj_flt + sig->cmaj_flt;
 		psig->cnvcsw +=
diff --git a/kernel/fork.c b/kernel/fork.c
index 1766d32..70b72d0 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -869,7 +869,7 @@ static int copy_mm(unsigned long clone_flags, struct task_struct *tsk)
 	struct mm_struct *mm, *oldmm;
 	int retval;
 
-	tsk->min_flt = tsk->maj_flt = 0;
+	tsk->_min_flt = tsk->maj_flt = 0;
 	tsk->nvcsw = tsk->nivcsw = 0;
 #ifdef CONFIG_DETECT_HUNG_TASK
 	tsk->last_switch_count = tsk->nvcsw + tsk->nivcsw;
diff --git a/kernel/sys.c b/kernel/sys.c
index 0da73cf..8123e70 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -1690,7 +1690,7 @@ static void accumulate_thread_rusage(struct task_struct *t, struct rusage *r)
 {
 	r->ru_nvcsw += t->nvcsw;
 	r->ru_nivcsw += t->nivcsw;
-	r->ru_minflt += t->min_flt;
+	r->ru_minflt += t->_min_flt;
 	r->ru_majflt += t->maj_flt;
 	r->ru_inblock += task_io_get_inblock(t);
 	r->ru_oublock += task_io_get_oublock(t);
diff --git a/kernel/tsacct.c b/kernel/tsacct.c
index a1dd9a1..f83abb9 100644
--- a/kernel/tsacct.c
+++ b/kernel/tsacct.c
@@ -75,7 +75,7 @@ void bacct_add_tsk(struct user_namespace *user_ns,
 	stats->ac_utimescaled = cputime_to_usecs(utimescaled);
 	stats->ac_stimescaled = cputime_to_usecs(stimescaled);
 
-	stats->ac_minflt = tsk->min_flt;
+	stats->ac_minflt = tsk->_min_flt;
 	stats->ac_majflt = tsk->maj_flt;
 
 	strncpy(stats->ac_comm, tsk->comm, sizeof(stats->ac_comm));
diff --git a/mm/memory.c b/mm/memory.c
index ba94dec..652240a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1849,13 +1849,6 @@ long __get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
 					BUG();
 				}
 
-				if (tsk) {
-					if (ret & VM_FAULT_MAJOR)
-						tsk->maj_flt++;
-					else
-						tsk->min_flt++;
-				}
-
 				if (ret & VM_FAULT_RETRY) {
 					if (nonblocking)
 						*nonblocking = 0;
@@ -1953,12 +1946,6 @@ int fixup_user_fault(struct task_struct *tsk, struct mm_struct *mm,
 			return -EFAULT;
 		BUG();
 	}
-	if (tsk) {
-		if (ret & VM_FAULT_MAJOR)
-			tsk->maj_flt++;
-		else
-			tsk->min_flt++;
-	}
 	return 0;
 }
 
diff --git a/tools/testing/selftests/vm/hugetlbfstest.c b/tools/testing/selftests/vm/hugetlbfstest.c
index ea40ff8..74d4782 100644
--- a/tools/testing/selftests/vm/hugetlbfstest.c
+++ b/tools/testing/selftests/vm/hugetlbfstest.c
@@ -5,7 +5,9 @@
 #include <stdlib.h>
 #include <string.h>
 #include <sys/mman.h>
+#include <sys/resource.h>
 #include <sys/stat.h>
+#include <sys/time.h>
 #include <sys/types.h>
 #include <unistd.h>
 
@@ -29,9 +31,24 @@ static u64 read_rss(void)
 	return rss << 12; /* assumes 4k pagesize */
 }
 
+static void check_for_page_faults(void *p)
+{
+	struct rusage before, after;
+	int err;
+
+	err = getrusage(RUSAGE_SELF, &before);
+	assert(!err);
+	memset(p, 1, length);
+	err = getrusage(RUSAGE_SELF, &after);
+	assert(!err);
+	printf("minor/major faults: %ld %ld\n",
+			after.ru_minflt - before.ru_minflt,
+			after.ru_majflt - before.ru_majflt);
+}
+
 static void do_mmap(int fd, int extra_flags, int unmap)
 {
-	int *p;
+	void *p;
 	int flags = MAP_PRIVATE | MAP_POPULATE | extra_flags;
 	u64 before, after;
 
@@ -42,6 +59,9 @@ static void do_mmap(int fd, int extra_flags, int unmap)
 	after = read_rss();
 	assert(llabs(after - before - length) < 0x40000 ||
 			!"rss didn't grow as expected");
+
+	check_for_page_faults(p);
+
 	if (!unmap)
 		return;
 	munmap(p, length);
-- 
1.7.10.4
