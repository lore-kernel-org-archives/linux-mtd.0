Received: from [80.190.106.10] (helo=taytron.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AojMA-0002yu-8t
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2004 13:15:46 +0000
Message-ID: <007301c3ebea$29f96270$9602010a@jingle>
From: "Florian Schirmer" <jolt@tuxbox.org>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 5 Feb 2004 14:15:03 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: JFFS2 corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

i'm having a strange problem with a JFFS2 filesystem: I always get messages
about incorrect CRC values while mounting the filesystem. What i did:

<create a file which contains nothing but lots of 0x42 called dummy.bin>

eraseall -j /dev/mtdblock/3
mount -t jffs2 /dev/mtdblock /mnt
cp /dummy.bin /mnt/dummy1.bin
cp /dummy.bin /mnt/dummy2.bin
cp /dummy.bin /mnt/dummy3.bin
cp /dummy.bin /mnt/dummy4.bin
sync
cat /dev/mtdblock/3 > /dump1.raw
umount /mnt
cat /dev/mtdblock/3 > /dump2.raw
mount -t jffs2 /dev/mtdblock /mnt

<Multiple messages about invalid JFFS2 CRC values>

cat /dev/mtdblock/3 > /dump3.raw

cmp -l /dump1.raw /dump2.raw => files are the same
cmp -l /dump2.raw /dump3.raw => Multiple differences.

Did some addition tests:

umount /mnt
cat /dev/mtdblock/3 > /dump2.raw
mount -t jffs2 /dev/mtdblock /mnt

Mounts just fine. But there are huge chunks of 0x00 in my dummy files on the
jffs2 partition.

Any ideas on how to track down this problem? Basic MTD/flash stuff seems to
work just fine. I can work with a cramfs image on this partition without any
errors. So i assume something is going wrong in the JFFS2 code.

Specs:

Build Host: x86
Target: MIPS (LE)
Flash: NOR (AMD)
MTD/JFFS2 Codebase: current CVS

Thanks,
   Florian
