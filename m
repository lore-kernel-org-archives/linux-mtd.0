Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT9T-0002qj-Hs
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:43:52 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [RFC PATCH 00/25] Add quota supporting in ubifs
Date: Tue, 21 Jul 2015 16:37:31 +0800
Message-ID: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Hi Atem, Richard and others,
	This is a patchset to add quota supporting in ubifs.
[1/25] - [7/25] are working to make quotactl to support filesystems
which are running on char device.

Others are about making ubifs to support quota
Please help to review or test it. Any comment is welcome :).

Hi Jan Kara,
	I am not sure I am using the quota APIs correctly, please
help to correct me if I am wrong.

Also you can get the code from:
https://github.com/yangdongsheng/linux.git  ubifs_quota_v1

	My simple testing is shown as below:
[root@atest-guest linux_compile]# mount -t ubifs -o usrquota,grpquota /dev/ubi0_0 /mnt/ubifs/
[root@atest-guest linux_compile]# quotacheck -ug /mnt/ubifs
[root@atest-guest linux_compile]# quotaon /mnt/ubifs
[root@atest-guest linux_compile]# repquota /mnt/ubifs
*** Report for user quotas on device /dev/ubi0_0
Block grace time: 7days; Inode grace time: 7days
                        Block limits                File limits
User            used    soft    hard  grace    used  soft  hard  grace
----------------------------------------------------------------------
root      --       0       0       0              1     0     0 
[root@atest-guest linux_compile]# setquota root 10 10 3 3 /mnt/ubifs
[root@atest-guest linux_compile]# repquota /mnt/ubifs
*** Report for user quotas on device /dev/ubi0_0
Block grace time: 7days; Inode grace time: 7days
                        Block limits                File limits
User            used    soft    hard  grace    used  soft  hard  grace
----------------------------------------------------------------------
root      --       0      10      10              1     3     3 
[root@atest-guest linux_compile]# touch /mnt/ubifs/{1,11,111}
ubifs: warning, user file quota exceeded.
[root@atest-guest linux_compile]# repquota /mnt/ubifs
*** Report for user quotas on device /dev/ubi0_0
Block grace time: 7days; Inode grace time: 7days
                        Block limits                File limits
User            used    soft    hard  grace    used  soft  hard  grace
----------------------------------------------------------------------
root      -+       0      10      10              4     3     3  7days
[root@atest-guest linux_compile]# rm -rf /mnt/ubifs/1*
[root@atest-guest linux_compile]# repquota /mnt/ubifs
*** Report for user quotas on device /dev/ubi0_0
Block grace time: 7days; Inode grace time: 7days
                        Block limits                File limits
User            used    soft    hard  grace    used  soft  hard  grace
----------------------------------------------------------------------
root      --       0      10      10              1     3     3    
[root@atest-guest linux_compile]# dd if=/dev/urandom of=/mnt/ubifs/data bs=1K count=11
ubifs: warning, user block quota exceeded.
11+0 records in
11+0 records out
11264 bytes (11 kB) copied, 0.216498 s, 52.0 kB/s
[root@atest-guest linux_compile]# repquota /mnt/ubifs
*** Report for user quotas on device /dev/ubi0_0
Block grace time: 7days; Inode grace time: 7days
                        Block limits                File limits
User            used    soft    hard  grace    used  soft  hard  grace
----------------------------------------------------------------------
root      +-      11      10      10  7days       2     3     3   
[root@atest-guest linux_compile]# rm -rf /mnt/ubifs/data 
[root@atest-guest linux_compile]# repquota /mnt/ubifs
*** Report for user quotas on device /dev/ubi0_0
Block grace time: 7days; Inode grace time: 7days
                        Block limits                File limits
User            used    soft    hard  grace    used  soft  hard  grace
----------------------------------------------------------------------
root      --       0      10      10              1     3     3     


Dongsheng Yang (25):
  fs: introduce a ->s_cdev field into struct super_block
  ubi: introduce a interface to get cdev in ubi_volume
  ubifs: fill sb->s_cdev in ubifs_fill_super()
  fs: super: introduce the functions to get super by cdev reference
  fs: char_dev: introduce lookup_cdev function to find cdev by name
  fs: dquot: skip invalidate_bdev if bdev is NULL
  fs: quota: make quota support fs which is running on char dev
  ubifs: fix a typo in comment of ubifs_budget_req
  ubifs: extend budget for blocks
  ubifs: fill ->s_dev in ubifs_fill_super
  ubifs: export read_block() from file.c
  ubifs: introduce quota related mount options
  ubifs: introduce a field named as budgeted to ubifs_inode
  ubifs: implement IO functions for quota files
  ubifs: disable quota in ubifs_put_super
  ubifs: write quota back in ubifs_sync
  ubifs: suspend & resume quota properly in ubifs_remount
  ubifs: record quota information about inode in ubifs_new_inode
  ubifs: free quota inode information in ubifs_evict_inode
  ubifs: alloc quota space in ubifs_write_begin
  ubifs: free quota space in do_truncation and unlink
  ubifs: adapt quota space informatin in do_setattr
  ubifs: transfer quota information in changing owner or group
  ubifs: implement ubifs_qctl_operations for quotactl
  ubifs: make ubifs to support quota

 drivers/mtd/ubi/kapi.c  |   6 +
 fs/char_dev.c           |  72 ++++++++++
 fs/quota/dquot.c        |   3 +-
 fs/quota/quota.c        |  30 +++--
 fs/super.c              |  45 +++++++
 fs/ubifs/budget.c       |   4 +
 fs/ubifs/debug.c        |   2 +
 fs/ubifs/dir.c          |  24 +++-
 fs/ubifs/file.c         |  56 +++++++-
 fs/ubifs/ioctl.c        |   1 +
 fs/ubifs/super.c        | 352 +++++++++++++++++++++++++++++++++++++++++++++++-
 fs/ubifs/ubifs.h        |  19 ++-
 include/linux/fs.h      |   5 +
 include/linux/mtd/ubi.h |   1 +
 14 files changed, 597 insertions(+), 23 deletions(-)

-- 
1.8.4.2
