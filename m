Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pXUv-0001jB-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 16:34:33 +0100
Message-ID: <3ADC62AE.66B350ED@daniel.com>
Date: Tue, 17 Apr 2001 10:35:10 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: rob@sysgo.de, Alexander Melichenko <AlexanderM@lrpeople.com>,
 	mtd@infradead.org, mark.langsdorf@amd.com
Subject: Re: Elan SC520 - problem with MTD
References: <01041716025800.02061@rob>  <01041715513200.02005@rob> <19294.987514727@redhat.com> <20801.987515671@redhat.com> <22300.987516491@redhat.com>
Content-Type: multipart/mixed;
 boundary="------------065AE57C6FF570C311B26891"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.
--------------065AE57C6FF570C311B26891
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

This is the board that I am working with myself. I've got this working for
quite a while and have sent
my "physmap.c" file to a few folks personally (that's the original physmap.c
file from CVS hacked for the SC520 CDP- this was before there was
a physmap file in CVS for this board.)

Anywhy, why I bring this is up, there is a *nasty* surprise waiting for folks
that use the default address of 0x8400000 as programmed by the BIOS
shipped with the board.

This "nasty surpirse" is documented in my hacked physmap.c that I reproduct
below (and attached):

/* The Embedded Systems BIOS decodes the first FLASH starting at
   0x8400000. This is a *terrible* place for it bacause accessing
   the flash at this location causes the A22 address line to be high
   (that's what 0x8400000 binary's out to be). But this is the highest
   order address line on the raw flash devices themselves!!
   This causes the top HALF of the flash to be accessed first. Beyond
   the physical limits of the flash, the flash chip aliases over (to
   0x880000 which causes the bottom half to be accessed. This splits the
   flash into two and inverts it! If you then try to acces this from another
   program that does NOT do this insanity, then you *will* access the
   first half of the flash, but not find what you expect there. That
   stuff is in the *second* half!
*/

So, what's the problem you ask? Well if you don't want to use the BIOS to boot
the board
and want to boot the kernel image directly from flash (which I wanted to do and
finally did),
you would probably decode the FLASH starting at a more sensible location- like
0x8800000 in the
first place. But you won't find the kernel there if you put it there when the
board was booted
with the original BIOS. That kernel is sitting in the second half of the flash
bank, even though you put
it at the start of /dev/mtd0!

Attached is my physmap.c file. There is code there to change to PAR reg's to
redecode the FLASH
at a more sensible location. There is also some code that dumps all PAR reg's
that may be useful
to others.

I suggest that whoever checked the sc520cdp.c file into CVS, at the very least
pick up the above comments
and include them as a warning, even if they don't want to reprogram the PAR at
the new and proper address
(I suggest that we reprogram the PAR regs).

Sorry for the long post.

Vipin








David Woodhouse wrote:

> rob@sysgo.de said:
> >  Probably (assuming the 'interesting' license allows it). Maybe
> > someone with access to a Net520 board could be persuaded to test/
> > maintain it ?
>
> The 'interesting' licence is just a mistake on the web site - I don't think
> they really meant to claim copyright on the entire MTD snapshot tarball :)
>
> The ideal volunteer for testing/maintenance would be Mark, but he appears to
> be away till April 25th, by which time I'm hoping to have completed the
> merge. If I actually do manage to send patches off by then, I'll just
> include it as net520.c. Otherwise I'll seek his advice upon his return.
>
> --
> dwmw2
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

--------------065AE57C6FF570C311B26891
Content-Type: text/plain; charset=us-ascii;
 name="physmap.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="physmap.c"

