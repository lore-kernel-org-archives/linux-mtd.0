Received: from smtpauth02.prod.mesa1.secureserver.net ([64.202.165.182])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1II7lY-0002Af-2d
	for linux-mtd@lists.infradead.org; Mon, 06 Aug 2007 14:57:21 -0400
Message-ID: <46B76F31.6020507@techmoninc.com>
Date: Mon, 06 Aug 2007 13:57:53 -0500
From: Andy Kennedy <akennedy@techmoninc.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: DiskOnChip 2000 (DOC 2000) woes.
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have been tasked to install Linux on a DOC 2000 on a SBC by 
Winsystems.  Since the DOC has reached EOL (July 1, 2007 -- for those 
that didn't know this) Winsystems won't assist me in this task -- and he 
got rid of all his work towards this end a few weeks ago, so I'm out of 
luck there.

What I have done:
Made a all-in-one kernel with BusyBox as the init for the initrd.
Included MTD support in the kernel -- including NFTL.
    I do get a /dev/mtd0 that I can access rw.
    I also get the following message at boot:
        NFTL driver: nftlcore.c $Revision: 1.98 $, nftlmount.c 
$Revision: 1.41 $
        DiskOnChip found at 0xd8000
        DiskOnChip 2000 responds to DWORD access
        NAND device: Manufacturer ID: 0xec, Chip ID: 0x75 (Samsung NAND 
32MiB 3,3V 8-bit)
        Found DiskOnChip ANAND Media Header at 0x0
        Found DiskOnChip ANAND Media Header at 0x4000
            DataOrgID        = ANAND
            NumEraseUnits    = 2048
            FirstPhysicalEUN = 0
            FormattedSize    = 32849920
            UnitSizeFactor   = 255
        mtd: Giving out device 0 to DiskOnChip 2000 (NFTL Model)
        NFTL: add_mtd for DiskOnChip 2000 (NFTL Model)
        nand_read_oob: from = 0x00000200, len = 8
        nand_isbad_bbt(): bbt info for offs 0x00000000: (block 0) 
0x02                                                                   
<snip> ...
        nand_isbad_bbt(): bbt info for offs 0x01ff8000: (block 2046) 0x00
        nand_isbad_bbt(): bbt info for offs 0x01ffc000: (block 2047) 0x00
        nand_read_oob: from = 0x00004200, len = 8
        nand_read_oob: from = 0x0000c200, len = 8
        NFTL Media Headers at 0x0 and 0xc000 disagree.
        nand_read_oob: from = 0x00010200, len = 8
        NFTL Media Headers at 0x0 and 0x10000 disagree.
        nand_read_oob: from = 0x00008000, len = 8
<snip> ...
        nand_read_oob: from = 0x01fffe00, len = 16
        nand_write_oob: to = 0x01ffc200, len = 8
        NFTL: cannot calculate a geometry to match size of 0xfaa0.
        NFTL: using C:1002 H:16 S:4 (== 0xfa80 sects)
         nftla: unknown partition table
I didn't start getting this error at first - other than the nftla: 
unknown partition table - until I attempted to nftl-format the DOC.  
After reading through the archive (which I have done extensively) I 
found that I may have needed to load the nftl driver AFTER the 
nftl-format took place.  The first boot, however, it looked like the 
NFTL driver itself formated the DOC -- Is this correct?

I've looked all over for a *good* and recent howto for the DOC, however, 
I cannot locate one.  Searching through the list hasn't helped me much 
either.  Other questions I have are as follows:

Can I build Ext3 onto DOC using the NFTL driver in Kernel 2.6.22.1?
Can I use lilo on the DOC using the NFTL driver?
Will I be able to boot from the DOC with the NFTL replacement firmware 
if the Caldera DOS with the M-systems drivers do?

My next task in attempting to make this work is to reformat the system 
with DOS and ensure that the DOS drivers can load everything.  I was 
also thinking of grabbing one of the newer systems that I have to make 
sure I have a good firmware version -- I don't think I have the 
latest/greatest firmware loaded at this moment, and the dformat command 
that I found online somewhere (as it appears that all of the DOS utils 
are removed from the Sandisk website) is version .  Is this the latest 
and does anyone have a copy of newer utils/images?  Do I need these 
utilities to get a bootable Linux onto the DOC?

Thanks for any assistance you can offer,
Andy
