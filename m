Received: from mail6.speakeasy.net ([216.254.0.206])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CO0yx-00070y-Co
	for linux-mtd@lists.infradead.org; Sat, 30 Oct 2004 17:41:57 -0400
Received: from dsl017-104-254.spk0.dsl.speakeasy.net (HELO [192.168.0.10])
	(jangiels@[69.17.104.254]) (envelope-sender <jangiels@speakeasy.net>)
	by mail6.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 30 Oct 2004 21:35:12 -0000
From: Jeff Angielski <jangiels@speakeasy.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Message-Id: <1099172137.30440.8.camel@nighteyes.localdomain>
Mime-Version: 1.0
Date: Sat, 30 Oct 2004 17:35:37 -0400
Content-Transfer-Encoding: 7bit
Subject: mkfs.jffs2 with DENX 2.4 kernel on MPC8260
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Should the current MTD CVS mkfs.jffs2 work with one of the older jffs2
kernels?  Or do I need to scrounge up an older version?  I ask because
the jffs2 image is not working correctly on my system while the cramfs
root image works fine - both built from the same directory tree.

Using the default rootfs image from the ELDK toolkit and with the
MTD/jffs2 debugging turned on, this is what I see:


<snip>
EP8260: Found 4 x16 devices at 0x0 in 64-bit mode
 Amd/Fujitsu Extended Query Table at 0x0040
EP8260: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
Using word write method
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
EP8260 flash bank 0: Using static image partition definition
Creating 5 MTD partitions on "EP8260":
0x00000000-0x00040000 : "hrcw"
mtd: Giving out device 0 to hrcw
0x00040000-0x00100000 : "kernel"
mtd: Giving out device 1 to kernel
0x00100000-0x01f00000 : "rootfs"
mtd: Giving out device 2 to rootfs
0x01f00000-0x01f40000 : "uboot"
mtd: Giving out device 3 to uboot
0x01f40000-0x01f80000 : "uboot parms"
mtd: Giving out device 4 to uboot parms
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 8192)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
mtdblock_open
ok
mtdblock: read on "rootfs" at 0x400, size 0x200
mtdblock: read on "rootfs" at 0x600, size 0x200
mtdblock_release
ok
mtdblock_open
ok
Eep. Child "application" (ino #14) of dir ino #2 doesn't exist!
VFS: Mounted root (jffs2 filesystem).
Mounted devfs on /dev
Freeing unused kernel memory: 60k init
MTD do_write_oneword(): WRITE 0x002e45b8(0xc3f19bd4)
MTD do_write_oneword(): WRITE 0x002e45c0(0xc3f19bd4)
MTD do_write_oneword(): WRITE 0x002e45c8(0xc3f19bd4)
MTD do_write_oneword(): WRITE 0x002e45d0(0xc3f19bd4)
MTD do_write_oneword(): WRITE 0x002e45d8(0xc3f19bd4)
MTD do_write_oneword(): WRITE 0x002e45e0(0xc3f19bd4)
MTD do_write_oneword(): WRITE 0x002e45e8(0xc3f19bd4)
MTD do_write_oneword(): WRITE 0x002e45f0(0xc3f19bd4)
MTD do_write_oneword(): WRITE 0x002e45f8(0xc3f19bd4)
MTD do_write_oneword(): WRITE 0x002e4438(0xc3f19c34)
MTD do_write_oneword(): WRITE 0x002e4440(0xc3f19c34)
MTD do_write_oneword(): NOP
MTD do_write_oneword(): WRITE 0x002e45f8(0xc3f19cb4)
MTD do_write_oneword(): WRITE 0x002e4600(0xc3f19cb4)
MTD do_write_oneword(): WRITE 0x002e4608(0xc3f19cb4)
MTD do_write_oneword(): WRITE 0x002e4610(0xc3f19cb4)
MTD do_write_oneword(): WRITE 0x002e4618(0xc3f19cb4)
MTD do_write_oneword(): WRITE 0x002e4620(0xc3f19cb4)
MTD do_write_oneword(): WRITE 0x002e4620(0xc3f19cb4)
MTD do_write_oneword(): WRITE 0x002e4628(0xc3f19cb4)
MTD do_write_oneword(): WRITE 0x002e44f8(0xc3f19ce4)
MTD do_write_oneword(): WRITE 0x002e4500(0xc3f19ce4)
MTD do_write_oneword(): NOP
MTD do_write_oneword(): WRITE 0x002e4570(0xc3f19cb4)
MTD do_write_oneword(): WRITE 0x002e4578(0xc3f19cb4)
MTD do_write_oneword(): NOP
MTD do_write_oneword(): WRITE 0x002e4630(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e4638(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e4640(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e4648(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e4650(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e4658(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e4660(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e4668(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e4670(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e4670(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e4678(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e4680(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e4688(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e4690(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e4698(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e4698(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e46a0(0xc3f19c44)
MTD do_write_oneword(): WRITE 0x002e45f8(0xc3f19c74)
MTD do_write_oneword(): WRITE 0x002e4600(0xc3f19c74)
MTD do_write_oneword(): NOP
MTD do_write_oneword(): WRITE 0x002e46a8(0xc3f19c94)
MTD do_write_oneword(): WRITE 0x002e46b0(0xc3f19c94)
MTD do_write_oneword(): WRITE 0x002e46b8(0xc3f19c94)
MTD do_write_oneword(): WRITE 0x002e46c0(0xc3f19c94)
MTD do_write_oneword(): WRITE 0x002e46c8(0xc3f19c94)
MTD do_write_oneword(): WRITE 0x002e46d0(0xc3f19c94)
MTD do_write_oneword(): WRITE 0x002e46d8(0xc3f19c94)
MTD do_write_oneword(): WRITE 0x002e46e0(0xc3f19c94)
MTD do_write_oneword(): WRITE 0x002e46e8(0xc3f19c94)
MTD do_write_oneword(): WRITE 0x002e4630(0xc3f19cf4)
MTD do_write_oneword(): WRITE 0x002e4638(0xc3f19cf4)
MTD do_write_oneword(): NOP
MTD do_write_oneword(): WRITE 0x002e46e8(0xc3f19c24)
MTD do_write_oneword(): WRITE 0x002e46f0(0xc3f19c24)
MTD do_write_oneword(): WRITE 0x002e46f8(0xc3f19c24)
MTD do_write_oneword(): WRITE 0x002e4700(0xc3f19c24)
MTD do_write_oneword(): WRITE 0x002e4708(0xc3f19c24)
MTD do_write_oneword(): WRITE 0x002e4710(0xc3f19c24)
MTD do_write_oneword(): WRITE 0x002e4718(0xc3f19c24)
MTD do_write_oneword(): WRITE 0x002e4720(0xc3f19c24)
MTD do_write_oneword(): WRITE 0x002e4728(0xc3f19c24)
MTD do_write_oneword(): WRITE 0x002e4730(0xc3f19c24)
MTD do_write_oneword(): WRITE 0x002e46a8(0xc3f19c84)
MTD do_write_oneword(): WRITE 0x002e46b0(0xc3f19c84)
MTD do_write_oneword(): NOP


BusyBox v0.60.5 (2004.02.16-23:33+0000) Built-in shell
(msh)jffs2_do_read_inode() on nonexistent ino 14

Enter 'help' for a list of built-in commands.

Bummer, could not run '/bin/application': Input/output error
Bummer, could not run '/bin/application': Input/output error
Bummer, could not run '/bin/application': Input/output error
Bummer, could not run '/bin/application': Input/output error


Jeff Angielski
