Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SQMGn-0006Mj-4G
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 17:26:17 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/3] do not use s_dirt in JFFS2
Date: Fri,  4 May 2012 20:27:06 +0300
Message-Id: <1336152428-24242-1-git-send-email-dedekind1@gmail.com>
Cc: Linux Kernel Maling List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch-set makes JFFS2 file-system stop using the VFS '->write_supers()'
call-back because I plan to remove it once all users are gone.

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

======
Overall status:

1. ext4: patches submitted, waiting for reply from Ted Ts'o:
   https://lkml.org/lkml/2012/4/2/111
   Ted keeps silence so far WRT the fate of this patch-set.
2. ext2: patches are in the ext2 tree maintained by Jan Kara:
   git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
3. Version 3 of FAT FS changes were sent to Andrew and Hirofumi:
   https://lkml.org/lkml/2012/5/4/183
4. JFFS2 patches are sent being sent now.

TODO: affs, exofs, hfs, hfsplus, reiserfs, sysv, udf, ufs
======

 fs/fat/fat.h             |    1 +
 fs/fat/fatent.c          |   22 +++++++++++++-----
 fs/fat/inode.c           |   54 ++++++++++++++++++++-------------------------
 include/linux/msdos_fs.h |    3 +-
 4 files changed, 43 insertions(+), 37 deletions(-)

Thanks,
Artem.
