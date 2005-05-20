Received: from canuck.infradead.org ([2001:8b0:10b:4::1])
	by pentafluge.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DZ1xY-0008Qj-Jc
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 08:30:20 +0100
Received: from mail.deutaeit.de ([213.168.79.210])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DZ1u1-0004d2-Q6
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 03:26:40 -0400
From: Thorsten Haas <haas@deutaeit.de>
To: Ralph Siemsen <ralphs@netwinder.org>
In-Reply-To: <428C7E60.3090908@netwinder.org>
References: <1116403535.2682.7.camel@shrek> <1116489972.2647.4.camel@shrek>
	<428C7E60.3090908@netwinder.org>
Content-Type: text/plain
Date: Fri, 20 May 2005 09:26:24 +0200
Message-Id: <1116573984.2737.13.camel@shrek>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: CFI physmap - how to create partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, den 19.05.2005, 07:54 -0400 schrieb Ralph Siemsen:
> Thorsten Haas wrote:
> 
> > Solved. I used mphysmap.c, because there are two banks of flash on my
> > board, but mphysmap.c does not support partitioning yet. Though,
> > physmap.c does provide commandline partition parsing.
> > Sadly, mtd-id's seem not to be well-documented. I looked the one for
> > mappings to the physical memory area up in the source. It's
> > "phys_mapped_flash". Huzaa.
> 
> Hmm, are the two banks the same (eg. two chips of same type), and are 
> they consecutive in memory or parallel on the bus?  Then you can 
> actually use physmap.  Just pass it the combined size of both chips, the 
> MTD code will handle the rest.  There is no need to call probe function 
> for each bank, or to partition each bank separately.  This seems to be 
> another one of the MTD undocumented "features".

Yes, they are the same. Yes, they are consecutive in memory. Yes, I
tried that. Yes, it's now less undocumented, because my diff contains
this information :)

Well, actually, when using physmap.c I am able to create partitions, but
there is still some trouble when using the mtd partitions: erasing and
mounting fails.

Does someone have an idea, what I am doing wrong?

# flash_erase /dev/mtd0
File open error
# flash_erase /dev/mtd4 0x0 0x40
Erase Total 64 Units
Performing Flash Erase of length 131072 at offset 0x160000
MTD Erase failure: Invalid argument
# ls -la /dev/mtd*
crw-r--r--    1 0        0         90,   0 Jan  9  2005 /dev/mtd0
crw-r--r--    1 0        0         90,   1 May 13  2005 /dev/mtd1
crw-r--r--    1 0        0         90,   2 May 15  2005 /dev/mtd2
crw-r--r--    1 0        0         90,   3 May 15  2005 /dev/mtd3
crw-r--r--    1 0        0         90,   4 May 18  2005 /dev/mtd4
crw-r--r--    1 0        0         90,   5 May 18  2005 /dev/mtd5
brw-r--r--    1 0        0         31,   0 May 15  2005 /dev/mtdblock0
brw-r--r--    1 0        0         31,   1 May 15  2005 /dev/mtdblock1
brw-r--r--    1 0        0         31,   2 May 15  2005 /dev/mtdblock2
brw-r--r--    1 0        0         31,   3 May 15  2005 /dev/mtdblock3
brw-r--r--    1 0        0         31,   4 May 18  2005 /dev/mtdblock4
brw-r--r--    1 0        0         31,   5 May 18  2005 /dev/mtdblock5
# cat /proc/partitions
major minor  #blocks  name
  31     0       5632 mtdblock0
  31     1       1024 mtdblock1
  31     2       1408 mtdblock2
  31     3        128 mtdblock3
  31     4       8192 mtdblock4
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00580000 00020000 "root"
mtd1: 00100000 00020000 "kernel"
mtd2: 00160000 00020000 "initrd"
mtd3: 00020000 00020000 "reset"
mtd4: 00800000 00020000 "jffs2"

Here's the output of dmesg:
physmap flash device: 1000000 at 38000000
phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank
phys_mapped_flash: Found 1 x16 devices at 0x800000 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
0: offset=0x0,size=0x20000,blocks=64
1: offset=0x800000,size=0x20000,blocks=64
5 cmdlinepart partitions found on MTD device phys_mapped_flash
Creating 5 MTD partitions on "phys_mapped_flash":
0x00000000-0x00580000 : "root"
0x00580000-0x00680000 : "kernel"
0x00680000-0x007e0000 : "initrd"
0x007e0000-0x00800000 : "reset"
0x00800000-0x01000000 : "jffs2"

Kernel version: 2.6.11.8, mtd cvs snapshot 2005-05-15.
