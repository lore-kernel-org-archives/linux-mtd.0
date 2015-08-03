Received: from valiant.selinc.com ([74.117.214.141])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMP3t-0007zf-5m
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 23:22:30 +0000
Received: from edison.ad.selinc.com (edison.ad.selinc.com [10.100.0.15])
 by valiant.selinc.com (8.15.0.59/8.14.7) with ESMTP id t73N3jf9014438
 for <linux-mtd@lists.infradead.org>; Mon, 3 Aug 2015 16:03:45 -0700
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Subject: Trying to understand nand_chip->chipsize inconsistencies
Message-ID: <OF2E1FCDDB.D3A51309-ON88257E96.00804E52-88257E96.00805C0A@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Mon, 3 Aug 2015 16:22:01 -0700
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, 

We're currently running the 3.0 kernel on an MPC8349 with a Samsung 
K9WAG08U1A NAND flash (which is non-ONFI).  We're migrating to an ONFI 
compliant Micron MT29F16G08AJADAWP part, and I'm seeing some 
inconsistencies in the way nand_chip->chipsize is being calculated that I 
need some help in understanding. 

Both parts contain multiple die in the same package and each have two 
chipselects.  In the case of the Samsung part there are two die and two 
chipselects (1/die) whereas the Micron has four die and two chipselects 
(2/die).  The Micron part has a lower density on each die, so both 
packages are 16GiBits or 2GiBytes. 

If you follow through the non-ONFI path of nand_get_flash_type, 
nand_chip->chipsize gets calculated from the "chipsize in MegaByte" field 
in nand_lash_ids[], and is based on the ID code returned from the flash 
part via a READ_ID address 0x00.  For both the Samsung and the Micron 
parts that ID code is 0xD3, which is an 8GiBit part. nand_get_flash_type() 
calculates "chip->chipsize = (uint64_t)type->chipsize << 20;" resulting in 
chip->chipsize of 1GiByte.  This seems reasonable to me since each 
chipselect on the part controls 1GiByte and as far as the processor and 
the kernel are concerned each chipselect is a different chip. 

Now looking at the ONFI path for the Micron part, I get the following from 
the parameter page data structure in the nand_onfi_params structure: 

pyte_per_page = 0x800 
spare_bytes_per_page = 0x40 
pages_per_block = 0x40 
block_per_lun = 0x1000 
lun_count = 0x4 

>From the 3.0 kernel (condensing several lines of code) we have: 
nand_chip->chipsize = blocks_per_lun * pages_per_block * byte_per_page = 
0x1000 * 0x40 * 0x800 = 512MByte (hummm, seems a little small) 

>From the 3.10 kernel we have: 
nand_chip->chipsize = lun_count * blocks_per_lun * pages_per_block * 
byte_per_page 
                                          = 0x4 *  0x1000 * 0x40 * 0x800 = 
2GiByte (which is the size of the entire PACKAGE not a single chipselect) 

The 4.0 kernel does that last calculation using shifts because of the 
possibility that pages_per_block and blocks_per_lun may not be a 
power-of-2, but in my case they are so the math works out the same so that 
nand_chip->chipsize = 2GiByte. 

Any way you slice it I get a different value for nand_chip->chipsize 
between the ONFI and non-ONFI paths through nand_get_flash_type.  So here 
are my questions: 

1) Do I not have a good understanding of what chipsize should be?  My 
assumption for years (based on my experience with the Samsung parts) was 
that it represented the size of what was controlled by a SINGLE chipselect 
regardless of the number of chipselects a package may have. 
2) Or is the calculation of chipsize in the 3.10 and 4.0 kernels (based on 
the lun_count of 4 from the Micron part) somehow wrong?  It is absolutely 
true that the Micron part has 4 logical units (defined by ONFI as "the 
minimum unit that can independently execute commands and report status"), 
but it only has TWO targets (defined by ONFI as "the unit of memory access 
by a chip enable"), and each target is 1GiByte so it seems to me that 
chipsize should be 1GiByte and each chipselect has a nand_chip struct 
associated with it. 
3) (most likely) Am I completely off the rails here and don't have a clue 
what I'm talking about (if that isn't an invitation of flaming I don't 
know what is :)  ) 

Thank for any guidance anyone can give. 

Bruce 
