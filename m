Received: from firewall.cpi.fr ([194.206.204.100] helo=firewall)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A1QXC-0008Tu-QP
	for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2003 14:15:22 +0100
Message-ID: <AF34F8F089D16B4FABE02B5F375228E0023B@serveur21.SYNCHRO2>
From: Yves CLOUSIER <yves.clousier@synchronic.fr>
To: linux-mtd@lists.infradead.org, uClinux development list
	 <uclinux-dev@uclinux.org>
Date: Mon, 22 Sep 2003 15:10:35 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: DOC out-of-line wait ???
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all, 

In my board (5272), with uclinux2.40 (20030305-uclinux-dist) I put a
disk-on-chip millenium MD2802-D02.
Last week I have a problem in the Docprobe.c, the DocCheck don't reconize my
DOC because the DOC was in reset mode (thanks Greg & Niki for your help).

Now the DOC is reconizes, but I have a another error message after NTFL
driver initialisation  :

	Blkmem copyright 1998,1999 D. Jeff Dionne
	Blkmem copyright 1998 Kenneth Albanowski
	Blkmem 1 disk images:
	0: 12730C-1FE30B [VIRTUAL 12730C-1FE30B] (RO)
	RAMDISK driver initialized: 16 RAM disks of 4096K size 1024
blocksize
	Using configured DiskOnChip probe address 0xe0000000
	ChipID : 30
	DiskOnChip Millennium found at address 0xE0000000
	Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba
TC58V64AFT/DC)
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady timed out.
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady timed out.
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady timed out.
	1 flash chips found. Total DiskOnChip size: 8 MiB
	mtd: Giving out device 0 to DiskOnChip Millennium
	init_mtdchar: allocated major number 90.
	NFTL driver: nftlcore.c $Revision: 1.86 $, nftlmount.c $Revision:
1.28 $
	NFTL_notify_add for DiskOnChip Millennium
	mtd->read = 0008b060, size = 8388608, erasesize = 8192
	NFTL_setup
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	...........



What's the signification of this out-of-line ??




If I change the DOC millenium (MD2802-D08) by DOC2000 (MD2200-D24), i have
the same message  :

	Blkmem copyright 1998 Kenneth Albanowski
	Blkmem 1 disk images:
	0: 12930C-20030B [VIRTUAL 12930C-20030B] (RO)
	RAMDISK driver initialized: 16 RAM disks of 4096K size 1024
blocksize
	Using configured DiskOnChip probe address 0xe0000000
	ChipID : 20
	DiskOnChip 2000 found at address 0xE0000000
	Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba
TC58V64AFT/DC)
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	Flash chip at floor 1, chip 0 is different:
	Unknown flash chip found: 59 59
	Please report to dwmw2@infradead.org
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	Flash chip at floor 2, chip 0 is different:
	Unknown flash chip found: 59 59
	Please report to dwmw2@infradead.org
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	Flash chip at floor 3, chip 0 is different:
	Unknown flash chip found: 59 59
	Please report to dwmw2@infradead.org
	3 flash chips found. Total DiskOnChip size: 24 MiB
	mtd: Giving out device 0 to DiskOnChip 2000
	init_mtdchar: allocated major number 90.
	NFTL driver: nftlcore.c $Revision: 1.86 $, nftlmount.c $Revision:
1.28 $
	NFTL_notify_add for DiskOnChip 2000
	mtd->read = 0008b41c, size = 25165824, erasesize = 8192
	NFTL_setup
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	_DoC_WaitReady called for out-of-line wait
	.................



What do you think about that ? Is-it a hardware problem, or a software
problem ? 


Thanks 



Yves
