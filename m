Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SRRE7-0005jA-UA
 for linux-mtd@lists.infradead.org; Mon, 07 May 2012 16:56:00 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 0/4] do not use s_dirt in JFFS2
Date: Mon,  7 May 2012 19:56:49 +0300
Message-Id: <1336409813-6365-1-git-send-email-dedekind1@gmail.com>
Cc: Linux Kernel Maling List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is the second version for the patch-set which makes JFFS2 file-system
stop using the VFS '->write_supers()' call-back because I plan to remove it
once all users are gone.

Comparing to the previous version I gave up on using a special inode for JFFS2
because it introduces unnecessary overhead: currently JFFS2 does not register
'->write_super()' at all, and if we register it for the sake of a single fake
inode - it will be called for all inodes, which is unnecessary. So in this
version I am using a delayed work for scheduling write-buffer flushing.

v1: https://lkml.org/lkml/2012/4/11/147

The final goal is to get rid of the 'sync_supers()' kernel thread. This kernel
thread wakes up every 5 seconds (by default) and calls '->write_super()' for
all mounted file-systems. And the bad thing is that this is done even if all
the superblocks are clean. Moreover, some file-systems do not even need this
end they do not register the '->write_super()' method at all (e.g., btrfs).

So 'sync_supers()' most often just generates useless wake-ups and wastes power.
I am trying to make all file-systems independent of '->write_super()' and plan
to remove 'sync_supers()' and '->write_super' completely once there are no more
users.

The '->write_supers()' method is mostly used by baroque file-systems like hfs,
udf, etc. Modern file-systems like btrfs and xfs do not use it. This justifies
removing this stuff from VFS completely and make every FS self-manage own
superblock.

Note: in the past I was trying to upstream patches which optimized 'sync_super()',
but Al Viro wanted me to kill it completely instead, which I am trying to do
now, see http://lkml.org/lkml/2010/7/22/96

 fs/jffs2/jffs2_fs_sb.h |    4 +++
 fs/jffs2/os-linux.h    |    7 +----
 fs/jffs2/super.c       |   21 ------------------
 fs/jffs2/wbuf.c        |   55 +++++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 58 insertions(+), 29 deletions(-)

Tested using fsstress on both nandsim and mtdram.

======
Overall status:

1. ext4: patches submitted, waiting for reply from Ted Ts'o:
   https://lkml.org/lkml/2012/4/2/111
   Ted keeps silence so far WRT the fate of this patch-set.
2. ext2: patches are in the ext2 tree maintained by Jan Kara:
   git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
3. Version 3 of FAT FS changes were sent to Andrew and Hirofumi:
   https://lkml.org/lkml/2012/5/4/183
4. JFFS2 patches version 3 are sent being sent now.

TODO: affs, exofs, hfs, hfsplus, reiserfs, sysv, udf, ufs
======

Thanks,
Artem.
