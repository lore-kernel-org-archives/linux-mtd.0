From: Amit.Lubovsky@infineon.com (Amit.Lubovsky at infineon.com)
Date: Tue, 4 Mar 2003 10:35:43 +0100
Subject: AMD - Am29LV160B
Message-ID: <04C8EDC5AE3FD611ABE40002B39CF69B07F2E0@ntah901e.savan.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C2E231.6D67F6C0
Content-Type: text/plain

Thanks,


I have applied BUSWIDTH 4 in the mapping driver and my

	Memory Technology Devices (MTD)  ---> RAM/ROM/Flash chip drivers

looks like:

    	 [*]   Common Flash Interface (CFI) support                       x
x   
  x x    [ ]   CFI Virtual erase regions (EXPERIMENTAL)                   x
x   
  x x    [*]   CFI Advanced configuration options                         x
x   
  x x    (BIG_ENDIAN_BYTE) Flash cmd/query data swapping                  x
x   
  x x    [*]   Specific CFI Flash geometry selection                      x
x   
  x x    [ ]     Support  8-bit buswidth                                  x
x   
  x x    [ ]     Support 16-bit buswidth                                  x
x   
  x x    [*]     Support 32-bit buswidth                                  x
x   
  x x    [ ]     Support 1-chip flash interleave                          x
x   
  x x    [*]     Support 2-chip flash interleave                          x
x   
  x x    [ ]     Support 4-chip flash interleave                          x
x   
  x x    [ ]     CFI support for Intel/Sharp Basic/Extended Commands      x
x   
  x x    [*]     CFI support for AMD/Fujitsu Standard Commands            x
x   
  x x    [ ]   AMD compatible flash chip support (non-CFI)                x
x   
  x x    [ ]   pre-CFI Sharp chip support                                 x
x   
  x x    [ ]   Support for RAM chips in bus mapping                       x
x   
  x x    [ ]   Support for ROM chips in bus mapping                       x
x   
  
I have allso tried the no swap, but still get :
	"Physically mapped flash: Found no CFI device at location zero"

( I run in big endian mode),

attached is the mapping driver I use.

Any other ideas?
Thanks,
Amit.

-----Original Message-----
From: Russ Dill [mailto:Russ.Dill at asu.edu]
Sent: Tuesday, March 04, 2003 3:51 AM
To: Lubovsky Amit
Cc: linux-mtd at lists.infradead.org
Subject: Re: AMD - Am29LV160B


On Mon, 2003-03-03 at 12:39, Russ Dill wrote:
> On Mon, 2003-03-03 at 07:08, Amit.Lubovsky at infineon.com wrote:
> > Hi,
> > 
> > Has anyone used the mtd device with the AMD
> > Am29LV160B chips? They are 16 Megabit (2M x 8-Bit/1M x 16-Bit) chips
> > and are CFI-compatible.
> > 
> > I work with kernel 2.4.6 and am trying to detect 4MB,
> > 2 x16 bit devices in parallel (32 bit access) at address 0,
> 
> they work great on my device (as well as the Am29LV800B, which are not
> CFI)
> 
> > #define BUSWIDTH 2
> 
> I'm away from my code right now, but shouldn't this be 32?

replying to myself here, the correct buswidth for 2 x16 devices in
parallel is 4


------_=_NextPart_000_01C2E231.6D67F6C0
Content-Type: application/octet-stream;
	name="purple.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="purple.c"

