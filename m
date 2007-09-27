Received: from rv-out-0910.google.com ([209.85.198.190])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Iauvu-0001I0-Uw
	for linux-mtd@lists.infradead.org; Thu, 27 Sep 2007 11:05:49 -0400
Received: by rv-out-0910.google.com with SMTP id c24so2518555rvf
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Sep 2007 08:05:40 -0700 (PDT)
Message-ID: <305035a40709270805t760b0530i8c366f4209dcec54@mail.gmail.com>
Date: Thu, 27 Sep 2007 17:05:40 +0200
From: "Gregory CLEMENT" <gclement00@gmail.com>
To: "Konstantin Baydarov" <kbaidarov@dev.rtsoft.ru>
Subject: Re: [PATCH] [MTD] BLOCK_RO: Readonly Block Device Layer Over MTD
In-Reply-To: <20061202194103.28f04a93@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20061117184055.569da7ad@localhost.localdomain>
	<1164034364.3574.6.camel@zod.rchland.ibm.com>
	<4562D537.5080908@ru.mvista.com>
	<20061122195633.0719c264@localhost.localdomain>
	<20061202194103.28f04a93@localhost.localdomain>
Cc: Vitaly Wool <vwool@ru.mvista.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
this drivers seems pretty good and easily reviewable, so why it hadn't
been included in mtd tree ?

After some search I had not find any news on this patch, but maybe I
missed something.


