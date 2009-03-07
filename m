Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LfvKP-00062a-78
	for linux-mtd@lists.infradead.org; Sat, 07 Mar 2009 12:08:33 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LfvKI-0002Xe-IG
	for linux-mtd@lists.infradead.org; Sat, 07 Mar 2009 12:08:22 +0000
Received: from woodchuck.wormnet.eu ([77.75.105.223])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sat, 07 Mar 2009 12:08:22 +0000
Received: from alex by woodchuck.wormnet.eu with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sat, 07 Mar 2009 12:08:22 +0000
To: linux-mtd@lists.infradead.org
From: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: [PATCH,RFC] ts81xx NAND driver
Date: Sat, 7 Mar 2009 11:48:08 +0000
Message-ID: <slrngr4nno.3ih.alex@woodchuck.wormnet.eu>
References: <49B15D6D.4070301@embeddedarm.com>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Eddie Dawydiuk <eddie@embeddedarm.com> [Fri, 06 Mar 2009 10:29:17 -0700]:
>
> The attached patch implements support for the NAND flash on the 
> Technologic Systems TS-8150 series of AMCC 44x boards.
>
Going PPC on us, got any juicy datasheets to nosey at? :)

> Any feedback appreciated..
>
> diff -urN linux-2.6.28.orig/drivers/mtd/nand/Kconfig 
> linux-2.6.28/drivers/mtd/nand/Kconfig
> --- linux-2.6.28.orig/drivers/mtd/nand/Kconfig  2008-12-24 
> 16:26:37.000000000 -0700
> +++ linux-2.6.28/drivers/mtd/nand/Kconfig       2009-03-06 
> 10:21:57.000000000 -0700
> @@ -420,4 +420,10 @@
>            Several Renesas SuperH CPU has FLCTL. This option enables support
>            for NAND Flash using FLCTL. This driver support SH7723.
>
> +config MTD_NAND_TS8150
> +       tristate "NAND Flash device on TS-8150 board"
> +       depends on MTD_NAND && TS81XX
> +       help
> +         Support for NAND flash on Technologic Systems TS-8150 platform.
> +
>   endif # MTD_NAND
>
> diff -urN linux-2.6.28.orig/drivers/mtd/nand/Kconfig 
> linux-2.6.28/drivers/mtd/nand/Kconfig
> --- linux-2.6.28.orig/drivers/mtd/nand/Kconfig  2008-12-24 
> 16:26:37.000000000 -0700
> +++ linux-2.6.28/drivers/mtd/nand/Kconfig       2009-03-06 
> 10:21:57.000000000 -0700
> @@ -420,4 +420,10 @@
>            Several Renesas SuperH CPU has FLCTL. This option enables support
>            for NAND Flash using FLCTL. This driver support SH7723.
>
> +config MTD_NAND_TS8150
> +       tristate "NAND Flash device on TS-8150 board"
> +       depends on MTD_NAND && TS81XX
> +       help
> +         Support for NAND flash on Technologic Systems TS-8150 platform.
> +
>   endif # MTD_NAND
>
deja vu? :)

> eddie@io:kernels$ diff -urN linux-2.6.28.orig/drivers/mtd/nand/Makefile 
> linux-2.6.28/drivers/mtd/nand/Makefile
> --- linux-2.6.28.orig/drivers/mtd/nand/Makefile 2008-12-24 
> 16:26:37.000000000 -0700
> +++ linux-2.6.28/drivers/mtd/nand/Makefile      2009-03-05 
> 17:37:01.000000000 -0700
> @@ -36,5 +36,6 @@
>   obj-$(CONFIG_MTD_NAND_FSL_UPM)         += fsl_upm.o
>   obj-$(CONFIG_MTD_NAND_SH_FLCTL)                += sh_flctl.o
>   obj-$(CONFIG_MTD_NAND_MXC)             += mxc_nand.o
> +obj-$(CONFIG_MTD_NAND_TS8150)          += ts8150.o
>
>   nand-objs := nand_base.o nand_bbt.o
>
A quick glance shows that this driver is *very* similar to your ts7250.c 
driver and also in your own ts kernel tree the ts78xx.c driver.  
Creating a third seperate and more-or-less identical driver is probably 
asking for trouble.

My recent attempts[1] to get a combined ts78xx and ts72xx driver 
mainline failed and I moved to using the plat_nand driver[2] by 
recommendation.  I still personally think a combo driver is the way to 
go, more so now I see your ts8150 uses exactly the same approach, but it 
seems very difficult to get things accepted/reviewed on the MTD mailing 
list so you might be better off going down the plat_nand approach.

> diff -urN linux-2.6.28.orig/drivers/mtd/nand/ts8150.c > linux-2.6.28/drivers/mtd/nand/ts8150.c
>
> [snipped]
>
> +struct partition_info {                // little-endian format
> +       unsigned int bootable:8;        // 0x80 = active, 0x00 = don't 
> use for booting
> +       unsigned int starting_head:8;
> +       unsigned int starting_csect:8;
> +       unsigned int starting_xcyl:8;
> +       // MSB bits 0-5 are sector
> +       unsigned int system_id:8;       // format of partition
> +       unsigned int ending_head:8;
> +       unsigned int ending_csect:8;
> +       unsigned int ending_xcyl:8;
> +       unsigned int relative_sector:32;        // sector offset from 
> start of disk to start of volume
> +       unsigned int total_sectors:32;
> +} __attribute__ ((packed));
> +
> +struct partition_table {
> +       struct partition_info part[4];
> +} __attribute__ ((__packed__));
> +
> +struct MBR {
> +       char bootcode[446];
> +       struct partition_table pt;
> +       unsigned int sig55:8;
> +       unsigned int sigAA:8;
> +} __attribute__ ((__packed__));
> +
I have a gut feeling this could be handled by something like
fs/partitions/msdos.c:msdos_partition()?  Maybe not...

