Received: from [202.177.17.107] (helo=donut.udomain.com.hk)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19jcEc-0007Zw-KY
	for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2003 11:06:35 +0100
Message-ID: <3F2E3089.40904@hectrix.com>
Date: Mon, 04 Aug 2003 18:08:09 +0800
From: Selwyn Tang <selwyn@hectrix.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Problems with DOC 2000 on 2.4.21
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

I wish to use kernel 2.4.21 with DOC 2000. In menuconfig, I selected the
followings in the MTD submenu (other options not mentioned here were all
left blank):

   * Memory Technology Device (MTD) support
   * Debugging
   0 Debugging verbosity
   M Direct char device access to MTD devices
   M Caching block device access to MTD devices
   M FTL (Flash Translation Layer) support
   M NFTL (NAND Flash Translation Layer) support
   * Write support for NFTL (BETA)

In "Self-contained MTD device drivers", I chose:

   M M-Systems Disk-On-Chip 2000 and Millennium

And in "NAND Flash Device Drivers", I chose:

   M NAND Device Support
   * Verify NAND page writes

I successfully compiled the bzImage and modules, installed them and
rebooted. Then I run:

   modprobe -a doc2000 nftl mtdchar mtdblock

But there was no message shown about anything loading. Anyway, I tried
"modprobe -a docprobe" also, but I got no message at all and modprobe
only return to the shell prompt after a long time. I wonder why I got no
message about detecting my DOC 2000.

I also tried compiling all the above features as built-in (all *) in the
kernel. Then I noticed that the kernel was probably detecting for DOC on
my computer during the reboot, with something like:

   DiskOnChip 2000 found at address 0xD4000
   Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba:NAND 16MB 
3,3V)
   1 flash chips found. Total DiskOnChip size: 16 MiB
   mtd: Giving out device 0 to DiskOnChip 2000

The address D4000 is exactly the address of my DOC 2000. But after the
reboot, I don't know how to access the device given out. I cat /proc/mtd 
and got:

   dev:    size   erasesize  name
   mtd0: 01000000 00004000 "DiskOnChip 2000"

But in /dev I can't find mtd or mtd0.

Do anyone know how to resolve these problems? Thanks in advance!!

Yours,

Selwyn Tang
