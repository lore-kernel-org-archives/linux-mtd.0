Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159ito-0000Mi-01
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 08:47:41 +0100
Received: from mail.2d3d.co.za ([196.14.185.200] helo=crystal.2d3d.co.za)
	by infradead.org with smtp (Exim 3.20 #2)
	id 159QpJ-0000bt-00
	for linux-mtd@lists.infradead.org; Mon, 11 Jun 2001 13:29:50 +0100
Date: Mon, 11 Jun 2001 14:29:13 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: Erik Mouw <J.A.K.Mouw@ITS.TUDelft.NL>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: partitioning bug
Message-ID: <20010611142913.A30396@crystal.2d3d.co.za>
References: <20010608120438.A9491@crystal.2d3d.co.za> <20010610142255.F651@arthur.ubicom.tudelft.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline
In-Reply-To: <20010610142255.F651@arthur.ubicom.tudelft.nl>; from J.A.K.Mouw@ITS.TUDelft.NL on Sun, Jun 10, 2001 at 14:22:55 +0200
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

--6sX45UoQRIJXqkqR
Content-Type: multipart/mixed; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Erik!

> > I've written a chip driver which works great until I use partitioning
> > support. If I do that, and I do a MEMGETINFO ioctl() on the first parti=
tion
> > (/dev/mtd0) I get the following fault as soon as I try and access the
> > returned mtd_info_user structure:
>=20
> [snip]
>=20
> > So what I don't get is why it crashes. I mean, all that happens during =
that
> > ioctl() is the mtd_info structure gets sent to the user process - no ma=
gic
> > there that can cause the process to crash.
>=20
> Try to look up in the System.map file which functions are called, so
> you'll get a clue what's going on (the addresses between [] are
> important).

That's the problem, the addresses that do show up is useless:

------------< snip <------< snip <------< snip <------------
root@tinystor:/mnt# grep ca00538c /proc/ksyms
root@tinystor:/mnt# grep c003fb0c /proc/ksyms
c003fb0c fput
root@tinystor:/mnt# grep c003e9c0 /proc/ksyms
c003e9c0 filp_close
root@tinystor:/mnt# grep c003ea4c /proc/ksyms
c003ea4c sys_close
root@tinystor:/mnt# grep ca0022e8 /proc/ksyms
root@tinystor:/mnt# grep c003fb8c /proc/ksyms
root@tinystor:/mnt# grep c003ea40 /proc/ksyms
root@tinystor:/mnt# grep c003ead8 /proc/ksyms
root@tinystor:/mnt# grep c0012680 /proc/ksyms
------------< snip <------< snip <------< snip <------------

Same for System.map

I can't get any references to calls in my module or the mtdpart module which
is obviously where things go wrong ):

I've even removed the static declarations in my module so that the functions
can show up in /proc/ksyms but nothing. I don't think there's a bug in my
module anyhow since it works perfectly without partitioning support.

I'm including my module source. Maybe you can spot something that I'm doing
wrong.

--=20

Regards
 Abraham

Don't hate yourself in the morning -- sleep till noon.

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--lrZ03NoBR/3+SXJZ
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="lart.c"


/*
 * MTD driver for the 28F160F3 Flash Memory (non-CFI) on LART.
 *
 * Author: Abraham vd Merwe <abraham@2d3d.co.za>
 *
 * Copyright (c) 2001, 2d3D, Inc.
 *
 * This code is released under GPL.
 *
 * References:
 *
 *    [1] 3 Volt Fast Boot Block Flash Memory" Intel Datasheet
 *           - Order Number: 290644-005
 *           - January 2000
 *
 *    [2] MTD internal API documentation
 *           - http://www.linux-mtd.infradead.org/tech/
 *
 * Limitations:
 *
 *    Even though this driver is written for 3 Volt Fast Boot
 *    Block Flash Memory, it is rather specific to LART. With
 *    Minor modifications, notably the without data line mangling
 *    and different bus settings, etc. it should be trivial
 *    to adapt to other platforms.
 *
 *    If somebody would sponsor me a different board, I'll
 *    adapt the driver (;
 */

/* debugging */
#define LART_DEBUG

