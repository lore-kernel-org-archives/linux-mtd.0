Received: from outbound-mail.lax.untd.com ([64.136.28.164])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CwSQ0-00052a-Km
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 16:52:13 -0500
Received: from outbound29-sr.lax.untd.com (webmail13.lax.untd.com
	[10.131.27.153])
	by smtpout06.lax.untd.com with SMTP id AABBACU48AXEK3DS
	for <linux-mtd@lists.infradead.org> (sender <pevnev@juno.com>);
	Wed,  2 Feb 2005 13:51:26 -0800 (PST)
Mime-Version: 1.0
From: "Alex" <pevnev@juno.com>
Date: Wed, 2 Feb 2005 21:49:38 GMT
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <20050202.135036.2985.7488@webmail13.lax.untd.com>
Cc: tglx@linutronix.de
Subject: CONFIG_MTD_PHYSMAP_START
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


As a reference I am supplying relevant
 content of my .config file 
- could someone please pinpoint to me
 what options need to be changed 
or invoked to correct my current problem
(driver interprets 0x04000000 as RAM address for 32Mb DRAM,
with highest address being 0x02000000).

Thanks,
***************************
...
#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
CONFIG_MTD_CMDLINE_PARTS=y

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
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
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_AMDSTD_RETRY=0
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=0x04000801
CONFIG_MTD_PHYSMAP_LEN=0x400000
CONFIG_MTD_PHYSMAP_BANKWIDTH=2
# CONFIG_MTD_RPXLITE is not set
# CONFIG_MTD_CFI_FLAGADM is not set

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
CONFIG_MTD_NAND=y
# CONFIG_MTD_NAND_VERIFY_WRITE is not set
CONFIG_MTD_NAND_IDS=y
# CONFIG_MTD_NAND_DISKONCHIP is not set
                                                              

___________________________________________________________________
Speed up your surfing with Juno SpeedBand.
Now includes pop-up blocker!
Only $14.95/month -visit http://www.juno.com/surf to sign up today!
