Received: from mx1.myoutlookonline.com ([69.25.74.59])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1Fc1Eq-0001Qe-CE
	for linux-mtd@lists.infradead.org; Fri, 05 May 2006 10:25:05 -0400
From: "Ushit Kumar" <ukumar@neomagic.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 5 May 2006 19:38:44 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <FE01084Ikv3ySjWrywN00012b68@mX1.Myoutlookonline.com>
Subject: Probe function not being called
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am trying to implement a nor driver for a Intel strata flash chip on Linux
2.6.14. My problem is that the driver code is not calling the probe
function. My declarations are as follows:

static struct device_driver mm6p_flash_driver = {
        .name           = "mm6p_flash",
        .bus            = &platform_bus_type,
        .probe          = mm6p_flash_probe,
        .remove         = mm6p_flash_remove,
};

static int __init mm6p_flash_init(void)
{
        printk("$$$$$in mm6p_flash_init$$$$$$$$$$\n");
        return driver_register(&mm6p_flash_driver);
}

module_init(mm6p_flash_init);

The mm6p_flash_init is called, but the mm6p_flash_probe is not being
invoked. My system configuration flags are as follows:

CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_CONCAT=y
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
CONFIG_MTD_REDBOOT_PARTS_READONLY=y
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_AFS_PARTS=y

#
# User Modules And Translation Layers
#
# CONFIG_MTD_CHAR is not set
# CONFIG_MTD_BLOCK is not set
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
CONFIG_MTD_CFI_INTELEXT=y
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
# CONFIG_MTD_PHYSMAP is not set
# CONFIG_MTD_ARM_INTEGRATOR is not set
# CONFIG_MTD_EDB7312 is not set
# CONFIG_MTD_IMPA7 is not set
# CONFIG_MTD_PLATRAM is not set
CONFIG_MTD_CS0_MM6PLUS=y

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOC2001PLUS is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set


What could be the problem? 

Thanks, 

Ushit
