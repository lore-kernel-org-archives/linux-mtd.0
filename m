Received: from mail.tokheimkaizen.com ([220.225.73.142])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HouaC-0005F8-Hj
	for linux-mtd@lists.infradead.org; Fri, 18 May 2007 01:01:00 -0400
From: "Samir" <samir.rawal@tokheimkaizen.com>
To: "'Foo Tze Wan'" <twfoo@autostar.com.sg>
Subject: RE: Unable to mount with jffs2
Date: Fri, 18 May 2007 10:30:39 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <005c01c79906$b0a6e690$f700a8c0@tzewanpc>
Message-ID: <MAILt6x4n8zX0VRwIDB00000172@mail.tokheimkaizen.com>
Cc: linux-mtd@lists.infradead.org
Reply-To: samir.rawal@tokheimkaizen.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

I am using the same AT91rm9200,SST39vf3201 with 2.4.27-vrs1 Kernel.

I am able to mount the jffs2 on mtdblock0.
I am not using the jffs2 image.
I am getting message like below.
But able to mount flash with same error

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00001000 "Physically mapped flash"
# mount -t jffs2 /dev/mtdblock0 /mnt
mtdblock_open
ok
jffs2_scan_inode_node(): CRC failed on node at 0x000cb4d0: Read 0xffffffff,
calculated 0xb6b94fd2
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000cb4d4:
0x007d instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000cb4d8:
0x4c36 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000cb4dc:
0x000c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000cb4e0:
0x0105 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000cb4e4:
0x81ed instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000cb4ec:
0xa000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000cb4f0:
0x068a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000cb4f4:
0x068a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000cb4f8:
0x068a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000cb4fc:
0x9000 instead
Further such events for this erase block will not be printed
Internal flash device timeout occured or write operation was performed while
flash was erasing
Internal flash device timeout occured or write operation was performed while
flash was erasing
Internal flash device timeout occured or write operation was performed while
flash was erasing
Internal flash device timeout occured or write operation was performed while
flash was erasing
Internal flash device timeout occured or write operation was performed while
flash was erasing
Internal flash device timeout occured or write operation was performed while
flash was erasing
Internal flash device timeout occured or write operation was performed while
flash was erasing
Internal flash device timeout occured or write operation was performed while
flash was erasing
Internal flash device timeout occured or write operation was performed while
flash was erasing
Internal flash device timeout occured or write operation was performed while
flash was erasing
Internal flash device timeout occured or write operation was performed while
flash was erasing
Newly-erased block contained word 0xff7fff7f at offset 0x000d2000
# Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Internal flash device timeout occurred or write operation was performed
while flash was programming.
Newly-erased block contained word 0x20031985 at offset 0x003d1000
 

#cd /mnt
#ls
#files in Flash drive

Samir Raval
(R&D Department)
Tokheim Kaizen Pvt. Ltd.
A-313,TTC Industrial Area,MIDC
Mahape,Navi Mumbai - 400 710
Maharashtra,INDIA
Direct Line:67614140
tel no:27783018/20  Ext:-140
 
-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Foo Tze Wan
Sent: Friday, May 18, 2007 10:10 AM
To: linux-mtd@lists.infradead.org
Subject: Unable to mount with jffs2

Hi community,

I am using a 2.6.17 kernel with patches from 
http://maxim.org.za/at91_26.html on a AT91RM9200 board. I am facing problems

with mounting jffs2 on my flash. The reported errors are related to the 
magic number 0x1985. I understand that the archive and linux-mtd FAQ has 
similar problems with this magic number thing, but I'm afraid I'm still not 
moving forward after a few days (I will try to search again though). Thus, 
appreciate your kind patience.

My MTD profile with the "cat /proc/mtd" command is:

    dev:    size   erasesize  name
    mtd0: 00400000 00010000 "flash1"
    mtd1: 00080000 00010000 "Bootloader"
    mtd2: 00080000 00010000 "zImage"
    mtd3: 00080000 00010000 "Ramdisk.gz"
    mtd4: 00280000 00010000 "User FS1"
    mtd5: 00400000 00010000 "flash2"
    mtd6: 00400000 00010000 "User FS2"

