Received: from lvs2.netcore.co.in ([202.162.240.2])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GXwgn-0002g4-Ir
	for linux-mtd@lists.infradead.org; Thu, 12 Oct 2006 05:17:22 -0400
Received: from uucp3.netcore.co.in (uucp3.netcore.co.in [202.162.229.13])
	by lvs2.netcore.co.in (Postfix) with ESMTP id 3DFE3B7AAD
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Oct 2006 14:47:01 +0530 (IST)
Received: from uucp1.netcore.co.in (unknown [192.168.2.1])
	by uucp3.netcore.co.in (Postfix) with ESMTP id 8A8D53B9FD
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Oct 2006 14:47:00 +0530 (IST)
Received: from thick.localnova.com (unknown [10.7.138.16])
	by chennai.novatium.com (Postfix) with ESMTP id 16AC87C004D
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Oct 2006 15:16:16 +0530 (IST)
Subject: Problem in Erase/Writing the flash device
From: harishkumar <harishkumar@novatium.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Thu, 12 Oct 2006 14:39:40 +0530
Message-Id: <1160644180.11204.18.camel@thick.localnova.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: harishkumar@novatium.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
	I am new to flash devices. I am writing AM29LV256MH 16MB flash map
driver using MTD for my ARM board.
I used jedec_probe. The flash is 16 bit.
I mapped my partitions for the flash.

Iam using 2.6.15 kernel.
When the kernel loads, it succesfully detects the flash.
i gave starting address as 0x02000000 & length as 0x01000000 & width as
2.

after booting up the kernel, cat /proc/mtd displayed the following
thing,
dev:	size		erasesize	name
mtd0:	01000000	00010000	Entire flash
mtd1:	00050000	00010000	Bootloader
mtd2:	00200000	00010000	Kernel
mtd3:	00c00000	00010000	Filesystem
mtd4:	001b0000	00010000	Reserved


All this seems to be ok, but normal read/write/erase operation on flash
device not happening.
I tried to read from the device /dev/mtd0 & dumped into file, the file
displayed only zeros.
Normally when no contents is there, it should display only ffff's but is
strange it is displaying zeros.

Then i tried to erase the flash using mtd-utils,
i got MEMERASE: input/output error.


Somebody help me............ please............

Harish
