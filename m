Received: from lst-amand-152-33-17-184.w82-127.abo.wanadoo.fr ([82.127.60.184]
	helo=polaris.sacet.fr)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HPFDx-0000Q3-IE
	for linux-mtd@lists.infradead.org; Thu, 08 Mar 2007 04:47:51 -0500
Received: from [127.0.0.1] (mimosa.sacet.fr [192.168.82.19])
	by polaris.sacet.fr (8.12.11/8.12.11) with ESMTP id l289md8u018956
	for <linux-mtd@lists.infradead.org>; Thu, 8 Mar 2007 10:48:39 +0100
Message-ID: <45EFDA0C.9030401@sacet.com>
Date: Thu, 08 Mar 2007 10:40:28 +0100
From: Michel LECONTE <michel.leconte@sacet.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Nand flash and jffs2 image problem
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

Hi everybody,

I'm using a compulab cm-x255 card with the 2.6.18-rc2 kernel.
I have some problems with the NAND flash (512MB) and jffs2 image.
Here is what I have done :

First I verify the mtd devices:
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00010000 "physmap-flash.0"
mtd1: 20000000 00020000 "rootfs"

Then I erased flash with :
# ./flash_eraseall -j /dev/mtd1
Erasing 128 Kibyte @ 360000 --  0 % complete. Cleanmarker written at 360000.
Skipping bad block at 0x00380000
Erasing 128 Kibyte @ 4ec0000 -- 15 % complete. Cleanmarker written at
4ec0000.
Skipping bad block at 0x04ee0000
Erasing 128 Kibyte @ e360000 -- 44 % complete. Cleanmarker written at
e360000.
Skipping bad block at 0x0e380000
Erasing 128 Kibyte @ 12a60000 -- 58 % complete. Cleanmarker written at
12a60000.
Skipping bad block at 0x12a80000
Erasing 128 Kibyte @ 12cc0000 -- 58 % complete. Cleanmarker written at
12cc0000.
Skipping bad block at 0x12ce0000
Erasing 128 Kibyte @ 17de0000 -- 74 % complete. Cleanmarker written at
17de0000.
Skipping bad block at 0x17e00000
Erasing 128 Kibyte @ 181a0000 -- 75 % complete. Cleanmarker written at
181a0000.
Skipping bad block at 0x181c0000
Erasing 128 Kibyte @ 18860000 -- 76 % complete. Cleanmarker written at
18860000.
Skipping bad block at 0x18880000
Erasing 128 Kibyte @ 1ffe0000 -- 99 % complete. Cleanmarker written at
1ffe0000.

I make an jffs2 image with :
# mkfs.jffs2 -l --pad=0x20000000 --eraseblock=0x20000 -d /opt/Debian_Ref
-o jffs2.img

I copy the image on flash :
# dd if=/opt/jffs2.img of=/dev/mtdblock1

dd: writing to `/dev/mtdblock1': Input/output error

7169+0 records in
7168+0 records out
3670016 bytes (3.7 MB) copied, 9.50543 seconds, 386 kB/s

I tried also :
# mkfs.jffs2 -d /opt/Debian_Ref -o jffs2.img
# mkfs.jffs2 -l --eraseblock=0x20000 -d /opt/Debian_Ref -o jffs2.img
and
# sdd instead of dd
but all without result.

I would like to know what I'm missing ?
Is it the good method ?
Can I just copy files with "cp" from an ext2 disk to the jffs2 flash or
I have to create an jffs2 image like what I have done ?

Thanks for your help.


Michel.