/*
 *	physmap.c - mapper for AMD Elan SC520 CDP eval board.
 *              based on Mark Langsdorf's net e520 file.
 *
 *              Modified for the SC520 CDP by Vipin Malik
 *
 *		based on pnc2000 by Crossnet Co.
 *
 * Copyright (C) 2000 Mark Langsdorf (mark.langsdorf@amd.com)
 *
 * This code is under the GPL, version 2.0
 *
 *
 * Basically, this is a physical memory map driver with 2 Flash banks
 * w/ 2 partitions each.
 *
 * If this code is used on custom designed boards, the
 * WINDOW_ADDR and WINDOW_SIZE parameters may have to
 * be changed, as well as the size of partition 2.
 *
 */
#include <linux/module.h>
#include <linux/malloc.h>
#include <linux/init.h>
#include <linux/kernel.h>
#include <asm/io.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/map.h>
#include <linux/mtd/partitions.h>
#include <linux/config.h>



/* Changes for the SC520 eval board -Vipin Malik
   NOTE: This code assumes equal size, contigious  flash 
   banks.
*/
#define NUMBANKS    2
/* The Embedded Systems BIOS decodes the first FLASH starting at
   0x8400000. This is a *terrible* place for it bacause accessing
   the flash at this location causes the A22 address line to be high
   (that's what 0x8400000 binary's out to be). But this is the highest
   order address line on the raw flash devices themselves!!
   This causes the top HALF of the flash to be accessed first. Beyond
   the physical limits of the flash, the flash chip aliases over (to
   0x880000 which causes the bottom half to be accessed. This splits the
   flash into two and inverts it! If you then try to acces this from another
   program that does NOT do this insanity, then you *will* access the
   first half of the flash, but not find what you expect there. That 
   stuff is in the *second* half!
   
   Starting to address the flash at 0x8800000 here solves this problem.
   This of course assumes that the PAR register for ROMCS0# is wide enough
   to address at least 12Megs of memory starting at 0x8400000.
*/
#define WINDOW_ADDR_BANK0 0x8800000

/* #define WINDOW_ADDR_BANK0 0x8400000 */

#define WINDOW_SIZE       0x0800000
/* BANK1 is assumed to start where BANK0 ends.*/
#define WINDOW_ADDR_BANK1 WINDOW_ADDR_BANK0 + WINDOW_SIZE



/* 
 * MAP DRIVER STUFF
 */

static struct mtd_info *mymtd[2] = {NULL, NULL};

__u8 physmap_read8(struct map_info *map, unsigned long ofs)
{
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
	writeb(d, map->map_priv_1 + adr);
}

void physmap_write16(struct map_info *map, __u16 d, unsigned long adr)
{
	writew(d, map->map_priv_1 + adr);
}

void physmap_write32(struct map_info *map, __u32 d, unsigned long adr)
{
	writel(d, map->map_priv_1 + adr);
}

void physmap_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
{
	memcpy_toio(map->map_priv_1 + to, from, len);
}

/*
  Each struct below defines one flash bank. Then each bank is
  partitioned into 2 partitions of equal (4MB) each. This can easily
  be changed as long as each partition starts/ends on sector boundary.
*/
struct map_info physmap_map[NUMBANKS] = {
       {
        "Elan SC520 Physically mapped flash BANK 0",
	WINDOW_SIZE,
	4,   /* Bus width in octets. 4= 32bit */
	physmap_read8,
	physmap_read16,
	physmap_read32,
	physmap_copy_from,
	physmap_write8,
	physmap_write16,
	physmap_write32,
	physmap_copy_to,
	0, /* set_vpp */
	0, /* map_priv_1 */
	0, /* map_priv_2 */
	0, /* fldrv_priv ?? */
	0  /* fldrv_destroy */
       },
       {
        "Elan SC520 Physically mapped flash BANK 1",
	WINDOW_SIZE,
	4,   /* Bus width in octets. 4= 32bit */
	physmap_read8,
	physmap_read16,
	physmap_read32,
	physmap_copy_from,
	physmap_write8,
	physmap_write16,
	physmap_write32,
	physmap_copy_to,
	0, /* set_vpp */
	0, /* map_priv_1 */
	0, /* map_priv_2 */
	0, /* fldrv_priv ?? */
	0  /* fldrv_destroy */
       }
};

