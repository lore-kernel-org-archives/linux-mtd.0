From: indy5xl@lycos.de (Indy500)
Date: Wed, 12 Mar 2003 00:11:56 +0100
Subject: dbox2 Partition Table
Message-ID: <200303120011.56251.indy5xl@lycos.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--Boundary-00=_80mb+FwPFBQa0Xi
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi

attached is the Partition Table which is commonly used for Dbox2 with jffs2 in 
/drivers/mtd/maps



--Boundary-00=_80mb+FwPFBQa0Xi
Content-Type: text/x-csrc;
  charset="us-ascii";
  name="dbox2-flash.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="dbox2-flash.c"

/*
 * $Id: dbox2-flash.c,v 1.4 2001/10/02 15:05:14 dwmw2 Exp $
 *
 * D-Box 2 flash driver
 */

#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <asm/io.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/map.h>
#include <linux/mtd/partitions.h>
#include <linux/config.h>

/* partition_info gives details on the logical partitions that the split the
 * single flash device into. If the size if zero we use up to the end of the
 * device. */
static struct mtd_partition partition_info[]=3D {{name: "BR bootloader",		/=
/ raw
						      size: 128 * 1024,=20
						      offset: 0,                 =20
						      mask_flags: MTD_WRITEABLE},
						{name: "flfs (ppcboot)",=09
						      size: 128 * 1024,=20
						      offset: MTDPART_OFS_APPEND,=20
						      mask_flags: 0},
						{name: "root (jffs2)",=09
						      size: 7936 * 1024,=20
						      offset: MTDPART_OFS_APPEND,=20
						      mask_flags: 0},
						{name: "flash without bootloader",=09
						      size: MTDPART_SIZ_FULL,=20
						      offset: 128 * 1024,=20
						      mask_flags: 0},
						{name: "complete flash",=09
						      size: MTDPART_SIZ_FULL,=20
						      offset: 0,=20
						      mask_flags: MTD_WRITEABLE}};

#define NUM_PARTITIONS (sizeof(partition_info) / sizeof(partition_info[0]))

#define WINDOW_ADDR 0x10000000
#define WINDOW_SIZE 0x800000

static struct mtd_info *mymtd;

__u8 dbox2_flash_read8(struct map_info *map, unsigned long ofs)
{
	return __raw_readb(map->map_priv_1 + ofs);
}

__u16 dbox2_flash_read16(struct map_info *map, unsigned long ofs)
{
	return __raw_readw(map->map_priv_1 + ofs);
}

__u32 dbox2_flash_read32(struct map_info *map, unsigned long ofs)
{
	return __raw_readl(map->map_priv_1 + ofs);
}

void dbox2_flash_copy_from(struct map_info *map, void *to, unsigned long fr=
om, ssize_t len)
{
	memcpy_fromio(to, map->map_priv_1 + from, len);
}

void dbox2_flash_write8(struct map_info *map, __u8 d, unsigned long adr)
{
	__raw_writeb(d, map->map_priv_1 + adr);
	mb();
}

void dbox2_flash_write16(struct map_info *map, __u16 d, unsigned long adr)
{
	__raw_writew(d, map->map_priv_1 + adr);
	mb();
}

void dbox2_flash_write32(struct map_info *map, __u32 d, unsigned long adr)
{
	__raw_writel(d, map->map_priv_1 + adr);
	mb();
}

void dbox2_flash_copy_to(struct map_info *map, unsigned long to, const void=
 *from, ssize_t len)
{
	memcpy_toio(map->map_priv_1 + to, from, len);
}

struct map_info dbox2_flash_map =3D {
	name: "D-Box 2 flash memory",
	size: WINDOW_SIZE,
	buswidth: 4,
	read8: dbox2_flash_read8,
	read16: dbox2_flash_read16,
	read32: dbox2_flash_read32,
	copy_from: dbox2_flash_copy_from,
	write8: dbox2_flash_write8,
	write16: dbox2_flash_write16,
	write32: dbox2_flash_write32,
	copy_to: dbox2_flash_copy_to
};

int __init init_dbox2_flash(void)
{
       	printk(KERN_NOTICE "D-Box 2 flash driver (size->0x%X mem->0x%X)\n",=
 WINDOW_SIZE, WINDOW_ADDR);
	dbox2_flash_map.map_priv_1 =3D (unsigned long)ioremap(WINDOW_ADDR, WINDOW_=
SIZE);

	if (!dbox2_flash_map.map_priv_1) {
		printk("Failed to ioremap\n");
		return -EIO;
	}

	// Probe for dual Intel 28F320 or dual AMD
	mymtd =3D do_map_probe("cfi_probe", &dbox2_flash_map);
	if (!mymtd) {
	    // Probe for single Intel 28F640
	    dbox2_flash_map.buswidth =3D 2;
=09
	    mymtd =3D do_map_probe("cfi_probe", &dbox2_flash_map);
	}
	   =20
	if (mymtd) {
		mymtd->module =3D THIS_MODULE;

                /* Create MTD devices for each partition. */
	        add_mtd_partitions(mymtd, partition_info, NUM_PARTITIONS);
	=09
		return 0;
	}

	iounmap((void *)dbox2_flash_map.map_priv_1);
	return -ENXIO;
}

static void __exit cleanup_dbox2_flash(void)
{
	if (mymtd) {
		del_mtd_partitions(mymtd);
		map_destroy(mymtd);
	}
	if (dbox2_flash_map.map_priv_1) {
		iounmap((void *)dbox2_flash_map.map_priv_1);
		dbox2_flash_map.map_priv_1 =3D 0;
	}
}

module_init(init_dbox2_flash);
module_exit(cleanup_dbox2_flash);


MODULE_LICENSE("GPL");
MODULE_AUTHOR("K=E1ri Dav=ED=F0sson <kd@flaga.is>, Bastian Blank <waldi@tux=
box.org>");
MODULE_DESCRIPTION("MTD map driver for D-Box 2 board");

--Boundary-00=_80mb+FwPFBQa0Xi--