/* partition support */
#define HAVE_PARTITIONS

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/types.h>
#include <linux/version.h>
#include <linux/errno.h>
#include <linux/mtd/mtd.h>
#ifdef HAVE_PARTITIONS
#include <linux/mtd/partitions.h>
#endif

#ifndef CONFIG_SA1100_LART
#error This is for LART architecture only
#endif

static char module_name[] = "lart";

/*
 * These values is specific to 28Fxxxx3 flash memory.
 * See section 2.3.1 in "3 Volt Fast Boot Block Flash Memory" Intel Datasheet
 */
#define FLASH_BLOCKSIZE_PARAM		(4096 * BUSWIDTH)
#define FLASH_NUMBLOCKS_16m_PARAM	8
#define FLASH_NUMBLOCKS_8m_PARAM	8

/*
 * These values is specific to 28Fxxxx3 flash memory.
 * See section 2.3.2 in "3 Volt Fast Boot Block Flash Memory" Intel Datasheet
 */
#define FLASH_BLOCKSIZE_MAIN		(32768 * BUSWIDTH)
#define FLASH_NUMBLOCKS_16m_MAIN	31
#define FLASH_NUMBLOCKS_8m_MAIN		15

/*
 * These values are specific to LART
 */

/* general */
#define BUSWIDTH			4				/* don't change this - a lot of the code _will_ break if you change this */
#define FLASH_OFFSET		0xe8000000		/* see linux/arch/arm/mach-sa1100/lart.c */

/* blob */
#define NUM_BLOB_BLOCKS		FLASH_NUMBLOCKS_16m_PARAM
#define BLOB_START			0x00000000
#define BLOB_LEN			(NUM_BLOB_BLOCKS * FLASH_BLOCKSIZE_PARAM)

/* kernel */
#define NUM_KERNEL_BLOCKS	7
#define KERNEL_START		(BLOB_START + BLOB_LEN)
#define KERNEL_LEN			(NUM_KERNEL_BLOCKS * FLASH_BLOCKSIZE_MAIN)

/* initial ramdisk */
#define NUM_INITRD_BLOCKS	24
#define INITRD_START		(KERNEL_START + KERNEL_LEN)
#define INITRD_LEN			(NUM_INITRD_BLOCKS * FLASH_BLOCKSIZE_MAIN)

/*
 * See section 4.0 in "3 Volt Fast Boot Block Flash Memory" Intel Datasheet
 */
#define READ_ARRAY			0x00FF00FF		/* Read Array/Reset */
#define READ_ID_CODES		0x00900090		/* Read Identifier Codes */
#define ERASE_SETUP			0x00200020		/* Block Erase */
#define ERASE_CONFIRM		0x00D000D0		/* Block Erase and Program Resume */
#define PGM_SETUP			0x00400040		/* Program */
#define STATUS_READ			0x00700070		/* Read Status Register */
#define STATUS_CLEAR		0x00500050		/* Clear Status Register */
#define STATUS_BUSY			0x00800080		/* Write State Machine Status (WSMS) */
#define STATUS_ERASE_ERR	0x00200020		/* Erase Status (ES) */
#define STATUS_PGM_ERR		0x00100010		/* Program Status (PS) */

/*
 * See section 4.2 in "3 Volt Fast Boot Block Flash Memory" Intel Datasheet
 */
#define FLASH_MANUFACTURER			0x00890089
#define FLASH_DEVICE_8mbit_TOP		0x88f188f1
#define FLASH_DEVICE_8mbit_BOTTOM	0x88f288f2
#define FLASH_DEVICE_16mbit_TOP		0x88f388f3
#define FLASH_DEVICE_16mbit_BOTTOM	0x88f488f4

/***************************************************************************************************/

static __u8 read8 (__u32 offset)
{
   volatile __u8 *data = (__u8 *) (FLASH_OFFSET + offset);
#ifdef LART_DEBUG
   printk (KERN_DEBUG "%s(): 0x%.8x -> 0x%.2x\n",__FUNCTION__,offset,*data);
#endif
   return (*data);
}

