Received: from fw01.queens.org ([204.94.115.5])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VI0x-0000sM-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2002 20:04:28 +0000
Received: from [204.62.161.159] (helo=aha.dlabs.com)
	by kahala.dls.queens.org with esmtp (Exim 3.03 #1)
	id 16VIBC-000870-00
	for linux-mtd@lists.infradead.org; Mon, 28 Jan 2002 10:15:02 -1000
Received: (from cyago@localhost)
	by aha.dlabs.com (8.11.2/8.11.2) id g0SKF2S03886
	for linux-mtd@lists.infradead.org; Mon, 28 Jan 2002 10:15:02 -1000
Date: Mon, 28 Jan 2002 10:15:02 -1000
From: Cliff Yago <cyago@dls.queens.org>
To: linux-mtd@lists.infradead.org
Subject: 32MB DOC Millennium
Message-ID: <20020128101502.B3779@aha.dlabs.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

I have a 32MB DOC Millennium (M-Systems MD-2810-D08) in a GCT Allwell 3036. I am running Linux 2.4.17 with the MTD source from CVS for 1/20/02 patched in.

When I do modprobe -a docprobe I get the following in /var/log/messages:

Jan 28 03:24:27 allwell kernel: DiskOnChip Millennium found at address 0xC8000
Jan 28 03:24:27 allwell kernel: Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
Jan 28 03:24:27 allwell kernel: 4 flash chips found. Total DiskOnChip size: 32 MiB
Jan 28 03:24:27 allwell kernel: mtd: Giving out device 0 to DiskOnChip Millennium
Jan 28 03:24:27 allwell kernel: Sorry, we don't support UnitSizeFactor of != 1 yet.
Jan 28 03:24:27 allwell kernel: Could not find valid boot record
Jan 28 03:24:27 allwell kernel: Could not mount NFTL device
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID FF found at 0xca000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID 00 found at 0xcc000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID 00 found at 0xce000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID FF found at 0xd0000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID FF found at 0xd2000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID FF found at 0xd4000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID FF found at 0xd6000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID FF found at 0xd8000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID FF found at 0xda000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID FF found at 0xdc000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID FF found at 0xde000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID 0B found at 0xe0000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID B8 found at 0xe2000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID 00 found at 0xe4000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID 00 found at 0xe6000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID 6D found at 0xe8000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID 00 found at 0xea000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID 3A found at 0xec000
Jan 28 03:24:27 allwell kernel: Possible DiskOnChip with unknown ChipID FF found at 0xee000

It appears that my DOC isn't supported yet by the MTD drivers. Could anyone point me to the appropriate MTD source code I could look at to address the UnitSizeFactor support?

Thanks,
--Cliff
