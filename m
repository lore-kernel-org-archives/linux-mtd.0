Received: from mail.sigma-star.at ([95.130.255.111])
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eHscf-0004wq-CC
 for linux-mtd@lists.infradead.org; Thu, 23 Nov 2017 14:37:03 +0000
From: Richard Weinberger <richard@nod.at>
To: Linus <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] UBI/UBIFS updates for 4.15-rc1
Date: Thu, 23 Nov 2017 15:37:01 +0100
Message-ID: <2342271.CoAPh78JdH@blindfold>
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

The following changes since commit bebc6082da0a9f5d47a1ea2edc099bf671058bd4:

  Linux 4.14 (2017-11-12 10:46:13 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.15-rc1

for you to fetch changes up to 15e5178339b9a95bc60c6bcfcae1b8f48afedd23:

  ubi: fastmap: Clean up the initialization of pointer p (2017-11-19 21:15:14 
+0100)

----------------------------------------------------------------
This pull request contains updates for both UBI and UBIFS:
- Minor bug fixes

----------------------------------------------------------------
Clay McClure (1):
      ubi: Fix race condition between ubi volume creation and udev

Colin Ian King (1):
      ubi: fastmap: Clean up the initialization of pointer p

Geert Uytterhoeven (1):
      ubifs: Fix uninitialized variable in search_dh_cookie()

Jeff Westfahl (1):
      mtd: ubi: Use 'max_bad_blocks' to compute bad_peb_limit if available

Pan Bian (1):
      ubi: fastmap: Use kmem_cache_free to deallocate memory

 drivers/mtd/ubi/build.c   | 13 +++++++++++--
 drivers/mtd/ubi/fastmap.c |  5 ++---
 drivers/mtd/ubi/vmt.c     | 15 ++++++++++-----
 fs/ubifs/tnc.c            | 21 +++++++--------------
 4 files changed, 30 insertions(+), 24 deletions(-)
