Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d2JJc-00085S-OT
 for linux-mtd@lists.infradead.org; Sun, 23 Apr 2017 15:20:47 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBI/UBIFS fixes for 4.11
Message-ID: <7417b6e7-5a06-c96d-bb5a-d62b45c5dad3@nod.at>
Date: Sun, 23 Apr 2017 17:20:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

The following changes since commit 89970a04d70c6c9e5e4492fd4096c0b5630a478c:

  Merge branch 'for-rc' of git://git.kernel.org/pub/scm/linux/kernel/git/rzhang/linux (2017-03-29 19:59:49 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.11-rc7

for you to fetch changes up to 32fe905c17f001c0eee13c59afddd0bf2eed509c:

  ubifs: Fix O_TMPFILE corner case in ubifs_link() (2017-04-18 23:18:02 +0200)

----------------------------------------------------------------
This pull request contains fixes for issues in both UBI and UBIFS:
- More O_TMPFILE fallout
- RENAME_WHITEOUT regression due to a mis-merge
- Memory leak in ubifs_mknod()
- Power-cut problem in UBI's update volume feature

----------------------------------------------------------------
Felix Fietkau (1):
      ubifs: Fix RENAME_WHITEOUT support

Hyunchul Lee (3):
      ubifs: Remove filename from debug messages in ubifs_readdir
      ubifs: Fix debug messages for an invalid filename in ubifs_dump_node
      ubifs: Fix debug messages for an invalid filename in ubifs_dump_inode

Richard Weinberger (2):
      ubifs: Fix memory leak in error path in ubifs_mknod
      ubifs: Fix O_TMPFILE corner case in ubifs_link()

Sebastian Siewior (1):
      ubi/upd: Always flush after prepared for an update

 drivers/mtd/ubi/upd.c |  8 ++++----
 fs/ubifs/debug.c      | 10 +++++++---
 fs/ubifs/dir.c        | 18 ++++++++++++------
 3 files changed, 23 insertions(+), 13 deletions(-)
