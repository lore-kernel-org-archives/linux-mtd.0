Received: from [192.109.80.15] (helo=turing.logware.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15c36f-0004xl-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 12:02:01 +0100
Received: from exchange.ten.logware.de (exchange.ten.logware.de [10.220.10.26])
	by turing.logware.de (8.9.3/8.9.3) with ESMTP id NAA24906
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 13:37:34 +0200
Message-ID: <71B37AB6576DD211AB7E008048CD4D319FA64B@exchange.ten.logware.de>
From: Veikko Werner <veikko.werner@logware.de>
To: linux-mtd@lists.infradead.org
Subject: UnitSizeFactor != 1
Date: Wed, 29 Aug 2001 13:07:54 +0200
MIME-Version: 1.0
Content-Type: text/plain
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

Hello List,

I'm trying defferent ways to get the DOC work under my x86-system.
I did all the things for the kernel, but get the following kernel messages
while booting.
I'm using a 2.4.9 kernel, but the same happens to 2.4.7
I can't use nftl_format - it complains the erase size. (I can't use CVS, so
I use the last tgz from 20000704)
Do I have to load a special firmware - other than M-Systems 5.0 ?
any comments?

Thanks, Veikko

<-- kernel message
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
Using configured probe address 0xd8000
DiskOnChip 2000 found at address 0xD8000
Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba TH58V128DC)
3 flash chips found. Total DiskOnChip size: 48 MiB
mtd: Giving out device 0 to DiskOnChip 2000
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftlcore.c,v 1.73 2001/06/09 01:09:43 dwmw2 Exp $
NFTL_notify_add for DiskOnChip 2000
NFTL_setup
Sorry, we don't support UnitSizeFactor of != 1 yet
Sorry, we don't support UnitSizeFactor of != 1 yet
Could not find valid boot record
Could not mount NFTL device
-->
