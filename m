Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I81uB-0003zQ-7u
	for linux-mtd@lists.infradead.org; Mon, 09 Jul 2007 18:40:34 -0400
Date: Tue, 10 Jul 2007 00:37:04 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD driver for alauda chips
Message-ID: <20070709223704.GC18501@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: Arnd Bergmann <arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here's a bone for people wanting raw flash access from their notebook.
The Alauda-based SmartMedia and xD cardreaders are real dumb and leave
all hard work to the device driver.  Alternatively the device driver can
play dumb as well and present raw flash access, as shown below.

In its current state the driver can read, write and erase all in-band
data.  It completely ignores OOB data, does not generate ECC or attempt
error correction.

People wanting to test this driver can buy a Olympus MAUSB-10 or a Fuji
DPC-R1 from ebay for about five bucks plus some xD cards.

One day this should probably be turned into a decent NAND driver.  The
current state is just the bare minimum I need to get an easy-to-use test
device.  Feel free to keep hacking.

Jörn

-- 
Everything should be made as simple as possible, but not simpler.
-- Albert Einstein

--- /dev/null	2007-07-09 15:54:23.610902586 +0200
+++ linux-2.6.21cow/drivers/mtd/devices/alauda.c	2007-07-09 23:57:26.000000000 +0200
@@ -0,0 +1,474 @@
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
+
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/kref.h>
+#include <asm/uaccess.h>
+#include <linux/usb.h>
+#include <linux/mutex.h>
+#include <linux/mtd/mtd.h>
+
+/* Control commands */
+#define ALAUDA_GET_XD_MEDIA_STATUS	0x08
+#define ALAUDA_ACK_XD_MEDIA_CHANGE	0x0a
+#define ALAUDA_GET_XD_MEDIA_SIG		0x86
+
+/* Common prefix */
+#define ALAUDA_BULK_CMD			0x40
+
+/* We only care about xD port */
+#define ALAUDA_PORT_XD			0x00
+
+/* Bulk commands */
+#define ALAUDA_BULK_READ_PAGE		0x84
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
+	{ USB_DEVICE(0x0584, 0x0008) },
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
+	struct kref		kref;
+};
+
+static struct usb_driver alauda_driver;
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
+		0, 0, 0, 0, ALAUDA_PORT_XD
+	};
+	usb_bulk_msg(al->dev, al->bulk_out, command, 9, NULL, HZ);
+}
+
+static int alauda_read(struct mtd_info *mtd, loff_t from, size_t len,
+		size_t *retlen, u_char *buf)
+{
+	struct alauda *al = mtd->priv;
+	void *bounce_buf;
+	int err;
+
+	bounce_buf = kmalloc(mtd->writesize + 64, GFP_KERNEL);
+	if (!bounce_buf)
+		return -ENOMEM;
+
+	*retlen = len;
+	while (len) {
+		u32 pba = from >> al->card->blockshift;
+		u32 page = (from >> al->card->pageshift) & al->pagemask;
+		u32 byte = from & al->bytemask;
+		size_t cplen;
+		/* FIXME: test whether ALAUDA_BULK_READ_PAGE is faster */
+		u8 command[] = {
+			ALAUDA_BULK_CMD, ALAUDA_BULK_READ_BLOCK, PBA_HI(pba),
+			PBA_ZONE(pba), 0, PBA_LO(pba) + page, 1, 0,
+			ALAUDA_PORT_XD
+		};
+
+		err = usb_bulk_msg(al->dev, al->bulk_out, command, 9, NULL, HZ);
+		if (err < 0)
+			goto out;
+
+		err = usb_bulk_msg(al->dev, al->bulk_in, bounce_buf,
+				mtd->writesize + 64, NULL, HZ);
+		if (err < 0)
+			goto out;
+		cplen = min(len, mtd->writesize - byte);
+		memcpy(buf, bounce_buf + byte, cplen);
+		buf += cplen;
+		from += cplen;
+		len -= cplen;
+	}
+	err = 0;
+out:
+	kfree(bounce_buf);
+	return err;
+}
+
+static int alauda_write(struct mtd_info *mtd, loff_t to, size_t len,
+		size_t *retlen, const u_char *buf)
+{
+	struct alauda *al = mtd->priv;
+	void *bounce_buf;
+	int err;
+
+	bounce_buf = kmalloc(mtd->writesize + 64, GFP_KERNEL);
+	if (!bounce_buf)
+		return -ENOMEM;
+
+	if ((to & al->bytemask) || (len & al->bytemask))
+		return -EINVAL;
+
+	*retlen = len;
+	while (len) {
+		u32 pba = to >> al->card->blockshift;
+		u32 page = (to >> al->card->pageshift) & al->pagemask;
+		u8 command[] = {
+			ALAUDA_BULK_CMD, ALAUDA_BULK_WRITE_PAGE, PBA_HI(pba),
+			PBA_ZONE(pba), 0, PBA_LO(pba) + page, 32, 0,
+			ALAUDA_PORT_XD,
+		};
+
+		/* FIXME: add ECC and other OOB stuff */
+		memcpy(bounce_buf, buf, mtd->writesize);
+		err = usb_bulk_msg(al->dev, al->bulk_out, command, 9, NULL, HZ);
+		if (err < 0)
+			goto out;
+		err = usb_bulk_msg(al->dev, al->write_out, bounce_buf,
+				mtd->writesize + 64, NULL, HZ);
+		if (err < 0)
+			goto out;
+		buf += mtd->writesize;
+		to += mtd->writesize;
+		len -= mtd->writesize;
+	}
+	err = 0;
+out:
+	kfree(bounce_buf);
+	return err;
+}
+
+static int alauda_erase(struct mtd_info *mtd, struct erase_info *instr)
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
+			PBA_ZONE(pba), 0, PBA_LO(pba), 0x02, 0, ALAUDA_PORT_XD
+		};
+		u8 buf[2];
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
+
+	instr->state = MTD_ERASE_DONE;
+	mtd_erase_callback(instr);
+	return 0;
+}
+
+static int alauda_isbad(struct mtd_info *mtd, loff_t ofs)
+{
+	return 0;
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
+	printk("pagesize=%x\nerasesize=%x\nsize=%xMiB\n", 1<<card->pageshift,
+			1<<card->blockshift, 1<<(card->chipshift-20));
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
+	al = kzalloc(sizeof(*al), GFP_KERNEL);
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
+	info("alauda probed");
+	alauda_check_media(al);
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
--- linux-2.6.21cow/drivers/mtd/devices/Kconfig~alauda_mtd	2007-05-07 13:23:29.000000000 +0200
+++ linux-2.6.21cow/drivers/mtd/devices/Kconfig	2007-07-06 15:42:15.000000000 +0200
@@ -146,6 +146,10 @@ config MTD_BLOCK2MTD
 	  Testing MTD users (eg JFFS2) on large media and media that might
 	  be removed during a write (using the floppy drive).
 
+config MTD_ALAUDA
+	tristate "MTD driver for Alauda chips"
+	depends on MTD && USB
+
 comment "Disk-On-Chip Device Drivers"
 
 config MTD_DOC2000
--- linux-2.6.21cow/drivers/mtd/devices/Makefile~alauda_mtd	2007-05-07 13:23:29.000000000 +0200
+++ linux-2.6.21cow/drivers/mtd/devices/Makefile	2007-07-06 15:43:03.000000000 +0200
@@ -15,5 +15,6 @@ obj-$(CONFIG_MTD_MS02NV)	+= ms02-nv.o
 obj-$(CONFIG_MTD_MTDRAM)	+= mtdram.o
 obj-$(CONFIG_MTD_LART)		+= lart.o
 obj-$(CONFIG_MTD_BLOCK2MTD)	+= block2mtd.o
+obj-$(CONFIG_MTD_ALAUDA)	+= alauda.o
 obj-$(CONFIG_MTD_DATAFLASH)	+= mtd_dataflash.o
 obj-$(CONFIG_MTD_M25P80)	+= m25p80.o
