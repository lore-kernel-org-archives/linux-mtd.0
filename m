Received: from smtp2.a1.net ([194.48.125.37] helo=smtp.a1.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BIkq0-0001Eg-0J
	for linux-mtd@lists.infradead.org; Wed, 28 Apr 2004 09:54:40 +0100
Received: from uxmsgf01-cnt (nathidingcontent.a1.net [194.48.124.30])
	Griff)linux-mtd@lists.infradead.org;
	Wed, 28 Apr 2004 10:54:39 +0200 (MET DST)
Received: from a1.net (uxmsgf01-cnt [10.247.30.44])
 by msgstore01.net.mobilkom.at
 (A1.net ORGANIZER - Alle Emails und Termine fest im Griff)
 with ESMTP id <0HWV005N0I33LF@msgstore01.net.mobilkom.at> for
 linux-mtd@lists.infradead.org; Wed, 28 Apr 2004 10:54:39 +0200 (MEST)
Date: Wed, 28 Apr 2004 10:54:39 +0200
From: hkrammer@a1.net
To: linux-mtd@lists.infradead.org
Message-id: <61d365f3dc.5f3dc61d36@a1.net>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-language: de
Content-transfer-encoding: 7BIT
Content-disposition: inline
Subject: jffs2 problem on ep7311
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I have running linux 2.4.19-rmk7 on a  self made cirrus board (EP7311 - 
ARM720T core)
and the system run fine, but sometimes I get problems to write files
into jffs2-flash-partition.

To isolate the problem I have written following script:

while /bin/true
do
   echo COPY
   time cp /bin/busybox /mnt/asd
   echo SYNC
   sync
done

Here my log of this simple test:
--------------------------------
COPY
cp: Write Error: Input/output error
real    0m 0.57s
user    0m 0.01s
sys     0m 0.19s
SYNC
COPY
cp: Write Error: Input/output error
real    0m 1.27s
user    0m 0.03s
sys     0m 0.23s
SYNC
COPY
real    0m 54.31s
user    0m 0.02s
sys     0m 14.05s
SYNC

After an Inpout/Output Error my file is corrupted.


Here is my log, after an Inpout/Output Error:
---------------------------------------------
increasing writtenlen by 4096
jffs2_commit_write() returning 4096. nrpages is 41
jffs2_prepare_write() nrpages 42
end prepare_write(). nrpages 42
jffs2_commit_write(): ino #460, page at 0x29000, range 0-4096, nrpages 42
jffs2_commit_write() loop: 0x1000 to write to 0x29000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x15b0 bytes at 0x13ea50
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1539, total_in 4084,
total_out 2545
calling deflate with avail_in 12, avail_out 1539
deflate returned with avail_in 0, avail_out 1529, total_in 4096,
total_out 2555
zlib compressed 4096 bytes into 2561
Last[2] is cb84, datum is 341f
Write of 2629 bytes at 0x0013ea50 failed. returned 0, retlen 838
jffs2_add_physical_node_ref(): Node at 0x13ea50, size 0xa48
jffs2_mark_node_obsolete called with already obsolete node at 0x0013ea50
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 30, nr_erasing_blocks 0, dirty_size
0x32808
jffs2_commit_write(): Not all bytes written. Marking page !uptodate
jffs2_commit_write(): Only 0 bytes written to page. start (0) not
reached, returning -5
jffs2_commit_write() returning -5. nrpages is 42

boot-msg :
---------
physmap flash device: 400000 at 0
Search for id:(04 22f9) interleave(1) type(2)
Found: Fujitsu MBM29LV320BE
Physically mapped flash: Found 1 x16 devices at 0x0 in 16-bit mode
number of JEDEC chips: 1
mtd: Giving out device 0 to Physically mapped flash
Using physmap partition definition
Creating 3 MTD partitions on "Physically mapped flash":
0x00000000-0x00010000 : "bootROM"
mtd: Giving out device 1 to bootROM
0x00010000-0x00100000 : "zImage"
mtd: Giving out device 2 to zImage
0x00100000-0x00400000 : "rootdisk"
mtd: Giving out device 3 to rootdisk

note:
rootdisk is my jffs2 root-partition




Any ideas ?

Best regards,
Harald


-- 
Harald Krammer
Brucknerstrasse 33
A - 4020  Linz
AUSTRIA

Mobil +43.(0) 664. 130 59 58
Mail: hkrammer@a1.net

Please avoid sending me Word or PowerPoint attachments.
See
http://www.fsf.org/philosophy/no-word-attachments.html