I was not able to mount mtdblock6, which is the 2nd piece of flash. Both 
flash parts are SST39VF3201. The following is what have I done.

1. At my host system, I created a JFFS2 image with the mkfs.jffs2 tool (ver 
1.50). The command I use is:

    mkfs.jffs2 -d jffs2 -e 0x10000 -o jffs2_64K_block.img

2. At my target, with U-boot, I erase the 2nd piece of flash entirely.

3. When my board boots up, I copied the JFFS2 image to mtdblock6. The 
command I use is:

    cp jffs2_64K_block.img /dev/mtdblock6.

The copying works fine.

4. Next, I try to mount with:

    mount -t jffs2 -o noatime /dev/mtdblock6 /mnt

What follows is a long list of error messages as follows:

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0000: 
0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000d0000: 
0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0000: 
0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0000: 
0xffff instead
Empty flash at 0x000f0004 ends at 0x000f68f8
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f68f8: 
0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00140000: 
0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00140004: 
0x000c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00140008: 
0xb0b1 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00150000: 
0x1952 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00150004: 
0x000c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00150008: 
0xb0b1 instead
Empty flash at 0x0015000c ends at 0x0015a000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0015a000: 
0xff52 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00160000: 
0xffff instead
Empty flash at 0x00160004 ends at 0x0016f000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0016f000: 
0xff52 instead
jffs2_scan_eraseblock(): Node at 0x00170000 {0x1985, 0x2003, 0x0000000c) has

invalid CRC 0xffffb0b1 (calculated 0xe41eb0b1)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00170004: 
0x000c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00170008: 
0xb0b1 instead
Empty flash at 0x0017000c ends at 0x00177000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00177000: 
0xff52 instead
Empty flash at 0x00177004 ends at 0x0017c000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0017c000: 
0xff52 instead
jffs2_scan_eraseblock(): Node at 0x001d0000 {0x1985, 0x2003, 0x0000000c) has

invalid CRC 0xffffb0b1 (calculated 0xe41eb0b1)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001d0004: 
0x000c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001d0008: 
0xb0b1 instead
jffs2_scan_eraseblock(): Node at 0x001f0000 {0x1985, 0x2003, 0x0000000c) has

