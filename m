Received: from [194.37.90.50] (helo=columbia.dt.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Is7d-000374-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2002 15:04:33 +0000
To: linux-mtd@lists.infradead.org
Subject: Kernel deadlocks during jffs2 mount...
Message-ID: <OF7C0F5F09.F3127DE1-ONC1256C83.00554D72@keymile.ch>
From: Thomas.Locher@keymile.com
Date: Mon, 2 Dec 2002 16:34:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

We mount the root filesystem from a partition in a NAND-flashdisk 
(/dev/mtdblock3)
After changing few files on the disk and a reboot, the kernel hangs after 
printing out these messages...

 
.....
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bnd 2048)
IP-Config: Incomplete network configuration information.
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Mounting root filesystem...
mtd->read(0x400 bytes from 0x1b4000) returned ECC error
mtd->read(0x3c28 bytes from 0x1b43d8) returned ECC error
mtd->read(0x3a90 bytes from 0x7b8570) returned ECC error
mtd->read(0x3c04 bytes from 0x7f03fc) returned ECC error
VFS: Mounted root (jffs2 filesystem) readonly.
Freeing unused kernel memory: 64k freed
mtd->read(0x34 bytes from 0x7f07c4) returned ECC error
mtd->read(0x34 bytes from 0x7f0670) returned ECC error
mtd->read(0x34 bytes from 0x7f051c) returned ECC error
mtd->read(0x737 bytes from 0x7b8a48) returned ECC error
jffs2_get_inode_nodes(): Data CRC failed on node at 0x007b8a04: Read 
0x8a379920, calculated 0x199cc518
......

It seems that the GC is blocking the kernel.
When we use another NFS as root filesystem and then mount the partition, 
we still get the same errors, but the system does'nt block...

Any ideas?

Regards

Thomas Locher

System Infos:
mtd/jffs2: cvs version 10. Oct. 02
kernel version:  2.4.17 

------------------------------------------------------
Software Developer, Line Systems

KEYMILE AG

E-Mail: thomas.locher@keymile.com
------------------------------------------------------
