Received: from lo.gmane.org ([80.91.229.12])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OMz09-0006v3-E9
	for linux-mtd@lists.infradead.org; Fri, 11 Jun 2010 07:50:06 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1OMz08-0001ey-2M
	for linux-mtd@lists.infradead.org; Fri, 11 Jun 2010 09:50:04 +0200
Received: from amg-holding.md ([89.28.62.63])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jun 2010 09:50:04 +0200
Received: from egorkat by amg-holding.md with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jun 2010 09:50:04 +0200
To: linux-mtd@lists.infradead.org
From: Egorkat <egorkat@gmail.com>
Subject: Re: modprobe nftl hangs
Date: Fri, 11 Jun 2010 07:48:23 +0000 (UTC)
Message-ID: <loom.20100611T094726-371@post.gmane.org>
References: <loom.20100608T165617-407@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Situation repeats with another chip - MD2201-D72:


modprobe diskonchip -
DiskOnChip found at 0xc8000
DiskOnChip 2000 responds to DWORD access
Detected 3 chips per floor.
NAND device: Manufacturer ID: 0x98, Chip ID: 0xe6 (Toshiba NAND 8MiB 3,3V 8-bit)
9 NAND chips detected
Found DiskOnChip ANAND Media Header at 0xc000
Found DiskOnChip ANAND Media Header at 0x10000
 DataOrgID        = ANAND
 NumEraseUnits    = 4605
 FirstPhysicalEUN = 3
 FormattedSize    = 73875456
 UnitSizeFactor   = 0
UnitSizeFactor=0x00 detected.  Correct value is assumed to be 0xfe.
Setting virtual erase size to 16384
Bad block table at page 97, version 0x55
Bad block table at page 129, version 0x55
Found alias of DOC at 0xc8000 to 0xca000

mtd_debug info /dev/mtd0 -
mtd.type = MTD_NANDFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 75497472 (72M)
mtd.erasesize = 16384 (16K)
mtd.writesize = 512
mtd.oobsize = 16
regions = 0

nftl_format /dev/mtd0 -
version 1.24 2005/11/07 11:15:13 gleixner
Phase 1. Checking and erasing Erase Zones from 0x00000000 to 0x04800000
Skipping bad zone (factory marked) #3 @ 0xc000
Skipping bad zone (factory marked) #4 @ 0x10000
Skipping bad zone (factory marked) #6 @ 0x18000
Skipping bad zone (factory marked) #7 @ 0x1c000
Skipping bad zone (factory marked) #8 @ 0x20000
Skipping bad zone (factory marked) #9 @ 0x24000
Skipping bad zone (factory marked) #10 @ 0x28000
        Checking Zone #4607 @ 0x47fc000
Phase 2.a Writing NFTL Media Header and Bad Unit Table
Phase 2.b Writing Spare NFTL Media Header and Spare Bad Unit Table
Phase 3. Writing Unit Control Information to each Erase Unit

and modprobe nftl - 
[ 1695.537469] NFTL Media Headers at 0x0 and 0xc000 disagree.
[ 1695.541610] NFTL Media Headers at 0x0 and 0x10000 disagree.
[ 1699.540763] Formatting block 6
[ 1699.580575] Formatting block 7
[ 1699.620227] Formatting block 8
[ 1699.660541] Formatting block 9
[ 1699.699122] Formatting block 10
[ 1851.005969] NFTL: cannot calculate a geometry to match size of 0x23e80.
[ 1851.008110] NFTL: using C:1021 H:16 S:9 (== 0x23e50 sects)
and nothing... it hangs forever...
