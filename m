From: nicola76@inwind.it (Nicola)
Date: 14 Feb 2003 17:14:34 +0100
Subject: jffs2 question for Guru
Message-ID: <1045239274.1191.58.camel@localhost.localdomain>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,
I have a important question to ask someone very inside in code jff2.
My Flash is Intel strataflash (NOR) 28F320C3, for space address
optimization FPGA that work as companion chip of an Xscale 80200 use I/O
space very singolar. In particular my physic base address for flash is
0x8000:0000. If i want read from location addr = 0x100 from the base of
the flash i need to read from addr<<2.

In pratice the simple read and write 16bit function for flash in mtd map
file become:

static void tat_write16(struct map_info *map, __u16 d, unsigned long
adr)
{
	*(__u16 *)(map->map_priv_1 + (adr << 2) ) = d;
}  

static __u16 tat_read16(struct map_info *map, unsigned long ofs)
{

	return *(__u16 *)(map->map_priv_1 + (ofs << 2) );
}

After debug i see that i reach to probe and read flash characteristic,
and i reach to scan jffs2 root partition but all the process is very
slowly. 
This strange offset access can give problem in any point of jffs2 code?
Or as I do is sufficient to rearrange only the function in structure
static struct map_info tat_map = {
	name: 		"TAT-Flash",
	size: 		WINDOW_SIZE,
	buswidth: 	BUSWIDTH,(=2)
	read8:		tat_read8,
	read16:		tat_read16,
	read32:		tat_read32,
	copy_from:	tat_copy_from,
	write8:		tat_write8,
	write16:	tat_write16,
	write32:	tat_write32,
	copy_to:	tat_copy_to
};
PS: TAT is my piece of hardware!! 
:)--------------------------PLEASE HELP ME-----------------------:)
