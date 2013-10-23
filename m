Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZ6d6-0000jQ-5T
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 22:10:16 +0000
Received: by mail-ie0-f169.google.com with SMTP id ar20so2536281iec.28
 for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2013 15:09:55 -0700 (PDT)
Date: Wed, 23 Oct 2013 15:09:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: UBIFS: assert failed in ubifs_tnc_next_ent
Message-ID: <20131023220950.GW23337@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm running a 3.8 kernel with UBIFS. I can trigger some UBIFS asserts
after a few hours of running a filesystem benchmark (like bonnie++) in a
loop. I've tried backporting a few UBIFS bugfixes, e.g.:

  commit 605c912bb843c024b1ed173dc427cd5c08e5d54d
  Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
  Date:   Fri Jun 28 14:15:15 2013 +0300

      UBIFS: fix a horrid bug

  commit 33f1a63ae84dfd9ad298cf275b8f1887043ced36
  Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
  Date:   Fri Jun 28 14:15:14 2013 +0300

      UBIFS: prepare to fix a horrid bug

They did not help.

I have run various tests (including the MTD read/page/stress test
modules as well as a few hand-rolled user-space tests), and my driver
seems to be working fine.

I am not able to reproduce the failure on nandsim with either my 3.8
kernel/embedded hardware or with Linus' head of tree on my PC. Perhaps
there's something related to NAND geometry or to driver timing that
uncovers the filesystem bug.

Do you have any idea what would cause this type of problem?

Thanks,
Brian

NAND chip:

  NAND device: Manufacturer ID: 0x2c, Chip ID: 0x44 (Micron MT29F32G08CBADAWP), 4096MiB, page size: 8192, OOB size: 744

Log:

(I didn't enable UBI/UBIFS debugging messages yet, because the test
takes a few hours to trigger this, and I would be overwhelmed with logs
before I could here...)

UBIFS assert failed in ubifs_tnc_next_ent at 2776 (pid 2143)
[<c0015efc>] (unwind_backtrace+0x0/0x138) from [<c01a81f0>] (ubifs_tnc_next_ent+0x1c4/0x270)
[<c01a81f0>] (ubifs_tnc_next_ent+0x1c4/0x270) from [<c0198238>] (ubifs_readdir+0x2e4/0x5a0)
[<c0198238>] (ubifs_readdir+0x2e4/0x5a0) from [<c00bc8e8>] (vfs_readdir+0x90/0xac)
[<c00bc8e8>] (vfs_readdir+0x90/0xac) from [<c00bc9e8>] (sys_getdents+0x74/0xcc)
[<c00bc9e8>] (sys_getdents+0x74/0xcc) from [<c000ebc0>] (ret_fast_syscall+0x0/0x30)
UBIFS error (pid 2143): ubifs_validate_entry: bad extended attribute entry node
[<c0015efc>] (unwind_backtrace+0x0/0x138) from [<c01a5570>] (lnc_add_directly.clone.21+0x7c/0xc0)
[<c01a5570>] (lnc_add_directly.clone.21+0x7c/0xc0) from [<c01a5670>] (matches_name.clone.22+0xbc/0xd0)
[<c01a5670>] (matches_name.clone.22+0xbc/0xd0) from [<c01a56cc>] (resolve_collision+0x48/0x304)
[<c01a56cc>] (resolve_collision+0x48/0x304) from [<c01a8174>] (ubifs_tnc_next_ent+0x148/0x270)
[<c01a8174>] (ubifs_tnc_next_ent+0x148/0x270) from [<c0198238>] (ubifs_readdir+0x2e4/0x5a0)
[<c0198238>] (ubifs_readdir+0x2e4/0x5a0) from [<c00bc8e8>] (vfs_readdir+0x90/0xac)
[<c00bc8e8>] (vfs_readdir+0x90/0xac) from [<c00bc9e8>] (sys_getdents+0x74/0xcc)
[<c00bc9e8>] (sys_getdents+0x74/0xcc) from [<c000ebc0>] (ret_fast_syscall+0x0/0x30)
	magic          0x6101831
	crc            0x2715b167
	node_type      0 (inode node)
	group_type     2 (last of node group)
	sqnum          80750934
	len            160
	key            (5899336, inode)
	creat_sqnum    80641253
	size           236552
	nlink          2
	atime          13941.0
	mtime          13963.0
	ctime          13963.0
	uid            0
	gid            0
	mode           16832
	flags          0x1
	xattr_cnt      0
	xattr_size     0
	xattr_names    0
	compr_type     0x0
	data len       0
UBIFS error (pid 2143): ubifs_readdir: cannot find next direntry, error -22
UBIFS assert failed in ubifs_tnc_next_ent at 2776 (pid 2143)
[<c0015efc>] (unwind_backtrace+0x0/0x138) from [<c01a81f0>] (ubifs_tnc_next_ent+0x1c4/0x270)
[<c01a81f0>] (ubifs_tnc_next_ent+0x1c4/0x270) from [<c0198238>] (ubifs_readdir+0x2e4/0x5a0)
[<c0198238>] (ubifs_readdir+0x2e4/0x5a0) from [<c00bc8e8>] (vfs_readdir+0x90/0xac)
[<c00bc8e8>] (vfs_readdir+0x90/0xac) from [<c00bc9e8>] (sys_getdents+0x74/0xcc)
[<c00bc9e8>] (sys_getdents+0x74/0xcc) from [<c000ebc0>] (ret_fast_syscall+0x0/0x30)
UBIFS error (pid 2143): ubifs_validate_entry: bad extended attribute entry node
[<c0015efc>] (unwind_backtrace+0x0/0x138) from [<c01a5570>] (lnc_add_directly.clone.21+0x7c/0xc0)
[<c01a5570>] (lnc_add_directly.clone.21+0x7c/0xc0) from [<c01a5670>] (matches_name.clone.22+0xbc/0xd0)
[<c01a5670>] (matches_name.clone.22+0xbc/0xd0) from [<c01a56cc>] (resolve_collision+0x48/0x304)
[<c01a56cc>] (resolve_collision+0x48/0x304) from [<c01a8174>] (ubifs_tnc_next_ent+0x148/0x270)
[<c01a8174>] (ubifs_tnc_next_ent+0x148/0x270) from [<c0198238>] (ubifs_readdir+0x2e4/0x5a0)
[<c0198238>] (ubifs_readdir+0x2e4/0x5a0) from [<c00bc8e8>] (vfs_readdir+0x90/0xac)
[<c00bc8e8>] (vfs_readdir+0x90/0xac) from [<c00bc9e8>] (sys_getdents+0x74/0xcc)
[<c00bc9e8>] (sys_getdents+0x74/0xcc) from [<c000ebc0>] (ret_fast_syscall+0x0/0x30)
	magic          0x6101831
	crc            0xef854d68
	node_type      0 (inode node)
	group_type     2 (last of node group)
	sqnum          80750937
	len            160
	key            (5899336, inode)
	creat_sqnum    80641253
	size           236488
	nlink          2
	atime          13941.0
	mtime          13963.0
	ctime          13963.0
	uid            0
	gid            0
	mode           16832
	flags          0x1
	xattr_cnt      0
	xattr_size     0
	xattr_names    0
	compr_type     0x0
	data len       0
UBIFS error (pid 2143): ubifs_readdir: cannot find next direntry, error -22