static __u32 read32 (__u32 offset)
{
   volatile __u32 *data = (__u32 *) (FLASH_OFFSET + offset);
#ifdef LART_DEBUG
   printk (KERN_DEBUG "%s(): 0x%.8x -> 0x%.8x\n",__FUNCTION__,offset,*data);
#endif
   return (*data);
}

static void write32 (__u32 x,__u32 offset)
{
   volatile __u32 *data = (__u32 *) (FLASH_OFFSET + offset);
   *data = x;
#ifdef LART_DEBUG
   printk (KERN_DEBUG "%s(): 0x%.8x <- 0x%.8x\n",__FUNCTION__,offset,*data);
#endif
}

/***************************************************************************************************/

#define BIT(n) (1 << (n))

typedef enum { U2 = 0, U3 = 1 } chip_t;

static int address_lines[2][20] =
{
   {  2,  3,  9, 13,  8, 12, 11, 10,  4,  5,  6,  7, 15, 14, 16, 17, 18, 20, 19, 21 },
   {  2,  3,  9,  8,  7,  6,  5,  4, 10, 11, 12, 13, 15, 14, 16, 18, 17, 20, 19, 21 }
};

/* Mangle address ``x'' in chip ``chip'' */
static __u32 addr_to_flash (__u32 x,chip_t chip)
{
   __u32 result = 0;
   int i;
   for (i = 0; i < 20; i++) if (x & BIT (i)) result |= BIT (address_lines[chip][i]);
   return (result);
}

#if 0
/* Unmanlge address ``x'' in chip ``chip'' */
static __u32 flash_to_addr (__u32 x,chip_t chip)
{
   __u32 result = 0;
   int i;
   for (i = 0; i < 20; i++) if (x & BIT (bits[chip][i])) result |= BIT (i);
   return (result);
}
#endif

/* Mangle data ``x'' */
static __u32 data_to_flash (__u32 x)
{
   __u32 result = 0;
   int i;
   int bits[] = { 12, 14, 11, 9, 0, 2, 7, 5, 13, 15, 10, 8, 1, 3, 6, 4 };
   for (i = 0; i < 16; i++)
	 {
		if (x & BIT (i)) result |= BIT (bits[i]);
		if (x & BIT (16 + i)) result |= BIT (bits[15 - i]) << 16;
	 }
   return (result);
}

/* Unmangle data ``x'' */
static __u32 flash_to_data (__u32 x)
{
   __u32 result = 0;
   int i;
   int bits[] = {  4, 12, 5, 13, 15, 7, 14, 6, 11, 3, 10, 2, 0, 8, 1, 9 };
   for (i = 0; i < 16; i++)
	 {
		if (x & BIT (i)) result |= BIT (bits[i]);
		if (x & BIT (16 + i)) result |= BIT (15 - bits[i]) << 16;
	 }
   return (result);
}

/***************************************************************************************************/

/*
 * Probe for 16mbit flash memory on a LART board without doing
 * too much damage. Since we need to write 1 dword to memory,
 * we're f**cked if this happens to be DRAM since we can't
 * restore the memory (otherwise we might exit Read Array mode).
 *
 * Returns 1 if we found 16mbit flash memory on LART, 0 otherwise.
 */
static int flash_probe (void)
{
   __u32 manufacturer,devtype;

   /* setup "Read Identifier Codes" mode */
   write32 (data_to_flash (READ_ID_CODES),0x00000000);

   /* probe U2. U2/U3 returns the same data since the first 3
	* address lines is mangled in the same way */
   manufacturer = flash_to_data (read32 (addr_to_flash (0x00000000,U2)));
   devtype = flash_to_data (read32 (addr_to_flash (0x00000001,U2)));

   /* put the flash back into command mode */
   write32 (data_to_flash (READ_ARRAY),0x00000000);

   return (manufacturer == FLASH_MANUFACTURER && (devtype == FLASH_DEVICE_16mbit_TOP || FLASH_DEVICE_16mbit_BOTTOM));
}

/*
 * Erase one block of flash memory at offset ``offset'' which is any
 * address within the block which should be erased.
 *
 * Returns 1 if successful, 0 otherwise.
 */
