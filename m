Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13w757-0002np-00
	for mtd-list@infradead.org; Wed, 15 Nov 2000 18:14:49 +0000
Message-ID: <3A12D2AC.6E529355@mvista.com>
Date: Wed, 15 Nov 2000 10:15:08 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Erwin Authried <eauth@softsys.co.at>,
   "'mtd@infradead.org'" <mtd@infradead.org>, ahennessy@mvista.com
Subject: Re: JEDEC support broken?
References: <Pine.LNX.4.30.0011150138350.1030-100000@imladris.demon.co.uk>
Content-Type: multipart/mixed;
 boundary="------------4320F806F42295FEE54E253B"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.
--------------4320F806F42295FEE54E253B
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

David Woodhouse wrote:

> On Tue, 14 Nov 2000, Alice Hennessy wrote:
>
> > Do you mean to use map->size instead of bank_size (to spread the
> > individual start offsets over if there are gaps between chips)
>
> Nope, discard the concept of bank_size altogether. Each chip needs its own
> information structure, much like the 'struct flchip' in
> include/mtd/flashchip.h, which contains the start offset of the chip in
> the map.
>
> It's reasonable to assume that all chips in the array will be the same
> size. You have an array of struct flchip (or your equivalent if you don't
> want to use struct flchip) and you index into that by dividing by the
> individual chip size - and then just address the chip you've selected by
> using the start offset listed for it.
>
> > Also,  is spin_lock support going to be added in jedec.c?
>
> It certainly _needs_ doing. Feel free :)
>
> > I have a board that needs support for both cfi and jedec flashes.
> > So, the approach I have taken is to use physmap.c with an array of
> > "physmap_info" structures that describe the window address, window
> > size, buswidth and number of partitions for each flash.
>  < ... deletia ... >
>
> > Is this in keeping with the intent of the map file?
>
> Sounds like it. Show us the code though.
>
> --
> dwmw2
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

Attached is my physmap.c.

Alice

--------------4320F806F42295FEE54E253B
Content-Type: text/plain; charset=us-ascii;
 name="physmap.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="physmap.c"

/*
 * $Id: physmap.c,v 1.3 2000/07/20 14:18:02 dwmw2 Exp $
 *
 * Normal mappings of chips in physical memory
 */

#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <asm/io.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/map.h>
#include <linux/mtd/partitions.h>
#include <linux/config.h>

__u8 physmap_read8(struct map_info *map, unsigned long ofs)
{
//	printk("physmap_read8 at %x\n",map->map_priv_1 + ofs);
	return readb(map->map_priv_1 + ofs);
}

__u16 physmap_read16(struct map_info *map, unsigned long ofs)
{
	return readw(map->map_priv_1 + ofs);
}

__u32 physmap_read32(struct map_info *map, unsigned long ofs)
{
	return readl(map->map_priv_1 + ofs);
}

void physmap_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
{
	memcpy_fromio(to, map->map_priv_1 + from, len);
}

void physmap_write8(struct map_info *map, __u8 d, unsigned long adr)
{
//	printk("physmap_write8 %x at %x\n",d,map->map_priv_1 + adr);
	writeb(d, map->map_priv_1 + adr);
}

void physmap_write16(struct map_info *map, __u16 d, unsigned long adr)
{
	writew(d, map->map_priv_1 + adr);
}

void physmap_write32(struct map_info *map, __u32 d, unsigned long adr)
{
	//printk("physmap_write32 %x at %x\n",d,map->map_priv_1 + adr);
	writel(d, map->map_priv_1 + adr);
}

void physmap_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
{
	memcpy_toio(map->map_priv_1 + to, from, len);
}

void physmap_set_vpp(int vpp)
{
}

const struct map_info basic_physmap_map = {
	NULL,
	0,
	0,
	physmap_read8,
	physmap_read16,
	physmap_read32,
	physmap_copy_from,
	physmap_write8,
	physmap_write16,
	physmap_write32,
	physmap_copy_to,
        physmap_set_vpp,
	0,
	0
};

/* board and partition description */

