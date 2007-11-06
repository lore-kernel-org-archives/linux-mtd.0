Received: from smtp4-g19.free.fr ([212.27.42.30])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IpQOO-0002i6-GP
	for linux-mtd@lists.infradead.org; Tue, 06 Nov 2007 10:31:11 -0500
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 0D71B3EA140
	for <linux-mtd@lists.infradead.org>;
	Tue,  6 Nov 2007 16:31:02 +0100 (CET)
Received: from [192.168.111.252] (cla34-1-88-160-215-156.fbx.proxad.net
	[88.160.215.156])
	by smtp4-g19.free.fr (Postfix) with ESMTP id E3E2F3EA13F
	for <linux-mtd@lists.infradead.org>;
	Tue,  6 Nov 2007 16:31:01 +0100 (CET)
From: Saravanan Chanemouganandam <schane@osmozis.com>
To: linux-mtd@lists.infradead.org
Subject: dual jffs2 mtd partition problem
Date: Tue, 6 Nov 2007 16:30:58 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200711061630.59674.schane@osmozis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am fascing problem while updating a "Jffs2 root filesystem" on my cm-x270 
arm target board. The board has bootloader on the NOR and statically defined 
dual Jffs2 partitions on the NAND devices for the root filesystem. 

cm-debian:~# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00010000 "phys_mapped_flash"
mtd1: 00200000 00020000 "OsmoConfig"
mtd2: 0fa00000 00020000 "rootfs_1"
mtd3: 10600000 00020000 "rootfs_2"

For an update rootfs process, I perform the following procedure...

A flash updating scheme employing 2 JFFS2 partitions, allowing to update one 
while running the other. 
For example, if I am running with mtdblock2 as main root filesystem in ro, 
when I want to update my root, I can program the new image into mtdblock3 and 
then switch the root filesystem to mtdblock3 when I reboot (by specifying in 
the kernel cmdling as root=/dev/mtdblock3 ). The next time I update, the 
process would be reversed (program and switch to /dev/mtdblock2).

So, during an update process, if any failure occurs in the middle ( like power 
failure or write error), the system should boot with the old rootfs 
partition. The problem is that during an update rootfs, when I power down the 
board, on reboot the board throws a "kernel panic" error 
...
Warning: unable to open an initial console.
Kernel panic - not syncing: No init found.  Try passing init= option to 
kernel.

Analysing the MTD partitions by mounting via nfs on the host shows the 
partitions got erased partially and hence the kernel panic.

Can anyboby precise me, how come the current rootfs partition getting erased 
when theres is an error while updating the alternate partition. ?

Thanks
Sara


 
