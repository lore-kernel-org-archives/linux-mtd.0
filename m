Received: from lo.gmane.org ([80.91.229.12])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OMMxi-000870-DV
	for linux-mtd@lists.infradead.org; Wed, 09 Jun 2010 15:13:03 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1OMMxc-0003l7-JN
	for linux-mtd@lists.infradead.org; Wed, 09 Jun 2010 17:12:56 +0200
Received: from amg-holding.md ([89.28.62.63])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 Jun 2010 17:12:56 +0200
Received: from egorkat by amg-holding.md with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 Jun 2010 17:12:56 +0200
To: linux-mtd@lists.infradead.org
From: Egorkat <egorkat@gmail.com>
Subject: Re: modprobe nftl hangs
Date: Wed, 9 Jun 2010 15:12:46 +0000 (UTC)
Message-ID: <loom.20100609T171030-617@post.gmane.org>
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

May be dmesg will be helpful:

DiskOnChip found at 0xc8000
DiskOnChip 2000 responds to DWORD access
Detected 2 chips per floor.
NAND device: Manufacturer ID: 0x98, Chip ID: 0x73 (Toshiba NAND 16MiB 3,3V 8-bit)
2 NAND chips detected
Found DiskOnChip ANAND Media Header at 0x0
Found DiskOnChip ANAND Media Header at 0x4000
    DataOrgID        = ANAND
    NumEraseUnits    = 2048
    FirstPhysicalEUN = 0
    FormattedSize    = 32833536
    UnitSizeFactor   = 0
UnitSizeFactor=0x00 detected.  Correct value is assumed to be 0xff.
Bad block table at page 1, version 0x55
Bad block table at page 33, version 0x55
nand_read_bbt: Bad block at 0x00000000c000
nand_read_bbt: Bad block at 0x000000010000
nand_read_bbt: Bad block at 0x000000348000
Found alias of DOC at 0xc8000 to 0xca000

also - cat /proc/mtd
dev:    size   erasesize  name
mtd0: 02000000 00004000 "DiskOnChip 2000 (NFTL Model)"
