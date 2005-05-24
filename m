Received: from cipe.mpl.ch ([195.134.130.77] helo=mail.mpl.ch)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DaZne-0001fq-Gg
	for linux-mtd@lists.infradead.org; Tue, 24 May 2005 09:50:28 -0400
Received: from [192.168.11.10] (IDENT:1000@pcdm.elsoft.loc [192.168.11.10])
	by mail.mpl.ch (8.13.2/8.13.2/Debian-1) with ESMTP id j4OCeeJo012778
	for <linux-mtd@lists.infradead.org>; Tue, 24 May 2005 14:40:40 +0200
Message-ID: <429320D1.2060003@elsoft.ch>
Date: Tue, 24 May 2005 14:40:49 +0200
From: =?ISO-8859-15?Q?=22David_M=FCller_=28ELSOFT_AG=29=22?=
	<d.mueller@elsoft.ch>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Subject: JFFS2 access delay
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

While playing around with JFFS2 on a NAND flash on an ARM based board,
i'm facing a strange problem:


First i create a tar file (using BusyBox's builtin tar command) on a
fresh formatted JFFS2 filesytems from a directory containing about 500
1kB files like this:

~ # flash_eraseall -j /dev/mtd/1
Erasing 16 Kibyte @ 1ea8000 -- 24 % complete. Cleanmarker written at
1ea8000.
Skipping bad block at 0x01eac000
Erasing 16 Kibyte @ 7dfc000 -- 99 % complete. Cleanmarker written at
7dfc000.
~ # mount -t jffs2 /dev/mtdblock/1 /mnt/hd/
~ # tar -cf /mnt/hd/t.tar /tmp/test
tar: Removing leading '/' from member names
~ # time ls -l /mnt/hd/
-rw-r--r--    1 root     root       769536 Jan  1 00:23 t.tar
real    0m 0.05s
user    0m 0.00s
sys     0m 0.04s


Everything seems to be fine. But if i unmount and remount the JFFS2
partition, the first "ls" to the JFFS2 takes quite some time:

~ # umount /mnt/hd/
~ # mount -t jffs2 /dev/mtdblock/1 /mnt/hd/
~ # time ls -l /mnt/hd/
-rw-r--r--    1 root     root       769536 Jan  1 00:23 t.tar
real    1m 32.68s
user    0m 0.01s
sys     0m 7.13s


During this delay, "jffs2_gcd_mtd1" is consuming a large amount of CPU
time but the rest of the system seems to be well.


If i don't build the tar file directly on the JFFS2 partition, but just
copy the final file over from another partition, there isn't such a delay:

~ # umount /mnt/hd/
~ # mount -t jffs2 /dev/mtdblock/1 /mnt/hd/
~ # time ls -l /mnt/hd/
-rw-r--r--    1 root     root       769536 Jan  1 00:53 t.tar
real    0m 0.07s
user    0m 0.01s
sys     0m 0.04s


I'm using linux 2.6.11. I also gave the latest MTD CVS code a try, but
with the same result.

Does this ring a bell? Any idea how to cure this behaviour?


Dave
