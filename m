Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I8lM5-0000Aa-0F
	for linux-mtd@lists.infradead.org; Wed, 11 Jul 2007 19:12:25 -0400
Date: Thu, 12 Jul 2007 01:08:52 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH Take 3] MTD driver for alauda chips
Message-ID: <20070711230851.GC837@lazybastard.org>
References: <20070709223704.GC18501@lazybastard.org>
	<20070711164628.GB27628@lazybastard.org>
	<20070711172617.GC27628@lazybastard.org>
	<200707112005.44089.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200707112005.44089.arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 11 July 2007 20:05:43 +0200, Arnd Bergmann wrote:
> 
> Not sure how much difference it makes, but it should be more efficient
> to queue all three commands first, and then wait for their completion
> once, instead of doing them all synchronously.

Combining the three per-page requests gave nice results.

Before:
read	169kB/s
write	166kB/s

After:
read	482kB/s
write	248kB/s

Or something thereabout.  On my old machine with usb 1.0 that peaks out
at 1MB/s.

> and you could gain more if you have multiple pages outstanding I/O.

Quite likely.  But simply submitting several pages at once via
ALAUDA_BULK_WRITE_PAGE.  That way I always run into a timeout, must
confuse the controller somehow.  One could submit whole blocks via
ALAUDA_BULK_READ_BLOCK or ALAUDA_BULK_WRITE_BLOCK.

Jörn

-- 
There is no worse hell than that provided by the regrets
for wasted opportunities.
-- Andre-Louis Moreau in Scarabouche

