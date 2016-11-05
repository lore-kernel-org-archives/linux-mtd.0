Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2onr-0000jz-Po
 for linux-mtd@lists.infradead.org; Sat, 05 Nov 2016 00:25:48 +0000
Received: by mail-it0-x241.google.com with SMTP id q124so854598itd.1
 for <linux-mtd@lists.infradead.org>; Fri, 04 Nov 2016 17:25:27 -0700 (PDT)
Date: Fri, 4 Nov 2016 17:24:25 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [GIT PULL] MTD updates for 4.9-rc4
Message-ID: <20161105002425.GA10139@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

The following changes since commit 07d9a380680d1c0eb51ef87ff2eab5c994949e69:

  Linux 4.9-rc2 (2016-10-23 17:10:14 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20161104

for you to fetch changes up to 0e2ce9d3fcba5f92dd6c2b27d82690e49d0c0854:

  Merge tag 'nand/fixes-for-4.9-rc3' of github.com:linux-nand/linux (2016-10-28 19:05:25 -0700)

----------------------------------------------------------------
MTD updates for 4.9-rc4:

 * MAINTAINERS updates to reflect some new maintainers/submaintainers -- we
   have some great volunteers who've been developing and reviewing already.
   We're going to try a group maintainership model, so eventually you'll
   probably see pull requests from people besides me.

 * NAND fixes from Boris:
   """
   Three simple fixes:

   - the first one is fixing a non-critical bug in the gpmi driver
   - the second one is fixing a bug in the 'automatic NAND timings
     selection' feature introduced in 4.9-rc1
   - the last one is fixing a false positive uninitialized-var warning
   """

----------------------------------------------------------------
Arnd Bergmann (1):
      mtd: mtk: avoid warning in mtk_ecc_encode

Boris Brezillon (2):
      MAINTAINERS: add more people to the MTD maintainer team
      mtd: nand: Fix data interface configuration logic

Brian Norris (1):
      Merge tag 'nand/fixes-for-4.9-rc3' of github.com:linux-nand/linux

Cyrille Pitchen (1):
      MAINTAINERS: add a maintainer for the SPI NOR subsystem

Fabio Estevam (1):
      mtd: nand: gpmi: disable the clocks on errors

 MAINTAINERS                           | 15 +++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c |  6 ++--
 drivers/mtd/nand/mtk_ecc.c            | 19 ++++++-----
 drivers/mtd/nand/nand_base.c          | 60 ++++++++++++++++++++++++-----------
 include/linux/mtd/nand.h              |  2 +-
 5 files changed, 71 insertions(+), 31 deletions(-)
