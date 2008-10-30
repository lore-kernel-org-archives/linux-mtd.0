Received: from smtp-vbr13.xs4all.nl ([194.109.24.33])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KvWY7-00042i-TH
	for linux-mtd@lists.infradead.org; Thu, 30 Oct 2008 12:22:52 +0000
Received: from mail3.aimsys.nl (a80-127-156-242.adsl.xs4all.nl
	[80.127.156.242])
	by smtp-vbr13.xs4all.nl (8.13.8/8.13.8) with ESMTP id m9UCMnlG077423
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Oct 2008 13:22:49 +0100 (CET)
	(envelope-from nvbolhuis@aimvalley.nl)
Message-ID: <4909A717.90502@aimvalley.nl>
Date: Thu, 30 Oct 2008 13:22:47 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: basic JFFS2 GC questions
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I need some confirmation of my understanding of JFFS2 garbage collection.

Some of our NAND chips (128MB, 128k blocks, 2k pages) have multi but errors,
at jffs2 mount time the first multi-bit error reported is:

mtd->read(0x1f39c bytes from 0x980c64) returned ECC error

I used jffs2dump and here are the relevant jffs2 inodes:
           Dirent     node at 0x01479d18, totlen 0x0000002e, #pino     1, version    45, #ino        49, nsize        6, name mib2cp
           Inode      node at 0x009daa50, totlen 0x000008af, #ino     49, version   795, isize  3145728, csize     2155, dsize     4096, offset  1507328
           Inode      node at 0x009af080, totlen 0x000008af, #ino     49, version   828, isize  3145728, csize     2155, dsize     4096, offset  1507328
           Inode      node at 0x00980c64, totlen 0x000008af, #ino     49, version   861, isize  3145728, csize     2155, dsize     4096, offset  1507328
           Inode      node at 0x00991f0c, totlen 0x000008af, #ino     49, version   893, isize  3145728, csize     2155, dsize     4096, offset  1507328
           Inode      node at 0x009624a0, totlen 0x000008af, #ino     49, version   926, isize  3145728, csize     2155, dsize     4096, offset  1507328
           Inode      node at 0x00973a14, totlen 0x000008af, #ino     49, version   958, isize  3145728, csize     2155, dsize     4096, offset  1507328
           Inode      node at 0x00945148, totlen 0x000008af, #ino     49, version   991, isize  3145728, csize     2155, dsize     4096, offset  1507328
           Inode      node at 0x009567c8, totlen 0x000008af, #ino     49, version  1023, isize  3145728, csize     2155, dsize     4096, offset  1507328

Why on earth does jffs2 instruct mtd to read 0x1f39c bytes (from 0x980c64) ?
I would expect 0x8af bytes.

Anyway, I guess this 4k part of the "mib2cp" file changed 7 times.
since the offset and size of the modification is always the same (4096 bytes) we're dealing with
7 x 4096 bytes dirty space, right ?

At first I thought, why not just read the latest inode (version 1023).
This can't be done right, because at mount time the file is chronologically "played back" by reading
all inodes in version order.

suppose block #76 (0x980000-0x9a0000) would have be "garbage collected". Does this mean
"inode at 0x00980c64" and "inode at 0x00991f0c" would somehow be removed from being played
back at mount time. In order words: would it have prevented the mtd read at 0x00980c64 ?
This must be I guess, otherwise there's no point in GC'ing.
