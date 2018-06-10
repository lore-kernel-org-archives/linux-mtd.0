Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fS75h-0004q7-RU
 for linux-mtd@lists.infradead.org; Sun, 10 Jun 2018 20:37:37 +0000
From: Richard Weinberger <richard@nod.at>
To: Linus <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] UBI/UBIFS updates for 4.18-rc1
Date: Sun, 10 Jun 2018 22:37:11 +0200
Message-ID: <3354112.NtT4H96kfh@blindfold>
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

The following changes since commit 29dcea88779c856c7dc92040a0c01233263101d4:

  Linux 4.17 (2018-06-03 14:15:21 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.18-rc1

for you to fetch changes up to f5a926dd529870de4bd19199ce7b36985f130d70:

  mtd: ubi: Update ubi-media.h to dual license (2018-06-07 15:53:17 +0200)

----------------------------------------------------------------
This pull request contains updates for both UBI and UBIFS:
- The UBI on-disk format header file is now dual licensed
- New way to detect Fastmap problems during runtime
- Bugfix for Fastmap
- Minor updates for UBIFS (spelling, comments, vm_fault_t, ...)

----------------------------------------------------------------
Lionel Debieve (1):
      mtd: ubi: Update ubi-media.h to dual license

Richard Weinberger (4):
      ubi: fastmap: Cancel work upon detach
      ubi: fastmap: Correctly handle interrupted erasures in EBA
      ubi: fastmap: Check each mapping only once
      ubi: fastmap: Detect EBA mismatches on-the-fly

Sascha Hauer (6):
      ubifs: remove set but never used variable
      ubifs: journal: Remove wrong comment
      ubifs: Spelling fix someting -> something
      ubifs: log: Some spelling fixes
      ubifs: gc: Fix typo
      ubifs: lpt: Fix wrong pnode number range in comment

Souptick Joarder (1):
      fs: ubifs: Adding new return type vm_fault_t

Wang Shilong (1):
      ubifs, xattr: remove misguided quota flags

 drivers/mtd/ubi/build.c     |   4 ++
 drivers/mtd/ubi/eba.c       | 111 +++++++++++++++++++++++++++++++++++++++++++-
 drivers/mtd/ubi/fastmap.c   |  20 ++++++++
 drivers/mtd/ubi/ubi-media.h |  22 ++-------
 drivers/mtd/ubi/ubi.h       |  11 +++++
 drivers/mtd/ubi/vmt.c       |   1 +
 drivers/mtd/ubi/vtbl.c      |  16 ++++++-
 drivers/mtd/ubi/wl.c        |   4 +-
 fs/ubifs/file.c             |  11 ++---
 fs/ubifs/gc.c               |   2 +-
 fs/ubifs/journal.c          |   5 +-
 fs/ubifs/log.c              |   6 +--
 fs/ubifs/lpt_commit.c       |   2 +-
 fs/ubifs/replay.c           |   5 +-
 fs/ubifs/ubifs.h            |   2 -
 fs/ubifs/xattr.c            |   2 +-
 16 files changed, 178 insertions(+), 46 deletions(-)
