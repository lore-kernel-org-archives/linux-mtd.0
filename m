Received: from [195.144.108.44] (helo=mail.deltaes.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15rapA-0003so-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2001 09:04:13 +0100
Received: from lxserver.deltes.cz (IDENT:martin@lxserver.deltes.cz [192.168.5.5])
	by mail.deltaes.com (8.9.3/8.9.3) with ESMTP id IAA29934
	for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2001 08:22:51 +0200
Date: Thu, 11 Oct 2001 10:19:06 +0200 (CEST)
From: martin.kula@deltaes.cz
Reply-To: martin.kula@deltaes.cz
To: linux-mtd@lists.infradead.org
Subject: Identification flash on board ?
Message-ID: <Pine.LNX.4.21.0110111005170.26498-100000@lxserver.deltes.cz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi

I have PC140 with DoC and a flash chip.
Can anybody explain me next lines from dmesg ?
---------------------------------------
Possible DiskOnChip with unknown ChipID FD found at 0xc8000
.................
Possible DiskOnChip with unknown ChipID FD found at 0xe6000
DiskOnChip 2000 found at address 0xE8000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
Flash chip at floor 1, chip 0 is different:
Unknown flash chip found: F9 F9
Please report to dwmw2@infradead.org
Flash chip at floor 2, chip 0 is different:
Unknown flash chip found: F9 F9
Please report to dwmw2@infradead.org
Flash chip at floor 3, chip 0 is different:
Unknown flash chip found: F9 F9
Please report to dwmw2@infradead.org
3 flash chips found. Total DiskOnChip size: 24 MiB
mtd: Giving out device 0 to DiskOnChip 2000
Ignoring DiskOnChip 2000 at 0xEA000 - already configured
Ignoring DiskOnChip 2000 at 0xEC000 - already configured
Ignoring DiskOnChip 2000 at 0xEE000 - already configured
-------------------------------------------------

How can I identify the flash (not DoC)?
I can use it under (ms)dos ;-((. Can I use it under linux ?
I tried some drivers but I hadn't success ;-(

Have you any ideas ?

Thanks

Martin
