Received: from mail1.infineon.com ([192.35.17.229])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15wQ6W-0003rg-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2001 16:38:04 +0100
Message-ID: <3BD6E171.3856A900@infineon.com>
Date: Wed, 24 Oct 2001 17:42:41 +0200
From: amit lubovsky <amit.lubovsky@infineon.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: mount of JFFS2
References: <3BD575F2.35D16336@infineon.com> <18479.1003845325@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hi,
When trying to mount JFFS2 as root on a malta board with mips5kc, I have
passed the kernel the mount device by:
        'go . root=/dev/mtdblock1'

after copying the file system to that device and I got the following:

jffs_scan_flash(): Leaving...
jffs_find_file(): ino: 1
jffs_find_file(): Didn't find file with ino 1.
jffs_add_virtual_root(): Creating a virtual root directory.
jffs_insert_file_into_hash(): f->ino: 1
jffs_possibly_delete_file(): ino: 1
jffs_remove_redundant_nodes(): ino: 1, name: "", newest_type: 1
jffs_insert_file_into_tree(): name: ""
jffs_find_file(): ino: 0
jffs_find_file(): Didn't find file with ino 0.
jffs_build_file(): ino: 1, name: ""
jffs_update_file(): ino: 1, version: 0
JFFS: Dumping the file system's hash table...
*** c->hash[1]: "" (ino: 1, pino: 0)
/ (ino: 1, highest_version: 0, size: 0)
jffs_read_inode(): inode->i_ino == 1
read_inode(): down biglock
jffs_find_file(): ino: 1
jffs_find_file(): Found file with ino 1. (name: "")
read_inode(): up biglock
JFFS: GC thread pid=8.
JFFS: Successfully mounted device 1f:01.
amit: JFFS: Successfully mounted device 1f:01.
VFS: Mounted root (jffs filesystem) readonly.
Freeing prom memory: 956kb freed
Freeing unused kernel memory: 76k freed
jffs_lookup(): dir: 0x810b0c40, name: "dev"
lookup(): down biglock
jffs_find_child()
jffs_find_child(): Didn't find the file "dev".
jffs_lookup(): Couldn't find the file. f = 0x00000000, name = "dev", d =
0x811f1
lookup(): up biglock
Warning: unable to open an initial console.
jffs_lookup(): dir: 0x810b0c40, name: "sbin"
lookup(): down biglock
jffs_find_child()
jffs_find_child(): Didn't find the file "sbin".
jffs_lookup(): Couldn't find the file. f = 0x00000000, name = "sbin", d
= 0x8111
lookup(): up biglock
jffs_lookup(): dir: 0x810b0c40, name: "etc"
lookup(): down biglock
jffs_find_child()
jffs_find_child(): Didn't find the file "etc".
jffs_lookup(): Couldn't find the file. f = 0x00000000, name = "etc", d =
0x811f1
lookup(): up biglock
jffs_lookup(): dir: 0x810b0c40, name: "bin"
lookup(): down biglock
jffs_find_child()
jffs_find_child(): Didn't find the file "bin".
jffs_lookup(): Couldn't find the file. f = 0x00000000, name = "bin", d =
0x811f1
lookup(): up biglock
Kernel panic: No init found.  Try passing init= option to kernel.

Any ideas ???

Thanks, amit.
