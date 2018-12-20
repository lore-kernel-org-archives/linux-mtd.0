Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga4nj-0003yw-7j
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 20:20:12 +0000
From: Richard Weinberger <richard@nod.at>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [GIT PULL] UBI/UBIFS fixes for 4.20-rc7
Date: Thu, 20 Dec 2018 21:19:58 +0100
Message-ID: <2752856.A3Cxyq1uY3@blindfold>
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

The following changes since commit 40e020c129cfc991e8ab4736d2665351ffd1468d:

  Linux 4.20-rc6 (2018-12-09 15:31:00 -0800)

are available in the Git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.20-rc7

for you to fetch changes up to e58725d51fa8da9133f3f1c54170aa2e43056b91:

  ubifs: Handle re-linking of inodes correctly while recovery (2018-12-13 22:18:24 +0100)

----------------------------------------------------------------
This pull request contains fixes for both UBI and UBIFS:

- Kconfig dependency fixes for our new auth feature
- Fix for selecting the right compressor when creating a fs
- Bugfix for a bug in UBIFS's O_TMPFILE implementation
- Refcounting fixes for UBI

----------------------------------------------------------------
Arnd Bergmann (2):
      ubifs: replay: Fix high stack usage
      ubifs: auth: Add CONFIG_KEYS dependency

Gabor Juhos (1):
      ubifs: Fix default compression selection in ubifs

Garry McNulty (1):
      ubifs: Fix memory leak on error condition

Geert Uytterhoeven (1):
      ubifs: CONFIG_UBIFS_FS_AUTHENTICATION should depend on UBIFS_FS

Pan Bian (2):
      ubi: Put MTD device after it is not used
      ubi: Do not drop UBI device reference before using

Richard Weinberger (1):
      ubifs: Handle re-linking of inodes correctly while recovery

 drivers/mtd/ubi/build.c |  2 +-
 drivers/mtd/ubi/kapi.c  |  2 +-
 fs/ubifs/Kconfig        | 16 +++++------
 fs/ubifs/lpt.c          | 12 ++++-----
 fs/ubifs/replay.c       | 72 +++++++++++++++++++++++++++++++++++++++++--------
 fs/ubifs/sb.c           | 13 ++++++++-
 6 files changed, 89 insertions(+), 28 deletions(-)
