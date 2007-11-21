Received: from wx-out-0506.google.com ([66.249.82.228])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IuqXy-0003hN-57
	for linux-mtd@lists.infradead.org; Wed, 21 Nov 2007 09:27:28 -0500
Received: by wx-out-0506.google.com with SMTP id s7so772351wxc
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Nov 2007 06:27:20 -0800 (PST)
Message-ID: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
Date: Wed, 21 Nov 2007 15:27:19 +0100
From: "Gregory CLEMENT" <gclement00@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Cc: Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I come back with my question because it seems that last time I sent
this mail mtd mailing list was done during few weeks, so maybe  this
mail was lost.



2007/9/27, Gregory CLEMENT <gclement00@gmail.com>:
> Hi,
> this drivers seems pretty good and easily reviewable, so why it hadn't
> been included in mtd tree ?
>
> After some search I had not find any news on this patch, but maybe I
> missed something.
>
>
> 2006/12/2, Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>:
> > On Wed, 22 Nov 2006 19:56:33 +0300
> > Konstantin Baydarov <kbaidarov@dev.rtsoft.ru> wrote:
> > >
> > > Corrected typo, renamed driver, got rid from redundant dependency.
> > > Also I've tested mtdblock_ro_bbfree as module - ok.
> >
> > Renamed driver to 'romblock'. Every entry of 'mtdblock' was replaced.
> > Debug level in DEBUG macros was replaced by corresponding macros.
> >
> >  drivers/mtd/Kconfig    |    7 ++
> >  drivers/mtd/Makefile   |    1
> >  drivers/mtd/romblock.c |  165 ++++++++++++++++++++++++++++++++++++++++=
+++++++++
> >  3 files changed, 173 insertions(+)
> >
> > Index: mtd-2.6/drivers/mtd/romblock.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- /dev/null
> > +++ mtd-2.6/drivers/mtd/romblock.c
> > @@ -0,0 +1,165 @@
> > +/*
> > + *  Readonly Block Device Layer Over MTD
> > + *
> > + *  (C) 2006 Baydarov Konstantin <kbaidarov@dev.rtsoft.ru>
> > + *           Pantelis Antoniou <panto@intracom.gr>
> > + *           David Woodhouse <dwmw2@infradead.org>
> > + *
> > + *  It allows to use any filesystem on this device in
> > + *  RO mode and thus gain faster mount times and better
> > + *  throughput rates.
> > + *
> > + */
> > +
> > +#include <linux/init.h>
> > +#include <linux/slab.h>
> > +#include <linux/mtd/mtd.h>
> > +#include <linux/mtd/blktrans.h>
> > +
> > +struct romblock_map {
> > +       struct mtd_blktrans_dev dev;
> > +       /* block map for RO */
> > +       int32_t *block_map;
> > +       int32_t block_top;
> > +       int32_t block_scantop;
> > +};
> > +
> > +static loff_t map_over_bad_blocks(struct mtd_blktrans_dev* dev, loff_t=
 from)
