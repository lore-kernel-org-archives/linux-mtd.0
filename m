From: splee@plexio.com (Stephen Lee)
Date: 22 Mar 2003 14:12:52 -0800
Subject: UnitSizeFactor of != 1
Message-ID: <1048371172.1876.135.camel@ralph.plexio.private>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,

I'm trying to format and install Peewee Linux on a 32M DiskOnChip2000
and have done the following:

1. Formatted the DOC with "dformat /win:D000 /s:doc524.exb". There were
no apparent errors.
2. Rebooted under Redhat7.1 with a stock 2.4.20 kernel with the
following kernel config settings:

CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=1
CONFIG_MTD_CHAR=y
CONFIG_MTD_DOC2000=y
CONFIG_MTD_DOCPROBE=y
CONFIG_MTD_DOCPROBE_ADDRESS=0
CONFIG_NFTL=y
CONFIG_NFTL_RW=y


and here's a portion of the kernel boot log:

Possible DiskOnChip with unknown ChipID FF found at 0xc8000
Possible DiskOnChip with unknown ChipID FF found at 0xca000
Possible DiskOnChip with unknown ChipID FF found at 0xcc000
Possible DiskOnChip with unknown ChipID FF found at 0xce000
DiskOnChip 2000 found at address 0xD0000
Flash chip found: Manufacturer ID: 98, Chip ID: 75 (Toshiba
TC58256FT/DC)
1 flash chips found. Total DiskOnChip size: 32 MiB
mtd: Giving out device 0 to DiskOnChip 2000
Possible DiskOnChip with unknown ChipID FF found at 0xd2000
Possible DiskOnChip with unknown ChipID FF found at 0xd4000
Possible DiskOnChip with unknown ChipID FF found at 0xd6000
Possible DiskOnChip with unknown ChipID FF found at 0xd8000
Possible DiskOnChip with unknown ChipID FF found at 0xda000
Possible DiskOnChip with unknown ChipID FF found at 0xdc000
Possible DiskOnChip with unknown ChipID FF found at 0xde000
Possible DiskOnChip with unknown ChipID FF found at 0xe0000
Possible DiskOnChip with unknown ChipID FF found at 0xe2000
Possible DiskOnChip with unknown ChipID FF found at 0xe4000
Possible DiskOnChip with unknown ChipID FF found at 0xe6000
Possible DiskOnChip with unknown ChipID FF found at 0xe8000
Possible DiskOnChip with unknown ChipID FF found at 0xea000
Possible DiskOnChip with unknown ChipID FF found at 0xec000
Possible DiskOnChip with unknown ChipID FF found at 0xee000
$Id: ftl.c,v 1.43 2002/02/13 15:31:37 dwmw2 Exp $
ftl_cs: FTL header not found.
NFTL driver: nftlcore.c $Revision: 1.85 $, nftlmount.c $Revision: 1.25 $
NFTL_notify_add for DiskOnChip 2000
NFTL_setup
Sorry, we don't support UnitSizeFactor of != 1 yet.
Could not find valid boot record
Could not mount NFTL device


Consequently I have no /dev/nftla. MAKEDEV from the mtd utilites was
run. cat /proc/mtd says:

mtd0: 02000000 00004000 "DiskOnChip 2000"

3. I then ran "nftl_format /dev/mtd0", rebooted and got nftla1
recognized. Fdisk worked fine with the device.

My question is whether "dformat /win:D000 /s:doc524.exb" should have
been sufficient to get DOC recognized correctly by the kernel or do I
have to run ntfl_format? If ntfl_format is required, can I simply fdisk
and format as a fat12 partition under linux?

Thanks,
Stephen
