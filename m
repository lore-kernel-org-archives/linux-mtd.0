From: david@embeddedminds.com (David Jones)
Date: Mon, 31 Mar 2003 15:08:47 -0700
Subject: Kernel hangs when trying to probe AM29LV160DB flash device
Message-ID: <3E88BC6F.6080109@embeddedminds.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,
   I am trying to get an AM29LV160DB flash device to work with the MTD 
drivers under uClinux.  The device is connected in a 16-bit bus
fashion to a Motorola MC68VZ328.

The AM29LV160DB is supported by mtd/chips/jedec_probe.c

In my map file I have:
mymtd = do_map_probe("jedec_probe", &em1vz328_map);

The do_map_probe function calls get_mtd_chip_driver in mtd/mtd/chipreg.c
and that is where things seem to hang.  The get_mtd_chip_driver function
never returns and hangs the kernel.

Here is a snippet of the boot messages:
---------------------------------------------------------
.
.
EMDG em1-vz328 mapping:size 200000 at 2000000
EMDG: MTD Debug: Calling the do_map_probe function...
EMDG: MTD Debug: Calling get_mtd_chip_driver function...

---------------------------------------------------------

I looked through the archives and I noticed someone else had a similar
problem with this flash device under uClinux, but I could not find what
the solution was.

If anyone has any ideas I would be grateful.

Thanks,
David


Kernel config:
#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
# CONFIG_MTD_BLOCK is not set
CONFIG_MTD_BLOCK_RO=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=y
# CONFIG_MTD_CFI_B1 is not set
CONFIG_MTD_CFI_B2=y
# CONFIG_MTD_CFI_B4 is not set
CONFIG_MTD_CFI_I1=y
# CONFIG_MTD_CFI_I2 is not set
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_INTELEXT is not set
# CONFIG_MTD_CFI_AMDSTD is not set
CONFIG_MTD_RAM=y
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set

-- 
David A. Jones                  Phone:  720-971-6381
Embedded Minds Design Group     Fax:    303-926-0208
www.EmbeddedMinds.com           Email:  david at EmbeddedMinds.com