> > +{
> > +       int i, block;
> > +       struct mtd_info *mtd =3D dev->mtd;
> > +       struct romblock_map* dev_cont =3D container_of(dev, struct romb=
lock_map, dev);
> > +       int32_t *block_map =3D dev_cont->block_map;
> > +       int32_t block_top =3D dev_cont->block_top;
> > +       int32_t block_scantop =3D dev_cont->block_scantop;
> > +
> > +       /* if no bad block checking is possible bail out */
> > +       if (mtd->block_isbad =3D=3D NULL)
> > +               return from;
> > +
> > +       /* first time in */
> > +       if (block_map =3D=3D NULL) {
> > +               block_top =3D mtd->size / mtd->erasesize;
> > +               block_map =3D kmalloc(sizeof(*block_map) * block_top, G=
FP_KERNEL);
> > +               if (block_map =3D=3D NULL) {
> > +                       printk (KERN_ERR "map_over_bad_blocks(): unable=
 to allocate block map\n");
> > +                       return -ENOMEM;
> > +               }
> > +               for (i =3D 0; i < block_top; i++)
> > +                       block_map[i] =3D -1;
> > +
> > +               for (i =3D 0; i < block_top; i++)
> > +                       if ((*mtd->block_isbad)(mtd, i * mtd->erasesize=
) =3D=3D 0)
> > +                               break;
> > +
> > +               if (i >=3D block_top) {
> > +                       printk (KERN_WARNING "map_over_bad_blocks(): al=
l blocks bad!\n");
> > +                       return -EIO;
> > +               }
> > +               block_scantop =3D 0;
> > +               block_map[0] =3D i;
> > +
> > +               DEBUG(MTD_DEBUG_LEVEL0, "mtd: map %d -> %d\n", block_sc=
antop, block_map[block_scantop]);
> > +       }
> > +
> > +       block =3D ((int)from / mtd->erasesize);
> > +       if (block >=3D block_top)
> > +               return (loff_t)-1;
> > +
> > +       /* scan for bad block up to where we want */
> > +       while (block >=3D block_scantop) {
> > +               /* find a non bad block */
> > +               for (i =3D block_map[block_scantop] + 1; i < block_top;=
 i++)
> > +                       if ((*mtd->block_isbad)(mtd, i * mtd->erasesize=
) =3D=3D 0)
> > +                               break;
> > +
> > +               /* exhausted ? */
> > +               if (i >=3D block_top) {
> > +                       printk (KERN_WARNING "map_over_bad_blocks(): no=
 more good blocks!\n");
> > +                       return (loff_t)-1;
> > +               }
> > +
> > +               block_map[++block_scantop] =3D i;
> > +               DEBUG(MTD_DEBUG_LEVEL0, "mtd: map %d -> %d\n", block_sc=
antop, block_map[block_scantop]);
> > +       }
> > +
> > +       block =3D block_map[(int)from / mtd->erasesize];
> > +       from =3D (block * mtd->erasesize) | ((int)from & (mtd->erasesiz=
e - 1));
> > +       return from;
> > +}
> > +
> > +static int romblock_readsect(struct mtd_blktrans_dev *dev,
> > +                             unsigned long block, char *buf)
> > +{
> > +       size_t retlen;
> > +       unsigned long from;
> > +
> > +       from =3D map_over_bad_blocks(dev, block<<9);
> > +
> > +       if (dev->mtd->read(dev->mtd, from, 512, &retlen, buf))
> > +               return 1;
> > +       return 0;
> > +}
> > +
> > +static int romblock_writesect(struct mtd_blktrans_dev *dev,
> > +                             unsigned long block, char *buf)
> > +{
> > +       size_t retlen;
> > +
> > +       if (dev->mtd->write(dev->mtd, (block * 512), 512, &retlen, buf)=
)
> > +               return 1;
> > +       return 0;
> > +}
> > +
> > +static void romblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_i=
nfo *mtd)
> > +{
> > +       struct romblock_map *dev_cont =3D kmalloc(sizeof(*dev_cont), GF=
P_KERNEL);
> > +
> > +       if (!dev_cont)
> > +               return;
> > +
> > +       memset(dev_cont, 0, sizeof(*dev_cont));
> > +
> > +       dev_cont->dev.mtd =3D mtd;
> > +       dev_cont->dev.devnum =3D mtd->index;
> > +       dev_cont->dev.blksize =3D 512;
> > +       dev_cont->dev.size =3D mtd->size >> 9;
> > +       dev_cont->dev.tr =3D tr;
> > +       dev_cont->dev.readonly =3D 1;
> > +
> > +       add_mtd_blktrans_dev(&(dev_cont->dev));
> > +}
> > +
> > +static void romblock_remove_dev(struct mtd_blktrans_dev *dev)
> > +{
> > +       del_mtd_blktrans_dev(dev);
> > +       kfree(dev);
> > +}
> > +
> > +static struct mtd_blktrans_ops romblock_tr =3D {
> > +       .name           =3D "romblock",
> > +       .major          =3D 258,
> > +       .part_bits      =3D 0,
> > +       .readsect       =3D romblock_readsect,
> > +       .writesect      =3D romblock_writesect,
> > +       .add_mtd        =3D romblock_add_mtd,
> > +       .remove_dev     =3D romblock_remove_dev,
> > +       .owner          =3D THIS_MODULE,
> > +};
> > +
> > +static int __init romblock_init(void)
> > +{
> > +       return register_mtd_blktrans(&romblock_tr);
> > +}
> > +
> > +static void __exit romblock_exit(void)
> > +{
> > +       deregister_mtd_blktrans(&romblock_tr);
> > +}
> > +
> > +module_init(romblock_init);
> > +module_exit(romblock_exit);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Baydarov Konstantin <kbaidarov@dev.rtsoft.ru>");
> > +MODULE_DESCRIPTION("Readonly Block Device Layer Over MTD");
> > Index: mtd-2.6/drivers/mtd/Makefile
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- mtd-2.6.orig/drivers/mtd/Makefile
> > +++ mtd-2.6/drivers/mtd/Makefile
> > @@ -17,6 +17,7 @@ obj-$(CONFIG_MTD_AFS_PARTS)   +=3D afs.o
> >  obj-$(CONFIG_MTD_CHAR)         +=3D mtdchar.o
> >  obj-$(CONFIG_MTD_BLOCK)                +=3D mtdblock.o mtd_blkdevs.o
> >  obj-$(CONFIG_MTD_BLOCK_RO)     +=3D mtdblock_ro.o mtd_blkdevs.o
> > +obj-$(CONFIG_MTD_BLOCK_ROMBLOCK)       +=3D romblock.o mtd_blkdevs.o
> >  obj-$(CONFIG_FTL)              +=3D ftl.o mtd_blkdevs.o
> >  obj-$(CONFIG_NFTL)             +=3D nftl.o mtd_blkdevs.o
> >  obj-$(CONFIG_INFTL)            +=3D inftl.o mtd_blkdevs.o
> > Index: mtd-2.6/drivers/mtd/Kconfig
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- mtd-2.6.orig/drivers/mtd/Kconfig
> > +++ mtd-2.6/drivers/mtd/Kconfig
> > @@ -197,6 +197,13 @@ config MTD_BLOCK_RO
> >           You do not need this option for use with the DiskOnChip devic=
es. For
> >           those, enable NFTL support (CONFIG_NFTL) instead.
> >
> > +config MTD_BLOCK_ROMBLOCK
> > +       tristate "Readonly Block Device Layer Over MTD"
> > +       depends on MTD_BLOCK!=3Dy && MTD
> > +       help
> > +         Same as readonly block driver, but this allow you to mount re=
ad-only file
> > +         systems from an MTD device, containing bad blocks.
> > +
> >  config FTL
> >         tristate "FTL (Flash Translation Layer) support"
> >         depends on MTD && BLOCK
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
>
>
> --
> Gregory CLEMENT
> Adeneo
> 2, chemin du Ruisseau - BP21
> 69136 Ecully Cedex
> France
> Tel : +33-4 72 18 08 40
>


--=20
Gregory CLEMENT
Adeneo
Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=E9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41

www.adetelgroup.com
