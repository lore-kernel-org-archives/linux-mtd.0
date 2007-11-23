Received: from rv-out-0910.google.com ([209.85.198.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IvZcm-0001IJ-NQ
	for linux-mtd@lists.infradead.org; Fri, 23 Nov 2007 09:35:28 -0500
Received: by rv-out-0910.google.com with SMTP id c24so2724406rvf
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Nov 2007 06:35:17 -0800 (PST)
Message-ID: <305035a40711230635j6e9b2082l2d610040256b9088@mail.gmail.com>
Date: Fri, 23 Nov 2007 15:35:17 +0100
From: "Gregory CLEMENT" <gclement00@gmail.com>
To: "Vitaly Wool" <vitalywool@gmail.com>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
In-Reply-To: <acd2a5930711210956p5fe8e4dbx271d4e821c4fa9e6@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
	<305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
	<20071121105817.3adbfbb5@weaponx>
	<20071121171501.GE20871@lazybastard.org>
	<acd2a5930711210943o2d0ff33an60f8dbf0c706088d@mail.gmail.com>
	<20071121174541.GF20871@lazybastard.org>
	<acd2a5930711210956p5fe8e4dbx271d4e821c4fa9e6@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2007/11/21, Vitaly Wool <vitalywool@gmail.com>:
> On Nov 21, 2007 8:45 PM, J=F6rn Engel <joern@logfs.org> wrote:
> > > Because we were explicitly directed by David to do so.
> >
> > And David has gone fishing.  Did he tell you why?
>
> He didn't want to add confusion, that's what he said. He directed us
> to make it a separate translation layer an have a separate device
> major (which we did get BTW :) ).
>
> If there's no objections, I can rediff/repost against the current MTD
> git. I'll also add some comments about the limitations of this
> approach (still it's viable enough within a real environment if
> there's an application which just reads the whole partition say once
> in a week and rewrites it as soon as it detects bit error corrections;
> that's what we did for emo BTW).

 As it seems that there is no objections on it, can you push the patch in m=
td ?
I have to made some change to apply the patch on 2.6.23 kernel, if ti
can help you, I join the new patch.
I test it on my board it seems working pretty well.

But I have a question, why mtdblock and romblock were mutually
exclusive? I guess it is to avoid the same mtd partition mounted both
time. Can't we deal with this case?

Index: drivers/mtd/Kconfig
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- drivers/mtd/Kconfig=09
+++ drivers/mtd/Kconfig
@@ -200,6 +200,13 @@
 =09  You do not need this option for use with the DiskOnChip devices. For
 =09  those, enable NFTL support (CONFIG_NFTL) instead.

+config MTD_BLOCK_ROMBLOCK
+       tristate "Readonly Block Device Layer Over MTD"
+       depends on MTD
+       help
+         Same as readonly block driver, but this allow you to mount
read-only file
+         systems from an MTD device, containing bad blocks.
+
 config FTL
 =09tristate "FTL (Flash Translation Layer) support"
 =09depends on BLOCK
Index: drivers/mtd/romblock.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- drivers/mtd/romblock.c
+++ drivers/mtd/romblock.c
@@ -0,0 +1,164 @@
+/*
+ *  Readonly Block Device Layer Over MTD
+ *
+ *  (C) 2006 Baydarov Konstantin <kbaidarov@dev.rtsoft.ru>
+ *           Pantelis Antoniou <panto@intracom.gr>
+ *           David Woodhouse <dwmw2@infradead.org>
+ *
+ *  It allows to use any filesystem on this device in
+ *  RO mode and thus gain faster mount times and better
+ *  throughput rates.
+ *
+ */
+
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/blktrans.h>
+
+struct romblock_map {
+       struct mtd_blktrans_dev dev;
+       /* block map for RO */
+       int32_t *block_map;
+       int32_t block_top;
+       int32_t block_scantop;
+};
+
+static loff_t map_over_bad_blocks(struct mtd_blktrans_dev* dev, loff_t fro=
m)
+{
+       int i, block;
+       struct mtd_info *mtd =3D dev->mtd;
+       struct romblock_map* dev_cont =3D container_of(dev, struct
romblock_map, dev);
+       int32_t *block_map =3D dev_cont->block_map;
+       int32_t block_top =3D dev_cont->block_top;
+       int32_t block_scantop =3D dev_cont->block_scantop;
+
+       /* if no bad block checking is possible bail out */
+       if (mtd->block_isbad =3D=3D NULL)
+               return from;
+
+       /* first time in */
+       if (block_map =3D=3D NULL) {
+               block_top =3D mtd->size / mtd->erasesize;
+
+               block_map =3D kmalloc(sizeof(*block_map) * block_top, GFP_K=
ERNEL);
+               if (block_map =3D=3D NULL) {
+                       printk (KERN_ERR "map_over_bad_blocks():
unable to allocate block map\n");
+                       return -ENOMEM;
+               }
+               for (i =3D 0; i < block_top; i++)
+                       block_map[i] =3D -1;
+
+               for (i =3D 0; i < block_top; i++)
+                       if ((*mtd->block_isbad)(mtd, i * mtd->erasesize) =
=3D=3D 0)
+                               break;
+
+               if (i >=3D block_top) {
+                       printk (KERN_WARNING "map_over_bad_blocks():
all blocks bad!\n");
+                       return -EIO;
+               }
+               block_scantop =3D 0;
+               block_map[0] =3D i;
+
+               DEBUG(MTD_DEBUG_LEVEL0, "mtd: map %d -> %d\n",
block_scantop, block_map[block_scantop]);
+       }
+
+       block =3D ((int)from / mtd->erasesize);
+       if (block >=3D block_top)
+               return (loff_t)-1;
+
+       /* scan for bad block up to where we want */
+       while (block >=3D block_scantop) {
+               /* find a non bad block */
+               for (i =3D block_map[block_scantop] + 1; i < block_top; i++=
)
+                       if ((*mtd->block_isbad)(mtd, i * mtd->erasesize) =
=3D=3D 0)
+                               break;
+
+               /* exhausted ? */
+               if (i >=3D block_top) {
+                       printk (KERN_WARNING "map_over_bad_blocks():
no more good blocks!\n");
+                       return (loff_t)-1;
+               }
+
+               block_map[++block_scantop] =3D i;
+               DEBUG(MTD_DEBUG_LEVEL0, "mtd: map %d -> %d\n",
block_scantop, block_map[block_scantop]);
+       }
+
+       block =3D block_map[(int)from / mtd->erasesize];
+       from =3D (block * mtd->erasesize) | ((int)from & (mtd->erasesize - =
1));
+       return from;
+}
+
+static int romblock_readsect(struct mtd_blktrans_dev *dev,
+                             unsigned long block, char *buf)
+{
+       size_t retlen;
+       unsigned long from;
+
+       from =3D map_over_bad_blocks(dev, block<<9);
+
+       if (dev->mtd->read(dev->mtd, from, 512, &retlen, buf))
+               return 1;
+       return 0;
+}
+
+static int romblock_writesect(struct mtd_blktrans_dev *dev,
+                             unsigned long block, char *buf)
+{
+       size_t retlen;
+
+       if (dev->mtd->write(dev->mtd, (block * 512), 512, &retlen, buf))
+               return 1;
+       return 0;
+}
+
+static void romblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info =
*mtd)
+{
+       struct romblock_map *dev_cont =3D kzalloc(sizeof(*dev_cont), GFP_KE=
RNEL);
+
+       if (!dev_cont)
+               return;
+
+       dev_cont->dev.mtd =3D mtd;
+       dev_cont->dev.devnum =3D mtd->index;
+       dev_cont->dev.size =3D mtd->size >> 9;
+       dev_cont->dev.tr =3D tr;
+       dev_cont->dev.readonly =3D 1;
+
+       add_mtd_blktrans_dev(&(dev_cont->dev));
+}
+
+static void romblock_remove_dev(struct mtd_blktrans_dev *dev)
+{
+       del_mtd_blktrans_dev(dev);
+       kfree(dev);
+}
+
+static struct mtd_blktrans_ops romblock_tr =3D {
+       .name           =3D "romblock",
+       .major          =3D 258,
+       .part_bits      =3D 0,
+       .blksize =09=3D 512,
+       .readsect       =3D romblock_readsect,
+       .writesect      =3D romblock_writesect,
+       .add_mtd        =3D romblock_add_mtd,
+       .remove_dev     =3D romblock_remove_dev,
+       .owner          =3D THIS_MODULE,
+};
+
+static int __init romblock_init(void)
+{
+       return register_mtd_blktrans(&romblock_tr);
+}
+
+static void __exit romblock_exit(void)
+{
+       deregister_mtd_blktrans(&romblock_tr);
+}
+
+module_init(romblock_init);
+module_exit(romblock_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Baydarov Konstantin <kbaidarov@dev.rtsoft.ru>");
+MODULE_DESCRIPTION("Readonly Block Device Layer Over MTD");
Index: drivers/mtd/Makefile
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- drivers/mtd/Makefile
+++ drivers/mtd/Makefile
@@ -17,6 +17,7 @@
 obj-$(CONFIG_MTD_BLKDEVS)=09+=3D mtd_blkdevs.o
 obj-$(CONFIG_MTD_BLOCK)=09=09+=3D mtdblock.o
 obj-$(CONFIG_MTD_BLOCK_RO)=09+=3D mtdblock_ro.o
+obj-$(CONFIG_MTD_BLOCK_ROMBLOCK)       +=3D romblock.o mtd_blkdevs.o
 obj-$(CONFIG_FTL)=09=09+=3D ftl.o
 obj-$(CONFIG_NFTL)=09=09+=3D nftl.o
 obj-$(CONFIG_INFTL)=09=09+=3D inftl.o


--=20
Gregory CLEMENT
Adeneo
Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=E9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41

www.adetelgroup.com
