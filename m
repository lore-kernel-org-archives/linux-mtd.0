Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1986l7-0000jL-HY
	for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2003 00:01:05 +0100
Received: from root by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1986kL-0001WN-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2003 01:00:17 +0200
To: linux-mtd@lists.infradead.org
From: David Wuertele <dave-gnus@bfnet.com>
Date: Tue, 22 Apr 2003 15:56:23 -0700
Message-ID: <m365p6b0q0.fsf@bfnet.com>
Mime-Version: 1.0
Sender: news <news@main.gmane.org>
Content-Type: text/plain; charset=us-ascii
Subject: mtd and devfs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is there any reason why mtd wouldn't work under devfs?
I'm running 2.4.18 plus some vendor patches.  I've got a nand flash
that is recognized on boot:

  STWX225 NAND Flash initializing...
  PFLASH_CNTL before MOD: 80after MOD: 80
  NAND device: Manufacture ID: 0xec, Chip ID: 0x73 (Samsung KM29U128T) Chip size: 2000000
  Creating 5 MTD partitions on "Samsung KM29U128T":
  0x00000000-0x00200000 : "MTD partition 0"
  mtd: Giving out device 0 to MTD partition 0
  0x00200000-0x00400000 : "MTD partition 1"
  mtd: Giving out device 1 to MTD partition 1
  0x00400000-0x00c00000 : "MTD partition 2 - root FS"
  mtd: Giving out device 2 to MTD partition 2 - root FS
  0x01f00000-0x01ffc000 : "MTD partition 3"
  mtd: Giving out device 3 to MTD partition 3
  0x01ffc000-0x02000000 : "MTD partition 4"
  mtd: Giving out device 4 to MTD partition 4
  STW4X225 NAND Flash initialized.

This results in devices under devfs:

  # ls -R /dev/mtd

  /dev/mtd:
  0
  0ro
  1
  1ro
  2
  2ro
  3
  3ro
  4
  4ro

But when I try to read from these, my system hangs before it ever gets
to the nand_read() function:

  # head /dev/mtd/0 > fred

Whether I try to read or write to the /dev/mtd/0 device, the system
hangs hard.  The nand_read() function has a printk as its first
statement, but the console never prints this, so I think there is
something wrong with the read dispatch.  Could there be issues with my
use of devfs?

Thanks,
Dave