#define MAX_PHYSMAP_PARTITIONS    8
struct physmap_info {
	char *name;
	unsigned long window_addr;
	unsigned long window_size;
	int buswidth;
	int num_partitions;
};

#define PHYSMAP_NUMBER  2  // number of physmap_info structs needed
const struct physmap_info physmap_board_desc[PHYSMAP_NUMBER] = 
{
    {   // Am29DL323D in 2x16 configuration
        "big flash",     // name
	0x40000000,      // window_addr
	0x00800000,      // window_size
        4,               // buswidth
	2,               // num_partitions
    },
    {   // Am29W040B in 1x8 configuration
        "boot flash",    // name
	0xfff80000,      // window_addr
	0x00060000,      // window_size
        1,               // buswidth
	2,               // num_partitions
    },

};
static struct mtd_partition physmap_partitions[PHYSMAP_NUMBER][MAX_PHYSMAP_PARTITIONS] = {
{  // Am29DL323D in 2x16 configuration
	{
		name: "big flash 128k sectors",
		size: 0x007E0000, // 63 x (2 x 64k) byte sectors
		offset: 0,
	},
	{
		name: "big flash 16k sectors",
		size: 0x00020000, // 8  x (2 x 8k)  byte sectors
		offset: 0x007E0000,
	},
},
{  // Am29W040B in 1x8 configuration  
	{
		name: "boot environment",
		size: 0x00010000, // 1 x 64k byte sectors
		offset: 0
	},
	{
		name: "boot flash sectors",
		size: 0x00050000, // 5 x 64k byte sectors
		offset: 0x10000
	},
}
};

struct map_info physmap_map[PHYSMAP_NUMBER];

int __init init_physmap(void)
{
	int i;
        struct mtd_info *mymtd;
        struct mtd_partition *parts;

	/* Initialize mapping */
	for (i=0;i<PHYSMAP_NUMBER;i++) {
		printk(KERN_NOTICE "physmap flash device: %x at %x\n", (unsigned int)physmap_board_desc[i].window_size, (unsigned int)physmap_board_desc[i].window_addr);
                memcpy((char *)&physmap_map[i],(char *)&basic_physmap_map,sizeof(struct map_info));
		physmap_map[i].map_priv_1 = (unsigned long)ioremap(physmap_board_desc[i].window_addr, physmap_board_desc[i].window_size);
		if (!physmap_map[i].map_priv_1) {
			printk(KERN_WARNING "Failed to ioremap\n");
			return -EIO;
	        }
		physmap_map[i].name = physmap_board_desc[i].name;
		physmap_map[i].size = physmap_board_desc[i].window_size;
		physmap_map[i].buswidth = physmap_board_desc[i].buswidth;
		printk(KERN_NOTICE "physmap: ioremap is %x\n",(unsigned int)(physmap_map[i].map_priv_1));
	}

	for (i=0;i<PHYSMAP_NUMBER;i++) {
                parts = &physmap_partitions[i][0];
		mymtd = do_cfi_probe(&physmap_map[i]);
		if (!mymtd) {
			mymtd = do_jedec_probe(&physmap_map[i]);
		}
		if (mymtd) {
#ifdef MODULE
			mymtd->module = &__this_module;
#endif
			/* save mymtd for cleanup */
	                physmap_map[i].map_priv_2 = (unsigned long)mymtd;
		        add_mtd_partitions(mymtd, parts, physmap_board_desc[i].num_partitions);
		}
		else
	           return -ENXIO;
	}
	return 0;
}

static void __exit cleanup_physmap(void)
{
	int i;
        struct mtd_info *mymtd;

	for (i=0;i<PHYSMAP_NUMBER;i++) {
	        mymtd = (struct mtd_info *)physmap_map[i].map_priv_2;
		if (mymtd) {
			del_mtd_partitions(mymtd);
			map_destroy(mymtd);
		}
		if (physmap_map[i].map_priv_1) {
			iounmap((void *)physmap_map[i].map_priv_1);
			physmap_map[i].map_priv_1 = 0;
		}
	}
}

#if LINUX_VERSION_CODE > 0x20300
module_init(init_physmap);
module_exit(cleanup_physmap);
#endif

--------------4320F806F42295FEE54E253B--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
