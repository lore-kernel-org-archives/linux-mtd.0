Received: from web20404.mail.yahoo.com ([66.163.169.92]
	helo=web20416.mail.yahoo.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AoK16-0006h5-M6
	for linux-mtd@lists.infradead.org; Wed, 04 Feb 2004 10:12:20 +0000
Message-ID: <20040204101218.92472.qmail@web20416.mail.yahoo.com>
Date: Wed, 4 Feb 2004 02:12:18 -0800 (PST)
From: Roy Lauer <rlaor@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Problems with DOC Millennium Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> The DiskOnChip Millennium Plus uses INFTL not NFTL.
You should be very
> careful using the current INFTL code -- it does not
observe the Bad Block Table.

What does it mean?
Does it mean that practically the current INFTL code
is unusable with the DiskOnChip Millennium Plus?

The DOC is recognized correctly but I keep getting
"corrupt block" errors (please see the log below).

It is because of the Bad Block Table, or is there
another reason?

Please help.

Roy Lauer
Commil Ltd.


INFTL: inftlcore.c $Revision: 1.14 $, inftlmount.c
$Revision: 1.12 $
Using configured DiskOnChip probe address 0xf0400000
DiskOnChip Millennium Plus found at address 0xF0400000
Flash chip found: Manufacturer ID: 98, Chip ID: 75
(Toshiba:NAND 32MiB 3,3V)
Flash chip found: Manufacturer ID: 98, Chip ID: 75
(Toshiba:NAND 32MiB 3,3V)
2 flash chips found. Total DiskOnChip size: 64 MiB
mtd: Giving out device 0 to DiskOnChip Millennium Plus
INFTL: Media Header ->
    bootRecordID          = BNAND
    NoOfBootImageBlocks   = -1
    NoOfBinaryPartitions  = 1
    NoOfBDTLPartitions    = 1
    BlockMultiplerBits    = 0
    FormatFlgs            = 1
    OsakVersion           = 0x35313430
    PercentUsed           = 98
    PARTITION[0] ->
        virtualUnits    = 32
        firstUnit       = 4
        lastUnit        = 35
        flags           = 0x20000000
        spareUnits      = 0
    PARTITION[1] ->
        virtualUnits    = 1969
        firstUnit       = 37
        lastUnit        = 2047
        flags           = 0xc0000000
        spareUnits      = 2
INFTL: corrupt block 1024 in chain 1024, chain length
0, erase mark 0xbf?
INFTL: formatting chain at block 1024
INFTL: formatting block 1024
MTD: Error 0xffffffa5 erasing at 0x2000000
INFTL: error while formatting block 1024
INFTL: corrupt block 1025 in chain 1025, chain length
0, erase mark 0xbf?
INFTL: formatting chain at block 1025
INFTL: formatting block 1025
MTD: Error 0xffffffa5 erasing at 0x2008000
INFTL: error while formatting block 1025
INFTL: corrupt block 1026 in chain 1026, chain length
0, erase mark 0xbf?
INFTL: formatting chain at block 1026
INFTL: formatting block 1026
MTD: Error 0xffffffa5 erasing at 0x2010000
INFTL: error while formatting block 1026
INFTL: corrupt block 1027 in chain 1027, chain length
0, erase mark 0xbf?
INFTL: formatting chain at block 1027
INFTL: formatting block 1027
MTD: Error 0xffffffa5 erasing at 0x2018000
INFTL: error while formatting block 1027
INFTL: corrupt block 1028 in cha
......


__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/
