Received: from web20405.mail.yahoo.com ([66.163.169.93])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AnhpG-0001Yz-Qo
	for linux-mtd@lists.infradead.org; Mon, 02 Feb 2004 17:25:35 +0000
Message-ID: <20040202172532.63778.qmail@web20405.mail.yahoo.com>
Date: Mon, 2 Feb 2004 09:25:32 -0800 (PST)
From: Roy Lauer <rlaor@yahoo.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1075728808.786.28.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with DOC Millenium Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> 
> The DiskOnChip Millennium Plus uses INFTL not NFTL.
> You should be very
> careful using the current INFTL code -- it does not
> observe the Bad
> Block Table.
 
OK, I switched to INFTL and now I get the following:

INFTL: inftlcore.c $Revision: 1.14 $, inftlmount.c
$Revision: 1.12 $
Using configured DiskOnChip probe address 0xf0400000
DiskOnChip Millennium Plus found at address 0xF0400000
Flash chip found: Manufacturer ID: 98, Chip ID: 75
(Toshiba:NAND 32MiB 3,3V)
Flash chip found: Manufacturer ID: 98, Chip ID: 75
(Toshiba:NAND 32MiB 3,3V)
2 flash chips found. Total DiskOnChip size: 64 MiB
INFTL: corrupt block 1024 in chain 1024, chain length
0, erase mark 0xbf?
INFTL: formatting chain at block 1024
INFTL: formatting block 1024
MTD: Error 0xffffffa5 erasing at 0x2000000
INFTL: error while formatting block 1024
INFTL: corrupt block 1025 in chain 1025, chain length
0, erase mark 0xbf?
INFTL: formatting chain at block 1025
INFTL: formatting block 1025
MTD: Error 0xffffffa5 erasing at 0x2008000
INFTL: error while formatting block 1025


What does it mean?

Roy


__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/
