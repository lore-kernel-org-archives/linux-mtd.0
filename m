Received: from [209.178.208.101] (helo=lserver.ddiworldwide.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18P6tU-00039S-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2002 20:03:45 +0000
Received: from 127.0.0.1 (localhost [127.0.0.1])
	by dummy.ddiworldwide.com (Postfix) with SMTP id AF907162F79
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2002 15:37:04 -0500 (EST)
Received: from plinux.ddiworldwide.com (plinux [192.168.1.128])
	by lserver.ddiworldwide.com (Postfix) with ESMTP id 10C6B162F78
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2002 15:37:04 -0500 (EST)
Content-Type: text/plain;
  charset="us-ascii"
From: Frank R Callaghan <f.callaghan@ieee.org>
Reply-To: f.callaghan@ieee.org
To: LinuxMTD <linux-mtd@lists.infradead.org>
Subject: AMD Config Advice
Date: Thu, 19 Dec 2002 15:31:19 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200212191531.19640.f.callaghan@ieee.org>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

I undrstand this may be a very basic question, but here go's

I am looking to use an AMD flash chip on my pc104 card
to store some non-volatile data, the chip is a 2MB part  AMD29F016,
the BIOS is in the top 128KB of the first mega-byte(do not want to overwrite).

After setting up the kernel with MDT I get
cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00200000 00010000 "Physically mapped flash"

ok but I only need the second 1MB - is there some way to either
prevent the first meg being mapped/used ?

Kernal Version 2.4.19 with:
#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
# CONFIG_MTD_PARTITIONS is not set
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_CHAR is not set
CONFIG_MTD_BLOCK=y
CONFIG_FTL=y
# CONFIG_NFTL is not set
#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_JEDEC is not set
#
# Mapping drivers for chip access
#
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=9500000		<- My phy addr of second MB
CONFIG_MTD_PHYSMAP_LEN=100000		<-- 1MB
CONFIG_MTD_PHYSMAP_BUSWIDTH=1
# CONFIG_MTD_PNC2000 is not set
# CONFIG_MTD_SC520CDP is not set
# CONFIG_MTD_NETSC520 is not set
# CONFIG_MTD_SBC_GXX is not set
# CONFIG_MTD_ELAN_104NC is not set
# CONFIG_MTD_DILNETPC is not set
# CONFIG_MTD_MIXMEM is not set
# CONFIG_MTD_OCTAGON is not set
# CONFIG_MTD_VMAX is not set
# CONFIG_MTD_L440GX is not set
# CONFIG_MTD_AMD766ROM is not set
# CONFIG_MTD_ICH2ROM is not set
# CONFIG_MTD_PCI is not set
#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOCPROBE is not set

also I'm looking to use jffs2 as the file system - maybe I can partion it
to only use the second meg ???

TIA,
        Frank.