static inline int erase_block (__u32 offset)
{
   __u32 status;

#ifdef LART_DEBUG
   printk (KERN_DEBUG "%s(): 0x%.8x\n",__FUNCTION__,offset);
#endif

   /* erase and confirm */
   write32 (data_to_flash (ERASE_SETUP),offset);
   write32 (data_to_flash (ERASE_CONFIRM),offset);

   /* wait for block erase to finish */
   do
	 {
		write32 (data_to_flash (STATUS_READ),offset);
		status = flash_to_data (read32 (offset));
	 }
   while ((~status & STATUS_BUSY) != 0);

   /* put the flash back into command mode */
   write32 (data_to_flash (READ_ARRAY),offset);

   /* was the erase successfull? */
   if ((status & STATUS_ERASE_ERR))
	 {
		printk (KERN_WARNING "%s: erase error at address 0x%.8x.\n",module_name,offset);
		return (0);
	 }

   return (1);
}

static int flash_erase (struct mtd_info *mtd,struct erase_info *instr)
{
   __u32 addr,len;
   int i,first;

#ifdef LART_DEBUG
   printk (KERN_DEBUG "%s(addr = 0x%.8x, len = %d)\n",__FUNCTION__,instr->addr,instr->len);
#endif

   /* sanity checks */
   if (instr->addr + instr->len > mtd->size) return (-EINVAL);

   /*
	* check that both start and end of the requested erase are
	* aligned with the erasesize at the appropriate addresses.
	*
	* skip all erase regions which are ended before the start of
	* the requested erase. Actually, to save on the calculations,
	* we skip to the first erase region which starts after the
	* start of the requested erase, and then go back one.
	*/
   for (i = 0; i < mtd->numeraseregions && instr->addr >= mtd->eraseregions[i].offset; i++) ;
   i--;

   /*
	* ok, now i is pointing at the erase region in which this
	* erase request starts. Check the start of the requested
	* erase range is aligned with the erase size which is in
	* effect here.
	*/
   if (instr->addr & (mtd->eraseregions[i].erasesize - 1)) return (-EINVAL);

   /* Remember the erase region we start on */
   first = i;

   /*
	* next, check that the end of the requested erase is aligned
	* with the erase region at that address.
	*
	* as before, drop back one to point at the region in which
	* the address actually falls
	*/
   for (; i < mtd->numeraseregions && instr->addr + instr->len >= mtd->eraseregions[i].offset; i++) ;
   i--;

   /* is the end aligned on a block boundary? */
   if ((instr->addr + instr->len) & (mtd->eraseregions[i].erasesize - 1)) return (-EINVAL);

   addr = instr->addr;
   len = instr->len;

   i = first;

   /* now erase those blocks */
   while (len)
	 {
		if (!erase_block (addr))
		  {
			 instr->state = MTD_ERASE_FAILED;
			 return (-EIO);
		  }

		addr += mtd->eraseregions[i].erasesize;
		len -= mtd->eraseregions[i].erasesize;

		if (addr == mtd->eraseregions[i].offset + (mtd->eraseregions[i].erasesize * mtd->eraseregions[i].numblocks)) i++;
	 }

   instr->state = MTD_ERASE_DONE;
   if (instr->callback) instr->callback (instr);

   return (0);
}

static int flash_read (struct mtd_info *mtd,loff_t from,size_t len,size_t *retlen,u_char *buf)
{
#ifdef LART_DEBUG
   printk (KERN_DEBUG "%s(from = 0x%.8x, len = %d)\n",__FUNCTION__,(__u32) from,len);
#endif

   /* sanity checks */
   if (!len) return (0);
   if (from + len > mtd->size) return (-EINVAL);

   /* we always read len bytes */
   *retlen = len;

   /* first, we read bytes until we reach a dword boundary */
   if (from & (BUSWIDTH - 1))
	 {
		int gap = BUSWIDTH - (from & (BUSWIDTH - 1));

		while (len && gap--) *buf++ = read8 (from++), len--;
	 }

   /* now we read dwords until we reach a non-dword boundary */
   while (len >= BUSWIDTH)
	 {
		*((__u32 *) buf) = read32 (from);

		buf += BUSWIDTH;
		from += BUSWIDTH;
		len -= BUSWIDTH;
	 }

   /* top up the last unaligned bytes */
   if (len & (BUSWIDTH - 1))
	 while (len--) *buf++ = read8 (from++);

   return (0);
}

