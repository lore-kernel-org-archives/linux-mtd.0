Received: from mail.iok.net ([62.249.129.22] helo=mail05.iok.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6S4J-0001BO-AS
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 10:54:19 +0100
Received: from lin01.mn-logistik.de (frdb-d9b963e9.pool.mediaWays.net
	[217.185.99.233])
	by mail05.iok.net (8.12.8/8.12.8) with ESMTP id h969qrN9011179
	for <linux-mtd@lists.infradead.org>; Mon, 6 Oct 2003 11:52:53 +0200
Received: from mnz66.mn-logistik.de (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-logistik.de (Postfix) with ESMTP id 00D571FF05
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Oct 2003 11:25:52 +0200 (CEST)
From: Holger Schurig <h.schurig@mn-logistik.de>
To: linux-mtd@lists.infradead.org
Date: Mon, 6 Oct 2003 11:25:52 +0200
MIME-Version: 1.0
Message-Id: <200310061125.52793.h.schurig@mn-logistik.de>
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_gUTg/zUfxEPcKIp"
Subject: [PATCH] even less clutter in 2.6 boot log
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Boundary-00=_gUTg/zUfxEPcKIp
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This makes the output of the boot log somewhat more pretty. It saves some 
bytes as well.


BTW: this and the previous is part of a series of patches that unifies the 
kernel log somewhat (not totally) to be in a "subsystem: message" style. 
E.g., my current kernel bootlog now looks like this:

Linux version 2.6.0-test6-bkpxa (root@mnz66.mn-logistik.de) (gcc version 
3.3) #175 Mon Oct 6 10:48:21 CEST 2003
CPU: XScale-PXA250 [69052d06] revision 6 (ARMv5TE)
CPU: D undefined 5 cache
CPU: I cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
CPU: D cache: 32768 bytes, associativity 32, 32 byte lines, 32 sets
Machine: Ramses
Ignoring unrecognised tag 0x00000000
Memory policy: ECC disabled, Data cache write back
Memory clock: 99.53MHz (*27)
Run Mode clock: 398.13MHz (*4)
Turbo Mode clock: 398.13MHz (*1.0, active)
On node 0 totalpages: 32768
  DMA zone: 32768 pages, LIFO batch:8
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Building zonelist for node 0
Kernel command line: root=/dev/mtdblock2 jffs2_orphaned_inodes=delet 
rootfstype=jffs2 console=ttyS0,115200
PID hash table entries: 512 (order 9: 4096 bytes)
Console: colour dummy device 80x30
Memory: 128MB = 128MB total
Memory: 128448KB available (851K code, 194K data, 52K init)
Calibrating delay loop... 397.31 BogoMIPS
Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
arm: write buffer coherency ok
arm: nwfpe v0.97 (double)
devfs: v1.22 (20021013)
jffs2: v2.1 (c) 2002 Red Hat Inc
pty: 256 Unix98 ptys configured
ttyS0 at MMIO 0x40100000 IRQ 15 is a FFUART
ttyS1 at MMIO 0x40200000 IRQ 14 is a BTUART
ttyS2 at MMIO 0x40700000 IRQ 13 is a STUART
io-scheduler: noop
mtd: 0x00000000-0x00040000: "Bootloader"
mtd: 0x00040000-0x00140000: "Kernel"
mtd: 0x00140000-0x02000000: "Filesystem"
i2c_adapter i2c-0: found device 0x68
VFS: Mounted root (jffs2 filesystem).
Mounted devfs on /dev
Freeing init memory: 52K

-- 
Try Linux 2.6 from BitKeeper for PXA2x0 CPUs at
http://www.mn-logistik.de/unsupported/linux-2.6/

--Boundary-00=_gUTg/zUfxEPcKIp
Content-Type: text/x-diff;
  charset="us-ascii";
  name="trivial-jffs2printk.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="trivial-jffs2printk.patch"

--- linux-2.6/fs/jffs2/super.c~trivial-printks
+++ linux-2.6/fs/jffs2/super.c
@@ -298,7 +298,7 @@
 {
 	int ret;
 
-	printk(KERN_INFO "JFFS2 version 2.1. (C) 2001, 2002 Red Hat, Inc.\n");
+	printk(KERN_INFO "jffs2: v2.1 (c) 2002 Red Hat Inc\n");
 
 	jffs2_inode_cachep = kmem_cache_create("jffs2_i",
 					     sizeof(struct jffs2_inode_info),

--Boundary-00=_gUTg/zUfxEPcKIp--