/*
 * MTD 'PARTITIONING' STUFF 
 */
#define NUM_PARTITIONS 1

/*
  The following will give you:
  /dev/mtd0: partition1 of flash BANK0
  /dev/mtd1: partition2 of flash BANK0
  
  /dev/mtd2: partition1 of flash BANK1
  /dev/mtd3: partition2 of flash BANK1
*/
static struct mtd_partition physmap_partitions[NUM_PARTITIONS] = {
	{
                name: "Partition 1",      /* The first partition */
		size: 0x800000,       
		offset: 0
	}
};

#if LINUX_VERSION_CODE < 0x20212 && defined(MODULE)
#define init_physmap init_module
#define cleanup_physmap cleanup_module
#endif

mod_init_t init_physmap(void)
{

#define ROMCS_REG_RSV_BIT_MASK  (unsigned short)0x1E37
  
	unsigned long iomapadr;
	int i, cnt;
	unsigned short romcs1, romcs2; 
	volatile unsigned char dump;



	/* Print out all the PAR registers to see whick register sets the ROMCS0# and ROMCS1#.*/
	iomapadr = (unsigned long) ioremap_nocache(0xFFFEF000, 0xFFF);

	
        for(cnt=0; cnt <= 15; cnt++){
	  printk("PAR%i=0x%lxh\n", cnt, *((unsigned long *)(iomapadr+(cnt*4)+0x88)));
	}
	/*Now set PAR8 to 0x8800000 and PAR9 to 0x9000000 */
	*((unsigned long *)(iomapadr+(8*4)+0x88)) = (unsigned long)0xaa1fc880; /* PAR8, cache disabled, 0x80h 64KB pages */
	*((unsigned long *)(iomapadr+(9*4)+0x88)) = (unsigned long)0xca1fc900; /* PAR9, cache disabled, 0x80h 64KB pages  */

	/* Now set PAR10 (which was orig unused for selecting 32KB in GP mem space using GPCS4# (for accessing the FRAM) */
	*((volatile unsigned long *)(iomapadr+(10*4)+0x88)) = (unsigned long)0x502000D0; /* PAR10,GP memory,GPCS4 @0xD0000,32KB */

	asm volatile ("wbinvd\n\t"); /* invalidate the cache as the ELAN book instructs. Hope this is the correct way.  */

	printk("PAR%i=0x%lxh\n", 8, *((unsigned long *)(iomapadr+(8*4)+0x88)));


	printk("PAR%i=0x%lxh\n", 9, *((unsigned long *)(iomapadr+(9*4)+0x88)));

	printk("PAR%i=0x%lxh\n", 10, *((unsigned long *)(iomapadr+(10*4)+0x88)));

	/* Get the ROMCS1 and ROMCS0 chipselect registers.*/
	romcs1 = *((unsigned short *)(iomapadr+0x54));
	romcs2 = *((unsigned short *)(iomapadr+0x56));

	printk("ROMCS1=0x%xh\n", romcs1);
	printk("ROMCS2=0x%xh\n", romcs2);

	*((volatile unsigned short *)(iomapadr+0x54)) = (romcs1 |(unsigned short)0x0007)&ROMCS_REG_RSV_BIT_MASK; /* 7 wait states*/
	*((volatile unsigned short *)(iomapadr+0x56)) = (romcs2 |(unsigned short)0x0007)&ROMCS_REG_RSV_BIT_MASK; /* 7 wait states*/


	/* Get the ROMCS1 and ROMCS0 chipselect registers.*/
	romcs1 = *((unsigned short *)(iomapadr+0x54));
	romcs2 = *((unsigned short *)(iomapadr+0x56));

	printk("ROMCS1=0x%xh\n", romcs1);
	printk("ROMCS2=0x%xh\n", romcs2);

	printk("GPECHO = 0x%xh\n", *((unsigned char *)(iomapadr+0xC00)));
	printk("GPCSDW = 0x%xh\n", *((unsigned char *)(iomapadr+0xC01)));
	printk("GPCSQUAL = 0x%xh\n", *((unsigned short *)(iomapadr+0xC02)));
	printk("GPCSRT = 0x%xh\n", *((unsigned char *)(iomapadr+0xC08)));
	printk("GPCSPW = 0x%xh\n", *((unsigned char *)(iomapadr+0xC09)));
	printk("GPCSOFF = 0x%xh\n", *((unsigned char *)(iomapadr+0xC0A)));
	printk("GPRDW = 0x%xh\n", *((unsigned char *)(iomapadr+0xC0B)));
	printk("GPRDOFF = 0x%xh\n", *((unsigned char *)(iomapadr+0xC0C)));
	printk("GPWRW = 0x%xh\n", *((unsigned char *)(iomapadr+0xC0D)));
	printk("GPWROFF = 0x%xh\n", *((unsigned char *)(iomapadr+0xC0E)));
	printk("GPALEW = 0x%xh\n", *((unsigned char *)(iomapadr+0xC0F)));
	printk("GPALEOFF = 0x%xh\n", *((unsigned char *)(iomapadr+0xC10)));

	printk("CSPFS = 0x%xh\n", *((unsigned char *)(iomapadr+0xC24)));

	iounmap((void *) iomapadr); /* Free the iomapping */


	/* *************   The actual FLASH mtd stuff starts here   **************  */
	iomapadr = (unsigned long) ioremap_nocache(WINDOW_ADDR_BANK0, WINDOW_SIZE * NUMBANKS);

	if (!iomapadr) {
		printk("physmap.c:MTD:Failed to ioremap the physical memory!\n");
		return -EIO;
	}
	else 
		printk("physmap.c:MTD:mapped physical memory to %08lx\n", iomapadr);


	for(i = 0; i < NUMBANKS; i++){ 

	       printk(KERN_INFO "AMD Elan Sc520 flash mapping defined: %x at %x\n", 
		      WINDOW_SIZE, 
		      WINDOW_ADDR_BANK0 + (i * WINDOW_SIZE)); /* assumes equally sized windows */

       	       physmap_map[i].map_priv_1 = iomapadr + (i * WINDOW_SIZE); /* assumes equally sized windows */

	       mymtd[i] = (struct mtd_info *)do_cfi_probe(&physmap_map[i]);

	       if (mymtd[i]) {
		   printk(KERN_INFO "physmap flash module installed for flash BANK%i\n", i);
#ifdef MODULE
		   mymtd[i]->module = THIS_MODULE;
#endif
		   if( add_mtd_partitions(mymtd[i], physmap_partitions, NUM_PARTITIONS) < 0){

		     goto ERR_JMPOUT;
		   }
		   
	       }else{

		     goto ERR_JMPOUT;
	       }
	}

	return 0;

       /* Bad  stuff has happened. Clean up and return error. */
 ERR_JMPOUT: 
	iounmap((void *) iomapadr);     /* give back our memory mapping */
	for( i = 0; i < NUMBANKS; i++){
	  physmap_map[i].map_priv_1 = 0;
	}

	inter_module_put("cfi_probe");	

	return -ENXIO;

}

mod_exit_t cleanup_physmap(void)
{

	int i;
	
	for (i=0; i<2; i++) {
		if (mymtd[i]) {
			del_mtd_partitions(mymtd[i]);
			map_destroy(mymtd[i]);
		}
	}

	if (physmap_map[0].map_priv_1) {
		iounmap((void *) physmap_map[0].map_priv_1);
		for( i = 0; i < NUMBANKS; i++){
		       physmap_map[i].map_priv_1 = 0;
		}
	}
}

module_init(init_physmap);
module_exit(cleanup_physmap);












--------------065AE57C6FF570C311B26891--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
