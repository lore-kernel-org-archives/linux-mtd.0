Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmEo-0002kO-Ai
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:09:19 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 00/39] Add quota supporting in ubifs
Date: Tue, 15 Sep 2015 17:01:55 +0800
Message-ID: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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
	This is the V3 to add quota in ubifs.

Hi Al,
	There are some patches about vfs, and
some of them are already Reviewed-by Jan, please
take a look at them. Thanx.

Hi Jan,
	There are some new patches for dquot,
please take a look.

Hi Artem and Richard,
	please help to review the ubifs part.

Test:

 # ./check -g quota
FSTYP         -- ubifs
PLATFORM      -- Linux/x86_64 atest-guest 4.2.0-quota_v3+
MKFS_OPTIONS  -- /dev/ubi0_1
MOUNT_OPTIONS -- -o context=system_u:object_r:nfs_t:s0 /dev/ubi0_1 /mnt/scratch

generic/055	 [not run] ubifs does not support shutdown
generic/082 0s ... 1s
generic/219 1s ... [not run] O_DIRECT is not supported
generic/230 13s ... 13s
generic/231 46s ... 47s
generic/232 2s ... 3s
generic/233 4s ... 4s
generic/234 8s ... 8s
generic/235 1s ... 1s
generic/270	 [not run] Filesystem ubifs not supported in _scratch_mkfs_sized
generic/280	 [not run] ubifs does not support freezing
Ran: generic/082 generic/230 generic/231 generic/232 generic/233 generic/234 generic/235
Not run: generic/055 generic/219 generic/270 generic/280
Passed all 7 tests

As usual, you can get the code from:
	https://github.com/yangdongsheng/linux.git   ubifs_quota_v3

Changelog:
	v1->v2:
		- remove the duplication in block_dev and char_dev
		- rename read_block to ubifs_read_block
		- drop patch for ui->budgeted
		- budget in ubifs_dirty_inode() if necessary
	v2->v3:
		- introduce a callback function in quotactl_ops
		  to allow filesystem to do some special work
		  in restoring iflags. This fix the problem
		  in V2 about ubifs_dirty_inode()

Dongsheng Yang (39):
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
  fs: quota: replace opened calling of ->sync_fs with sync_filesystem
  fs: quota: make quota support fs which is running on char dev
  fs: introduce a get_qsize() to inode_operations
  fs: quota: restore i_flags of quota files in dquot_disable
  fs: quota: introduce a callback of restore_iflags to quotactl_ops
  ubi: introduce a interface to get cdev in ubi_volume
  ubifs: extend budget for blocks
  ubifs: fill sb->s_cdev in ubifs_fill_super()
  ubifs: fill ->s_dev in ubifs_fill_super
  ubifs: export read_block() from file.c
  ubifs: introduce i_dquot to ubifs_inode
  ubifs: implement IO functions for quota files
  ubifs: disable quota in ubifs_put_super
  ubifs: write quota back in ubifs_sync
  ubifs: set/clear MS_RDONLY properly in ubifs_remount
  ubifs: suspend & resume quota properly in ubifs_remount
  ubifs: check inode with NULL before using it
  ubifs: record quota information about inode in ubifs_new_inode
  ubifs: free quota inode information in ubifs_evict_inode
  ubifs: alloc quota space in ubifs writing path
  ubifs: free quota space in do_truncation
  ubifs: free quota space when deleting a file
  ubifs: adapt quota space informatin in do_setattr
  ubifs: transfer quota information in changing owner or group
  ubifs: write inode in ubifs_quota_write if we are appending
  ubifs: implement ubifs_get_qsize to get quota size in ubifs
  ubifs: implement ubifs_restore_iflags for quotactl_operations
  ubifs: fill the quota related fields in ubifs_fill_super
  ubifs: introduce quota related mount options

 drivers/mtd/ubi/kapi.c  |   6 +
 fs/Makefile             |   2 +-
 fs/block_dev.c          |  26 +----
 fs/char_dev.c           |  48 ++++++++
 fs/dev.c                |  77 +++++++++++++
 fs/internal.h           |  14 +++
 fs/ioctl.c              |  31 +++--
 fs/quota/dquot.c        |  62 ++++++----
 fs/quota/quota.c        |  30 +++--
 fs/super.c              | 284 ++++++++++++++++++++++++---------------------
 fs/ubifs/budget.c       |   4 +
 fs/ubifs/debug.c        |   2 +
 fs/ubifs/dir.c          |  23 +++-
 fs/ubifs/file.c         |  80 ++++++++++++-
 fs/ubifs/journal.c      |   4 +
 fs/ubifs/super.c        | 297 +++++++++++++++++++++++++++++++++++++++++++++++-
 fs/ubifs/ubifs.h        |  17 +++
 include/linux/fs.h      |   6 +
 include/linux/mtd/ubi.h |   1 +
 include/linux/quota.h   |   5 +
 20 files changed, 819 insertions(+), 200 deletions(-)
 create mode 100644 fs/dev.c

-- 
1.8.4.2
