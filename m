Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B30uJ-0002DP-Oc
	for linux-mtd@lists.infradead.org; Mon, 15 Mar 2004 22:50:04 +0000
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id i2FMnvO22318
	for <linux-mtd@lists.infradead.org>; Tue, 16 Mar 2004 11:49:57 +1300
Received: from sunstorm.tait.co.nz (sunstorm.tait.co.nz [172.25.40.9])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id i2FMnvF22303
	for <linux-mtd@lists.infradead.org>; Tue, 16 Mar 2004 11:49:57 +1300
Received: from tait.co.nz ([172.25.107.91])
 by sunstorm.tait.co.nz (iPlanet Messaging Server 5.1 (built May  7 2001))
 with ESMTP id <0HUN00KAQ3F9TE@sunstorm.tait.co.nz> for
 linux-mtd@lists.infradead.org; Tue, 16 Mar 2004 11:49:57 +1300 (NZDT)
Date: Tue, 16 Mar 2004 11:49:07 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
To: mtd list <linux-mtd@lists.infradead.org>
Message-id: <405632E3.9040509@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT
Subject: mtdparts howto required!!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings

I'm trying to map 3 partitions into a single flash device using the 
mtdparts command line stuff. I'm using a 2.4.22 kernel cross compiled 
from i686 to PowerPC with mtd patches from CVS as of 19th Feb.

My Linux config is:
# Memory Technology Devices (MTD)
CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_CFI_INTELEXT=y
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_JEDEC is not set
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=40000000
CONFIG_MTD_PHYSMAP_LEN=400000
CONFIG_MTD_PHYSMAP_BUSWIDTH=2
# CONFIG_MTD_CFI_FLAGADM is not set
# CONFIG_MTD_PCI is not set
# CONFIG_MTD_PCMCIA is not set
# Self-contained MTD device drivers
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOC2001PLUS is not set
# CONFIG_MTD_DOCPROBE is not set
# CONFIG_MTD_NAND is not set

My Linux boot command line is:
mtdparts=phys:7M(jffs2),256K(u-boot),-(kernel)

and when I turn on debugging in cmdlineparts I see:
DEBUG-CMDLINE-PART: parsing <7M(jffs2),256K(u-Boot),-(kernel)>
DEBUG-CMDLINE-PART: partition 2: name <kernel>, offset 0, size ffffffff, 
mask flags 0
DEBUG-CMDLINE-PART: partition 1: name <u-Boot>, offset 0, size 40000, 
mask flags 0
DEBUG-CMDLINE-PART: partition 0: name <jffs2>, offset 0, size 700000, 
mask flags 0
DEBUG-CMDLINE-PART: mtdid=<phys> num_parts=<3>

So what happened to the offsets? Shouldn't they allow for the size of 
the previous partition? and when I look in /proc/mtd I see:

/ # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00800000 00010000 "Physically mapped flash"

So what happened to the partitions I just parsed?


Other information reported at boot (note: RedBoot not enabled) is:

physmap flash device: 400000 at 40000000
Physically mapped flash: Found 1 x16 devices at 0x0 in 16-bit mode
  Intel/Sharp Extended Query Table at 0x0035
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
kmod: failed to exec /sbin/modprobe -s -k RedBoot, errno = 2
RedBoot partition parsing not available


-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks@tait.co.nz
New Zealand
