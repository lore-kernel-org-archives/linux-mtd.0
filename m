Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwH76-0003Xp-Bc
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2015 22:10:06 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBI/UBIFS updates for 4.4-rc1
Message-ID: <56426B1F.50303@nod.at>
Date: Tue, 10 Nov 2015 23:09:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

the following changes since commit 9ffecb10283508260936b96022d4ee43a7798b4c:

  Linux 4.3-rc3 (2015-09-27 07:50:08 -0400)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.4-rc1

for you to fetch changes up to 8c1c5f263833ec2dc8fd716cf4281265c485d7ad:

  ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs (2015-11-07 11:35:08 +0100)

----------------------------------------------------------------
This pull request includes the following UBI/UBIFS changes:
* access time support for UBIFS by Dongsheng Yang
* random cleanups and bug fixes all over the place

----------------------------------------------------------------
Andrew Murray (1):
      UBI: Update comments to reflect UBI_METAONLY flag

Andrzej Hajda (1):
      UBIFS: use kmemdup rather than duplicating its implementation

Dongsheng Yang (3):
      UBIFS: fix a typo in comment of ubifs_budget_req
      ubifs: make ubifs_[get|set]xattr atomic
      ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs

Ezequiel García (1):
      UBI: Fastmap: Fix PEB array type

Julia Lawall (1):
      UBI: drop null test before destroy functions

Markus Elfring (1):
      UBIFS: Delete unnecessary checks before the function call "iput"

Richard Weinberger (6):
      UBI: Fastmap: Simplify expression
      UBI: Fix typo in comment
      UBI: Fix debug message
      ubi: fastmap: Implement produce_free_peb()
      UBIFS: Fix possible memory leak in ubifs_readdir()
      UBI: Remove in vain semicolon

Yaowei Bai (1):
      fs/ubifs: remove unnecessary new_valid_dev check

shengyong (2):
      UBIFS: call dbg_is_power_cut() instead of reading c->dbg->pc_happened
      UBIFS: print verbose message when rescanning a corrupted node

 drivers/mtd/ubi/attach.c     |  4 +---
 drivers/mtd/ubi/cdev.c       |  2 +-
 drivers/mtd/ubi/eba.c        |  2 +-
 drivers/mtd/ubi/fastmap-wl.c | 29 +++++++++++++++++++++++++
 drivers/mtd/ubi/fastmap.c    |  4 ++--
 drivers/mtd/ubi/gluebi.c     |  4 ++--
 drivers/mtd/ubi/ubi-media.h  |  2 +-
 fs/ubifs/Kconfig             | 15 +++++++++++++
 fs/ubifs/debug.c             |  8 +++----
 fs/ubifs/dir.c               | 11 +++++-----
 fs/ubifs/file.c              | 50 ++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/lpt.c               |  6 ++----
 fs/ubifs/misc.h              |  9 ++------
 fs/ubifs/recovery.c          |  8 +++----
 fs/ubifs/super.c             | 12 +++++++++--
 fs/ubifs/tnc.c               |  3 +--
 fs/ubifs/ubifs.h             |  7 +++++--
 fs/ubifs/xattr.c             | 12 ++++++++---
 18 files changed, 144 insertions(+), 44 deletions(-)
