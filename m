From: nicola76@inwind.it (Nicola)
Date: 14 Feb 2003 10:05:44 +0100
Subject: buswidth and mtd map file
Message-ID: <1045213544.1191.29.camel@localhost.localdomain>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,
I would ask you some question that are driving me crazy: after scanning
flash for node (after debug i see that nodes are readed correctly) jffs2
dead or seems become very slow. 

I want to use JFFS2 root image on my flash Intel strataflash (NOR)
28F320C3.

Firstly i unlock all flash at bootloader time.

1) My flash is with bus width 16 (x16) so i put BUSWIDTH = 2 in my map
file in drivers/mtd/maps/.  

I see in ixp425.c map file that function for read/write 8 bit from flash
are not implemented, and there is not copy_to function.

static struct map_info ixp425_map = {
	name: 		"IXP425 Flash",
	buswidth: 	BUSWIDTH, (= 2)
	read16:		ixp425_read16,
	copy_from:	ixp425_copy_from,
	write16:	ixp425_write16,
};

But in file edb7312.c they are implemented, in both file the BUSWIDTH =
2.

struct map_info edb7312nor_map = {
	name: "NOR flash on EDB7312",
	size: WINDOW_SIZE,
	buswidth: BUSWIDTH, (= 2)
	read8: edb7312nor_read8,
	read16: edb7312nor_read16,
	read32: edb7312nor_read32,
#ifdef CFI_WORD_64
	read64: edb7312nor_read64,
#endif
	copy_from: edb7312nor_copy_from,
	write8: edb7312nor_write8,
	write16: edb7312nor_write16,
	write32: edb7312nor_write32,
#ifdef CFI_WORD_64
	write64: edb7312nor_write64,
#endif
	copy_to: edb7312nor_copy_to
};

What mean this? I need to implement all this function:
xxx_read 8, xxx_read 16, xxx_read 32 xxx_copy_from, 
xxx_write8, xxx_write16, xxx_write32, xxx_copt_to
or only 16 bit function or what?

I think i can't load jffs2 image for problem related these functions,
I will be very pleased if anyone can help me!

Best Regards,
Nicola  
   
