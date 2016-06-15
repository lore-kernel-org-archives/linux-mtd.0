Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDHZo-0002Qj-2f
 for linux-mtd@lists.infradead.org; Wed, 15 Jun 2016 20:38:17 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBI fixes for 4.7-rc4
Message-ID: <5761BC9D.5090100@nod.at>
Date: Wed, 15 Jun 2016 22:37:49 +0200
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

The following changes since commit db06d759d6cf903aeda8c107fd3abd366dd80200:

  Merge branch 'for-4.7-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/percpu (2016-06-13 19:54:46 -1000)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.7-rc4

for you to fetch changes up to 61edc3f3b51d2d3948029197cfff6fef7d94e939:

  ubi: Don't bypass ->getattr() (2016-06-14 10:51:42 +0200)

----------------------------------------------------------------
This pull request contains fixes for a regression introduced in rc1.

----------------------------------------------------------------
Richard Weinberger (3):
      Revert "mtd: switch ubi_open_volume_path() to vfs_stat()"
      Revert "mtd: switch open_mtd_by_chdev() to use of vfs_stat()"
      ubi: Don't bypass ->getattr()

 drivers/mtd/ubi/build.c | 11 +++++++++--
 drivers/mtd/ubi/kapi.c  |  8 +++++++-
 2 files changed, 16 insertions(+), 3 deletions(-)
