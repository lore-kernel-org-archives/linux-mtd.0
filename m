Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdZMu-0007lQ-DH
 for linux-mtd@lists.infradead.org; Thu, 12 Jul 2018 11:02:42 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 0/5] ubifs: Rework assert code
Date: Thu, 12 Jul 2018 13:01:55 +0200
Message-Id: <20180712110200.13054-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series changes the UBIFS assert code such that users can specify what
do to upon a failed assert. The new mount option "assert=" controls these
actions. Currently three actions are supported:
- report: Just report the assertion
- panic: Panic the kernel
- read-only: Switch to read-only mode

>From now on the default action is read-only.

Richard Weinberger (5):
  ubifs: Turn two ubifs_assert() into a WARN_ON()
  ubifs: Pass struct ubifs_info to ubifs_assert()
  ubifs: Rework ubifs_assert()
  ubifs: Allow setting assert action as mount parameter
  ubifs: Set default assert action to read-only

 fs/ubifs/budget.c     |  68 ++++++++++++-------------
 fs/ubifs/commit.c     |   8 +--
 fs/ubifs/crypto.c     |   4 +-
 fs/ubifs/debug.c      |  42 ++++++++++++----
 fs/ubifs/debug.h      |  14 +++---
 fs/ubifs/dir.c        |  35 ++++++-------
 fs/ubifs/file.c       |  47 ++++++++++--------
 fs/ubifs/find.c       |  54 ++++++++++----------
 fs/ubifs/gc.c         |  64 ++++++++++++------------
 fs/ubifs/io.c         |  97 ++++++++++++++++++------------------
 fs/ubifs/journal.c    |  52 ++++++++++----------
 fs/ubifs/key.h        |  14 +++---
 fs/ubifs/log.c        |  12 ++---
 fs/ubifs/lprops.c     |  86 ++++++++++++++++----------------
 fs/ubifs/lpt.c        | 112 +++++++++++++++++++++---------------------
 fs/ubifs/lpt_commit.c |  50 ++++++++++---------
 fs/ubifs/master.c     |   2 +-
 fs/ubifs/misc.c       |  11 +++++
 fs/ubifs/misc.h       |  16 +++---
 fs/ubifs/orphan.c     |  26 +++++-----
 fs/ubifs/recovery.c   |  14 +++---
 fs/ubifs/replay.c     |  13 ++---
 fs/ubifs/sb.c         |  12 ++---
 fs/ubifs/scan.c       |   2 +-
 fs/ubifs/shrinker.c   |  10 ++--
 fs/ubifs/super.c      |  74 +++++++++++++++++++---------
 fs/ubifs/tnc.c        | 107 ++++++++++++++++++++--------------------
 fs/ubifs/tnc_commit.c |  28 +++++------
 fs/ubifs/tnc_misc.c   |  38 ++++++++------
 fs/ubifs/ubifs.h      |  31 +++++++++---
 fs/ubifs/xattr.c      |  16 +++---
 31 files changed, 632 insertions(+), 527 deletions(-)

-- 
2.18.0
