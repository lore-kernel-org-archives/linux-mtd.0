Received: from mpeisrv.mpei.ac.ru ([193.233.69.251])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CDOtf-0003yj-85
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2004 11:00:37 -0400
Received: from avanto.mpei.ac.ru (avanto.mpei.ac.ru [193.233.71.179])
	by mpeisrv.mpei.ac.ru (8.12.10/8.12.11) with ESMTP id i91Evtsq017130
	for <linux-mtd@lists.infradead.org>; Fri, 1 Oct 2004 18:59:06 +0400
Received: from skorinkod.lan ([10.255.2.21])
	by avanto.mpei.ac.ru with esmtp (Exim 3.36 #1 (Debian))
	id 1CDOrF-00013W-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Oct 2004 18:58:05 +0400
From: Dmitry <skorinkod@mosk.ru>
To: linux-mtd@lists.infradead.org
Date: Fri, 1 Oct 2004 18:58:28 +0400
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200410011858.28776.skorinkod@mosk.ru>
Subject: Problems with DiskOnChip 2000
Reply-To: skorinkod@mail.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, all

I have pc104 system ICOP-6070 with DiskOnChip 2000 on it..
Here is task to install linux OS on this system..
With Knoppix 3.6 CD I start linux and try load drivers for this flash disk for 
next step with installation on it, but modules don't see chip on board...

kernel 2.6.8:
#insmod mtdcore
#insmod nand_ids
#insmod docecc
#insmod doc2000
#insmod docprobe
and i have:
Resource temporarily unavailable

kernel 2.4.27:
#insmod mtdcore
#insmod nand_ids
#insmod docecc
#insmod doc2000
#insmod docprobe
Possible DiskOnChip with unknown ChipID FF found at 0xc8000
Possible DiskOnChip with unknown ChipID FF found at 0xca000
Possible DiskOnChip with unknown ChipID FF found at 0xcc000
Possible DiskOnChip with unknown ChipID FF found at 0xce000
Possible DiskOnChip with unknown ChipID FF found at 0xd0000
Possible DiskOnChip with unknown ChipID FF found at 0xd2000
Possible DiskOnChip with unknown ChipID FF found at 0xd4000
Possible DiskOnChip with unknown ChipID FF found at 0xd6000
Possible DiskOnChip with unknown ChipID FF found at 0xd8000
Possible DiskOnChip with unknown ChipID FF found at 0xda000
Possible DiskOnChip with unknown ChipID FF found at 0xdc000
Possible DiskOnChip with unknown ChipID FF found at 0xde000
DiskOnChip Millennium found at address 0xE0000
Unknown flash chip found: 01 01
Please report to dwmw2@infradead.org
Unknown flash chip found: 01 01
Please report to dwmw2@infradead.org
Unknown flash chip found: 01 01
Please report to dwmw2@infradead.org
No flash chips recognised.
DiskOnChip Millennium found at address 0xE2000
Unknown flash chip found: 01 01
Please report to dwmw2@infradead.org
Unknown flash chip found: 01 01
Please report to dwmw2@infradead.org
Unknown flash chip found: 01 01
Please report to dwmw2@infradead.org
No flash chips recognised.
DiskOnChip Millennium found at address 0xE4000
Unknown flash chip found: 01 01
Please report to dwmw2@infradead.org
Unknown flash chip found: 01 01
Please report to dwmw2@infradead.org
Unknown flash chip found: 01 01
Please report to dwmw2@infradead.org
No flash chips recognised.
DiskOnChip Millennium found at address 0xE6000
Unknown flash chip found: 01 01
Please report to dwmw2@infradead.org
Unknown flash chip found: 01 01
Please report to dwmw2@infradead.org
Unknown flash chip found: 81 81
Please report to dwmw2@infradead.org
No flash chips recognised.
Possible DiskOnChip with unknown ChipID 36 found at 0xe8000
Possible DiskOnChip with unknown ChipID C6 found at 0xea000
Possible DiskOnChip with unknown ChipID F6 found at 0xec000
Possible DiskOnChip with unknown ChipID C1 found at 0xee000


Help, please...

Dmitry
