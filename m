Received: from mailout05.sul.t-online.com ([194.25.134.82])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CgmvM-0005i6-61
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 11:31:49 -0500
From: stephanwib@t-online.de (Stephan Wiebusch)
To: <linux-mtd@lists.infradead.org>
Date: Tue, 21 Dec 2004 17:29:11 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <1Cgmuu-1zfbjU0@fwd08.sul.t-online.com>
Subject: DOC2000 bootloader
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

I am not able to boot my Linux 2.6.9 Kernel from a 16MB DOC2000 device.

I am not able to compile Grub. I already asked because of this, but there
came no reply.

Lilo is able to boot the Kernel, but it ends with: "Kernel panic - not
syncing. VFS: Unable to mount root on device "<NULL>" or
unknown-block(254,0)"

The Kernel contains the new NAND DiskOnChip-driver and the ext2fs-driver as
built-in.
The Kernel and the root-fs seem to be OK, but it simply does not work :(

My lilo.conf looks like this:

-------------------------------------
boot=/dev/nftla
compact
install=/boot/boot.b
disk=/dev/nftla
	bios=0x80

prompt
delay=50
timeout=20

image=/boot/vmlinuz-2.6.9
	label=LinuxSTB
	root=/dev/nftla1
------------------------------------

Any ideas??

I would like to test a precompiled grub_firmware with ext2 support.
Can anybody send this to: stephanwib@t-online.de

Thanks 
Stephan
