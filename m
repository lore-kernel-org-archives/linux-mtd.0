Received: from web20408.mail.yahoo.com ([66.163.169.96]
	helo=web20420.mail.yahoo.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AndwE-0000pF-1j
	for linux-mtd@lists.infradead.org; Mon, 02 Feb 2004 13:16:30 +0000
Message-ID: <20040202131627.72316.qmail@web20420.mail.yahoo.com>
Date: Mon, 2 Feb 2004 05:16:27 -0800 (PST)
From: Roy Lauer <rlaor@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Problems with DOC Millenium Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
 
We used to have DOC 2000. 
Recently, M-sys stopped manufacturing the DOC 2000, so
we bought DOC Millennium Plus instead.
 
I updated the mtd driver to the latest version from
the CVS.
 
The first problem I encountered was that the kernel
build failed due to unresolved symbol BUG_ON in
mtd_core.c and mtd_blkdevs_24.c.
I guess this is a bug.
 
Anyway, I commented out these lines and was able to
build the kernel.
 
I formatted the DOC with DFORMAT version 5.1.4 from
M-sys.
 
When I boot with the new kernel, it recognizes the DOC
correctly but complains "Could not find valid boot
record":
 
Feb  2 09:46:12 192 kernel: NFTL driver: nftlcore.c
$Revision: 1.94 $, nftlmount.c $Revision: 1.34 $
Feb  2 09:46:12 192 kernel: Using configured
DiskOnChip probe address 0xf0400000
Feb  2 09:46:12 192 kernel: DiskOnChip Millennium Plus
found at address 0xF04000 00
Feb  2 09:46:12 192 kernel: Flash chip found:
Manufacturer ID: 98, Chip ID: 75 (Toshiba:NAND 32MiB
3,3V)
Feb  2 09:46:12 192 kernel: Flash chip found:
Manufacturer ID: 98, Chip ID: 75 (Toshiba:NAND 32MiB
3,3V)
Feb  2 09:46:12 192 kernel: 2 flash chips found. Total
DiskOnChip size: 64 MiB
Feb  2 09:46:12 192 kernel: Could not find valid boot
record
Feb  2 09:46:12 192 kernel: NFTL: could not mount
device
 
The readme file advices to use nftl_format in such a
case, but this tool seems not to be available any
more.
 
I tried it with another DOC and got the same message.
 
Can anyone help me please with this situation.
What have I done wrong?
What shell I do now?
 
Roy


=====
Roy Lauer
+972-67-477055

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/
