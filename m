Received: from msr64.hinet.net ([168.95.4.164])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19snm5-0002hY-N8
	for <linux-mtd@lists.infradead.org>; Fri, 29 Aug 2003 19:15:06 +0100
Received: from s90.tku.edu.tw (61-230-51-18.HINET-IP.hinet.net [61.230.51.18])
	by msr64.hinet.net (8.9.3/8.9.3) with ESMTP id CAA12770
	for <linux-mtd@lists.infradead.org>;
	Sat, 30 Aug 2003 02:14:31 +0800 (CST)
Message-ID: <3F4F97CC.5060209@s90.tku.edu.tw>
Date: Sat, 30 Aug 2003 02:13:32 +0800
From: Ulysses <690190029@s90.tku.edu.tw>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: 7bit
Subject: CF+blkmtd problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I have a 64MB CF card and I want to use jffs2 filesystem on it.
My procedure is:
1.modprobe blkmtd device=/dev/hdc5
2.cat /proc/mtd
dev: size erasesize name
mtd0: 03c7c000 00020000 "blkmtd: /dev/hdc5"
3../mkfs.jffs2 -e 0x20000 -p -r root -o image.jffs2
4.dd if=image.jffs2 of=/dev/mtdblock/0
5.mount /dev/mtdblock/0 /mnt/a5 -t jffs2
It took a few seconds and mounted successfully. :-)

But I met some errors after I upgraded the kerenl(2.4.22) mtd and jffs2
driver version
to CVS version(mtd-snapshot-20030825.tar.bz2).
At first I used patchin.sh to patch my kernel. Then I made new
mkfs.jffs2 in util
directory and created a new jffs2 image file.
Then rebuild kernel and reboot last....
The procedure was same with above and I got some error message in syslog:

blkmtd: mtd0: [/dev/hdc5] erase_size = 128KiB
blkmtd: version 1.10
JFFS2 version 2.1. (C) 2001, 2002 Red Hat, Inc., designed by Axis
Communications AB.
jffs2: Erase block size too small (128KiB). Using virtual blocks size
(128KiB) instead
Empty flash at 0x0001fffc ends at 0x00020000
CLEANMARKER node found at 0x00020000, not first node in block (0x00000000)
Node at 0x0002000c with length 0x00000204 would run over the end of the
erase block
Perhaps the file system was created with the wrong erase size?
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020010:
0x0204 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020014:
0x774e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020018:
0x0005 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002001c:
0x0008 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020020:
0x81ed instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020028:
0x7400 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002002c:
0x65e2 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020030:
0x65e2 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020034:
0x65e2 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020038:
0x2c86 instead
Further such events for this erase block will not be printed
Eep. ofs 0x000200ed not word-aligned!
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000200f0:
0x48b8 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000200f4:
0x2290 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000200f8:
0x4ac9 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000200fc:
0xd5e1 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020100:
0xdbbe instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020104:
0xa411 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020108:
0x142e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002010c:
0xa205 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020110:
0x7aed instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020114:
0xb89c instead
Further such events for this erase block will not be printed
Empty flash at 0x0003fffc ends at 0x00040000
CLEANMARKER node found at 0x00040000, not first node in block (0x000200ed)
Node at 0x0004000c with length 0x00000514 would run over the end of the
erase block
Perhaps the file system was created with the wrong erase size?
Eep. ofs 0x000401da not word-aligned!
....
....
....
Further such events for this erase block will not be printed
Empty flash at 0x005bf1f8 ends at 0x005c0000
CLEANMARKER node found at 0x005c0000, not first node in block (0x005a29a9)
0x02812840
Erase at 0x02812840 finished, but state != MTD_ERASE_DONE. State is 0x10
instead.
Erase at 0x02812840 failed immediately: errno -5
blkmtd: erase: invalid erase request 0x200ED @ 0x027F2753
Erase at 0x027f2753 finished, but state != MTD_ERASE_DONE. State is 0x10
instead.
Erase at 0x027f2753 failed immediately: errno -5
blkmtd: erase: invalid erase request 0x200ED @ 0x027D2666
Erase at 0x027d2666 finished, but state != MTD_ERASE_DONE. State is 0x10
instead.
Erase at 0x027d2666 failed immediately: errno -5
blkmtd: erase: invalid erase request 0x200ED @ 0x027B2579
Erase at 0x027b2579 finished, but state != MTD_ERASE_DONE. State is 0x10
instead.
Erase at 0x027b2579 failed immediately: errno -5
blkmtd: erase: invalid erase request 0x200ED @ 0x0279248C
Erase at 0x0279248c finished, but state != MTD_ERASE_DONE. State is 0x10
instead.
Erase at 0x0279248c failed immediately: errno -5
blkmtd: erase: invalid erase request 0x200ED @ 0x0277239F
Erase at 0x0277239f finished, but state != MTD_ERASE_DONE. State is 0x10
instead.
Erase at 0x0277239f failed immediately: errno -5
blkmtd: erase: invalid erase request 0x200ED @ 0x027522B2

Then mount failed.
I don't know if I make a mistake.
So any suggestion or idea?
Thank you very much.

Sincerely,
Ulysses
