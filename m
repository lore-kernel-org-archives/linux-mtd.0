Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aj9th-0005IC-Mc
 for linux-mtd@lists.infradead.org; Thu, 24 Mar 2016 18:22:19 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBI/UBIFS updates for 4.6
Message-ID: <56F4303D.5060606@nod.at>
Date: Thu, 24 Mar 2016 19:21:49 +0100
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

The following changes since commit 1e75a9f34a5ed5902707fb74b468356c55142b71:

  Merge git://www.linux-watchdog.org/linux-watchdog (2016-03-19 19:35:51 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.6-rc1

for you to fetch changes up to c27cb97218b3e72417ffc5e73dce488844017b39:

  ubifs: Remove unused header (2016-03-20 21:37:46 +0100)

----------------------------------------------------------------
This pull request contains cleanups and a maintainer update
for UBI and UBIFS.

----------------------------------------------------------------
Andreas Gruenbacher (1):
      ubifs: Remove unused header

Joe Perches (2):
      ubifs: Add logging functions for ubifs_msg, ubifs_err and ubifs_warn
      mtd: ubi: Add logging functions ubi_msg, ubi_warn and ubi_err

Richard Weinberger (1):
      MAINTAINERS: Update UBIFS entry

 MAINTAINERS            |  3 ++-
 drivers/mtd/ubi/misc.c | 49 +++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/ubi.h  | 16 ++++++++------
 fs/ubifs/Makefile      |  1 +
 fs/ubifs/misc.c        | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/ubifs.h       | 41 +++++++++++++++---------------------
 fs/ubifs/xattr.c       |  1 -
 7 files changed, 136 insertions(+), 32 deletions(-)
 create mode 100644 fs/ubifs/misc.c