2006/12/2, Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>:
> On Wed, 22 Nov 2006 19:56:33 +0300
> Konstantin Baydarov <kbaidarov@dev.rtsoft.ru> wrote:
> >
> > Corrected typo, renamed driver, got rid from redundant dependency.
> > Also I've tested mtdblock_ro_bbfree as module - ok.
>
> Renamed driver to 'romblock'. Every entry of 'mtdblock' was replaced.
> Debug level in DEBUG macros was replaced by corresponding macros.
>
>  drivers/mtd/Kconfig    |    7 ++
>  drivers/mtd/Makefile   |    1
>  drivers/mtd/romblock.c |  165 +++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 173 insertions(+)
>
> Index: mtd-2.6/drivers/mtd/romblock.c
> ===================================================================
> --- /dev/null
> +++ mtd-2.6/drivers/mtd/romblock.c
> @@ -0,0 +1,165 @@
> +/*
> + *  Readonly Block Device Layer Over MTD
> + *
> + *  (C) 2006 Baydarov Konstantin <kbaidarov@dev.rtsoft.ru>
> + *           Pantelis Antoniou <panto@intracom.gr>
> + *           David Woodhouse <dwmw2@infradead.org>
> + *
> + *  It allows to use any filesystem on this device in
> + *  RO mode and thus gain faster mount times and better
> + *  throughput rates.
> + *
> + */
> +
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/blktrans.h>
> +
> +struct romblock_map {
> +       struct mtd_blktrans_dev dev;
> +       /* block map for RO */
> +       int32_t *block_map;
> +       int32_t block_top;
> +       int32_t block_scantop;
> +};
> +
> +static loff_t map_over_bad_blocks(struct mtd_blktrans_dev* dev, loff_t from)
> +{
> +       int i, block;
> +       struct mtd_info *mtd = dev->mtd;
> +       struct romblock_map* dev_cont = container_of(dev, struct romblock_map, dev);
> +       int32_t *block_map = dev_cont->block_map;
> +       int32_t block_top = dev_cont->block_top;
> +       int32_t block_scantop = dev_cont->block_scantop;
> +
> +       /* if no bad block checking is possible bail out */
> +       if (mtd->block_isbad == NULL)
> +               return from;
> +
> +       /* first time in */
> +       if (block_map == NULL) {
> +               block_top = mtd->size / mtd->erasesize;
> +               block_map = kmalloc(sizeof(*block_map) * block_top, GFP_KERNEL);
> +               if (block_map == NULL) {
> +                       printk (KERN_ERR "map_over_bad_blocks(): unable to allocate block map\n");
> +                       return -ENOMEM;
> +               }
> +               for (i = 0; i < block_top; i++)
> +                       block_map[i] = -1;
> +
> +               for (i = 0; i < block_top; i++)
> +                       if ((*mtd->block_isbad)(mtd, i * mtd->erasesize) == 0)
> +                               break;
> +
> +               if (i >= block_top) {
> +                       printk (KERN_WARNING "map_over_bad_blocks(): all blocks bad!\n");
> +                       return -EIO;
> +               }
> +               block_scantop = 0;
> +               block_map[0] = i;
> +
> +               DEBUG(MTD_DEBUG_LEVEL0, "mtd: map %d -> %d\n", block_scantop, block_map[block_scantop]);
> +       }
> +
> +       block = ((int)from / mtd->erasesize);
> +       if (block >= block_top)
> +               return (loff_t)-1;
> +
> +       /* scan for bad block up to where we want */
> +       while (block >= block_scantop) {
> +               /* find a non bad block */
> +               for (i = block_map[block_scantop] + 1; i < block_top; i++)
> +                       if ((*mtd->block_isbad)(mtd, i * mtd->erasesize) == 0)
> +                               break;
> +
> +               /* exhausted ? */
> +               if (i >= block_top) {
> +                       printk (KERN_WARNING "map_over_bad_blocks(): no more good blocks!\n");
> +                       return (loff_t)-1;
> +               }
> +
> +               block_map[++block_scantop] = i;
> +               DEBUG(MTD_DEBUG_LEVEL0, "mtd: map %d -> %d\n", block_scantop, block_map[block_scantop]);
> +       }
> +
> +       block = block_map[(int)from / mtd->erasesize];
> +       from = (block * mtd->erasesize) | ((int)from & (mtd->erasesize - 1));
> +       return from;
> +}
> +
> +static int romblock_readsect(struct mtd_blktrans_dev *dev,
> +                             unsigned long block, char *buf)
> +{
> +       size_t retlen;
> +       unsigned long from;
> +
> +       from = map_over_bad_blocks(dev, block<<9);
> +
> +       if (dev->mtd->read(dev->mtd, from, 512, &retlen, buf))
> +               return 1;
> +       return 0;
> +}
> +
> +static int romblock_writesect(struct mtd_blktrans_dev *dev,
> +                             unsigned long block, char *buf)
> +{
> +       size_t retlen;
> +
> +       if (dev->mtd->write(dev->mtd, (block * 512), 512, &retlen, buf))
> +               return 1;
> +       return 0;
> +}
> +
> +static void romblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
> +{
> +       struct romblock_map *dev_cont = kmalloc(sizeof(*dev_cont), GFP_KERNEL);
> +
> +       if (!dev_cont)
> +               return;
> +
> +       memset(dev_cont, 0, sizeof(*dev_cont));
> +
> +       dev_cont->dev.mtd = mtd;
> +       dev_cont->dev.devnum = mtd->index;
> +       dev_cont->dev.blksize = 512;
> +       dev_cont->dev.size = mtd->size >> 9;
> +       dev_cont->dev.tr = tr;
> +       dev_cont->dev.readonly = 1;
> +
> +       add_mtd_blktrans_dev(&(dev_cont->dev));
> +}
> +
> +static void romblock_remove_dev(struct mtd_blktrans_dev *dev)
> +{
> +       del_mtd_blktrans_dev(dev);
> +       kfree(dev);
> +}
> +
> +static struct mtd_blktrans_ops romblock_tr = {
> +       .name           = "romblock",
> +       .major          = 258,
> +       .part_bits      = 0,
> +       .readsect       = romblock_readsect,
> +       .writesect      = romblock_writesect,
> +       .add_mtd        = romblock_add_mtd,
> +       .remove_dev     = romblock_remove_dev,
> +       .owner          = THIS_MODULE,
> +};
> +
> +static int __init romblock_init(void)
> +{
> +       return register_mtd_blktrans(&romblock_tr);
> +}
> +
> +static void __exit romblock_exit(void)
> +{
> +       deregister_mtd_blktrans(&romblock_tr);
> +}
> +
> +module_init(romblock_init);
> +module_exit(romblock_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Baydarov Konstantin <kbaidarov@dev.rtsoft.ru>");
> +MODULE_DESCRIPTION("Readonly Block Device Layer Over MTD");
> Index: mtd-2.6/drivers/mtd/Makefile
> ===================================================================
> --- mtd-2.6.orig/drivers/mtd/Makefile
> +++ mtd-2.6/drivers/mtd/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_MTD_AFS_PARTS)   += afs.o
>  obj-$(CONFIG_MTD_CHAR)         += mtdchar.o
>  obj-$(CONFIG_MTD_BLOCK)                += mtdblock.o mtd_blkdevs.o
>  obj-$(CONFIG_MTD_BLOCK_RO)     += mtdblock_ro.o mtd_blkdevs.o
> +obj-$(CONFIG_MTD_BLOCK_ROMBLOCK)       += romblock.o mtd_blkdevs.o
>  obj-$(CONFIG_FTL)              += ftl.o mtd_blkdevs.o
>  obj-$(CONFIG_NFTL)             += nftl.o mtd_blkdevs.o
>  obj-$(CONFIG_INFTL)            += inftl.o mtd_blkdevs.o
> Index: mtd-2.6/drivers/mtd/Kconfig
> ===================================================================
> --- mtd-2.6.orig/drivers/mtd/Kconfig
> +++ mtd-2.6/drivers/mtd/Kconfig
> @@ -197,6 +197,13 @@ config MTD_BLOCK_RO
>           You do not need this option for use with the DiskOnChip devices. For
>           those, enable NFTL support (CONFIG_NFTL) instead.
>
> +config MTD_BLOCK_ROMBLOCK
> +       tristate "Readonly Block Device Layer Over MTD"
> +       depends on MTD_BLOCK!=y && MTD
> +       help
> +         Same as readonly block driver, but this allow you to mount read-only file
> +         systems from an MTD device, containing bad blocks.
> +
>  config FTL
>         tristate "FTL (Flash Translation Layer) support"
>         depends on MTD && BLOCK
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


-- 
Gregory CLEMENT
Adeneo
2, chemin du Ruisseau - BP21
69136 Ecully Cedex
France
Tel : +33-4 72 18 08 40
