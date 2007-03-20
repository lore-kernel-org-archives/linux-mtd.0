Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HTdKL-0008Rr-Ey
	for linux-mtd@lists.infradead.org; Tue, 20 Mar 2007 12:20:35 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1HTdJr-0001Cj-Fr
	for linux-mtd@lists.infradead.org; Tue, 20 Mar 2007 13:20:03 +0100
Received: from obelix.objectxp.com ([62.2.156.213])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Mar 2007 13:20:03 +0100
Received: from mma by obelix.objectxp.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Mar 2007 13:20:03 +0100
To: linux-mtd@lists.infradead.org
From: Michel Marti <mma@objectxp.com>
Subject: JFFS2: Filesystem corruption after umount/mount
Date: Tue, 20 Mar 2007 13:15:56 +0100
Message-ID: <etoj9s$b84$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm experiencing a strange problem with JFFS2 using Linux 2.6.21-rc4-g78157a82 from
denx.de on PowerPC. After unmounting and remounting the filesystem, some directory entries
are corrupt. See the transcript below.

Flash in use is a Spansion S29GL256N. I'm using the physmap driver and pass the MTD
partition layout on the kernel command line.

# eraseall /dev/mtd3
# mount -t jffs2 /dev/mtdblock3 /mnt
# touch /mnt/printf /mnt/printenv
# ls -l /mnt
-rw-r--r--    1 root     root            0 Jan  1 00:37 printenv
-rw-r--r--    1 root     root            0 Jan  1 00:37 printf

# umount /mnt
# mount -t jffs2 /dev/mtdblock3 /mnt
# ls -l /mnt
ls: /mnt/prin: No such file or directory
-rw-r--r--    1 root     root            0 Jan  1 00:37 printf


# umount /mnt
# eraseall /dev/mtd3
# mount -t jffs2 /dev/mtdblock3 /mnt
# for I in `seq 0 9`; do F=$F$I; touch /mnt/$F; done
# ls -l /mnt
-rw-r--r--    1 root     root            0 Jan  1 00:50 0
-rw-r--r--    1 root     root            0 Jan  1 00:50 01
-rw-r--r--    1 root     root            0 Jan  1 00:50 012
-rw-r--r--    1 root     root            0 Jan  1 00:50 0123
-rw-r--r--    1 root     root            0 Jan  1 00:50 01234
-rw-r--r--    1 root     root            0 Jan  1 00:50 012345
-rw-r--r--    1 root     root            0 Jan  1 00:50 0123456
-rw-r--r--    1 root     root            0 Jan  1 00:50 01234567
-rw-r--r--    1 root     root            0 Jan  1 00:50 012345678
-rw-r--r--    1 root     root            0 Jan  1 00:50 0123456789

# umount /mnt
# mount -t jffs2 /dev/mtdblock3 /mnt
# ls -l /mnt
-rw-r--r--    1 root     root            0 Jan  1 00:50 0
-rw-r--r--    1 root     root            0 Jan  1 00:50 01
-rw-r--r--    1 root     root            0 Jan  1 00:50 012
-rw-r--r--    1 root     root            0 Jan  1 00:50 0123
-rw-r--r--    1 root     root            0 Jan  1 00:50 0123
-rw-r--r--    1 root     root            0 Jan  1 00:50 0123
-rw-r--r--    1 root     root            0 Jan  1 00:50 0123
-rw-r--r--    1 root     root            0 Jan  1 00:50 01234
-rw-r--r--    1 root     root            0 Jan  1 00:50 012345
-rw-r--r--    1 root     root            0 Jan  1 00:50 0123456


I also read back the mtd device after erasing it and it contains 0xFF bytes only.
Additionally, I copied a jffs2 image to the device, read it back and compared it to the
image and there was no difference.

(relevant) Output from kernel on startup:

physmap platform flash device: 02000000 at fc000000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
physmap-flash.0: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
4 cmdlinepart partitions found on MTD device physmap-flash.0
Adding 4 parsed mtd-partitions...
Creating 4 MTD partitions on "physmap-flash.0":
0x00000000-0x00040000 : "U"
0x00060000-0x00160000 : "K"
0x00160000-0x01f00000 : "R"
0x01f00000-0x02000000 : "C"


Any Hints?

--Michel


PS: I posted this to the jffs-dev list first, but somehow my post seems to have got
lost... In case it unexpectedly pops up there too: Sorry for the double posting.
