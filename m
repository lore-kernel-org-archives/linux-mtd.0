Received: from ip67-94-185-2.z185-94-67.customer.algx.net ([67.94.185.2]
	helo=lserver.ddiworldwide.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AAEIA-0006wQ-Ro
	for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2003 21:00:15 +0100
Received: from 127.0.0.1 (lserver.ddiworldwide.com [127.0.0.1])
	by dummy.domain.name (Postfix) with SMTP id 0767D6D0074
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Oct 2003 15:58:49 -0400 (EDT)
Received: from plinux.ddiworldwide.com (plinux.ddiworldwide.com
	[192.168.1.128])
	by lserver.ddiworldwide.com (Postfix) with ESMTP id DBC656D006D
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Oct 2003 19:58:48 +0000 (UTC)
From: Frank R Callaghan <f.callaghan@ieee.org>
To: MTD <linux-mtd@lists.infradead.org>
Date: Thu, 16 Oct 2003 15:57:19 -0400
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200310161557.19824.f.callaghan@ieee.org>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: Help with 2.4.22 MTD driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I have been using 2.4.19 + mdt patches for sometime with no problem, now
I must switch to 2.4.22 and I have a problem with MTD 

The kernel seem to detect the chip correctly:

physmap flash device: 200000 at 9400000
 Amd/Fujitsu Extended Query Table v1.1 at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
mtd: Giving out device 0 to Physically mapped flash
Using physmap partition definition
Creating 2 MTD partitions on "Physically mapped flash":
0x00000000-0x001e0000 : "fixed_flash"
mtd: Giving out device 1 to fixed_flash
0x001e0000-0x00200000 : "BIOS-DO_NOT_TOUCH"
mtd: Giving out device 2 to BIOS-DO_NOT_TOUCH

but latter:
.......................
.......................
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001e0024: 0x7265 
id
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x001e0000 is not formatted. It will be erased
................... repeated for tree more blocks

cat /proc/mtd gives:

dev:    size   erasesize  name
mtd0: 00200000 00010000 "Physically mapped flash"
mtd1: 001e0000 00010000 "fixed_flash"
mtd2: 00020000 00010000 "BIOS-DO_NOT_TOUCH"

I'm not sure if this correct as before with 2.4.19 it looks like this

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 001e0000 00010000 "fixed_flash"
mtd1: 00020000 00010000 "BIOS-DO_NOT_TOUCH"


Now the flash file system on the partision is corrupt :(

can someone please give me a little guidance on how to find the problem ?
what other info would help ?

Thanks In Advance,

	Frank. 