invalid CRC 0xffffb0b1 (calculated 0xe41eb0b1)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001f0004: 
0x000c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001f0008: 
0xb0b1 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0000: 
0xffff instead
Empty flash at 0x002c0004 ends at 0x002c1000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c1000: 
0xffff instead
Empty flash at 0x002c1004 ends at 0x002c2000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c2000: 
0xffff instead
Empty flash at 0x002c2004 ends at 0x002c3000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c3000: 
0xffff instead
Empty flash at 0x002c3004 ends at 0x002c4000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c4000: 
0xffff instead
Empty flash at 0x002c4004 ends at 0x002c5000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c5000: 
0xffff instead
Empty flash at 0x002c5004 ends at 0x002c6000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c6000: 
0xffff instead
Empty flash at 0x002c6004 ends at 0x002c7000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c7000: 
0xffff instead
Empty flash at 0x002c7004 ends at 0x002c8000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c8000: 
0xffff instead
Empty flash at 0x002c8004 ends at 0x002c9000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c9000: 
0xffff instead
Further such events for this erase block will not be printed
Empty flash at 0x002c9004 ends at 0x002ca000
Empty flash at 0x002ca004 ends at 0x002cb000
Empty flash at 0x002cb004 ends at 0x002cc000
Empty flash at 0x002cc004 ends at 0x002cd000
Empty flash at 0x002cd004 ends at 0x002ce000
Empty flash at 0x002ce004 ends at 0x002cf000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002d0000: 
0xffff instead
Empty flash at 0x002d0004 ends at 0x002d1000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002d1000: 
0xffff instead
Empty flash at 0x002d1004 ends at 0x002d2000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002d2000: 
0xffff instead
Empty flash at 0x002d2004 ends at 0x002d3000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002d3000: 
0xffff instead
Empty flash at 0x002d3004 ends at 0x002d4000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002d4000: 
0xffff instead
Empty flash at 0x002d4004 ends at 0x002d5000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002d5000: 
0xffff instead
Empty flash at 0x002d5004 ends at 0x002d6000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002d6000: 
0xffff instead
Empty flash at 0x002d6004 ends at 0x002d7000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002d7000: 
0xffff instead
Empty flash at 0x002d7004 ends at 0x002d8000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002d8000: 
0xffff instead
Empty flash at 0x002d8004 ends at 0x002d9000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002d9000: 
0xffff instead
Further such events for this erase block will not be printed
Empty flash at 0x002d9004 ends at 0x002da000
Empty flash at 0x002da004 ends at 0x002db000
Empty flash at 0x002db004 ends at 0x002dc000
Empty flash at 0x002dc004 ends at 0x002dd000
Empty flash at 0x002dd004 ends at 0x002de000
Empty flash at 0x002de004 ends at 0x002df000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0000: 
0xffff instead
Empty flash at 0x002e0004 ends at 0x002e1000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e1000: 
0xffff instead
Empty flash at 0x002e1004 ends at 0x002e2000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e2000: 
0xffff instead
Empty flash at 0x002e2004 ends at 0x002e3000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e3000: 
0xffff instead
Empty flash at 0x002e3004 ends at 0x002e4000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e4000: 
0xffff instead
Empty flash at 0x002e4004 ends at 0x002e5000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e5000: 
0xffff instead
Empty flash at 0x002e5004 ends at 0x002e6000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e6000: 
0xffff instead
Empty flash at 0x002e6004 ends at 0x002e7000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e7000: 
0xffff instead
Empty flash at 0x002e7004 ends at 0x002e8000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e8000: 
0xffff instead
Empty flash at 0x002e8004 ends at 0x002e9000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e9000: 
0xffff instead
Further such events for this erase block will not be printed
Empty flash at 0x002e9004 ends at 0x002ea000
Empty flash at 0x002ea004 ends at 0x002eb000
Empty flash at 0x002eb004 ends at 0x002ec000
Empty flash at 0x002ec004 ends at 0x002ed000
Empty flash at 0x002ed004 ends at 0x002ee000
Empty flash at 0x002ee004 ends at 0x002ef000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002f0000: 
0xffff instead
Empty flash at 0x002f0004 ends at 0x002f1000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002f1000: 
0xffff instead
Empty flash at 0x002f1004 ends at 0x002f2000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002f2000: 
0xffff instead
Empty flash at 0x002f2004 ends at 0x002f3000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002f3000: 
0xffff instead
Empty flash at 0x002f3004 ends at 0x002f4000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002f4000: 
0xffff instead
Empty flash at 0x002f4004 ends at 0x002f5000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002f5000: 
0xffff instead
Empty flash at 0x002f5004 ends at 0x002f6000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002f6000: 
0xffff instead
Empty flash at 0x002f6004 ends at 0x002f7000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002f7000: 
0xffff instead
Empty flash at 0x002f7004 ends at 0x002f8000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002f8000: 
0xffff instead
Empty flash at 0x002f8004 ends at 0x002f9000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002f9000: 
0xffff instead
Further such events for this erase block will not be printed
Empty flash at 0x002f9004 ends at 0x002fa000
Empty flash at 0x002fa004 ends at 0x002fb000
Empty flash at 0x002fb004 ends at 0x002fc000
Empty flash at 0x002fc004 ends at 0x002fd000
Empty flash at 0x002fd004 ends at 0x002fe000
Empty flash at 0x002fe004 ends at 0x002ff000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340000: 
0xffff instead
Empty flash at 0x00340004 ends at 0x00341000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00341000: 
0xffff instead
Empty flash at 0x00341004 ends at 0x00342000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00342000: 
0xffff instead
Empty flash at 0x00342004 ends at 0x00343000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00343000: 
0xffff instead
Empty flash at 0x00343004 ends at 0x00344000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00344000: 
0xffff instead
Empty flash at 0x00344004 ends at 0x00345000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00345000: 
0xffff instead
Empty flash at 0x00345004 ends at 0x00346000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00346000: 
0xffff instead
Empty flash at 0x00346004 ends at 0x00347000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00347000: 
0xffff instead
Empty flash at 0x00347004 ends at 0x00348000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00348000: 
0xffff instead
Empty flash at 0x00348004 ends at 0x00349000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00349000: 
0xffff instead
Further such events for this erase block will not be printed
Empty flash at 0x00349004 ends at 0x0034a000
Empty flash at 0x0034a004 ends at 0x0034b000
Empty flash at 0x0034b010 ends at 0x0034c000
Empty flash at 0x0034c004 ends at 0x0034d000
Empty flash at 0x0034d004 ends at 0x0034e000
Empty flash at 0x0034e00c ends at 0x0034f000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00350000: 
0xffff instead
Empty flash at 0x00350004 ends at 0x00351000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00351000: 
0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00351004: 
0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00351008: 
0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0035100c: 
0x7f03 instead
Empty flash at 0x00351010 ends at 0x00352000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00352000: 
0xffff instead
Empty flash at 0x00352004 ends at 0x00353000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00353000: 
0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00353004: 
0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00353008: 
0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0035300c: 
0x7f03 instead
Further such events for this erase block will not be printed
Empty flash at 0x00353010 ends at 0x00354000
Empty flash at 0x00354004 ends at 0x00355000
Empty flash at 0x00355010 ends at 0x00356000
Empty flash at 0x0035600c ends at 0x00357000
Empty flash at 0x0035700c ends at 0x00358000
Empty flash at 0x00358004 ends at 0x00359000
Empty flash at 0x0035900c ends at 0x0035a000
Empty flash at 0x0035a00c ends at 0x0035b000
Empty flash at 0x0035b00c ends at 0x0035c000
CLEANMARKER node found at 0x0035c000, not first node in block (0x00350000)
Empty flash at 0x0035c00c ends at 0x0035d000
CLEANMARKER node found at 0x0035d000, not first node in block (0x00350000)
Empty flash at 0x0035d00c ends at 0x0035e000
CLEANMARKER node found at 0x0035e000, not first node in block (0x00350000)
Empty flash at 0x0035e00c ends at 0x0035f000
CLEANMARKER node found at 0x0035f000, not first node in block (0x00350000)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360000: 
0xffff instead
Empty flash at 0x00360004 ends at 0x00361000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00361000: 
0xffff instead
Empty flash at 0x00361004 ends at 0x00362000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00362000: 
0xffff instead
Empty flash at 0x00362004 ends at 0x00363000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00363000: 
0xffff instead
Empty flash at 0x00363004 ends at 0x00364000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00364000: 
0xffff instead
Empty flash at 0x00364004 ends at 0x00365000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00365000: 
0xffff instead
Empty flash at 0x00365004 ends at 0x00366000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00366000: 
0xffff instead
Empty flash at 0x00366004 ends at 0x00367000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00367000: 
0xffff instead
Empty flash at 0x00367004 ends at 0x00368000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00368000: 
0xffff instead
Empty flash at 0x00368004 ends at 0x00369000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00369000: 
0xffff instead
Further such events for this erase block will not be printed
Empty flash at 0x00369004 ends at 0x0036a000
Empty flash at 0x0036a004 ends at 0x0036b000
Empty flash at 0x0036b00c ends at 0x0036c000
Empty flash at 0x0036c004 ends at 0x0036d000
Empty flash at 0x0036d004 ends at 0x0036e000
Empty flash at 0x0036e00c ends at 0x0036f000
CLEANMARKER node found at 0x0036f000, not first node in block (0x00360000)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00370000: 
0x19ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00370004: 
0x000c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00370008: 
0xb0b1 instead
Empty flash at 0x0037000c ends at 0x00371000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00371000: 
0xffff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00371004: 
0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00371008: 
0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0037100c: 
0x7f03 instead
Empty flash at 0x00371010 ends at 0x00372000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00372000: 
0x19ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00372004: 
0x000c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00372008: 
0xb0b1 instead
Further such events for this erase block will not be printed
Empty flash at 0x0037200c ends at 0x00373000
Empty flash at 0x00373010 ends at 0x00374000
Empty flash at 0x0037400c ends at 0x00375000
Empty flash at 0x0037500c ends at 0x00376000
Empty flash at 0x0037600c ends at 0x00377000
Empty flash at 0x0037700c ends at 0x00378000
Empty flash at 0x0037800c ends at 0x00379000
Empty flash at 0x0037900c ends at 0x0037a000
Empty flash at 0x0037a00c ends at 0x0037b000
CLEANMARKER node found at 0x0037b000, not first node in block (0x00370000)
Empty flash at 0x0037b00c ends at 0x0037c000
CLEANMARKER node found at 0x0037c000, not first node in block (0x00370000)
Empty flash at 0x0037c00c ends at 0x0037d000
CLEANMARKER node found at 0x0037d000, not first node in block (0x00370000)
Empty flash at 0x0037d00c ends at 0x0037e000
CLEANMARKER node found at 0x0037e000, not first node in block (0x00370000)
Empty flash at 0x0037e00c ends at 0x0037f000
CLEANMARKER node found at 0x0037f000, not first node in block (0x00370000)
Empty flash at 0x0037f00c ends at 0x0037f400
# JFFS2 error: (722) jffs2_do_read_inode_internal: CRC failed for read_inode

