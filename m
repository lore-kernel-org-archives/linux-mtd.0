Received: from hotwww5.hotwww.com ([161.58.242.233])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D97YJ-0005yl-4U
	for linux-mtd@lists.infradead.org; Wed, 09 Mar 2005 15:13:08 -0500
Date: Wed, 9 Mar 2005 13:13:00 -0700
From: Jeremy Fillingim <jfilling@realmsys.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20050309201300.GA6975@realmsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Trouble with rw JFFS2 root
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm having some trouble mounting a JFFS2 root partition as rw at
boot/init time, and would appreciate any insight that you guys can
provide.

Here are my system specifications:

PowerPC 405
Linux kernel 2.6.10
MTD head of CVS as of 2005-03-08 + jffs2 summary patch
Samsung 256MB NAND Flash (128kB erase block, 2kB page size, 64B spare
data per page)

Here is some additional information:

# cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 00400000 00020000 "Live Kernel"
mtd1: 02000000 00020000 "Live Root FS"
mtd2: 0d800000 00020000 "Live User FS"

Kernel command line: console=uart,mmio,0xf0005003<<2,115200n8
rootfstype=jffs2 root=/dev/mtdblock1 ro

If I attempt to mount a root filesystem as rw at boot/init time, I
receive the following error messages (truncated to keep the message a
reasonable length).

...
VFS: Mounted root (jffs2 filesystem) readonly.
Freeing unused kernel memory: 60k init
init started:  BusyBox v1.00 (2005.03.08-16:06+0000) multi-call binary
Node header CRC failed at 000a71f0. But it must have been OK earlier.
Node was: { 0000, 206c, 915a8ac4, 00000006 }
read too short for dnode
jffs2_get_inode_nodes() for ino 9 returned -5
Returned error for crccheck of ino #9. Expect badness...
Eep. Unknown node type 0002 at 000003e4 was marked REF_UNCHECKED
Node header CRC failed at 000003e4. But it must have been OK earlier.
Node was: { 93b9, 2002, 0c00b351, 3ac2ffff }
jffs2_do_read_inode(): No data nodes found for ino #10
Returned error for crccheck of ino #10. Expect badness...
Node header CRC failed at 000a74f0. But it must have been OK earlier.
Node was: { 0000, 2000, 00000000, 00000000 }
Node header CRC failed at 000a73f0. But it must have been OK earlier.
Node was: { 0000, 200a, 00000001, 000041ed }
Node header CRC failed at 000a72e0. But it must have been OK earlier.
Eep. Unknown node type cc7e at 000b63c0 was marked REF_UNCHECKED
Node header CRC failed at 000b63c0. But it must have been OK earlier.
Node was: { 85f0, ec7e, 33b62a65, 77d78ccc }
...

I am able to mount the JFFS2 root filesystem as ro and perform a "mount
-o remount,rw /", then I am able to modify, add, and delete files without
incident.

My problem only occurs if the kernel mounts the filesystem rw at boot
time, or if I have my inittab remount the root filesystem as rw.

JFFS2 filesystems on non-root partitions work as expected.

Thank you in advance

Jeremy
