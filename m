Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0a3K-0000Ph-6u
	for linux-mtd@lists.infradead.org; Fri, 27 Aug 2004 02:17:36 -0400
Received: from 192.168.69.102 ([69.70.213.145]) by VL-MO-MR010.ip.videotron.ca
	(iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
	with ESMTP id <0I3300AHFFXYKI@VL-MO-MR010.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 27 Aug 2004 02:10:46 -0500 (EST)
Date: Fri, 27 Aug 2004 02:10:53 -0400
From: Ccool <ccool@ninjatech.biz>
To: linux-mtd@lists.infradead.org
Message-id: <200408270210.53632.ccool@ninjatech.biz>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_Lj04gAQcfV61Q/E3HrJCZg)"
Content-disposition: inline
Subject: Trouble with mtd partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Boundary_(ID_Lj04gAQcfV61Q/E3HrJCZg)
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable
Content-disposition: inline

Hello,

This trouble might look like a neebies, but I'm really having a hard time w=
ith=20
this.  I installed a few options in my kernel so I could have an mtd=20
character device.  I tried edit physmap.c and whenever I was never abler to=
=20
get anything more than one big partition of my flash disk.

something like:
mtd0	01000000	00040000	"Physical map something"



I would really like it if I could have an mtd0, and also mtd1, mtd2, etc. =
=20
like in my configuration file.  If anyone knows "a magic trick" or anything=
=20
that could help me with that.  I cannot really work with only one big=20
partition, because there is some data that I don't want to erase (bootloade=
r)=20
on the flash disk.  So if you could help me, I would appreciate it very muc=
h.

If it helps (because I surely don't understand what's happenning), it is li=
ke=20
if the partition structure in the physmap.c was not taken count off.  I tri=
ed=20
also to put some information into the init string, mtdparts=3D...  but even=
=20
with all the examples that I found via google, I never had anything up and=
=20
working.  If I could only have this structure working.  In attachement, the=
re=20
is my physmap.c (pretty much basic).  I've also tried with the rpxlite.c,=20
because it is my board, and it did'nt work.  Actually, in rpxlite.c, I did'=
nt=20
find any place to put my partitions structure.  My board is an RPXlite with=
=20
16 meg of ram and 16 meg of Flash, they have mpc823e processor.  I have CW=
=20
and DW version of this board.  As the memory map is a little different, I'v=
e=20
only pu some example for the DW.

Thanks
Rapha=EBl


--Boundary_(ID_Lj04gAQcfV61Q/E3HrJCZg)
Content-type: text/x-csrc; charset=iso-8859-1; name=physmap.c
Content-transfer-encoding: 7BIT
Content-disposition: attachment; filename=physmap.c

/*
 * $Id: physmap.c,v 1.21 2002/09/05 05:12:54 acurtis Exp $
 *
 * Normal mappings of chips in physical memory
 */

#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <asm/io.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/map.h>
#include <linux/config.h>

#ifdef CONFIG_MTD_PARTITIONS
#include <linux/mtd/partitions.h>
#endif

#define WINDOW_ADDR CONFIG_MTD_PHYSMAP_START
#define WINDOW_SIZE CONFIG_MTD_PHYSMAP_LEN
#define BUSWIDTH CONFIG_MTD_PHYSMAP_BUSWIDTH

static struct mtd_info *mymtd;

__u8 physmap_read8(struct map_info *map, unsigned long ofs)
{
	return __raw_readb(map->map_priv_1 + ofs);
}

__u16 physmap_read16(struct map_info *map, unsigned long ofs)
{
	return __raw_readw(map->map_priv_1 + ofs);
}

__u32 physmap_read32(struct map_info *map, unsigned long ofs)
{
	return __raw_readl(map->map_priv_1 + ofs);
}

void physmap_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
{
	memcpy_fromio(to, map->map_priv_1 + from, len);
}

void physmap_write8(struct map_info *map, __u8 d, unsigned long adr)
{
	__raw_writeb(d, map->map_priv_1 + adr);
	mb();
}

