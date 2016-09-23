Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bnPFX-0000Fv-Kk
 for linux-mtd@lists.infradead.org; Fri, 23 Sep 2016 12:06:41 +0000
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] MTD NAND fixes for v4.8-rc8
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <91984e2b-9bc9-0938-f4af-8decc00b7e63@nod.at>
Date: Fri, 23 Sep 2016 14:05:20 +0200
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

This pull request contains fixes for bugs which got introduced in -rc1.
You may wonder why I'm sending this pull request. Usually Brian takes NAND patches
from Boris, but since Brian is very busy these days with other stuff and Boris is
not yet member of the kernel.org web of trust I stepped in.

Boris will be in Berlin at ELCE, I'll sign his key and hopefully other
Kernel developers too such that he can issue his own pull requests soon.

Brian, if there is anything wrong with this pull request, please let us know.
We're not trying to bypass you. All we want is getting these fixes upstream
before the merge window opens and new bugs emerge.

The following changes since commit 3be7988674ab33565700a37b210f502563d932e6:

  Linux 4.8-rc7 (2016-09-18 17:27:41 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/nand-fixes-for-4.8-rc8

for you to fetch changes up to 38178e7b88dcbe1ab384f27a7370074e774dda81:

  mtd: nand: mxc: fix obiwan error in mxc_nand_v[12]_ooblayout_free() functions (2016-09-19 11:57:12 +0200)

----------------------------------------------------------------
NAND Fixes for 4.8-rc8:
- Fix a wrong OOB layout definition in the mxc driver
- Fix incorrect ECC handling in the mtk driver

----------------------------------------------------------------
Lothar Waßmann (1):
      mtd: nand: mxc: fix obiwan error in mxc_nand_v[12]_ooblayout_free() functions

RogerCC Lin (2):
      mtd: nand: fix generating over-boundary ECC data when writing
      mtd: nand: fix chances to create incomplete ECC data when writing

 drivers/mtd/nand/mtk_ecc.c  | 12 ++++++++----
 drivers/mtd/nand/mtk_nand.c |  7 +++++--
 drivers/mtd/nand/mxc_nand.c |  2 +-
 3 files changed, 14 insertions(+), 7 deletions(-)
