Received: from bay17-f15.bay17.hotmail.com ([64.4.43.65] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C8r6b-0005N3-6x
	for linux-mtd@lists.infradead.org; Sat, 18 Sep 2004 22:07:11 -0400
From: "yan yong" <floatingdudu@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Sun, 19 Sep 2004 10:05:56 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Message-ID: <BAY17-F15ByNP29M5f80002850e@hotmail.com>
Subject: JFFS2 problem on ST M29W640DB (90 ns)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

发件人: "floatingdudu" <floatingdudu@163.com> 
主题: JFFS2 problem on ST M29W640DB(90 ns) 
日期: 2004-09-19 09:50:59 
收件人: linux-mtd@lists.infradead.org 
抄送: (无)  
优先级: PriCommon  

--------------------------------------------------------------------------------


Hi friends,
My board has one 16-bit flash: ST M29W640DB (90ns).

M29W640DB (16 bit bus): 
0x00000000----0x00020000  bootloader 128k
0x00002000----0x00100000  kernel     
0x00100000----0x007F0000   JFFS2
0x007F0000----0x00800000   spare


I have burned bootloader(u-boot),jffs2 image and Linux kernel into flash.
I set bootargs as: 
root=/dev/mtdblock3 rw console=ttyS0,115200 ...........

When power on, Linux kernel boots from flash and print out info such as:
"
AT91RM9200-NOR:0x00800000 at 0x10000000
Amd/Fujitsu Extended Query Table v1.3 at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
mtd: Giving out device 0 to NOR flash on at91rm9200
AT91RM9200-NOR:using static partition definition
Creating 3 MTD partitions on "NOR flash on at91rm9200":
0x00000000-0x00020000 : "ARMboot"
mtd: Giving out device 1 to ARMboot
0x00020000-0x00100000 : "Kernel"
mtd: Giving out device 2 to Kernel
0x00100000-0x007f0000 : "JFFS2"
mtd: Giving out device 3 to JFFS2
....................
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: 
0x0020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008: 
0x0020 instead
.....................................................................................

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010000: 
0x0020 instead
.....................................................................................

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020000: 
0x0020 instead
............................................
"
In u-boot, I entered commands to display memory:
u-boot=> md 0x00100000 4/md 0x00110000 4
The magic number 0x1985 IS here!No 0x0020 exists at all!! 

It's quite strange!! Why Linux detects 0x0020 instead?

when Linux boots via nfs, I CAN erase these mtd partitions 
succussfully(eraseall /dev/mtdx)! Then I try to mount jffs2 after erasing:
# mount -t jffs2 /dev/mtdblockx /mnt
It's ok! Jffs2 can be mounted successfully!But when i reboot the board via 
nfs, and try to re-mount jffs2, It'll get failed again:
"
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010000: 
0x0020 instead
...........
"

I use "dd if=/dev/mtdx of=/mnt/memory.log" to dump flash memory into a 
file.and open
the file, I found all data in the file are 0x0020!!
But if I use "md 0x001..... len" in u-boot, all data are there and 0x1985 
can be found!

Why U-boot can read the data on flash correctly while linux can't?
and why sometimes linux can mount flash partitions correctly but sometimes 
not?
why linux always read all data as 0x0020?

when I simply replace ST M29W640DB with AMD AM29DL640D(the two chips are 
pin-to-pin comatible, ) JFFS2 works very fine!

what's the problem? 
 
Thanks
Jean

_________________________________________________________________
与联机的朋友进行交流，请使用 MSN Messenger:  http://messenger.msn.com/cn  
