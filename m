Received: from mx03.ca.mci.com ([142.77.2.11])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDwTi-0005iE-Fo
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 03:19:46 +0100
Received: from roadie.xiphos.ca (unknown [216.95.199.148])
	by mx03.ca.mci.com (Postfix) with ESMTP id 780C03CC3A
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Apr 2004 22:19:44 -0400 (EDT)
From: Joshua Lamorie <jpl@xiphos.ca>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1081995604.30866.20.camel@roadie.xiphos.ca>
Mime-Version: 1.0
Date: Wed, 14 Apr 2004 22:20:04 -0400
Content-Transfer-Encoding: 7bit
Subject: JFFS2 on big-endian system, 8-bit wide flash on 32-bit bus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gidday there,

I have a problem mounting my physically mapped flash device as JFFS2. 
Here is what I see. (I also have MTD debugging on)

# mount -t jffs2 /dev/rom7 /mnt
mtdblock_open
ok
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000:
0x1919 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008:
0xf0f0 id
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased

( a long time later)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008e0074:
0x3c3c id
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x008e0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008f0000:
0x1919 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x008f0008:
0xf0f0 id
JFFS2: Erase block at 0x008f0000 is not formatted. It will be erased
Cowardly refusing to erase blocks on filesystem with no valid JFFS2
nodes
mtdblock_release
ok
mount: Mounting /dev/rom7 on /mnt failed: Invalid argument

This appears to be reading more than 8-bits at a time from my flash
because...
a) My flash adapter repeats the 8-bits on all buslanes.
b) I don't see the MTD writes or ioctls.

Now for some details of my system.

I have a board with Xilinx Virtex-II Pro (PPC 405) running Linux 2.4.26.

Attached to the 32-bit PLB, I have an interface to an 8-bit AMD flash
device (16 Meg).  I have this configured in the kernel, and it appears
to be recognized okay at boot.

physmap flash device: 1000000 at a8000000
 Amd/Fujitsu Extended Query Table v1.3 at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
mtd: Giving out device 0 to Physically mapped flash
Using physmap partition definition
Creating 7 MTD partitions on "Physically mapped flash":
0x00000000-0x00080000 : "Region A"
mtd: Giving out device 1 to Region A
0x00080000-0x00100000 : "Region B"
mtd: Giving out device 2 to Region B
0x00100000-0x00180000 : "Region C"
mtd: Giving out device 3 to Region C
0x00180000-0x00200000 : "Region D"
mtd: Giving out device 4 to Region D
0x00200000-0x00300000 : "uImage"
mtd: Giving out device 5 to uImage
0x00300000-0x00700000 : "ramdisk.gz"
mtd: Giving out device 6 to ramdisk.gz
0x00700000-0x01000000 : "User FS"
mtd: Giving out device 7 to User FS

It nicely shows up in /proc/mtd  and after making the character
devices /dev/mtd[0-7] I can use mtd_debug to get some interesting
info.

# ./mtd_debug info /dev/mtd0
MTD_open
MTD_ioctl
MTD_ioctl
mtd.type = MTD_NMTD_close
ORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 16777216 (16M)
mtd.erasesize = 65536 (64K)
mtd.oobblock = 0 
mtd.oobsize = 0 
mtd.ecctype = MTD_ECC_NONE
regions = 0


I have written quite successfully to flash with /dev/mtd0 and
in my bootloader (u-boot, which gives me direct physical access)
I can see that stuff has been done.

Before getting the mount error, I used the following procedure.

a) erased the mtd (char) device

# ./erase /dev/mtd7 0 144
MTD_open
Erase Total 144 MTD_ioctl
Units
MTD_ioctl
Performing FlasMTD_ioctl
Performing FlasMTD_ioctlat offset 0x0
Performing FlasMTD_ioctlat offset 0x10000
Performing FlasMTD_ioctlat offset 0x20000
[snip]
Performing FlasMTD_ioctlat offset 0x8e0000
h Erase of length 65536 at offset 0x8f0000 done
MTD_close


b) Mounted the associated block device
# mount -t jffs2 /dev/rom7 /mnt
mtdblock_open
ok
(that took about 30 seconds to return)

c) Checked the mount table and size...
# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/ram0                 3963      1477      2282  39% /
none                     15396      2448     12948  16% /var/shm
/dev/rom7                 9216      8448       768  92% /mnt

(so why is 92% of that partition used???)

d) Wrote a file 
# echo "This is a test" > /mnt/testing.txt
Node totlen on flash (0x00000000) != totlen in node ref (0x00000044)
# ls /mnt
testing.txt

e) Read the file
# cat /mnt/testing.txt 
This is a test

f) Unmounted the filesystem
# umount /mnt
mtdblock_release
ok

e) Tried to mount it again, which is when all the crap occurred.

I exited to my bootloader, and using byte-wise reads, I looked at some
of the blocks it was complaining about.

[q5 boot]> md.b 0xa8800000
a8800000: 19 85 20 03 00 00 00 0c f0 60 dc 98 ff ff ff ff    ..
......`......
a8800010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff   
................
a8800020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff   
................
a8800030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff   
................

That looks just like what I saw on my i86 laptop when I generated an
image with mkfs.jffs2 -b --pad=0x800000

I searched through the archives (googled with site:lists.infradead.org)
but couldn't see much that resembled my problem.

I noticed that mtdblock didn't seem to implement read calls, so where is
that going through?  How can I make sure that this is doing only 8-bit
access?

Any hints, cajoles, witty criticism, or critty witicisms appreciated.

Joshua


-- 
Joshua Lamorie				jpl@xiphos.ca
Space Systems				514-848-9640 ext. 277
Xiphos Technologies Inc.		514-848-9644 (fax)
