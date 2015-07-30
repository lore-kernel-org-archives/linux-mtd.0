Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKh5M-0002r3-90
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 06:12:57 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <eguan@redhat.com>, <fstests@vger.kernel.org>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 0/5] xfstests: introduce ubifs in xfstests
Date: Thu, 30 Jul 2015 14:06:52 +0800
Message-ID: <1438236417-24612-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Hi all:
	This patchset introduce a subtestset for ubifs.

In kernel v4.1, we will find some cases fail for ubifs,
I have post some patch for ubifs to fix it.
[PATCH v3] ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs
[PATCH] ubifs: make ubifs_[get|set]xattr atomic

And I have send a patchset to add quota in ubifs.

Then we can get a all pass:
 # ./check -ubifs
FSTYP         -- ubifs
PLATFORM      -- Linux/x86_64 atest-guest 4.1.0+
MKFS_OPTIONS  -- /dev/ubi0_1
MOUNT_OPTIONS -- -o context=system_u:object_r:nfs_t:s0 /dev/ubi0_1 /mnt/scratch

generic/001 7s ... 7s
generic/002 1s ... 1s

[...]

Passed all 70 tests


Dongsheng Yang (5):
  xfstest: add ubifs support
  xfstest: generic/219 add _require_odirect
  xfstest: generic/125 add _require_odirect
  xfstest: introduce subtestset for ubifs
  xfstest: add quota tests to ubifs

 check               |  2 ++
 common/config       |  9 ++++---
 common/quota        |  4 +--
 common/rc           |  8 ++++--
 tests/generic/125   |  1 +
 tests/generic/219   |  1 +
 tests/ubifs/001     | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/ubifs/001.out |  1 +
 tests/ubifs/group   |  6 +++++
 9 files changed, 95 insertions(+), 8 deletions(-)
 create mode 100755 tests/ubifs/001
 create mode 100644 tests/ubifs/001.out
 create mode 100644 tests/ubifs/group

-- 
1.8.4.2
