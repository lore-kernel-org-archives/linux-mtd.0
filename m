Received: from mail-qa0-x232.google.com ([2607:f8b0:400d:c00::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZ9mZ-0003Gv-HM
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 01:32:16 +0000
Received: by mail-qa0-f50.google.com with SMTP id cm18so1014004qab.16
 for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2013 18:31:54 -0700 (PDT)
Date: Wed, 23 Oct 2013 18:31:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS: assert failed in ubifs_tnc_next_ent
Message-ID: <20131024013150.GB23337@ld-irv-0074.broadcom.com>
References: <20131023220950.GW23337@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131023220950.GW23337@ld-irv-0074.broadcom.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 23, 2013 at 03:09:50PM -0700, Brian Norris wrote:
> I am not able to reproduce the failure on nandsim with either my 3.8
> kernel/embedded hardware or with Linus' head of tree on my PC. Perhaps
> there's something related to NAND geometry or to driver timing that
> uncovers the filesystem bug.

Scratch that. It just took a lot longer (over 700 runs of bonnie++ vs.
100 to 200 on real hardware), but I was able to reproduce the bug with
nandsim on 3.8. I'll retry on 3.12-rc and with a few extra backported
fixes on 3.8.

The asserts using nandsim:

UBIFS assert failed in ubifs_tnc_next_ent at 2776 (pid 4262)
[<c0015efc>] (unwind_backtrace+0x0/0x138) from [<c01a81f0>] (ubifs_tnc_next_ent+0x1c4/0x270)
[<c01a81f0>] (ubifs_tnc_next_ent+0x1c4/0x270) from [<c0198238>] (ubifs_readdir+0x2e4/0x5a0)
[<c0198238>] (ubifs_readdir+0x2e4/0x5a0) from [<c00bc8e8>] (vfs_readdir+0x90/0xac)
[<c00bc8e8>] (vfs_readdir+0x90/0xac) from [<c00bc9e8>] (sys_getdents+0x74/0xcc)
[<c00bc9e8>] (sys_getdents+0x74/0xcc) from [<c000ebc0>] (ret_fast_syscall+0x0/0x30)
UBIFS error (pid 4262): ubifs_validate_entry: bad extended attribute entry node
[<c0015efc>] (unwind_backtrace+0x0/0x138) from [<c01a5570>] (lnc_add_directly.clone.21+0x7c/0xc0)
[<c01a5570>] (lnc_add_directly.clone.21+0x7c/0xc0) from [<c01a5670>] (matches_name.clone.22+0xbc/0xd0)
[<c01a5670>] (matches_name.clone.22+0xbc/0xd0) from [<c01a56cc>] (resolve_collision+0x48/0x304)
[<c01a56cc>] (resolve_collision+0x48/0x304) from [<c01a8174>] (ubifs_tnc_next_ent+0x148/0x270)
[<c01a8174>] (ubifs_tnc_next_ent+0x148/0x270) from [<c0198238>] (ubifs_readdir+0x2e4/0x5a0)
[<c0198238>] (ubifs_readdir+0x2e4/0x5a0) from [<c00bc8e8>] (vfs_readdir+0x90/0xac)
[<c00bc8e8>] (vfs_readdir+0x90/0xac) from [<c00bc9e8>] (sys_getdents+0x74/0xcc)
[<c00bc9e8>] (sys_getdents+0x74/0xcc) from [<c000ebc0>] (ret_fast_syscall+0x0/0x30)
	magic          0x6101831
	crc            0xf87567a6
	node_type      0 (inode node)
	group_type     2 (last of node group)
	sqnum          324111858
	len            160
	key            (23300960, inode)
	creat_sqnum    324002935
	size           263248
	nlink          2
	atime          20882.0
	mtime          20884.0
	ctime          20884.0
	uid            0
	gid            0
	mode           16832
	flags          0x1
	xattr_cnt      0
	xattr_size     0
	xattr_names    0
	compr_type     0x0
	data len       0
UBIFS error (pid 4262): ubifs_readdir: cannot find next direntry, error -22
UBIFS assert failed in ubifs_tnc_next_ent at 2776 (pid 4262)
[<c0015efc>] (unwind_backtrace+0x0/0x138) from [<c01a81f0>] (ubifs_tnc_next_ent+0x1c4/0x270)
[<c01a81f0>] (ubifs_tnc_next_ent+0x1c4/0x270) from [<c0198238>] (ubifs_readdir+0x2e4/0x5a0)
[<c0198238>] (ubifs_readdir+0x2e4/0x5a0) from [<c00bc8e8>] (vfs_readdir+0x90/0xac)
[<c00bc8e8>] (vfs_readdir+0x90/0xac) from [<c00bc9e8>] (sys_getdents+0x74/0xcc)
[<c00bc9e8>] (sys_getdents+0x74/0xcc) from [<c000ebc0>] (ret_fast_syscall+0x0/0x30)
UBIFS error (pid 4262): ubifs_validate_entry: bad extended attribute entry node
[<c0015efc>] (unwind_backtrace+0x0/0x138) from [<c01a5570>] (lnc_add_directly.clone.21+0x7c/0xc0)
[<c01a5570>] (lnc_add_directly.clone.21+0x7c/0xc0) from [<c01a5670>] (matches_name.clone.22+0xbc/0xd0)
[<c01a5670>] (matches_name.clone.22+0xbc/0xd0) from [<c01a56cc>] (resolve_collision+0x48/0x304)
[<c01a56cc>] (resolve_collision+0x48/0x304) from [<c01a8174>] (ubifs_tnc_next_ent+0x148/0x270)
[<c01a8174>] (ubifs_tnc_next_ent+0x148/0x270) from [<c0198238>] (ubifs_readdir+0x2e4/0x5a0)
[<c0198238>] (ubifs_readdir+0x2e4/0x5a0) from [<c00bc8e8>] (vfs_readdir+0x90/0xac)
[<c00bc8e8>] (vfs_readdir+0x90/0xac) from [<c00bc9e8>] (sys_getdents+0x74/0xcc)
[<c00bc9e8>] (sys_getdents+0x74/0xcc) from [<c000ebc0>] (ret_fast_syscall+0x0/0x30)
	magic          0x6101831
	crc            0x76707438
	node_type      0 (inode node)
	group_type     2 (last of node group)
	sqnum          324111861
	len            160
	key            (23300960, inode)
	creat_sqnum    324002935
	size           263184
	nlink          2
	atime          20882.0
	mtime          20884.0
	ctime          20884.0
	uid            0
	gid            0
	mode           16832
	flags          0x1
	xattr_cnt      0
	xattr_size     0
	xattr_names    0
	compr_type     0x0
	data len       0
UBIFS error (pid 4262): ubifs_readdir: cannot find next direntry, error -22

Brian
