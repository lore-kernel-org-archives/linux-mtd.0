Received: from h-66-166-124-218.lsanca54.covad.net ([66.166.124.218]
	helo=sb-exchange1.rinconnetworks.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AKoHV-00012d-PR
	for <linux-mtd@lists.infradead.org>; Sat, 15 Nov 2003 00:27:18 +0000
Received: from sb-lnx3.rinconnetworks.com (localhost.localdomain [127.0.0.1])
	hAF0PaFR016013
	for <linux-mtd@lists.infradead.org>; Fri, 14 Nov 2003 16:25:36 -0800
Received: (from vangool@localhost)
	by sb-lnx3.rinconnetworks.com (8.12.8/8.12.8/Submit) id hAF0PX1V016011
	for linux-mtd@lists.infradead.org; Fri, 14 Nov 2003 16:25:33 -0800
Date: Fri, 14 Nov 2003 16:25:33 -0800
From: Paul van Gool <paul.vangool@rinconnetworks.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20031115002533.GA15967@rinconnetworks.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii
Subject: problem writing to /dev/mtd0
Reply-To: paul.vangool@rinconnetworks.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to read and write from/to a flash partition using its char
device. Reading seems to work fine but I can't seem to get writing  to
work.

I'm using a SolutionEngine7751 dev board, Linux 2.4.20 and the MTD release
that was part of that kernel. The error I get is:

Last[3] is cba4cda6, datum is 34333231

Looking at Last[4] during the 10000 write attempts, it seems its value
seems to alternate between cba4cda6 and cbe4cde6.

The errno I get back is 5, and is EIO.

Boottime info regarding the chips is:

Amd/Fujitsu Extended Query Table v1.0 at 0x0040
Solution Engine FLASH: JEDEC Device ID is 0xC4. Assuming broken CFI table.
Solution Engine FLASH: Swapping erase regions for broken CFI table.
number of CFI chips: 1
Solution Engine: Flash at 0x00000000, EPROM at 0x01000000
Using configured partition at 0x00020000.
Creating 4 MTD partitions on "Solution Engine FLASH":
0x00000000-0x00020000 : "Boot loader"
0x00020000-0x000e0000 : "Kernel"
0x000e0000-0x00300000 : "Root filesystem"
0x00300000-0x00400000 : "JFFS segment"

I use this flash chip through its block device all the time and writing
through that device (/dev/mtdblock0) hasn't been an issue.

Any ideas?

Thanks.

Paul
-- 
Paul van Gool                                               Rincon Networks
paul.vangool@rinconnetworks.com                              (805)-705-1442
