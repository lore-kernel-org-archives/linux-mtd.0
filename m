Received: from ihemail2.lucent.com ([192.11.222.163])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DU3id-0001eQ-Qu
	for linux-mtd@lists.infradead.org; Fri, 06 May 2005 10:22:20 -0400
Received: from il0015exch001h.wins.lucent.com (h135-1-23-83.lucent.com
	[135.1.23.83])
	by ihemail2.lucent.com (8.12.11/8.12.11) with ESMTP id j46EMNYK001050
	for <linux-mtd@lists.infradead.org>;
	Fri, 6 May 2005 09:22:23 -0500 (CDT)
Message-ID: <B8D764EEF0FACB4B887EBDB3565CAAB31082F424@il0015exch003u.ih.lucent.com>
From: "Miller, Gary W (Gary)" <gwmiller1@lucent.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Fri, 6 May 2005 09:22:21 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: jffs2 root filesystem w/Intel Srataflash problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I'm trying get a jffs2 root filesystem to boot and am having problems. Sorry for the lengthy
post, but the detail may be helpful.

I'm using a 32Mb Intel StrataFlash part (28F256J3), 16 bit bus width, 
on a board running kernel 2.4.20 on a Mips 5Kc processor. I've got the flash
partitioned and am trying to use one of the partitions as the jffs2 root filesystem. 
I created the jffs2 filesystem using mkfs.jffs2 rev. 1.26 (and later tried v1.39). With 
the kernel booted from an nfs mounted filesystem, I'm able to mount the flash partition 
and see the root directory structure. When I try to boot using that partition, though, 
I get the following:

======
mtdblock_open
ok
mtdblock: read on "LPA636 Linux Flash" at 0x400, size 0x200
mtdblock: read on "LPA636 Linux Flash" at 0x600, size 0x200
mtdblock_release
ok
mtdblock_open
ok
Old JFFS2 bitmask found at 0x00e7ce4c
You cannot use older JFFS2 filesystems with newer kernels
VFS: Mounted root (jffs2 filesystem) readonly.
Mounted devfs on /dev
Freeing prom memory: 1020kb freed
Freeing unused kernel memory: 76k freed
execve of /sbin/ltt_boot_trace failed
Kernel panic: No init found.  Try passing init= option to kernel.
======

Starting with an erased partition, if I mount it and copy in the root filesystem by hand, I get the following:

====

mtdblock_open
ok
mtdblock: read on "LPA636 Linux Flash" at 0x400, size 0x200
mtdblock: read on "LPA636 Linux Flash" at 0x600, size 0x200
mtdblock_release
ok
mtdblock_open
ok
Old JFFS2 bitmask found at 0x00e7ce4c
You cannot use older JFFS2 filesystems with newer kernels
Child dir "usr" (ino #2) of dir ino #1 appears to be a hard link
 -- -cut - more hard link messages--
Child dir "cron.weekly" (ino #278) of dir ino #197 appears to be a hard link
VFS: Mounted root (jffs2 filesystem) readonly.
Mounted devfs on /dev
Freeing prom memory: 1020kb freed
Freeing unused kernel memory: 76k freed
execve of /sbin/ltt_boot_trace failed
Kernel panic: No init found.  Try passing init= option to kernel.
======

I then tried a newer version of mkfs.jffs2 v1.39 and get:

=====

mtdblock_open
ok
mtdblock: read on "LPA636 Linux Flash" at 0x400, size 0x200
mtdblock: read on "LPA636 Linux Flash" at 0x600, size 0x200
mtdblock_release
ok
mtdblock_open
ok
Old JFFS2 bitmask found at 0x00e7ce4c
You cannot use older JFFS2 filesystems with newer kernels
Child dir "boot" (ino #3) of dir ino #1 appears to be a hard link
 -- -cut - more hard link messages--
VFS: Mounted root (jffs2 filesystem) readonly.
mount_devfs_fs(): unable to mount devfs, err: -2
Freeing prom memory: 1020kb freed
Freeing unused kernel memory: 76k freed
Warning: unable to open an initial console.
execve of /sbin/ltt_boot_trace failed
Argh. Special inode #114 with mode 0xa1ff had more than one node
Algorithmics/MIPS FPU Emulator v1.5
jffs2_get_inode_nodes(): Data CRC failed on node at 0x01fffa68: Read 0xf235e621, calculated 0xc32e9a24
 -- -cut - more CRC messages--


===================

Any suggestions?

Thanks,

Gary Miller