> +#ifdef CONFIG_MTD_PARTITIONS
> +static struct mtd_partition partition_mbr[] = {
> +       {.name = "whole chip",
> +        .offset = 0,
> +        .size = (0x20000000)},
> +       {.name = "kernel",
> +        .offset = 0x20000,
> +        .size = 0x400000},
> +       {.name = "initrd",
> +        .offset = 0x420000,
> +        .size = 0x400000},
> +       {.name = "rootfs",
> +        .offset = 0x820000,
> +        .size = (0x20000000) - 0x820000},
> +       {.name = "part4",
> +        .offset = (0x20000000),
> +        .size = 0},
> +};
> +#endif
>
I have always felt this should be platform specific code that lives 
under arch rather than mtd/nand?  If you do go the plat_nand driver 
approach you should apply Hartley's patch[3] and go from there.  In your 
platform code you would already have the logic to detect 

For your .offset's, if you use MTDPART_OFS_APPEND instead then it simply 
places the next partition at the end of the previous one.  Far clearer 
to read and understand.  For the size of your final partition, I would 
suggest you use MTDPART_SIZ_FULL instead for reasons of clarity.

> +static void ts8150_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
> +{
> +       struct nand_chip *chip = mtd->priv;
> +
> +       if (ctrl & NAND_CTRL_CHANGE) {
> +               unsigned long addr = ts8150_nandctrl;
> +               unsigned char bits;
> +
> +               bits = (ctrl & NAND_NCE) << 2;
> +               bits |= ctrl & NAND_CLE;
> +               bits |= (ctrl & NAND_ALE) >> 2;
> +
> +               __raw_writeb((__raw_readb((unsigned long *)addr) & ~0x7) | bits,
> +                            (unsigned long *)addr);
>
I got 'told off' for using __raw_(read|write)'s...unsure why and never 
looked into it too much...if you find out why or if this is true, I 
would be interested.  I now use read/write() in my code and not noticed 
any problems.

As a side note, if you add something like my patch[4] to plat_nand 
(others have asked and supplied patches for this but been ignored here 
it seems), you could use (write|read)(w|l) that can give you a 
significant performance boost.  You can see how this is used in my git 
*nand* branch[5].

> +       /* Allocate memory for MTD device structure and private data */
> +       ts8150_mtd = kmalloc(sizeof(struct mtd_info) +
> +                            sizeof(struct nand_chip), GFP_KERNEL);
> +       if (!ts8150_mtd) {
> +               printk
> +                   ("Unable to allocate TS8150 NAND MTD device 
> structure.\n");
> +               return -ENOMEM;
> +       }
> +
> +       nandaddr = ioremap(0xA4081000, 0x1000);
>
It's because of this why the code should belong in the plaform code, 
it's a bit too 'specific' for the MTD subsystem surely?

> +       this->chip_delay = 15;
> +       this->options = NAND_USE_FLASH_BBT;
> +       this->ecc.size = 2048;
> +       this->ecc.bytes = 24;
>
If you move to the plat_nand driver ecc.size/bytes does not exist, but 
the extra tweaks needed are 'trivial'.

> +       if (mbr->sigAA == 0xAA && mbr->sig55 == 0x55) {
> +               part_type = "MBR";
> +               for (i = 0; i < 4; i++) {
> +                       if (mbr->pt.part[i].total_sectors) {
> +                               parts++;
> +                               partition_mbr[i + 1].offset =
> +                                   512 * mbr->pt.part[i].relative_sector;
> +                               if (i < 2) {
> +                                       partition_mbr[i + 1].size =
> +                                           512 * mbr->pt.part[i +
> +                                                              1].
> +                                           relative_sector -
> +                                           512 *
> +                                           mbr->pt.part[i].relative_sector;
> +                               } else {
> +                                       partition_mbr[i + 1].size =
> +                                           512 * mbr->pt.part[i].total_sectors;
> +                               }
> +                               ofs = partition_mbr[i + 1].offset
> +                                   + partition_mbr[i + 1].size;
> +                       }
> +               }
> +       } else {
> +               part_type = "default";
> +               parts = 3;
> +       }
>
As mentioned earlier, have a look at Hartley's patch and seriously 
consider the plat_nand driver...and hopefully fs/partitions/msdos.c 
might be able to help you out too but I could be wrong on that.

You might want to seriously look into using git, the patches above I 
noticed were quite manual and there were hints of line wrapping...  Also 
all your patches you should pass through scripts/checkpatch.pl.  Helpful 
git links I have collected:

http://linux.yyz.us/git-howto.html
http://lwn.net/Articles/210045/
http://www.gnome.org/~federico/misc/git-cheat-sheet.txt

Cheers

[1] http://lists.infradead.org/pipermail/linux-mtd/2009-February/024527.html
[2] http://git.marvell.com/?p=orion.git;a=blob;f=arch/arm/mach-orion5x/ts78xx-setup.c#l155
[3] http://lists.infradead.org/pipermail/linux-mtd/2009-March/024806.html
[4] http://lists.infradead.org/pipermail/linux-mtd/2009-March/024747.html
[5] git://git.wormnet.eu/alex/ts78xx.git

-- 
Alexander Clouter
.sigmonster says: "It's like deja vu all over again."   -- Yogi Berra
