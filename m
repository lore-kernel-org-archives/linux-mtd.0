Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19bseb-0002d8-WA
	for <linux-mtd@lists.infradead.org>; Mon, 14 Jul 2003 03:01:26 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h6E21XV28738
	for <linux-mtd@lists.infradead.org>; Mon, 14 Jul 2003 14:01:33 +1200
Received: from sunstorm.tait.co.nz (sunstorm.tait.co.nz [172.25.40.9])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h6E21WO28732
	for <linux-mtd@lists.infradead.org>; Mon, 14 Jul 2003 14:01:32 +1200
Received: from tait.co.nz (sardine.tait.co.nz [172.25.140.19])
 by sunstorm.tait.co.nz (iPlanet Messaging Server 5.1 (built May  7 2001))
 with ESMTP id <0HHZ00B19SAKTU@sunstorm.tait.co.nz> for
 linux-mtd@lists.infradead.org; Mon, 14 Jul 2003 14:01:32 +1200 (NZST)
Date: Mon, 14 Jul 2003 14:02:50 +1200
From: Dmytro Bablinyuk <dmytro.bablinyuk@tait.co.nz>
To: linux-mtd@lists.infradead.org
Message-id: <3F120F4A.7080507@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT
Subject: Problem with finding flash device AM29F040B
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a MPC866ADS out of the box board and I got linux running from 
ramdisk.
But I could not get flash (AM29F040B) working with 2.4.21 kernel.
I tried to specify phys map but I still have:

physmap flash device: 200000 at 2800000
CFI: Found no Physically mapped flash device at location zero
kmod: failed to exec /sbin/modprobe -s -k jedec_probe, errno = 2
kmod: failed to exec /sbin/modprobe -s -k map_rom, errno = 2

Could somebody please give me a clue about this.
Thank you in advance for any help.

Some details of my kernel config:

#
# Mapping drivers for chip access
#
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=2800000
CONFIG_MTD_PHYSMAP_LEN=200000
CONFIG_MTD_PHYSMAP_BUSWIDTH=2
# CONFIG_MTD_TQM8XXL is not set
# CONFIG_MTD_RPXLITE is not set
# CONFIG_MTD_MBX860 is not set
# CONFIG_MTD_DBOX2 is not set
# CONFIG_MTD_CFI_FLAGADM is not set
# CONFIG_MTD_REDWOOD is not set
# CONFIG_MTD_PCI is not set
# CONFIG_MTD_PCMCIA is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
# CONFIG_MTD_CFI_INTELEXT is not set
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_CFI_STAA is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
CONFIG_MTD_OBSOLETE_CHIPS=y
CONFIG_MTD_AMDSTD=y

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
