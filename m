Received: from n1.cetrtapot.si ([89.212.80.162])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KQ13f-00054d-WB
	for linux-mtd@lists.infradead.org; Mon, 04 Aug 2008 14:29:13 +0000
Received: from localhost (localhost.dmz.cetrtapot.si [127.0.0.1])
	by n1.cetrtapot.si (Postfix) with ESMTP id DC0C9BED1
	for <linux-mtd@lists.infradead.org>;
	Mon,  4 Aug 2008 16:28:53 +0200 (CEST)
Received: from n1.cetrtapot.si ([127.0.0.1])
	by localhost (n1.dmz.cetrtapot.si [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EsF+giB9UTuK for <linux-mtd@lists.infradead.org>;
	Mon,  4 Aug 2008 16:28:35 +0200 (CEST)
Received: from [172.31.65.135] (inside.kranj.cetrtapot.si [192.168.66.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by n1.cetrtapot.si (Postfix) with ESMTP id 50721BD02
	for <linux-mtd@lists.infradead.org>;
	Mon,  4 Aug 2008 16:28:35 +0200 (CEST)
Message-ID: <489711DE.5010600@cetrtapot.si>
Date: Mon, 04 Aug 2008 16:27:42 +0200
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: no summary vs. summary on NAND
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to make summarized JFFS2 images for 256MB NAND flash. The normal image is created with:
mkfs.jffs2 \
	--squash \
	--little-endian \
	--pagesize=2048 \
	--eraseblock=131072 \
	--no-cleanmarkers \
	--root=/work/sdk/cris-uclibc/target-nand \
	--output=/work/sdk/cris-uclibc/image-nand-2Gb

Then summarized image is made with sumtool:
./hosttools/sumtool \
	--eraseblock=131072 \
	-p \
	-i /work/sdk/cris-uclibc/image-nand-2Gb \
	-o /work/sdk/cris-uclibc/image-nand-2Gb.summary

Below is simple shell script that erases flash and burns the JFFS2 image with nandwrite.
The mount times are improved a bit.
When un-mounting for the first time it takes for ages, subsequent un-mounts are fast!

Am I doing this correct, or should the results be be better with summarized image?

# sh -x nand.sh 
+ umount /mnt
umount: cannot umount /mnt: Invalid argument
+ modprobe carneol-nand
+ flash_eraseall /dev/mtd3
Erasing 128 Kibyte @ 5000000 -- 31 % complete.
Skipping bad block at 0x05020000
Erasing 128 Kibyte @ 8c80000 -- 54 % complete.
Skipping bad block at 0x08ca0000
Erasing 128 Kibyte @ ffe0000 -- 99 % complete.
+ echo Testing ordinary JFFS2 image
Testing ordinary JFFS2 image
+ nandwrite -pa /dev/mtd3 /image-nand-2Gb
Writing data to block 0
Writing data to block 20000
Writing data to block 40000
Writing data to block 60000
Writing data to block 80000
Writing data to block a0000
Writing data to block c0000
Writing data to block e0000
Writing data to block 100000
Writing data to block 120000
Writing data to block 140000
Writing data to block 160000
Writing data to block 180000
Writing data to block 1a0000
Writing data to block 1c0000
Writing data to block 1e0000
Writing data to block 200000
Writing data to block 220000
Writing data to block 240000
Writing data to block 260000
Writing data to block 280000
Writing data to block 2a0000
Writing data to block 2c0000
Writing data to block 2e0000
Writing data to block 300000
Writing data to block 320000
Writing data to block 340000
+ time mount /mnt
real	0m 12.75s
user	0m 0.00s
sys	0m 12.72s
+ sleep 1
+ time umount /mnt
real	4m 19.33s
user	0m 0.00s
sys	4m 19.11s
+ sleep 1
+ time mount /mnt
real	0m 12.78s
user	0m 0.00s
sys	0m 12.75s
+ sleep 1
+ time umount /mnt
real	0m 0.25s
user	0m 0.00s
sys	0m 0.02s
+ sleep 3
+ flash_eraseall /dev/mtd3
Erasing 128 Kibyte @ 5000000 -- 31 % complete.
Skipping bad block at 0x05020000
Erasing 128 Kibyte @ 8c80000 -- 54 % complete.
Skipping bad block at 0x08ca0000
Erasing 128 Kibyte @ ffe0000 -- 99 % complete.
+ echo Testing summarized JFFS2 image
Testing summarized JFFS2 image
+ nandwrite -pa /dev/mtd3 /image-nand-2Gb.summary
Writing data to block 0
Writing data to block 20000
Writing data to block 40000
Writing data to block 60000
Writing data to block 80000
Writing data to block a0000
Writing data to block c0000
Writing data to block e0000
Writing data to block 100000
Writing data to block 120000
Writing data to block 140000
Writing data to block 160000
Writing data to block 180000
Writing data to block 1a0000
Writing data to block 1c0000
Writing data to block 1e0000
Writing data to block 200000
Writing data to block 220000
Writing data to block 240000
Writing data to block 260000
Writing data to block 280000
Writing data to block 2a0000
Writing data to block 2c0000
Writing data to block 2e0000
Writing data to block 300000
Writing data to block 320000
Writing data to block 340000
+ time mount /mnt
real	0m 9.43s
user	0m 0.00s
sys	0m 9.39s
+ sleep 1
+ time umount /mnt
real	4m 25.51s
user	0m 0.00s
sys	0m 0.02s
+ sleep 1
+ time mount /mnt
real	0m 9.42s
user	0m 0.00s
sys	0m 9.40s
+ sleep 1
+ time umount /mnt
real	0m 0.25s
user	0m 0.00s
sys	0m 0.03s

Best regards,
Hinko

-- 
ÈETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si
