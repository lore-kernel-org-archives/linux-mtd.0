Received: from 213-97-242-113.uc.nombres.ttd.es ([213.97.242.113] helo=rebirth.wojtyla.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16tByK-00067S-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 19:28:32 +0100
Received: from devil.iqc-services.com (devil.iqc-services.local [192.168.197.3])
	by rebirth.wojtyla.org (8.11.6/8.8.7) with ESMTP id g34J9gh23825
	for <linux-mtd@lists.infradead.org>; Thu, 4 Apr 2002 21:09:43 +0200
Message-Id: <5.1.0.14.2.20020404202217.01ed8b20@pop3.iqc-services.com>
Date: Thu, 04 Apr 2002 20:27:38 +0200
To: linux-mtd@lists.infradead.org
From: Marcos Lois =?iso-8859-1?Q?Bermúdez?= <marcos@iqc-services.com>
Subject: Problem getting MTD work.
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=====================_448735==_"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--=====================_448735==_
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

I'm working under uClinux 2.4.17 distribution, and havew a Dragonix board=20
(MC68VZ328), and usr two banks of 2MB of flash (Amd29LV160B), i use the map=
=20
that i atach, i make a copy of physimap and adapt it to my board.

The probem is that with the physimap map don't work on my board, and with=20
this map i get this message and the boarg hags:

Dragonix Strataflash mapping:size 400000 at 2000000
ZEUS:dragonix_map.map_priv_1=3D2000000

What is wrong here, what files i need touch to get this working with the=20
Amd29LV160B chips.

Regards.

----------------------------------------------------
Marcos Lois Berm=FAdez
marcos@iqc-services.com
IQC-Services.
Carretera provincial 60 - 1
36210 Vigo - Pontevedra
Tel: +34 986 281 830
Fax: +34 986 415 074
http://www.iqc-services.com
----------------------------------------------------
--=====================_448735==_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="dragonix_map.c"

#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <asm/io.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/map.h>
#include <linux/mtd/partitions.h>


#define WINDOW_ADDR 0x02000000
#define WINDOW_SIZE 0x00400000
#define BUSWIDTH 2

static struct mtd_info *mymtd;


static __u8 dragonix_read8(struct map_info *map,unsigned long ofs)
{
	return __raw_readb(map->map_priv_1 + ofs);
}

static __u16 dragonix_read16(struct map_info *map,unsigned long ofs)
{
	return __raw_readw(map->map_priv_1 + ofs);
}

static __u32 dragonix_read32(struct map_info *map, unsigned long ofs)
{
	return __raw_readl(map->map_priv_1 + ofs);
}

static void dragonix_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
{
	memcpy(to, (void *)(map->map_priv_1 + from), len);
}

static void dragonix_write8(struct map_info *map, __u8 d, unsigned long adr)
{
	*(__u8 *)(map->map_priv_1 + adr) = d;
}

static void dragonix_write16(struct map_info *map, __u16 d, unsigned long adr)
{
	*(__u16 *)(map->map_priv_1 + adr) = d;
}

static void dragonix_write32(struct map_info *map, __u32 d, unsigned long adr)
{
	*(__u32 *)(map->map_priv_1 + adr) = d;
}

static void dragonix_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
{
	memcpy((void *)(map->map_priv_1 + to), from, len);
}

/*
static struct mtd_partition dragonix_partition[]={
    { 
	    name: "Dragonix Bootloader", 
	    offset: 0, 
	    size:   0x20000,
    },
    {
	   name:"Dragonix Kernel",
	   offset:0x20000,
	   size:0x7e0000,
    },
    { 
	    name: "dragonix RamDisk", /////
	    offset: 0x800000,
	    size:0x800000, 
    }
};
*/

// Test partition
static struct mtd_partition dragonix_partition[]={
    { 
	    name: "Dragonix Bootloader", 
	    offset: 0, 
	    size:   0x400000,
    }
};

#define NUM_PARTITIONS (sizeof(dragonix_partition)/sizeof(dragonix_partition[0]))


struct map_info dragonix_map = {
	name: "dragonix StrataFlash map",
	size: WINDOW_SIZE,
	buswidth: BUSWIDTH,
	read8: dragonix_read8,
	read16: dragonix_read16,
	read32: dragonix_read32,
	copy_from: dragonix_copy_from,
	write8: dragonix_write8,
	write16: dragonix_write16,
	write32: dragonix_write32,
	copy_to: dragonix_copy_to,
};


static  int __init init_dragonix(void)
{
	printk(KERN_NOTICE "Dragonix Strataflash mapping:size %x at %x\n", WINDOW_SIZE, WINDOW_ADDR);
	dragonix_map.map_priv_1 = (unsigned long)ioremap(WINDOW_ADDR, WINDOW_SIZE);
	printk("ZEUS:dragonix_map.map_priv_1=%x\n",dragonix_map.map_priv_1);
	if (!dragonix_map.map_priv_1) {
		printk("Failed to ioremap\n");
		return -EIO;
	}
	
	mymtd = do_map_probe("cfi_probe", &dragonix_map);
	if (mymtd) {
		mymtd->module = THIS_MODULE;
		add_mtd_partitions( mymtd, dragonix_partition, NUM_PARTITIONS );

		add_mtd_device(mymtd);
		printk("ZEUS:right end of init_dragonix(I mean flash)\n");
		return 0;
	}
	
	iounmap((void *)dragonix_map.map_priv_1);
	printk("ZEUS:so its the wrong end of init_dragonix(flash)\n");
	return -ENXIO;

}

mod_exit_t cleanup_dragonix(void)
{
	if (mymtd) {
		del_mtd_device(mymtd);
		map_destroy(mymtd);
	}
	if (dragonix_map.map_priv_1) {
		iounmap((void *)dragonix_map.map_priv_1);
		dragonix_map.map_priv_1 = 0;
	}
}

module_init(init_dragonix);
module_exit(cleanup_dragonix);
--=====================_448735==_--
