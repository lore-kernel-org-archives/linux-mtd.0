Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13RDvG-0003BI-00
	for mtd-list@infradead.org; Tue, 22 Aug 2000 14:16:58 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13RDvE-0003BC-00
	for mtd@infradead.org; Tue, 22 Aug 2000 14:16:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39A26511.240F7998@arcom.co.uk> 
References: <39A26511.240F7998@arcom.co.uk>  <399CF6F1.4622CF44@arcom.co.uk> <26879.966589787@cygnus.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org
Subject: Re: JFFS oopses on mount 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Tue, 22 Aug 2000 14:16:54 +0100
Message-ID: <5111.966950214@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  It's working better than before.
> However, it oopsed again and it seems to have lost a file.
> I have an image of the flash which causes the oops but I have no idea
> what to do with it. 

That image mounts and works fine here. It was powered down half-way through 
an erase operation @0x40000, so we have an entire 128Kb of dirty flash, but 
it handles that just fine.

Which file do you think is missing? "jffs-testfiles/8"?
Remember that cp(1) will unlink the file before creating the new one.

JFFS: Trying to mount device 1f:00.
jffs_scan_flash(): start pos = 0x0, end = 0x180000
jffs_scan_flash(): 0xff at pos 0x0.
jffs_scan_flash(): 0xff ended at pos 0x40000.
*************** Dirty flash memory or bad inode: hexdump(pos = 0x40000, len = 128):
262144: efbe ffeb bbff efff ffef eefb aeae aeae  ï¾.ë..ï..ïîû....
262160: ffbe bfab abae feaf ffef afef aaef afee  .¾¿......ï.ïªï.î
262176: bbef aaaf baeb ebbf eaaf beae aabf feea  .ïª.ºëë¿ê.¾.ª¿.ê
262192: abfe efbf aaaa baeb aeee aaae aaae eeaf  ..ï¿ªªºë.îª.ª.î.
262208: feaa bfab aaae faaa aabb abaa aaaa baae  .ª¿.ª.úªª..ªªªº.
262224: bbbe fabe abbe eafb eaaa aeeb aaae eaaa  .¾ú¾.¾êûêª.ëª.êª
262240: ffbb efab aefa bfef aaee beee beef afef  ..ï..ú¿ïªî¾î¾ï.ï
262256: fbab efae aabf fbaf bfff effa efef ffff  û.ï.ª¿û.¿.ïúïï..
jffs_scan_flash(): Bad checksum: checksum = 472245, raw_inode.dchksum = 1042714
jffs_scan_flash(): 0xff at pos 0xcb0e0.
jffs_scan_flash(): 0xff ended at pos 0x180000.
JFFS: Dumping the file system's hash table...
*** c->hash[1]: "" (ino: 1, pino: 0)
*** c->hash[2]: "test-files1" (ino: 2, pino: 1)
*** c->hash[3]: "test-files2" (ino: 3, pino: 1)
*** c->hash[4]: "1" (ino: 4, pino: 2)
*** c->hash[5]: "2" (ino: 5, pino: 2)
*** c->hash[6]: "8" (ino: 6, pino: 2)
*** c->hash[7]: "4" (ino: 7, pino: 2)
*** c->hash[8]: ".md5sums" (ino: 8, pino: 2)
*** c->hash[13]: ".md5sums" (ino: 13, pino: 3)
*** c->hash[18]: "1" (ino: 1982938, pino: 3)
*** c->hash[19]: "2" (ino: 1982939, pino: 3)
*** c->hash[20]: "4" (ino: 1982940, pino: 3)
/ (ino: 1, highest_version: 0, size: 0)
  test-files2/ (ino: 3, highest_version: 1598, size: 0)
    4 (ino: 1982940, highest_version: 2, size: 4096)
    2 (ino: 1982939, highest_version: 2, size: 2048)
    1 (ino: 1982938, highest_version: 2, size: 1024)
    .md5sums (ino: 13, highest_version: 991740, size: 144)
  test-files1/ (ino: 2, highest_version: 1598, size: 0)
    .md5sums (ino: 8, highest_version: 991866, size: 144)
    4 (ino: 7, highest_version: 1605, size: 4096)
    8 (ino: 6, highest_version: 1613, size: 8192)
    2 (ino: 5, highest_version: 1601, size: 2048)
    1 (ino: 4, highest_version: 1600, size: 1024)
JFFS: GC thread pid=5477.
JFFS: Successfully mounted device 1f:00.
jffs_garbage_collect_thread(): Starting infinite loop.
thread_should_wake(): free=1003296, dirty=542760, blocksize=131072.
jffs_garbage_collect_thread(): collecting.
***jffs_garbage_collect_thread(): round #1, fmc->dirty_size = 542760
thread_should_wake(): free=1134368, dirty=411688, blocksize=131072.
thread_should_wake(): free=1134368, dirty=411688, blocksize=131072.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
