Received: from web60310.mail.yahoo.com ([216.109.118.121])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7omT-0002de-I5
	for <linux-mtd@lists.infradead.org>; Fri, 10 Oct 2003 05:21:33 +0100
Message-ID: <20031010042004.98859.qmail@web60310.mail.yahoo.com>
Date: Thu, 9 Oct 2003 21:20:04 -0700 (PDT)
From: Kevin Kaichuan He <hek_u5@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Eraseall error on Samsung NAND Flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have some problems with my Samsung NAND driver. The
MTD code I used is pulled from CVS today(10/09/03) and
the kernel version is 2.4.18(mips).

This is the Samsung NAND chip detected on my board:

---
exm2402_init: allocating memory for MTD
exm2402_init: before IO-remap
exm2402_init: set this->eccmode to NAND_ECC_SOFT
NAND device: Manufacturer ID: 0xec, Chip ID: 0x75 (Samsung NAND 32MiB 3,3V)
Using static partition definition
Creating 2 MTD partitions on "NAND 32MiB 3,3V":
0x00000000-0x00c00000 : "Operational RootFS"
0x00c00000-0x01000000 : "Golden RootFS"
---

This is all MTD partitions on my board:

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00100000 00010000 "Bootflash (boot)"
mtd1: 00c00000 00004000 "Operational RootFS"
mtd2: 00400000 00004000 "Golden RootFS"

----

Then when I do "eraseall -j /dev/mtd1"  (mtd1 is the 
1st partition of the Samsung NAND flash) I see the following errors
across the whole partition:


Erasing 16 Kibyte @ 0 --  0 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 4000 --  0 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 8000 --  0 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ c000 --  0 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 10000 --  0 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 14000 --  0 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 18000 --  0 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 1c000 --  0 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 20000 --  1 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 24000 --  1 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 28000 --  1 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 2c000 --  1 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 30000 --  1 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 34000 --  1 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 38000 --  1 % complete

....

[continues all the way to 100% complete, each block has the
same Input/output error]

Then if I mount the partition with JFFS2 and try copying a 
file to it, it will displays the following errors.

...
Erase at 0x00bf4000 failed immediately: errno -5
Erase at 0x00bf0000 failed immediately: errno -5
Erase at 0x00bec000 failed immediately: errno -5
Erase at 0x00be8000 failed immediately: errno -5
Erase at 0x00be4000 failed immediately: errno -5
Erase at 0x00be0000 failed immediately: errno -5
Erase at 0x00bdc000 failed immediately: errno -5
Erase at 0x00bd8000 failed immediately: errno -5
Erase at 0x00bd4000 failed immediately: errno -5
....

I basically cloned the edb7312.c to make my own NAND
driver for the Samsung K9F5608U0B chip. I'm wondering
if any people have some experience with the Samsung NAND
driver to share.

Thanks a lot!

Kevin
 