#include <linux/module.h>=0A=
#include <linux/types.h>=0A=
#include <linux/kernel.h>=0A=
#include <asm/io.h>=0A=
#include <linux/mtd/mtd.h>=0A=
#include <linux/mtd/map.h>=0A=
#include <linux/mtd/partitions.h>=0A=
#include <linux/config.h>=0A=
=0A=
=0A=
/* where is the flash located */=0A=
#define WINDOW_ADDR 0xb0000000=0A=
#define WINDOW_SIZE 0x400000=0A=
#define BUSWIDTH 4=0A=
=0A=
static struct mtd_info *mymtd;=0A=
=0A=
__u8 purple_read8(struct map_info *map, unsigned long ofs)=0A=
{=0A=
	return __raw_readb(map->map_priv_1 + ofs);=0A=
}=0A=
=0A=
__u16 purple_read16(struct map_info *map, unsigned long ofs)=0A=
{=0A=
	return __raw_readw(map->map_priv_1 + ofs);=0A=
}=0A=
=0A=
__u32 purple_read32(struct map_info *map, unsigned long ofs)=0A=
{=0A=
	return __raw_readl(map->map_priv_1 + ofs);=0A=
}=0A=
=0A=
void purple_copy_from(struct map_info *map, void *to, unsigned long =
from, ssize_t len)=0A=
{=0A=
	memcpy_fromio(to, map->map_priv_1 + from, len);=0A=
}=0A=
=0A=
void purple_write8(struct map_info *map, __u8 d, unsigned long adr)=0A=
{=0A=
	__raw_writeb(d, map->map_priv_1 + adr);=0A=
	mb();=0A=
}=0A=
=0A=
void purple_write16(struct map_info *map, __u16 d, unsigned long =
adr)=0A=
{=0A=
	__raw_writew(d, map->map_priv_1 + adr);=0A=
	mb();=0A=
}=0A=
=0A=
void purple_write32(struct map_info *map, __u32 d, unsigned long =
adr)=0A=
{=0A=
	__raw_writel(d, map->map_priv_1 + adr);=0A=
	mb();=0A=
}=0A=
=0A=
void purple_copy_to(struct map_info *map, unsigned long to, const void =
*from, ssize_t len)=0A=
{=0A=
	memcpy_toio(map->map_priv_1 + to, from, len);=0A=
}=0A=
=0A=
struct map_info purple_map =3D {=0A=
	name: "Physically mapped flash",=0A=
	size: WINDOW_SIZE,=0A=
	buswidth: BUSWIDTH,=0A=
	read8: purple_read8,=0A=
	read16: purple_read16,=0A=
	read32: purple_read32,=0A=
	copy_from: purple_copy_from,=0A=
	write8: purple_write8,=0A=
	write16: purple_write16,=0A=
	write32: purple_write32,=0A=
	copy_to: purple_copy_to=0A=
};=0A=
=0A=
/*=0A=
 * MTD 'PARTITIONING' STUFF =0A=
 */=0A=
=0A=
#if 0=0A=
static struct mtd_partition purple_partitions[]=3D{=0A=
	    { name: "boot partition", =0A=
	      offset: 0, =0A=
	      size: 0x200000 },=0A=
            { name: "partition 1", =0A=
	      offset: 0x200000, =0A=
	      size: 0x200000 },=0A=
            { name: "partition 2",=0A=
	      size: 0x400000, =0A=
              offset: 0x400000 }=0A=
};=0A=
#endif=0A=
=0A=
static struct mtd_partition purple_partitions[]=3D{=0A=
	    { name: "boot partition", =0A=
	      offset: 0, =0A=
	      size: 0x100000 },=0A=
            { name: "partition 1", =0A=
	      offset: 0x100000, =0A=
	      size: 0x100000 },=0A=
            { name: "partition 2",=0A=
	      size: 0x200000, =0A=
              offset: 0x200000 }=0A=
};=0A=
=0A=
#if LINUX_VERSION_CODE < 0x20212 && defined(MODULE)=0A=
#define init_purple init_module=0A=
#define cleanup_purple cleanup_module=0A=
#endif=0A=
=0A=
int __init init_purple(void)=0A=
{=0A=
       	printk(KERN_NOTICE "purple flash device: %x@%x\n", =
WINDOW_SIZE, WINDOW_ADDR);=0A=
	purple_map.map_priv_1 =3D (unsigned long)ioremap(WINDOW_ADDR, =
WINDOW_SIZE);=0A=
=0A=
	if (!purple_map.map_priv_1) {=0A=
		printk("Failed to ioremap\n");=0A=
		return -EIO;=0A=
	}=0A=
=0A=
	mymtd =3D do_map_probe("cfi", &purple_map);=0A=
	printk("mymtd=3D0x%08x\n",mymtd);=0A=
	if (mymtd) {=0A=
		mymtd->module =3D THIS_MODULE;=0A=
=0A=
		return add_mtd_partitions(mymtd, purple_partitions, 3);=0A=
	}=0A=
=0A=
	iounmap((void *)purple_map.map_priv_1);=0A=
	return -ENXIO;=0A=
}=0A=
=0A=
static void __exit cleanup_purple(void)=0A=
{=0A=
	if (mymtd) {=0A=
		del_mtd_partitions(mymtd);=0A=
		map_destroy(mymtd);=0A=
	}=0A=
	if (purple_map.map_priv_1) {=0A=
		iounmap((void *)purple_map.map_priv_1);=0A=
		purple_map.map_priv_1 =3D 0;=0A=
	}=0A=
}=0A=
=0A=
module_init(init_purple);=0A=
module_exit(cleanup_purple);=0A=

------_=_NextPart_000_01C2E231.6D67F6C0--