of inode 2 at physical location 0x80048
Returned error for crccheck of ino #2. Expect badness...
Newly-erased block contained word 0x2003ffff at offset 0x002f0000
Newly-erased block contained word 0x2003ffff at offset 0x002e0000
Newly-erased block contained word 0x2003ffff at offset 0x002d0000
Newly-erased block contained word 0x2003ffff at offset 0x002c0000
Newly-erased block contained word 0x2003ffff at offset 0x00273000
Newly-erased block contained word 0xffa9ffff at offset 0x0026bcc8
Newly-erased block contained word 0x2003ffff at offset 0x00257000
Newly-erased block contained word 0x2003ffff at offset 0x0024b000
Newly-erased block contained word 0xffffff01 at offset 0x00160000
Erase at 0x00140000 failed immediately: errno -5
Newly-erased block contained word 0x2003ffff at offset 0x000e0000
Erase at 0x000d0000 failed immediately: errno -5
Newly-erased block contained word 0x2003ffff at offset 0x000c0000
Newly-erased block contained word 0xfffdffff at offset 0x0007fea8
Newly-erased block contained word 0xffffff89 at offset 0x000593a4

5. After the last line, the system just stays there without returning to the

prompt until I intentionally hit the return key.

6. Some other background info: I created the flash part entry in 
jedec_probe.c with the erase region of:

    ERASEINFO(0x10000, 64),

This is also the reason why I think the JFFS2 image (created with the 
mkfs.jffs2 tool) should be specfiied with the "-e 0x10000" erase block size.

7. At the same time, I have modified the do_erase_oneblock( ...) function in

cfi_cmdset_0002.c by changing:

   map_write(map, CMD(0x30), adr);

to
   map_write(map, CMD(0x50), adr);

I thought that this should be appropriate since 0x50 is used for block erase

size of 64K, while 0x30 is used to indicate sector erase size of 4K. (Am I 
doing the correct steps?)

8. Part of the boot log is as shown:

Found: SST 39VF3201
flash1: Found 1 x16 devices at 0x0 in 16-bit bank
number of JEDEC chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Creating 4 MTD partitions on "flash1":
0x00000000-0x00080000 : "Bootloader"
0x00080000-0x00100000 : "zImage"
0x00100000-0x00180000 : "Ramdisk.gz"
0x00180000-0x00400000 : "User FS1"
Found: SST 39VF3201
flash2: Found 1 x16 devices at 0x0 in 16-bit bank
number of JEDEC chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Creating 1 MTD partitions on "flash2":
0x00000000-0x00400000 : "User FS2"

Are there any steps I have missed out? Thanks in advance.

Regards,
Tze Wan



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
