Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFztJ-0005TK-Bl
 for linux-mtd@lists.infradead.org; Thu, 23 Jun 2016 08:21:39 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBI/UBIFS fixes for 4.7-rc5
Message-ID: <576B9BF9.8000506@nod.at>
Date: Thu, 23 Jun 2016 10:21:13 +0200
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

The following changes since commit c0a1ecb9f4e208f4b75d88fa9669748e3fd705ab:

  gpio: make library immune to error pointers (2016-06-23 00:29:31 +0200)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.7-rc5

for you to fetch changes up to 4ac1c17b2044a1b4b2fbed74451947e905fc2992:

  UBIFS: Implement ->migratepage() (2016-06-23 00:29:53 +0200)

----------------------------------------------------------------
This pull requests contains fixes for two critical bugs in UBI and UBIFS:
1. Fixes the possibility of losing data upon a power cut when UBI tries
   to recover from a write error.
2. Fixes page migration on UBIFS. It turned out that the default page
   migration function is not suitable for UBIFS.

----------------------------------------------------------------
Kirill A. Shutemov (1):
      UBIFS: Implement ->migratepage()

Richard Weinberger (2):
      ubi: Make recover_peb power cut aware
      mm: Export migrate_page_move_mapping and migrate_page_copy

 drivers/mtd/ubi/eba.c | 22 +++++++++++++++-------
 fs/ubifs/file.c       | 24 ++++++++++++++++++++++++
 mm/migrate.c          |  2 ++
 3 files changed, 41 insertions(+), 7 deletions(-)
