Received: from dialup.rama.com.au ([202.0.186.166] helo=gateway.perth.rama.com.au)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15RRKj-0004nB-00
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2001 05:40:43 +0100
Received: from willhart-tech.com (IDENT:alex@[192.156.249.82])
	by gateway.perth.rama.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA13427
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2001 14:01:09 +0800
Message-ID: <3B6636CA.374A6E14@willhart-tech.com>
Date: Tue, 31 Jul 2001 12:40:42 +0800
From: Alexandru Harsanyi <a.harsanyi@willhart-tech.com>
MIME-Version: 1.0
To: Linux Mtd <linux-mtd@lists.infradead.org>
Subject: DOC 2000 driver (NFTL) in kernel 2.4.7
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

I'm trying to configure the 2.4.7 kernel to access a DOC, and I have the
following problems:

1) Although I have only one DOC 2000, the DOC driver detects many more
(see dmesg below)

2) The DOC driver detects 3 flash chips, I only have one

3) (and this is the show stopper) The NFTL driver is not able to find a
boot record on the DOC. This is strange because I'm actually booting
from the DOC.

The previous configuration used a 2.0.36 kernel with M-System provided
drivers and it worked fine.

Here is the relevant dmesg part from the system:

----- dmesg -----
DiskOnChip 2000 found at address 0xC8000
Flash chip found: Manufacturer ID: 98, Chip ID: 6B (Toshiba TC5832DC)
3 flash chips found. Total DiskOnChip size: 12 MiB
Possible DiskOnChip with unknown ChipID FF found at 0xca000
Possible DiskOnChip with unknown ChipID 00 found at 0xcc000
Possible DiskOnChip with unknown ChipID 00 found at 0xce000
Possible DiskOnChip with unknown ChipID FF found at 0xd0000
Possible DiskOnChip with unknown ChipID FF found at 0xd2000
Possible DiskOnChip with unknown ChipID FF found at 0xd4000
Possible DiskOnChip with unknown ChipID FF found at 0xd6000
Possible DiskOnChip with unknown ChipID FF found at 0xd8000
Possible DiskOnChip with unknown ChipID FF found at 0xda000
Possible DiskOnChip with unknown ChipID FF found at 0xdc000
Possible DiskOnChip with unknown ChipID FF found at 0xde000
Possible DiskOnChip with unknown ChipID 0B found at 0xe0000
Possible DiskOnChip with unknown ChipID 00 found at 0xe2000
Possible DiskOnChip with unknown ChipID 28 found at 0xe4000
Possible DiskOnChip with unknown ChipID 00 found at 0xe6000
Possible DiskOnChip with unknown ChipID 6D found at 0xe8000
Possible DiskOnChip with unknown ChipID 07 found at 0xea000
Possible DiskOnChip with unknown ChipID 00 found at 0xec000
Possible DiskOnChip with unknown ChipID FE found at 0xee000
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftlcore.c,v 1.73 2001/06/09 01:09:43 dwmw2 Exp $
Could not find valid boot record
Could not mount NFTL device
---- end dmesg ----

Does anyone know what's the problem? 

Thanx,
Alex.
