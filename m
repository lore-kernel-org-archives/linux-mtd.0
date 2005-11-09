Received: from zproxy.gmail.com ([64.233.162.196])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZk2u-0000Zg-Vg
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2005 02:07:04 -0500
Received: by zproxy.gmail.com with SMTP id i11so148049nzi
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Nov 2005 23:06:57 -0800 (PST)
Message-ID: <51d250110511082306k522ae955r53553ca9867c7dd@mail.gmail.com>
Date: Wed, 9 Nov 2005 12:36:57 +0530
From: yonathana wodeselia <yonathanaw@gmail.com>
To: yaffs@stoneboat.aleph1.co.uk, linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Cc: 
Subject: oob structure for 2.6.14 or anyother 2.6 kernel on 0x76 samsung ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hiya nanders
                   I have the following structure in my nand flash
driver . Now i have a samsung 0x76 id  512 page device on my board ,
are these values correct . These are defining how the oob info should
should be placed . But what if mtd always throws a weird value which
scanning the device for bad blocks , could be timing issues . I have
placed a chip delay of 50 in the driver . The driver is a spia pull.
and kernel version is 2.6.12-rc6-mm1. have tries it will most other
2.6 kernels


static struct nand_oobinfo nand_oobsel =3D {
        useecc: 1,
        eccbytes: 6,
        eccpos: {8, 9, 10, 13, 14, 15}

I tried   changing these values to in the 2.6.14 kernel
static struct nand_oobinfo nand_oob_16 =3D {
        .useecc =3D MTD_NANDECC_AUTOPLACE,
        .eccbytes =3D 6,
        .eccpos =3D {0, 1, 2, 3, 6, 7},
        .oobfree =3D { {8, 8} }
};
and
const static struct mtd_partition partition_info[] =3D {
        {
                name: "Partition 1 on nand",
                offset: 0,
                oobsel: &nand_oobsel, // or nand_oob_16
                size:    2*1024*1024},
as the partition defination

Am not sure how the oob structure  should be allocated for a 512+16
device .. can anyone shed some pointers if this is the problem for
this device .. When i try to write a ls-la > file to  this mounted
block device as yaffs filesystem i get a whole lot of
 nand_write_oob: Failed write verify, page 0x00000f59
**>> yaffs chunk 3962 was not erased
nand_write_oob: Failed write verify, page 0x00000f5a
**>> yaffs chunk 3963 was not erased
nand_write_oob: Failed write verify, page 0x00000f5b
**>> yaffs chunk 3964 was not erased
nand_write_oob: Failed write verify, page 0x00000f5c
**>> yaffs chunk 3965 was not erased
nand_write_oob: Failed write verify, page 0x00000f5d
**>> yaffs chunk 3966 was not erased
nand_write_oob: Failed write verify, page 0x00000f5e
**>> yaffs chunk 3967 was not erased
nand_write_oob: Failed write verify, page 0x00000f5f
nand_write_oob: Failed write verify, page 0x00000f40
nand_write_oob: Failed write verify, page 0x00000f41
**>> Block 123 retired
**>> yaffs write required 3936 attempts
[root@raphie yoni]#df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/mtdblock2           31488     21656      9832  69% /
/dev/mtdblock3            2048      2048         0 100% /mnt/usb

And nandwrite from mtd always gives this
./nandwrite -p -y /dev/mtd3 test
MTD_open
MTD_ioctl
MTD_ioctl
MTD_ioctl
Writing data to block 0
MTD_ioctl
MTD_write
nand_verify_pages: Failed write verify, page 0x00000000
<6>nand_write_ecc: verify_pages failed -5
pwrite: Input/output error
MTD_close
Data did not fit into device, due to bad blocks
: Illegal seek

erasing happens properly using mkyaffs or flash_eraseall
and the whole device if filled and nothing written .. Anyclues what
could be wrong ..
The driver code see below
*
 * $Id: spia.c,v 1.21 2003/07/11 15:12:29 dwmw2 Exp $
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 *  Overview:
 *   This is a device driver for the NAND flash device found on the
 *   SPIA board which utilizes the Toshiba TC58V64AFT part. This is
 *   a 64Mibit (8MiB x 8 bits) NAND flash device.
 */

#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/module.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/partitions.h>
#include <asm/io.h>
#include <asm/sizes.h>
#include <asm/arch-pxa/pxa-regs.h>
/*
 * MTD structure for SPIA board
 */
static struct mtd_info *spia_mtd =3D NULL;

/*
 * Values specific to the SPIA board (used with EP7212 processor)
 */
#define SPIA_IO_BASE    0xd0000000      /* Start of EP7212 IO address space=
 */
#define SPIA_FIO_BASE   0x06000000      /* Address where flash is mapped */
#define SPIA_PEDR       0x0080          /*
                                         * IO offset to Port E data registe=
r
                                         * where the CLE, ALE and NCE pins
                                         * are wired to.
                                         */
#define SPIA_PEDDR      0x00c0          /*
                                         * IO offset to Port E data directi=
on
                                         * register so we can control the I=
O
                                         * lines.
                                         */
static unsigned char data_buf[512+16];
static unsigned char oob_buf[16*32];

static struct nand_oobinfo nand_oob_16 =3D {
        .useecc =3D MTD_NANDECC_AUTOPLACE,
        .eccbytes =3D 6,
        .eccpos =3D {0, 1, 2, 3, 6, 7},
        .oobfree =3D { {8, 8} }
};

#if 0
static struct nand_oobinfo nand_oobsel =3D {
        useecc: 1,
        eccbytes: 6,
        eccpos: {8, 9, 10, 13, 14, 15}
};
#endif
/*
 * Module stuff
 */

//static int spia_io_base =3D SPIA_IO_BASE;
static int spia_fio_base =3D SPIA_FIO_BASE;
//static int spia_pedr =3D SPIA_PEDR;
//static int spia_peddr =3D SPIA_PEDDR;

//MODULE_PARM(spia_io_base, "i");
//MODULE_PARM(spia_fio_base, "i");
//MODULE_PARM(spia_pedr, "i");
//MODULE_PARM(spia_peddr, "i");

/*
 * Define partitions for flash device
 */

const static struct mtd_partition partition_info[] =3D {
        {
                name: "Partition 1 on nand",
                offset: 0,
                oobsel: &nand_oob_16,
                size:    2*1024*1024},
        {
                name: "Partion 2 on nand",
                offset:  2*1024*1024,
                oobsel: &nand_oob_16,
                size:   4 * 1024 * 1024},
};
#define NUM_PARTITIONS 2


/*
 *      hardware specific access to control-lines
*/
static void spia_hwcontrol(struct mtd_info *mtd, int cmd){

    switch(cmd){

        case NAND_CTL_SETCLE: GPSR2 =3D 0x80000;   break;
        case NAND_CTL_CLRCLE:GPCR2 =3D 0x80000;   break;

        case NAND_CTL_SETALE: GPSR2 =3D 0x100000; break;
        case NAND_CTL_CLRALE: GPCR2 =3D 0x100000;  break;

        case NAND_CTL_SETNCE: GPCR2 =3D 0x20000; break;
        case NAND_CTL_CLRNCE: GPSR2 =3D 0x20000; break;
    }
}

/*
 * Main initialization routine
 */
int __init spia_init (void)
{
        struct nand_chip *this;
        GPSR2 =3D 0x60000;
        GPDR2 |=3D 0x1e0000;

        GPCR2 =3D 0x20000;
        /* Allocate memory for MTD device structure and private data */
        spia_mtd =3D kmalloc (sizeof(struct mtd_info) + sizeof (struct nand=
_chip),
                                GFP_KERNEL);
        if (!spia_mtd) {
                printk ("Unable to allocate SPIA NAND MTD device structure.=
\n");
                return -ENOMEM;
        }

        /* Get pointer to private data */
        this =3D (struct nand_chip *) (&spia_mtd[1]);

        /* Initialize structures */
        memset((char *) spia_mtd, 0, sizeof(struct mtd_info));
        memset((char *) this, 0, sizeof(struct nand_chip));
spia_fio_base=3D(unsigned long)ioremap(spia_fio_base,SZ_1K);
        /* Link the private data with the MTD structure */
        spia_mtd->priv =3D this;

        /*
         * Set GPIO Port E control register so that the pins are configured
         * to be outputs for controlling the NAND flash.
         */
        //(*(volatile unsigned char *) (spia_io_base + spia_peddr)) =3D 0x0=
7;

        /* Set address of NAND IO lines */
        this->IO_ADDR_R =3D (void __iomem *)spia_fio_base;
        this->IO_ADDR_W =3D (void __iomem *)spia_fio_base;
        /* Set address of hardware control function */
        this->hwcontrol =3D spia_hwcontrol;
        /* 15 us command delay time */
        this->chip_delay =3D 50;
      //  this->eccmode =3D NAND_ECC_NONE;
          this->eccmode =3D NAND_ECC_SOFT;
       // this->eccmode=3D MTD_NANDECC_PLACE;

        /* Scan to find existence of the device */
        if (nand_scan (spia_mtd, 1)) {
                kfree (spia_mtd);
                return -ENXIO;
        }

        /* Allocate memory for internal data buffer */
//      this->data_buf =3D kmalloc (sizeof(u_char) * (spia_mtd->oobblock
+ spia_mtd->oobsize), GFP_KERNEL);
        this->data_buf =3D data_buf; // some kernel versions dont
require this  do this this too
        this->oob_buf =3D oob_buf;   // ditto .. justchecking ...
usually commented
        if (!this->data_buf) {
                printk ("Unable to allocate NAND data buffer for SPIA.\n");
                kfree (spia_mtd);
                return -ENOMEM;
        }
        if (!this->oob_buf) {
                printk ("Unable to allocate NAND data buffer for SPIA.\n");
                kfree (spia_mtd);
                return -ENOMEM;
        }


        /* Register the partitions */
        add_mtd_partitions(spia_mtd, partition_info, NUM_PARTITIONS);

        /* Return happy */
        return 0;
}
module_init(spia_init);

/*
 * Clean up routine
 */
#ifdef MODULE
static void __exit spia_cleanup (void)
{
//      struct nand_chip *this =3D (struct nand_chip *) &spia_mtd[1];

        /* Unregister the device */
        del_mtd_device (spia_mtd);

        /* Free internal data buffer */
//      kfree (this->data_buf);

        /* Free the MTD device structure */
//      kfree (spia_mtd);
}
module_exit(spia_cleanup);
#endif

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Steven J. Hill <sjhill@realitydiluted.com");
MODULE_DESCRIPTION("Board-specific glue layer for NAND flash on SPIA board"=
);

If mtd is not happy so is yaffs and jffs2 . Anything noticable .. ?
Any kernel build lying around that had mtd happy and yaffs/jffs2 live
together for these chips ...
regards
yonathana
