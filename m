Received: from smtp3.adl2.internode.on.net ([203.16.214.203])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLGlG-0002eB-E1
	for linux-mtd@lists.infradead.org; Wed, 05 May 2004 08:24:10 +0100
Received: from localhost.localdomain (ppp147-93.lns1.mel2.internode.on.net
	[150.101.147.93])i457Nxk2013070	for <linux-mtd@lists.infradead.org>;
	Wed, 5 May 2004 16:53:59 +0930 (CST)
Received: from localhost (tiger [10.10.10.5])
	by localhost.localdomain (8.12.8/8.12.8) with ESMTP id i457NrcN002835
	for <linux-mtd@lists.infradead.org>; Wed, 5 May 2004 17:23:53 +1000
Message-ID: <1083741832.40989688de363@tiger.enttec>
Date: Wed,  5 May 2004 17:23:52 +1000
From: NGB <ngbmoreau@yahoo.com.au>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Subject: MTD problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi 

I'm trying to get MTD to find the flash chip (28F128J3) on a EP9301 dev board.
so I can access the redboot partitions.

Redboot says:

RAM: 0x00000000-0x02000000, 0x00041c88-0x01fdd000 available
FLASH: 0x60000000 - 0x61000000, 128 blocks of 0x00020000 bytes each.

So I configured the kernel (2.4.21-rmk1-cirrus-1-2-1) like this:

CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CONCAT=y
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_CMDLINE_PARTS=y
# CONFIG_MTD_AFS_PARTS is not set
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_CFI_STAA is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
CONFIG_MTD_OBSOLETE_CHIPS=y
CONFIG_MTD_AMDSTD=y
# CONFIG_MTD_SHARP is not set
CONFIG_MTD_JEDEC=y

#
# Mapping drivers for chip access
#
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=60000000
CONFIG_MTD_PHYSMAP_LEN=1000000
CONFIG_MTD_PHYSMAP_BUSWIDTH=2

But MTD still can't find the chips

physmap flash device: 1000000 at 60000000
CFI: Found no Physically mapped flash device at location zero

Any ideas ?

Thanks

Nic



-------------------------------------------------
