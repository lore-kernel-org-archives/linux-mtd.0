Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fsaCR-0007x4-2L
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2018 20:57:59 +0000
From: Richard Weinberger <richard@nod.at>
To: torvalds@linux-foundation.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] UBI/UBIFS updates for 4.19-rc1
Date: Wed, 22 Aug 2018 22:57:32 +0200
Message-ID: <25583958.CCRG8GzgUh@blindfold>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

The following changes since commit 94710cac0ef4ee177a63b5227664b38c95bbf703:

  Linux 4.18 (2018-08-12 13:41:04 -0700)

are available in the Git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.19-rc1

for you to fetch changes up to 99a24e02ccf6604e3020cf9e2c7a042b6ebb655f:

  ubifs: Set default assert action to read-only (2018-08-15 00:25:22 +0200)

----------------------------------------------------------------
This pull request contains updates for both UBI and UBIFS:

- Year 2038 preparations
- New UBI feature to skip CRC checks of static volumes
- A new Kconfig option to disable xattrs in UBIFS
- Lots of fixes in UBIFS, found by our new test framework

----------------------------------------------------------------
Arnd Bergmann (2):
      ubifs: use timespec64 for inode timestamps
      ubifs: tnc: use monotonic znode timestamp

Gustavo A. R. Silva (1):
      ubifs: use swap macro in swap_dirty_idx

Quentin Schulz (2):
      ubi: provide a way to skip CRC checks
      ubi: expose the volume CRC check skip flag

Richard Weinberger (15):
      ubifs: Fix directory size calculation for symlinks
      ubifs: Fix synced_i_size calculation for xattr inodes
      ubi: Initialize Fastmap checkmapping correctly
      ubifs: Fix memory leak in lprobs self-check
      ubifs: gc: Fix typo
      ubifs: xattr: Don't operate on deleted inodes
      ubifs: Add comment on c->commit_sem
      Revert "UBIFS: Fix potential integer overflow in allocation"
      ubifs: Check data node size before truncate
      ubifs: Use kmalloc_array()
      ubifs: Turn two ubifs_assert() into a WARN_ON()
      ubifs: Pass struct ubifs_info to ubifs_assert()
      ubifs: Rework ubifs_assert()
      ubifs: Allow setting assert action as mount parameter
      ubifs: Set default assert action to read-only

Stefan Agner (1):
      ubifs: introduce Kconfig symbol for xattr support

 drivers/mtd/ubi/cdev.c      |  11 +++++
 drivers/mtd/ubi/kapi.c      |   2 +-
 drivers/mtd/ubi/ubi-media.h |   6 +++
 drivers/mtd/ubi/ubi.h       |   4 ++
 drivers/mtd/ubi/vmt.c       |  12 +++++
 drivers/mtd/ubi/vtbl.c      |  23 +++++----
 fs/ubifs/Kconfig            |  15 +++++-
 fs/ubifs/Makefile           |   3 +-
 fs/ubifs/budget.c           |  68 +++++++++++++--------------
 fs/ubifs/commit.c           |   8 ++--
 fs/ubifs/crypto.c           |   4 +-
 fs/ubifs/debug.c            |  42 +++++++++++++----
 fs/ubifs/debug.h            |  14 +++---
 fs/ubifs/dir.c              |  42 +++++++++--------
 fs/ubifs/file.c             |  62 ++++++++++++++----------
 fs/ubifs/file.h             |   0
 fs/ubifs/find.c             |  59 +++++++++++------------
 fs/ubifs/gc.c               |  66 +++++++++++++-------------
 fs/ubifs/io.c               |  97 +++++++++++++++++++-------------------
 fs/ubifs/journal.c          |  72 ++++++++++++++++------------
 fs/ubifs/key.h              |  14 +++---
 fs/ubifs/log.c              |  12 ++---
 fs/ubifs/lprops.c           |  94 ++++++++++++++++++-------------------
 fs/ubifs/lpt.c              | 112 ++++++++++++++++++++++----------------------
 fs/ubifs/lpt_commit.c       |  50 ++++++++++----------
 fs/ubifs/master.c           |   2 +-
 fs/ubifs/misc.c             |  11 +++++
 fs/ubifs/misc.h             |  16 ++++---
 fs/ubifs/orphan.c           |  26 +++++-----
 fs/ubifs/recovery.c         |  14 +++---
 fs/ubifs/replay.c           |  13 ++---
 fs/ubifs/sb.c               |  18 +++----
 fs/ubifs/scan.c             |   2 +-
 fs/ubifs/shrinker.c         |  12 ++---
 fs/ubifs/super.c            |  76 ++++++++++++++++++++----------
 fs/ubifs/tnc.c              | 111 +++++++++++++++++++++----------------------
 fs/ubifs/tnc_commit.c       |  28 +++++------
 fs/ubifs/tnc_misc.c         |  40 +++++++++-------
 fs/ubifs/ubifs.h            |  39 ++++++++++++---
 fs/ubifs/xattr.c            |  40 ++++++++++++----
 include/uapi/mtd/ubi-user.h |  18 ++++++-
 41 files changed, 787 insertions(+), 571 deletions(-)
 create mode 100644 fs/ubifs/file.h