/*
 * Write one dword ``x'' to flash memory at offset ``offset''. ``offset''
 * must be 32 bits, i.e. it must be on a dword boundary.
 *
 * Returns 1 if successful, 0 otherwise.
 */
static inline int write_dword (__u32 offset,__u32 x)
{
   __u32 status;

#ifdef LART_DEBUG
   printk (KERN_DEBUG "%s(): 0x%.8x <- 0x%.8x\n",__FUNCTION__,offset,x);
#endif

   /* setup writing */
   write32 (data_to_flash (PGM_SETUP),offset);

   /* write the data */
   write32 (x,offset);

   /* wait for the write to finish */
   do
	 {
		write32 (data_to_flash (STATUS_READ),offset);
		status = flash_to_data (read32 (offset));
	 }
   while ((~status & STATUS_BUSY) != 0);

   /* put the flash back into command mode */
   write32 (data_to_flash (READ_ARRAY),offset);

   /* was the write successfull? */
   if ((status & STATUS_PGM_ERR) || read32 (offset) != x)
	 {
		printk (KERN_WARNING "%s: write error at address 0x%.8x.\n",module_name,offset);
		return (0);
	 }

   return (1);
}

static int flash_write (struct mtd_info *mtd,loff_t to,size_t len,size_t *retlen,const u_char *buf)
{
   __u8 tmp[4];
   int i,n;

#ifdef LART_DEBUG
   printk (KERN_DEBUG "%s(to = 0x%.8x, len = %d)\n",__FUNCTION__,(__u32) to,len);
#endif

   *retlen = 0;

   /* sanity checks */
   if (!len) return (0);
   if (to + len > mtd->size) return (-EINVAL);

   /* first, we write a 0xFF.... padded byte until we reach a dword boundary */
   if (to & (BUSWIDTH - 1))
	 {
		__u32 aligned = to & ~(BUSWIDTH - 1);
		int gap = to - aligned;

		i = n = 0;

		while (gap--) tmp[i++] = 0xFF;
		while (len && i < BUSWIDTH) tmp[i++] = buf[n++], len--;
		while (i < BUSWIDTH) tmp[i++] = 0xFF;

		if (!write_dword (aligned,*((__u32 *) tmp))) return (-EIO);

		to += n;
		buf += n;
		*retlen += n;
	 }

   /* now we write dwords until we reach a non-dword boundary */
   while (len >= BUSWIDTH)
	 {
		if (!write_dword (to,*((__u32 *) buf))) return (-EIO);

		to += BUSWIDTH;
		buf += BUSWIDTH;
		*retlen += BUSWIDTH;
		len -= BUSWIDTH;
	 }

   /* top up the last unaligned bytes, padded with 0xFF.... */
   if (len & (BUSWIDTH - 1))
	 {
		i = n = 0;

		while (len--) tmp[i++] = buf[n++];
		while (i < BUSWIDTH) tmp[i++] = 0xFF;

		if (!write_dword (to,*((__u32 *) tmp))) return (-EIO);

		*retlen += n;
	 }

   return (0);
}

/***************************************************************************************************/

#define NB_OF(x) (sizeof (x) / sizeof (x[0]))

static int initialized = 0;
static struct mtd_info mtd;

static struct mtd_erase_region_info erase_regions[] =
{
   /* parameter blocks */
   {
	     offset: 0x00000000,
	  erasesize: FLASH_BLOCKSIZE_PARAM,
	  numblocks: FLASH_NUMBLOCKS_16m_PARAM
   },
   /* main blocks */
   {
	     offset: FLASH_BLOCKSIZE_PARAM * FLASH_NUMBLOCKS_16m_PARAM,
	  erasesize: FLASH_BLOCKSIZE_MAIN,
	  numblocks: FLASH_NUMBLOCKS_16m_MAIN
   }
};

