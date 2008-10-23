Received: from smtp.argonst.com ([72.165.80.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kt14Q-0002Xd-5i
	for linux-mtd@lists.infradead.org; Thu, 23 Oct 2008 14:21:50 +0000
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Transfer-Encoding: 7bit
Message-Id: <F824315E-76A0-48D8-8E9B-2949D954EF2E@argonst.com>
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
To: linux-mtd@lists.infradead.org
From: Allon Stern <allon.stern@argonst.com>
Subject: MTD Erase Size & JFFS2
Date: Thu, 23 Oct 2008 10:21:28 -0400
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

<Channeling my office-mate>

I'm putting the finishing touches on the MTD setup on a PXA-based  
board and have a question. My FLASH part contains 2 dies in one  
package and each has a few small blocks at their start followed by a  
larger number of large blocks. The kernel boot info for this is:

Probing Numonyx StrataFlash at physical address 0x00000000 (16-bit  
bankwidth)
Numonyx StrataFlash: Found 1 x16 devices at 0x0 in 16-bit bank
Numonyx StrataFlash: Found 1 x16 devices at 0x2000000 in 16-bit bank
  Intel/Sharp Extended Query Table at 0x010A
  Intel/Sharp Extended Query Table at 0x010A
  Intel/Sharp Extended Query Table at 0x010A
  Intel/Sharp Extended Query Table at 0x010A
  Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
Using auto-unlock on power-up/resume
cfi_cmdset_0001: Erase suspend on write enabled
erase region 0: offset=0x0,size=0x8000,blocks=4
erase region 1: offset=0x20000,size=0x20000,blocks=255
erase region 2: offset=0x2000000,size=0x8000,blocks=4
erase region 3: offset=0x2020000,size=0x20000,blocks=255
Creating 5 MTD partitions on "Numonyx StrataFlash":
0x00000000-0x00040000 : "u-boot-bin"
0x00040000-0x00060000 : "uboot-env"
0x00060000-0x00860000 : "kernel"
0x00860000-0x01860000 : "initrd"
0x01860000-0x04000000 : "optfs"

I have both the char and block devices for these partitions in /dev  
and want a JFFS2 partition in optfs. To that end, I've done:
$ flash_eraseall -j /dev/mtd4

which I can explore:

$ dd if=/dev/mtdblock4 bs=512 count=81152 | hexdump -C
00000000  85 19 03 20 0c 00 00 00  b1 b0 1e e4 ff ff ff ff   
|... ............|
00000010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff   
|................|
*
00020000  85 19 03 20 0c 00 00 00  b1 b0 1e e4 ff ff ff ff   
|... ............|
00020010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff   
|................|
... pattern continues, stepping only by 20000 ...
02780000  85 19 03 20 0c 00 00 00  b1 b0 1e e4 ff ff ff ff   
|... ............|
02780010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff   
|................|
*
027a0000

My question / concern stems from the fact that the partition consists  
of a fair chunk of erase region 1 and all of erase regions 2 and 3.  
As shown above, those regions have different erase block sizes.

I'm concerned about "flash_eraseall -j" having used a consistent  
$20000 step size (from a MEMGETINFO ioctl on the dev node) for all of  
the clean markers it writes.

Is that going to mislead the JFFS2 file system into not handling the  
erasures correctly? Do I need to arrange my partitions to avoid  
having erase regions of different page sizes or is there a layer in  
the MTD driver or kernel that "handles" the small erase regions  
transparently?

Thanks for any advice.

-
allon