--- /dev/null	2007-07-11 19:48:55.170891600 +0200
+++ linux-2.6.21cow/drivers/mtd/nand/alauda.c	2007-07-12 00:09:13.000000000 +0200
@@ -0,0 +1,670 @@
+/*
+ * MTD driver for Alauda chips
+ *
+ * Copyright (C) 2007 Joern Engel <joern@logfs.org>
+ *
+ * Based on drivers/usb/usb-skeleton.c which is:
+ * Copyright (C) 2001-2004 Greg Kroah-Hartman (greg@kroah.com)
+ * and on drivers/usb/storage/alauda.c, which is:
+ *   (c) 2005 Daniel Drake <dsd@gentoo.org>
+ *
+ * Idea and initial work by Arnd Bergmann <arnd@arndb.de>
+ */
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/kref.h>
+#include <linux/usb.h>
+#include <linux/mutex.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand_ecc.h>
+
+/* Control commands */
+#define ALAUDA_GET_XD_MEDIA_STATUS	0x08
+#define ALAUDA_ACK_XD_MEDIA_CHANGE	0x0a
+#define ALAUDA_GET_XD_MEDIA_SIG		0x86
+
+/* Common prefix */
+#define ALAUDA_BULK_CMD			0x40
+
+/* The two ports */
+#define ALAUDA_PORT_XD			0x00
+#define ALAUDA_PORT_SM			0x01
+
+/* Bulk commands */
+#define ALAUDA_BULK_READ_PAGE		0x84
+#define ALAUDA_BULK_READ_OOB		0x85 /* don't use, there's a chip bug */
+#define ALAUDA_BULK_READ_BLOCK		0x94
+#define ALAUDA_BULK_ERASE_BLOCK		0xa3
+#define ALAUDA_BULK_WRITE_PAGE		0xa4
+#define ALAUDA_BULK_WRITE_BLOCK		0xb4
+#define ALAUDA_BULK_RESET_MEDIA		0xe0
+
+/* Address shifting */
+#define PBA_LO(pba) ((pba & 0xF) << 5)
+#define PBA_HI(pba) (pba >> 3)
+#define PBA_ZONE(pba) (pba >> 11)
+
+static struct usb_device_id alauda_table [] = {
+	{ USB_DEVICE(0x0584, 0x0008) },	/* Fujifilm DPC-R1 */
+	{ USB_DEVICE(0x07b4, 0x010a) },	/* Olympus MAUSB-10 */
+	{ }
+};
+MODULE_DEVICE_TABLE(usb, alauda_table);
+
+struct alauda_card {
+	u8	id;		/* id byte */
+	u8	chipshift;	/* 1<<chipshift total size */
+	u8	pageshift;	/* 1<<pageshift page size */
+	u8	blockshift;	/* 1<<blockshift block size */
+};
+
+struct alauda {
+	struct usb_device	*dev;
+	struct usb_interface	*interface;
+	struct mtd_info		*mtd;
+	struct alauda_card	*card;
+	u32			pagemask;
+	u32			bytemask;
+	u32			blockmask;
+	unsigned int		write_out;
+	unsigned int		bulk_in;
+	unsigned int		bulk_out;
+	u8			port;
+	struct kref		kref;
+};
+
+static struct alauda_card alauda_card_ids[] = {
+	/* NAND flash */
+	{ 0x6e, 20, 8, 12},	/* 1 MB */
+	{ 0xe8, 20, 8, 12},	/* 1 MB */
+	{ 0xec, 20, 8, 12},	/* 1 MB */
+	{ 0x64, 21, 8, 12},	/* 2 MB */
+	{ 0xea, 21, 8, 12},	/* 2 MB */
+	{ 0x6b, 22, 9, 13},	/* 4 MB */
+	{ 0xe3, 22, 9, 13},	/* 4 MB */
+	{ 0xe5, 22, 9, 13},	/* 4 MB */
+	{ 0xe6, 23, 9, 13},	/* 8 MB */
+	{ 0x73, 24, 9, 14},	/* 16 MB */
+	{ 0x75, 25, 9, 14},	/* 32 MB */
+	{ 0x76, 26, 9, 14},	/* 64 MB */
+	{ 0x79, 27, 9, 14},	/* 128 MB */
+	{ 0x71, 28, 9, 14},	/* 256 MB */
+
+	/* MASK ROM */
+	{ 0x5d, 21, 9, 13},	/* 2 MB */
+	{ 0xd5, 22, 9, 13},	/* 4 MB */
+	{ 0xd6, 23, 9, 13},	/* 8 MB */
+	{ 0x57, 24, 9, 13},	/* 16 MB */
+	{ 0x58, 25, 9, 13},	/* 32 MB */
+	{ }
+};
+
+static struct alauda_card *get_card(u8 id)
+{
+	struct alauda_card *card;
+
+	for (card = alauda_card_ids; card->id; card++)
+		if (card->id == id)
+			return card;
+	return NULL;
+}
+
+static void alauda_delete(struct kref *kref)
+{
+	struct alauda *al = container_of(kref, struct alauda, kref);
+
+	if (al->mtd) {
+		del_mtd_device(al->mtd);
+		kfree(al->mtd);
+	}
+	usb_put_dev(al->dev);
+	kfree(al);
+}
+
+static int alauda_get_media_status(struct alauda *al, void *buf)
+{
+	return usb_control_msg(al->dev, usb_rcvctrlpipe(al->dev, 0),
+			ALAUDA_GET_XD_MEDIA_STATUS, 0xc0, 0, 1, buf, 2, HZ);
+}
+
+static int alauda_ack_media(struct alauda *al)
+{
+	return usb_control_msg(al->dev, usb_sndctrlpipe(al->dev, 0),
+			ALAUDA_ACK_XD_MEDIA_CHANGE, 0x40, 0, 1, NULL, 0, HZ);
+}
+
+static int alauda_get_media_signatures(struct alauda *al, void *buf)
+{
+	return usb_control_msg(al->dev, usb_rcvctrlpipe(al->dev, 0),
+			ALAUDA_GET_XD_MEDIA_SIG, 0xc0, 0, 0, buf, 4, HZ);
+}
+
+static void alauda_reset(struct alauda *al)
+{
+	u8 command[] = {
+		ALAUDA_BULK_CMD, ALAUDA_BULK_RESET_MEDIA, 0, 0,
+		0, 0, 0, 0, al->port
+	};
+	usb_bulk_msg(al->dev, al->bulk_out, command, 9, NULL, HZ);
+}
+
+struct alauda_sg_request {
+	struct urb *urb[3];
+	struct completion comp;
+};
+
+static void alauda_complete(struct urb *urb)
+{
+	struct completion *comp = urb->context;
+
+	if (comp)
+		complete(comp);
+}
+
+#define TIMEOUT HZ
+static int alauda_read_page(struct mtd_info *mtd, loff_t from, void *buf,
+		void *oob)
+{
+	struct alauda_sg_request sg;
+	struct alauda *al = mtd->priv;
+	u32 pba = from >> al->card->blockshift;
+	u32 page = (from >> al->card->pageshift) & al->pagemask;
+	u8 command[] = {
+		ALAUDA_BULK_CMD, ALAUDA_BULK_READ_PAGE, PBA_HI(pba),
+		PBA_ZONE(pba), 0, PBA_LO(pba) + page, 1, 0, al->port
+	};
+	int i, err;
+
+	for (i=0; i<3; i++)
+		sg.urb[i] = NULL;
+
+	err = -ENOMEM;
+	for (i=0; i<3; i++) {
+		sg.urb[i] = usb_alloc_urb(0, GFP_NOIO);
+		if (!sg.urb[i])
+			goto out;
+	}
+	init_completion(&sg.comp);
+	usb_fill_bulk_urb(sg.urb[0], al->dev, al->bulk_out, command, 9,
+			alauda_complete, NULL);
+	usb_fill_bulk_urb(sg.urb[1], al->dev, al->bulk_in, buf, mtd->writesize,
+			alauda_complete, NULL);
+	usb_fill_bulk_urb(sg.urb[2], al->dev, al->bulk_in, oob, 16,
+			alauda_complete, &sg.comp);
+
+	for (i=0; i<3; i++) {
+		err = usb_submit_urb(sg.urb[i], GFP_NOIO);
+		if (err)
+			goto cancel;
+	}
+	if (!wait_for_completion_timeout(&sg.comp, TIMEOUT)) {
+		err = -ETIMEDOUT;
+cancel:
+		for (i=0; i<3; i++) {
+			usb_kill_urb(sg.urb[i]);
+		}
+	}
+
+out:
+	usb_free_urb(sg.urb[0]);
+	usb_free_urb(sg.urb[1]);
+	usb_free_urb(sg.urb[2]);
+	return err;
+}
+
+static int alauda_write_page(struct mtd_info *mtd, loff_t to, void *buf,
+		void *oob)
+{
+	struct alauda_sg_request sg;
+	struct alauda *al = mtd->priv;
+	u32 pba = to >> al->card->blockshift;
+	u32 page = (to >> al->card->pageshift) & al->pagemask;
+	u8 command[] = {
+		ALAUDA_BULK_CMD, ALAUDA_BULK_WRITE_PAGE, PBA_HI(pba),
+		PBA_ZONE(pba), 0, PBA_LO(pba) + page, 32, 0, al->port
+	};
+	int i, err;
+
+	for (i=0; i<3; i++)
+		sg.urb[i] = NULL;
+
+	err = -ENOMEM;
+	for (i=0; i<3; i++) {
+		sg.urb[i] = usb_alloc_urb(0, GFP_NOIO);
+		if (!sg.urb[i])
+			goto out;
+	}
+	init_completion(&sg.comp);
+	usb_fill_bulk_urb(sg.urb[0], al->dev, al->bulk_out, command, 9,
+			alauda_complete, NULL);
+	usb_fill_bulk_urb(sg.urb[1], al->dev, al->write_out, buf,mtd->writesize,
+			alauda_complete, NULL);
+	usb_fill_bulk_urb(sg.urb[2], al->dev, al->write_out, oob, 16,
+			alauda_complete, &sg.comp);
+
+	for (i=0; i<3; i++) {
+		err = usb_submit_urb(sg.urb[i], GFP_NOIO);
+		if (err)
+			goto cancel;
+	}
+	if (!wait_for_completion_timeout(&sg.comp, TIMEOUT)) {
+		err = -ETIMEDOUT;
+cancel:
+		for (i=0; i<3; i++) {
+			usb_kill_urb(sg.urb[i]);
+		}
+	}
+
+out:
+	usb_free_urb(sg.urb[0]);
+	usb_free_urb(sg.urb[1]);
+	usb_free_urb(sg.urb[2]);
+	return err;
+}
+
+static int alauda_read_oob(struct mtd_info *mtd, loff_t from, void *oob)
+{
+	static u8 ignore_buf[512]; /* write only */
+
+	return alauda_read_page(mtd, from, ignore_buf, oob);
+}
+
+static int popcount8(u8 c)
+{
+	int ret = 0;
+
+	for ( ; c; c>>=1)
+		ret += c & 1;
+	return ret;
+}
+
+static int alauda_isbad(struct mtd_info *mtd, loff_t ofs)
+{
+	u8 oob[16];
+	int err;
+
+	err = alauda_read_oob(mtd, ofs, oob);
+	if (err)
+		return err;
+
+	/* A block is marked bad if two or more bits are zero */
+	return popcount8(oob[5]) >= 7 ? 0 : 1;
+}
+
+static void correct_data(void *buf, void *read_ecc,
+		int *corrected, int *uncorrected)
+{
+	u8 calc_ecc[3];
+	int err;
+
+	nand_calculate_ecc(NULL, buf, calc_ecc);
+	err = nand_correct_data(NULL, buf, read_ecc, calc_ecc);
+	if (err) {
+		if (err > 0)
+			(*corrected)++;
+		else
+			(*uncorrected)++;
+	}
+}
+
+static int alauda_bounce_read(struct mtd_info *mtd, loff_t from, size_t len,
+		size_t *retlen, u_char *buf)
+{
+	struct alauda *al = mtd->priv;
+	void *bounce_buf;
+	int err, corrected=0, uncorrected=0;
+
+	bounce_buf = kmalloc(mtd->writesize, GFP_KERNEL);
+	if (!bounce_buf)
+		return -ENOMEM;
+
+	*retlen = len;
+	while (len) {
+		u8 oob[16];
+		u32 byte = from & al->bytemask;
+		size_t cplen = min(len, mtd->writesize - byte);
+
+		err = alauda_read_page(mtd, from, bounce_buf, oob);
+		if (err)
+			goto out;
+
+		correct_data(bounce_buf, oob+13, &corrected, &uncorrected);
+		correct_data(bounce_buf+256, oob+8, &corrected, &uncorrected);
+
+		memcpy(buf, bounce_buf + byte, cplen);
+		buf += cplen;
+		from += cplen;
+		len -= cplen;
+	}
+	err = 0;
+	if (corrected)
+		err = -EUCLEAN;
+	if (uncorrected)
+		err = -EBADMSG;
+out:
+	kfree(bounce_buf);
+	return err;
+}
+
+static int alauda_read(struct mtd_info *mtd, loff_t from, size_t len,
+		size_t *retlen, u_char *buf)
+{
+	struct alauda *al = mtd->priv;
+	int err, corrected=0, uncorrected=0;
+
+	if ((from & al->bytemask) || (len & al->bytemask))
+		return alauda_bounce_read(mtd, from, len, retlen, buf);
+
+	*retlen = len;
+	while (len) {
+		u8 oob[16];
+
+		err = alauda_read_page(mtd, from, buf, oob);
+		if (err)
+			return err;
+
+		correct_data(buf, oob+13, &corrected, &uncorrected);
+		correct_data(buf+256, oob+8, &corrected, &uncorrected);
+
+		buf += mtd->writesize;
+		from += mtd->writesize;
+		len -= mtd->writesize;
+	}
+	err = 0;
+	if (corrected)
+		err = -EUCLEAN;
+	if (uncorrected)
+		err = -EBADMSG;
+	return err;
+}
+
+static int alauda_write(struct mtd_info *mtd, loff_t to, size_t len,
+		size_t *retlen, const u_char *buf)
+{
+	struct alauda *al = mtd->priv;
+	int err;
+
+	if ((to & al->bytemask) || (len & al->bytemask))
+		return -EINVAL;
+
+	*retlen = len;
+	while (len) {
+		u32 page = (to >> al->card->pageshift) & al->pagemask;
+		u8 oob[16] = {	'h', 'e', 'l', 'l', 'o', 0xff, 0xff, 0xff,
+				0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
+
+		/* don't write to bad blocks */
+		if (page == 0) {
+			err = alauda_isbad(mtd, to);
+			if (err) {
+				return -EIO;
+			}
+		}
+		nand_calculate_ecc(mtd, buf, &oob[13]);
+		nand_calculate_ecc(mtd, buf+256, &oob[8]);
+
+		err = alauda_write_page(mtd, to, (void*)buf, oob);
+		if (err)
+			return err;
+
+		buf += mtd->writesize;
+		to += mtd->writesize;
+		len -= mtd->writesize;
+	}
+	return 0;
+}
+
+static int __alauda_erase(struct mtd_info *mtd, struct erase_info *instr)
+{
+	struct alauda *al = mtd->priv;
+	u32 ofs = instr->addr;
+	u32 len = instr->len;
+	int err;
+
+	if ((ofs & al->blockmask) || (len & al->blockmask))
+		return -EINVAL;
+
+	while (len) {
+		u32 pba = ofs >> al->card->blockshift;
+		u8 command[] = {
+			ALAUDA_BULK_CMD, ALAUDA_BULK_ERASE_BLOCK, PBA_HI(pba),
+			PBA_ZONE(pba), 0, PBA_LO(pba), 0x02, 0, al->port
+		};
+		u8 buf[2];
+
+		/* don't erase bad blocks */
+		err = alauda_isbad(mtd, ofs);
+		if (err > 0)
+			err = -EIO;
+		if (err < 0)
+			return err;
+
+		err = usb_bulk_msg(al->dev, al->bulk_out, command, 9, NULL, HZ);
+		if (err < 0)
+			return err;
+
+		err = usb_bulk_msg(al->dev, al->bulk_in, buf, 2, NULL, 5*HZ);
+		if (err < 0)
+			return err;
+
+		ofs += mtd->erasesize;
+		len -= mtd->erasesize;
+	}
+	return 0;
+}
+
+static int alauda_erase(struct mtd_info *mtd, struct erase_info *instr)
+{
+	int err;
+
+	err = __alauda_erase(mtd, instr);
+	instr->state = err ? MTD_ERASE_FAILED : MTD_ERASE_DONE;
+	mtd_erase_callback(instr);
+	return err;
+}
+
+static int alauda_init_media(struct alauda *al)
+{
+	u8 buf[4], *b0=buf, *b1=buf+1;
+	struct alauda_card *card;
+	struct mtd_info *mtd;
+	int err;
+
+	mtd = kzalloc(sizeof(*mtd), GFP_KERNEL);
+	if (!mtd)
+		return -ENOMEM;
+
+	for (;;) {
+		err = alauda_get_media_status(al, buf);
+		if (err < 0)
+			goto error;
+		if (*b0 & 0x10)
+			break;
+		msleep(20);
+	}
+
+	err = alauda_ack_media(al);
+	if (err)
+		goto error;
+
+	msleep(10);
+
+	err = alauda_get_media_status(al, buf);
+	if (err < 0)
+		goto error;
+
+	if (*b0 != 0x14) {
+		/* media not ready */
+		err = -EIO;
+		goto error;
+	}
+	err = alauda_get_media_signatures(al, buf);
+	if (err < 0)
+		goto error;
+
+	card = get_card(*b1);
+	if (!card) {
+		printk(KERN_ERR"Alauda: unknown card id %02x\n", *b1);
+		err = -EIO;
+		goto error;
+	}
+	printk(KERN_INFO"pagesize=%x\nerasesize=%x\nsize=%xMiB\n",
+			1<<card->pageshift, 1<<card->blockshift,
+			1<<(card->chipshift-20));
+	al->card = card;
+	al->pagemask = (1 << (card->blockshift - card->pageshift)) - 1;
+	al->bytemask = (1 << card->pageshift) - 1;
+	al->blockmask = (1 << card->blockshift) - 1;
+
+	mtd->name = "alauda";
+	mtd->size = 1<<card->chipshift;
+	mtd->erasesize = 1<<card->blockshift;
+	mtd->writesize = 1<<card->pageshift;
+	mtd->type = MTD_NANDFLASH;
+	mtd->flags = MTD_CAP_NANDFLASH;
+	mtd->read = alauda_read;
+	mtd->write = alauda_write;
+	mtd->erase = alauda_erase;
+	mtd->block_isbad = alauda_isbad;
+	mtd->priv = al;
+	mtd->owner = THIS_MODULE;
+
+	err = add_mtd_device(mtd);
+	if (err) {
+		err = -ENFILE;
+		goto error;
+	}
+
+	al->mtd = mtd;
+	alauda_reset(al); /* no clue whether this is necessary */
+	return 0;
+error:
+	kfree(mtd);
+	return err;
+}
+
+static int alauda_check_media(struct alauda *al)
+{
+	u8 buf[2], *b0 = buf, *b1 = buf+1;
+	int err;
+
+	err = alauda_get_media_status(al, buf);
+	if (err < 0)
+		return err;
+
+	if ((*b1 & 0x01) == 0) {
+		/* door open */
+		return -EIO;
+	}
+	if ((*b0 & 0x80) || ((*b0 & 0x1F) == 0x10)) {
+		/* no media ? */
+		return -EIO;
+	}
+	if (*b0 & 0x08) {
+		/* media change ? */
+		return alauda_init_media(al);
+	}
+	return 0;
+}
+
+static int alauda_probe(struct usb_interface *interface,
+		const struct usb_device_id *id)
+{
+	struct alauda *al;
+	struct usb_host_interface *iface;
+	struct usb_endpoint_descriptor *ep,
+			*ep_in=NULL, *ep_out=NULL, *ep_wr=NULL;
+	int i, err = -ENOMEM;
+
+	al = kzalloc(2*sizeof(*al), GFP_KERNEL);
+	if (!al)
+		goto error;
+
+	kref_init(&al->kref);
+	usb_set_intfdata(interface, al);
+
+	al->dev = usb_get_dev(interface_to_usbdev(interface));
+	al->interface = interface;
+
+	iface = interface->cur_altsetting;
+	for (i = 0; i < iface->desc.bNumEndpoints; ++i) {
+		ep = &iface->endpoint[i].desc;
+
+		if (usb_endpoint_is_bulk_in(ep)) {
+			ep_in = ep;
+		} else if (usb_endpoint_is_bulk_out(ep)) {
+			if (i==0)
+				ep_wr = ep;
+			else
+				ep_out = ep;
+		}
+	}
+	err = -EIO;
+	if (!ep_wr || !ep_in || !ep_out)
+		goto error;
+
+	al->write_out = usb_sndbulkpipe(al->dev,
+			ep_wr->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK);
+	al->bulk_in = usb_rcvbulkpipe(al->dev,
+			ep_in->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK);
+	al->bulk_out = usb_sndbulkpipe(al->dev,
+			ep_out->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK);
+
+	/* second device is identical up to now */
+	memcpy(al+1, al, sizeof(*al));
+
+	al[0].port = ALAUDA_PORT_XD;
+	al[1].port = ALAUDA_PORT_SM;
+
+	info("alauda probed");
+	alauda_check_media(al);
+	alauda_check_media(al+1);
+
+	return 0;
+
+error:
+	if (al)
+		kref_put(&al->kref, alauda_delete);
+	return err;
+}
+
+static void alauda_disconnect(struct usb_interface *interface)
+{
+	struct alauda *al;
+
+	al = usb_get_intfdata(interface);
+	usb_set_intfdata(interface, NULL);
+
+	/* FIXME: prevent more I/O from starting */
+
+	/* decrement our usage count */
+	if (al)
+		kref_put(&al->kref, alauda_delete);
+
+	info("alauda gone");
+}
+
+static struct usb_driver alauda_driver = {
+	.name =		"alauda",
+	.probe =	alauda_probe,
+	.disconnect =	alauda_disconnect,
+	.id_table =	alauda_table,
+};
+
+static int __init alauda_init(void)
+{
+	return usb_register(&alauda_driver);
+}
+
+static void __exit alauda_exit(void)
+{
+	usb_deregister(&alauda_driver);
+}
+
+module_init(alauda_init);
+module_exit(alauda_exit);
+
+MODULE_LICENSE("GPL");
--- linux-2.6.21cow/drivers/mtd/nand/Kconfig~alauda_mtd	2007-05-07 13:23:29.000000000 +0200
+++ linux-2.6.21cow/drivers/mtd/nand/Kconfig	2007-07-11 18:33:47.000000000 +0200
@@ -259,4 +259,11 @@ config MTD_NAND_NANDSIM
 	  The simulator may simulate various NAND flash chips for the
 	  MTD nand layer.
 
+config MTD_ALAUDA
+	tristate "MTD driver for Olympus MAUSB-10 and Fijufilm DPC-R1"
+	depends on MTD_NAND && USB
+	help
+	  These two (and possibly other) Alauda-based cardreaders for
+	  SmartMedia and xD allow raw flash access.
+
 endmenu
--- linux-2.6.21cow/drivers/mtd/nand/Makefile~alauda_mtd	2007-05-07 13:23:29.000000000 +0200
+++ linux-2.6.21cow/drivers/mtd/nand/Makefile	2007-07-11 18:34:06.000000000 +0200
@@ -25,6 +25,7 @@ obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x
 obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
 obj-$(CONFIG_MTD_NAND_AT91)		+= at91_nand.o
 obj-$(CONFIG_MTD_NAND_BASLER_EXCITE)	+= excite_nandflash.o
+obj-$(CONFIG_MTD_ALAUDA)		+= alauda.o
 
 nand-objs := nand_base.o nand_bbt.o
 cafe_nand-objs := cafe.o cafe_ecc.o
