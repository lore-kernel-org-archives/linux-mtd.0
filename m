Received: from gwise1.sanmina-sci.com ([143.116.116.229])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AyfAs-0003yd-77
	for linux-mtd@lists.infradead.org; Wed, 03 Mar 2004 22:49:10 +0000
Message-Id: <s0460c6e.082@gwise1.sanmina-sci.com>
Date: Wed, 03 Mar 2004 16:48:26 -0600
From: "Flint Cowden" <Flint.Cowden@sanmina-sci.com>
To: <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: making jffs2 writes permanent
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I was able to do the following:

eraseall /dev/mtd/0

This produced a long long list of ioctl messages, ending in the entire
64M block erased. The following session ensued:


# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 04000000 00010000 "Physically mapped flash"
mtd1: 04000000 00010000 "my_jffs2"
mtd2: 00400000 00020000 "mtdram test device"


# mkdir /mnt
# mkdir /mnt/mydev
# mount -t jffs2 /dev/mtdblock/1 /mnt/mydev
mtdblock_open
ok

# df
Filesystem           1k-blocks      Used Available Use% Mounted on
rootfs                    3990      3608       382  90% /
/dev/root                 3990      3608       382  90% /
/dev/mtdblock/1          65536       332     65204   1% /mnt/mydev

cd /
find > files.txt

# mv files.txt /mnt/mydev
Node totlen on flash (0xffffffff) != totlen in node ref (0x00000044)
Node totlen on flash (0xffffffff) != totlen in node ref (0x00000044)
Node totlen on flash (0xffffffff) != totlen in node ref (0x00000044)
#
# cd /mnt/mydev
# ls
files.txt


#date > /dev/mtd/1
MTD_open
MTD_ioctl
Invalid ioctl 402c7413 (MEMGETINFO = 40204d01)
MTD_write
MTD_close

# xxd /dev/mtd/1 | more
MTD_open
MTD_ioctl
Invalid ioctl 402c7413 (MEMGETINFO = 40204d01)
MTD_read
0000MTD_read
000:MTD_read
 ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000010: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000020: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000030: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000040: ffff ffff ffff ffff ffff ffff ffff ffff  ................
0000050: ffff ffff ffff ffff ffff ffff ffff ffff  ................

--------------------------------------

Upon rebooting the system, the /mnt directory no longer exists. I can
recreate it and remount the jffs2 device, but of course the directory is
empty and the file files.txt that I copied in is now gone. I see no
indication that the flash is seeing any physical writes at all. What am
I missing?

Flint
