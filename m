From: Amit.Lubovsky@infineon.com (Amit.Lubovsky at infineon.com)
Date: Mon, 3 Mar 2003 15:08:47 +0100
Subject: AMD - Am29LV160B
Message-ID: <04C8EDC5AE3FD611ABE40002B39CF69B07F2D9@ntah901e.savan.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,

Has anyone used the mtd device with the AMD
Am29LV160B chips? They are 16 Megabit (2M x 8-Bit/1M x 16-Bit) chips
and are CFI-compatible.

I work with kernel 2.4.6 and am trying to detect 4MB,
2 x16 bit devices in parallel (32 bit access) at address 0,


I have mapped the physical addresses in drivers/mtd/maps/purple.c

...
#define WINDOW_ADDR 0xb0000000
#define WINDOW_SIZE 0x400000
#define BUSWIDTH 2

static struct mtd_partition easyport_partitions[]={
            { name: "boot partition",
              offset: 0,
              size: 0x100000 },
            { name: "partition 1",
              offset: 0x100000,
              size: 0x100000 },
            { name: "partition 2",
              size: 0x200000,
              offset: 0x200000 }
};




Here are the options I use:

option #1
----------
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y

# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_CFI_AMDSTD=y

# Mapping drivers for chip access
#
#
CONFIG_MTD_PURPLE=y

For the first option I get:
---------------------------
purple flash device: 400000 at b0000000
purple_map.map_priv_1=0xb0000000
-----------------> FLASH #2
--------------------------->file: chipreg.c name=cfi drv=8020c970
-----------@@@@@@@@@@ CFIDEV_BUSWIDTH_2 CFIDEV_INTERLEAVE_1
--------########## func: cfi_probe_chip CFI_DEVICETYPE_X16
-----------@@@@@@@@@@ CFIDEV_BUSWIDTH_2 CFIDEV_INTERLEAVE_2
--------########## func: cfi_probe_chip CFI_DEVICETYPE_X8
--------########## func: cfi_probe_chip CFI_DEVICETYPE_X16
--------------> file: cfi_probe.c func: cfi_cfi_probe index=-1
Physically mapped flash: Found no CFI device at location zero
--------------> file: cfi_probe.c  cfi=0
mymtd=0x00000000


option #2
----------
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y

# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_CFI_B4=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_AMDSTD=y

#
# Mapping drivers for chip access
#
CONFIG_MTD_PURPLE=y

for option #2 I get:
--------------------

purple flash device: 400000 at b0000000
purple_map.map_priv_1=0xb0000000
--------------------------->file: chipreg.c name=cfi drv=8020a970
cfi_probe called with unsupported buswidth 2
--------------> file: cfi_probe.c func: cfi_cfi_probe index=-1
Physically mapped flash: Found no CFI device at location zero
--------------> file: cfi_probe.c  cfi=0
mymtd=0x00000000

Any help would be appreciated.

Thanks,
Amit.
