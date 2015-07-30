Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnU-0006IZ-NN
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:29 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 00/35] Add quota supporting in ubifs
Date: Thu, 30 Jul 2015 13:47:56 +0800
Message-ID: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
	This is the V2 for adding quota in ubifs.

Changelog:
	v1->v2:
		- remove the duplication in block_dev and char_dev
		- rename read_block to ubifs_read_block
		- drop patch for ui->budgeted
		- budget in ubifs_dirty_inode() if necessary

TEST:
	With a patchset [xfstests: Introduce ubifs to xfstests],
we can run xfstests for ubifs. And the result is shown below:

 # ./check -ubifs
FSTYP         -- ubifs
PLATFORM      -- Linux/x86_64 atest-guest 4.1.0+
MKFS_OPTIONS  -- /dev/ubi0_1
MOUNT_OPTIONS -- -o context=system_u:object_r:nfs_t:s0 /dev/ubi0_1 /mnt/scratch

generic/001 7s ... 7s
generic/002 1s ... 1s

[...]

Passed all 70 tests

 # ./check -ubifs -g quota
FSTYP         -- ubifs
PLATFORM      -- Linux/x86_64 atest-guest 4.1.0+
MKFS_OPTIONS  -- /dev/ubi0_1
MOUNT_OPTIONS -- -o context=system_u:object_r:nfs_t:s0 /dev/ubi0_1 /mnt/scratch

generic/055	 [not run] ubifs does not support shutdown
generic/082 1s ... 0s
generic/219 23s ... [not run] O_DIRECT is not supported
generic/230 13s ... 13s
generic/231 51s ... 50s
generic/232 3s ... 3s
generic/233 4s ... 5s
generic/234 10s ... 9s
generic/235 1s ... 1s
generic/270	 [not run] Filesystem ubifs not supported in _scratch_mkfs_sized
generic/280	 [not run] ubifs does not support freezing
Ran: generic/082 generic/230 generic/231 generic/232 generic/233 generic/234 generic/235
Not run: generic/055 generic/219 generic/270 generic/280
Passed all 7 tests

You can get the code by:
ubifs:  https://github.com/yangdongsheng/linux.git ubifs_quota_v2
xfstests: https://github.com/yangdongsheng/xfstests.git ubifs_v1

NOTE: the branch of ubifs_quota_v2 contains one patch about atime and one patch about get/setxattr.
These patches can make xfstests all pass and there would be some conflict between them and quota
patchset. So I keep them in this branch.

NOTE2: I found Jan has post his patch about "quota: Propagate errors when creating quota entry",
if that went to mainline, I will send a patch to catch the ret-value of dquot_initialize() in ubifs.

Any test or review is welcom :)

Thanx
Yang

Dongsheng Yang (35):
  fs: introduce a ->s_cdev field into struct super_block
  fs: cleanup: remove the blank line before EXPORT_SYMBOL
  fs: super: cleanup: make the comment of each function aligned
  fs: super: consolidate the get_super class functions
  fs: super: introduce a get_super_cdev to get super by a cdev reference
  fs: super: introduce a get_super_cdev_thawed to get sb by cdev
    reference
  fs: char_dev: introduce cd_acquire function to acquire cdev
  fs: introduce a __lookup_dev for internal using
  fs: char_dev: introduce lookup_cdev to get cdev by pathname
  fs: dquot: skip invalidate_bdev if bdev is NULL
  fs: quota: make quota support fs which is running on char dev
  ubi: introduce a interface to get cdev in ubi_volume
  ubifs: fix a typo in comment of ubifs_budget_req
  ubifs: extend budget for blocks
  ubifs: fill sb->s_cdev in ubifs_fill_super()
  ubifs: fill ->s_dev in ubifs_fill_super
  ubifs: export read_block() from file.c
  ubifs: introduce quota related mount options
  ubifs: budget for inode in ubifs_dirty_inode if necessary
  ubifs: implement IO functions for quota files
  ubifs: disable quota in ubifs_put_super
  ubifs: write quota back in ubifs_sync
  ubifs: set/clear MS_RDONLY properly in ubifs_remount
  ubifs: suspend & resume quota properly in ubifs_remount
  ubifs: record quota information about inode in ubifs_new_inode
  ubifs: free quota inode information in ubifs_evict_inode
  ubifs: alloc quota space in ubifs_write_begin
  ubifs: free quota space in do_truncation
  ubifs: free quota space when deleting a file
  ubifs: adapt quota space informatin in do_setattr
  ubifs: transfer quota information in changing owner or group
  ubifs: write inode in ubifs_quota_write if we are appending
  fs: introduce a get_qsize() to file_operations
  ubifs: implement ubifs_get_qsize to get quota size in ubifs
  ubifs: make ubifs to support quota

 drivers/mtd/ubi/kapi.c  |   6 +
 fs/Makefile             |   2 +-
 fs/block_dev.c          |  26 +---
 fs/char_dev.c           |  48 ++++++++
 fs/dev.c                |  77 ++++++++++++
 fs/internal.h           |  14 +++
 fs/ioctl.c              |  31 +++--
 fs/quota/dquot.c        |   3 +-
 fs/quota/quota.c        |  30 +++--
 fs/super.c              | 284 +++++++++++++++++++++++--------------------
 fs/ubifs/budget.c       |   4 +
 fs/ubifs/debug.c        |   2 +
 fs/ubifs/dir.c          |  24 +++-
 fs/ubifs/file.c         |  78 +++++++++++-
 fs/ubifs/journal.c      |   6 +
 fs/ubifs/super.c        | 317 +++++++++++++++++++++++++++++++++++++++++++++++-
 fs/ubifs/ubifs.h        |  19 ++-
 include/linux/fs.h      |   6 +
 include/linux/mtd/ubi.h |   1 +
 19 files changed, 792 insertions(+), 186 deletions(-)
 create mode 100644 fs/dev.c

-- 
1.8.4.2