#ifdef HAVE_PARTITIONS
static struct mtd_partition lart_partitions[] =
{
   /* blob */
   {
	       name: "blob",
	     offset: BLOB_START,
	       size: BLOB_LEN,
	 mask_flags: 0
   },
   /* kernel */
   {
	       name: "kernel",
	     offset: KERNEL_START,			/* MTDPART_OFS_APPEND */
	       size: KERNEL_LEN,
	 mask_flags: 0
   },
   /* initial ramdisk */
   {
	       name: "initial ramdisk",
	     offset: INITRD_START,			/* MTDPART_OFS_APPEND */
	       size: INITRD_LEN,			/* MTDPART_SIZ_FULL */
	 mask_flags: 0
   }
};
#endif

int __init lart_flash_init (void)
{
   int result;
   memset (&mtd,0,sizeof (mtd));
   printk ("MTD driver for LART. Written by Abraham vd Merwe<abraham@2d3d.co.za>\n");
   printk ("%s: Probing for 28F160x3 flash on LART...\n",module_name);
   if (!flash_probe ())
	 {
		printk (KERN_WARNING "%s: Found no LART compatible flash device\n",module_name);
		return (-ENXIO);
	 }
   printk ("%s: This looks like a LART board to me.\n",module_name);
   mtd.name = module_name;
   mtd.type = MTD_NORFLASH;
   mtd.flags = MTD_CAP_NORFLASH;
   mtd.size = FLASH_BLOCKSIZE_PARAM * FLASH_NUMBLOCKS_16m_PARAM + FLASH_BLOCKSIZE_MAIN * FLASH_NUMBLOCKS_16m_MAIN;
   mtd.erasesize = FLASH_BLOCKSIZE_MAIN;
   mtd.numeraseregions = NB_OF (erase_regions);
   mtd.eraseregions = erase_regions;
   mtd.module = THIS_MODULE;
   mtd.erase = flash_erase;
   mtd.read = flash_read;
   mtd.write = flash_write;

#ifdef LART_DEBUG
   printk (KERN_DEBUG
		   "mtd.name = %s\n"
		   "mtd.size = 0x%.8x (%uM)\n"
		   "mtd.erasesize = 0x%.8x (%uK)\n"
		   "mtd.numeraseregions = %d\n",
		   mtd.name,
		   mtd.size,mtd.size / (1024*1024),
		   mtd.erasesize,mtd.erasesize / 1024,
		   mtd.numeraseregions);

   if (mtd.numeraseregions)
	 for (result = 0; result < mtd.numeraseregions; result++)
	   printk (KERN_DEBUG
			   "\n\n"
			   "mtd.eraseregions[%d].offset = 0x%.8x\n"
			   "mtd.eraseregions[%d].erasesize = 0x%.8x (%uK)\n"
			   "mtd.eraseregions[%d].numblocks = %d\n",
			   result,mtd.eraseregions[result].offset,
			   result,mtd.eraseregions[result].erasesize,mtd.eraseregions[result].erasesize / 1024,
			   result,mtd.eraseregions[result].numblocks);

   printk ("\npartitions = %d\n",NB_OF (lart_partitions));

   for (result = 0; result < NB_OF (lart_partitions); result++)
	 printk (KERN_DEBUG
			 "\n\n"
			 "lart_partitions[%d].name = %s\n"
			 "lart_partitions[%d].offset = 0x%.8x\n"
			 "lart_partitions[%d].size = 0x%.8x (%uK)\n",
			 result,lart_partitions[result].name,
			 result,lart_partitions[result].offset,
			 result,lart_partitions[result].size,lart_partitions[result].size / 1024);
#endif

#ifndef HAVE_PARTITIONS
   result = add_mtd_device (&mtd);
#else
   result = add_mtd_partitions (&mtd,lart_partitions,NB_OF (lart_partitions));
#endif

   initialized = 1;
   return (result);
}

void __exit lart_flash_exit (void)
{
   if (initialized)
	 {
#ifndef HAVE_PARTITIONS
		del_mtd_device (&mtd);
#else
		del_mtd_partitions (&mtd);
#endif
	 }
}

module_init (lart_flash_init);
module_exit (lart_flash_exit);


--lrZ03NoBR/3+SXJZ--

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7JLmZzNXhP0RCUqMRAuK0AKCK1C4/+SypFZC3GQHGoyUTl+Tl1ACff9qX
wf0n87tMCbbtOgYLGDCDo/A=
=HZlB
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
