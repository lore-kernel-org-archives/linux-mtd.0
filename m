Received: from apcoh.org ([217.197.167.123])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CNdLX-0005FV-3w
	for linux-mtd@lists.infradead.org; Fri, 29 Oct 2004 16:27:42 -0400
Received: from rasz (helo=localhost) by apcoh.org with local-esmtp (Exim 4.30)
	id 1CNdLQ-0006Ml-B8
	for linux-mtd@lists.infradead.org; Fri, 29 Oct 2004 22:27:32 +0200
Date: Fri, 29 Oct 2004 22:27:32 +0200 (CEST)
From: rasz@apcoh.org
To: linux-mtd@lists.infradead.org
Message-ID: <unknown.1@apcoh.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: not erasing | help | urgent
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, I'v got a kinda urgent problem, i tried to flash new image to
my box and encountered a strange problem. Flash seems to be partially
blocked. The box is running now, but if I turn it off I'm lost (bootloader
partially broken). Here is some info from my box.

dmesg :
Linux version 2.4.27 (root@gp) (gcc version 3.3.3) #70 Thu Oct 28 10:02:15
BST 2004
physmap flash device: 4000000 at 1fc00000
 Amd/Fujitsu Extended Query Table v1.0 at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
Using command line partition definition
Creating 2 MTD partitions on "Physically mapped flash":
0x00000000-0x00100000 : "kern"
0x00100000-0x00200000 : "root"

The flash is 2M Byte MXIC MX29LV160AB.

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00200000 00010000 "Physically mapped flash"
mtd1: 00100000 00010000 "kern"
mtd2: 00100000 00010000 "root"

# ./einfo /dev/mtd0
Device /dev/mtd0 has 4 erase regions
Region 0 is at 0x0 with size 0x4000 and has 0x1 blocks
Region 1 is at 0x4000 with size 0x2000 and has 0x2 blocks
Region 2 is at 0x8000 with size 0x8000 and has 0x1 blocks
Region 3 is at 0x10000 with size 0x10000 and has 0x1f blocks

# ./mtd_debug info /dev/mtd0

mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 2097152 (2M)
mtd.erasesize = 65536 (64K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 4

region[0].offset = 0x00000000
region[0].erasesize = 16384 (16K)
region[0].numblocks = 1
region[0].regionindex = 0
region[1].offset = 0x00004000
region[1].erasesize = 8192 (8K)
region[1].numblocks = 2
region[1].regionindex = 1
region[2].offset = 0x00008000
region[2].erasesize = 32768 (32K)
region[2].numblocks = 1
region[2].regionindex = 2
region[3].offset = 0x00010000
region[3].erasesize = 65536 (64K)
region[3].numblocks = 31
region[3].regionindex = 3

And now :

# ./flash_eraseall /dev/mtd0
Erasing 64 Kibyte @ 1f0000 -- 96 % complete.

Why only one sector ? This tool is from current CVS snapshot.

# ./eraseall /dev/mtd0
Erased 2048 Kibyte @ 0 -- 100% complete.

mm seems better (this one is from 2002 snapshot), but now :

# dd if=/dev/mtd0 bs=1 count=131000 |hexdump
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0004000 0000 0000 0000 0000 0000 0000 0000 0000
*
0006000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0008000 0000 0000 0000 0000 0000 0000 0000 0000
*
0010000 ffff ffff ffff ffff ffff ffff ffff ffff
*
001ffb0
131000+0 records in
131000+0 records out

Those FF'ed areas are fine, i can write there with no problem (dd or my
own program), but those zeroed are hosed :(. Nothing can be written there.

What can I do ? My bootloader has 128KB, but I can only flash region
0, second block of region 1 and region 3 :(.
HELP !
