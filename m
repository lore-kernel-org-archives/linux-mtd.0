Received: from resonance.org ([12.165.58.239] helo=earth.resonance.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HMpJ9-00012R-NM
	for linux-mtd@lists.infradead.org; Thu, 01 Mar 2007 12:43:14 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by earth.resonance.org (Postfix) with ESMTP id B77CEE597
	for <linux-mtd@lists.infradead.org>;
	Thu,  1 Mar 2007 09:43:08 -0800 (PST)
Subject: JFFS2 file system slowly filling up for unknown reason ~20 seconds
	after mount
From: Josh Green <josh@resonance.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Thu, 01 Mar 2007 18:41:53 +0000
Message-Id: <1172774513.20708.40.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm currently working on a Linux project with a Philips LPC3180 based
system.  The Linux support for this board seems to be under development
by Philips and is not yet in the main Linux tree (we received support as
a patch).  So this problem could very well be related to the drivers we
received for this platform, but I wanted to check if anyone else has
experienced similar behavior or have any pointers as to the cause.

Description of problem:

After mounting jffs2 file system it gradually goes from 45% full to 100%
in the matter of ~20 seconds (as reported by df).  Doing a du on the top
directory of the file system shows the same amount of data as when it is
first mounted.  Unmounting and remounting still shows 100% usage, and no
files can be written (device full).  Rebooting and then remounting the
file system, then goes through the 45% to 100% gradual fill up again.
No kernel error messages are received when mounting or unmounting.  The
actual jffs2 image file which gets flashed is ~3MB and contains ~6MB of
data (which gets zlib compressed as shown by mkfs.jffs2 -v).  The flash
partition is ~10MB.

I was able to successfully flash other parts of the flash memory (the
first partition) with kernel, uboot, etc.  So I'm pretty sure that is
working correctly, and the files in the jffs2 file system are indeed
there after mounting.


Details of system:

Linux kernel 2.6.10 with patch from Philips
Cross compiler gcc 3.4.2 using scratchbox
Flash is an ST Micro NAND256R3A 32MB chip with 8 bit bus

MTD messages on boot, showing the 2 partitions I created.  The erase
block size is 0x4000 (16KiB), as reported by /proc/mtd.

NAND device: Manufacturer ID: 0x20, Chip ID: 0x35 (ST Micro NAND 32MiB 1,8V 8-bit)
Scanning device for bad blocks
Creating 2 MTD partitions on "NAND 32MiB 1,8V 8-bit":
0x00008000-0x00c00000 : "rootfs-kernel-uboot"
0x00c00000-0x01640000 : "jffs2"

jffs2 file system created with the following command:
mkfs.jffs2 -n -e 16384 -o rootfs_jffs2.img -r target

Flashed with the following commands on the target:
flash_erase /dev/mtdchar1 0 656
nandwrite -p -s 0 /dev/mtdchar1 rootfs_jffs2.img

df immediately after mount and ~20 seconds later (going gradually
upwards).

Filesystem           1k-blocks      Used Available Use% Mounted on              
/dev/mtdblock1           10496      4672      5824  45% /mnt/disk               

Filesystem           1k-blocks      Used Available Use% Mounted on              
/dev/mtdblock1           10496     10496         0 100% /mnt/disk               


If anyone has any helpful information they could share in regards to
this problem, I would appreciate it.  This could very well be a jffs2
specific problem, but the jffs list seems rather dead, and there is a
lot related to jffs2 on this list.  Please let me know if I'm posting to
the wrong list though.

Best regards,
	Josh Green