void physmap_write16(struct map_info *map, __u16 d, unsigned long adr)
{
	__raw_writew(d, map->map_priv_1 + adr);
	mb();
}

void physmap_write32(struct map_info *map, __u32 d, unsigned long adr)
{
	__raw_writel(d, map->map_priv_1 + adr);
	mb();
}

void physmap_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
{
	memcpy_toio(map->map_priv_1 + to, from, len);
}

struct map_info physmap_map = {
	name: "Physically mapped flash",
	size: WINDOW_SIZE,
	buswidth: BUSWIDTH,
	read8: physmap_read8,
	read16: physmap_read16,
	read32: physmap_read32,
	copy_from: physmap_copy_from,
	write8: physmap_write8,
	write16: physmap_write16,
	write32: physmap_write32,
	copy_to: physmap_copy_to
};

#ifdef CONFIG_MTD_PARTITIONS
#ifdef CONFIG_MTD_CMDLINE_PARTS
static struct mtd_partition *mtd_parts = 0;
static int                   mtd_parts_nb = 0;
#else
static struct mtd_partition physmap_partitions[] = {
/* Put your own partition definitions here */
#if 0
	{
		name:		"boot",
		size:		0x80000,
		offset:		0,
		mask_flags:	MTD_WRITEABLE,  /* force read-only */
	}, {
		name:		"zImage",
		size:		0x100000,
		offset:		MTDPART_OFS_APPEND,
		mask_flags:	MTD_WRITEABLE,  /* force read-only */
	}, {
		name:		"ramdisk.gz",
		size:		0x300000,
		offset:		MTDPART_OFS_APPEND,
		mask_flags:	MTD_WRITEABLE,  /* force read-only */
//	}, {
//		name:		"User FS",
//		size:		MTDPART_SIZ_FULL,
//		offset:		MTDPART_OFS_APPEND,
	}
#endif
};


#define NUM_PARTITIONS	(sizeof(physmap_partitions)/sizeof(struct mtd_partition))

#endif
#endif

int __init init_physmap(void)
{
	static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", 0 };
	const char **type;

       	printk(KERN_NOTICE "physmap flash device: %x at %x\n", WINDOW_SIZE, WINDOW_ADDR);
	physmap_map.map_priv_1 = (unsigned long)ioremap(WINDOW_ADDR, WINDOW_SIZE);

	if (!physmap_map.map_priv_1) {
		printk("Failed to ioremap\n");
		return -EIO;
	}
	
	mymtd = 0;
	type = rom_probe_types;
	for(; !mymtd && *type; type++) {
		mymtd = do_map_probe(*type, &physmap_map);
	}
	if (mymtd) {
		mymtd->module = THIS_MODULE;

		add_mtd_device(mymtd);
#ifdef CONFIG_MTD_PARTITIONS
#ifdef CONFIG_MTD_CMDLINE_PARTS
		mtd_parts_nb = parse_cmdline_partitions(mymtd, &mtd_parts, 
							"phys");
		if (mtd_parts_nb > 0)
		{
			printk(KERN_NOTICE 
			       "Using command line partition definition\n");
			add_mtd_partitions (mymtd, mtd_parts, mtd_parts_nb);
		}
#else
		if (NUM_PARTITIONS != 0) 
		{
			printk(KERN_NOTICE 
			       "Using physmap partition definition\n");
			add_mtd_partitions (mymtd, physmap_partitions, NUM_PARTITIONS);
		}

#endif
#endif
		return 0;
	}

	iounmap((void *)physmap_map.map_priv_1);
	return -ENXIO;
}

static void __exit cleanup_physmap(void)
{
	if (mymtd) {
		del_mtd_device(mymtd);
		map_destroy(mymtd);
	}
	if (physmap_map.map_priv_1) {
		iounmap((void *)physmap_map.map_priv_1);
		physmap_map.map_priv_1 = 0;
	}
}

module_init(init_physmap);
module_exit(cleanup_physmap);


MODULE_LICENSE("GPL");
MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
MODULE_DESCRIPTION("Generic configurable MTD map driver");

--Boundary_(ID_Lj04gAQcfV61Q/E3HrJCZg)--
