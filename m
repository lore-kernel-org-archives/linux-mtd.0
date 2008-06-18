Received: from ironport2-out.teksavvy.com ([206.248.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8z0A-0003a1-4Y
	for linux-mtd@lists.infradead.org; Wed, 18 Jun 2008 14:51:10 +0000
Received: from Basil ([216.187.106.204])
	by mail.pppoe.ca (Internet Mail Server v1.0) with ESMTP id YUR79706
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2008 10:51:06 -0400
Received: from basil ([127.0.0.1] helo=jsoft.ca)
	by Basil with esmtp (Exim 3.36 #1 (Debian)) id 1K8zQS-00047L-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2008 11:18:20 -0400
Message-ID: <1374.128.100.203.197.1213802300.squirrel@128.100.203.197>
Date: Wed, 18 Jun 2008 11:18:20 -0400 (EDT)
Subject: trouble with a 16MB DOC Millenium
From: "Jesse Malone" <jmalone@jsoft.ca>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Reply-To: jmalone@jsoft.ca
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've been trying to get a DOC Millenium working with a 2.6.23 kernel with
the mtd drivers compiled into the kernel. The NFTL driver is not happy.
After formatting with the dos utility from M-Sys I get this output from
the nftl driver:

****************************************************************************
NFTL driver: nftlcore.c $Revision: 1.98 $, nftlmount.c $Revision: 1.41 $
INFTL: inftlcore.c $Revision: 1.19 $, inftlmount.c $Revision: 1.18 $
DiskOnChip found at 0xd0000
NAND device: Manufacturer ID: 0x98, Chip ID: 0xe6 (Toshiba NAND 8MiB 3,3V
8-bit)
Found DiskOnChip ANAND Media Header at 0xe000
Found DiskOnChip ANAND Media Header at 0x10000
    DataOrgID        = ANAND
    NumEraseUnits    = 2041
    FirstPhysicalEUN = 7
    FormattedSize    = 16359424
    UnitSizeFactor   = 0
UnitSizeFactor=0x00 detected.  Correct value is assumed to be 0xff.
Bad block table at page 113, version 0x55
Bad block table at page 129, version 0x55
INFTL: could not find valid boot record?
INFTL: could not mount device
NFTL Media Header sanity check failed:
numvunits (1997) > nb_blocks (1024) - nb_boot_blocks(7) - 2
Could not find valid boot record
NFTL: could not mount device
************************************************************************

I ran nftl_format on /dev/mtd0, which appears to have done some good. I
think I may have access to the nftla1 device, though its not mounted and
its giving me errors about media headers dissagreeing. Here's the output
after doing the nftl_format:

**************************************************************************
NFTL driver: nftlcore.c $Revision: 1.98 $, nftlmount.c $Revision: 1.41 $
INFTL: inftlcore.c $Revision: 1.19 $, inftlmount.c $Revision: 1.18 $
DiskOnChip found at 0xd0000
NAND device: Manufacturer ID: 0x98, Chip ID: 0xe6 (Toshiba NAND 8MiB 3,3V
8-bit)
Found DiskOnChip ANAND Media Header at 0x0
Found DiskOnChip ANAND Media Header at 0x2000
    DataOrgID        = ANAND
    NumEraseUnits    = 1024
    FirstPhysicalEUN = 0
    FormattedSize    = 8290304
    UnitSizeFactor   = 255
Bad block table at page 1, version 0xFF
Bad block table at page 17, version 0xFF
nand_read_bbt: Bad block at 0x0000e000
nand_read_bbt: Bad block at 0x00010000
nand_read_bbt: Bad block at 0x00014000
nand_read_bbt: Bad block at 0x00016000
nand_read_bbt: Bad block at 0x00018000
nand_read_bbt: Bad block at 0x0001a000
nand_read_bbt: Bad block at 0x0001c000
INFTL: could not find valid boot record?
INFTL: could not mount device
NFTL Media Headers at 0x0 and 0xe000 disagree.
NFTL Media Headers at 0x0 and 0x10000 disagree.
 nftla: unknown partition table
***************************************************************


I'd like to see if I can partition it, but the warning about media headers
dissagreeing concerns me. Any advice would be very much appreciated.

Just to provide a bit more info, here's the output from the M-Sys DINFO
utility(before I did nftl_format):

 GENERAL INFO.
ßßßßßßßßßßßßßßß
	Physical Address:  0xD0000
	DiskOnChip Type :  DiskOnChip Millennium
	Flash Type      :  TC5864
	FormatType      :  NFTL
	TrueFFS version :  5.1.4
	Driver Version  :  DOS 5.1.4
	Sectors         :  2
	Heads           :  16
	Cylinders       :  998
	Boot Area Size  :  57344 Bytes
	Logical Sectors :  31952
	Phy. UnitSize   :  8192 Bytes
	Physical Size   :  16777216 (16 MB)
	Unit Size       :  8192 Bytes
	Media Size      :  16777216 Bytes (16 MB)
	Chip Size       :  8388608 Bytes (8 MB)
	No Of Chips     :  2
	Interleaving    :  1
 BDTL INFO.
ßßßßßßßßßßßß
The Media is not Divided to partitions


	Partition number: 1
		Size               :  16351232 Bytes (15.6 MB)
		Format Type        :  Fat Format
		Protection Status  :  Not Protected



-Jesse
