Received: from eris.discordia.ch ([212.55.212.99] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15HAF7-0000us-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2001 21:24:26 +0100
Date: Mon, 2 Jul 2001 22:30:28 +0200
From: Peter Keel <killer@discordia.ch>
To: linux-mtd@lists.infradead.org
Subject: DOC missing erasesize
Message-ID: <20010702223028.A9468@discordia.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

Kernel is 2.4.5. My DOC has no erasesize: 

This happens when loading: 
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $
Could not find valid boot record
Could not mount NFTL device
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
DiskOnChip 2000 found at address 0xFFFD8000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
2 flash chips found. Total DiskOnChip size: 16 Mb
Ignoring DiskOnChip 2000 at 0xFFFDA000 - already configured

cat /proc/mtd
mtd0: 01000000 "DiskOnChip 2000"

Consequently, everything else fails with ioctl-errors. 
nftl_format does its job for some time, until it hits something else
and starts spewing. 

What should 0xFFFDA000 mean anyway? Nothing like this in the docs. 

I'd be glad to have set up the chip in relatively short time, because
my other machine keeps turning off its power (god damn ATX), and the
IDE-Controller on the terminal with the DOC is broken and has a 
throughput of 400kb/sec.. The world is bad. 

Thank you
Peter
-- 
"Any good Unix security engineer can clean up any Unix box. But I'm not 
 sure there are people even within Microsoft who know how to clean up 
 an NT box." -- Michael Zbouray
