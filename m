Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1deqM5-0001kf-HA
 for linux-mtd@lists.infradead.org; Mon, 07 Aug 2017 22:18:35 +0000
Received: by mail-pf0-x243.google.com with SMTP id j68so1568942pfc.2
 for <linux-mtd@lists.infradead.org>; Mon, 07 Aug 2017 15:18:12 -0700 (PDT)
Date: Mon, 7 Aug 2017 15:18:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] MTD fixes for 4.13-rc5
Message-ID: <20170807221809.GA84674@google.com>
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

I missed getting these out for rc4, but here are some MTD fixes.

The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20170807

for you to fetch changes up to 33983675fbd5b2447430c3dd4c205e879576b475:

  Merge tag 'nand/fixes-for-4.13-rc4' of git://git.infradead.org/l2-mtd into MTD (2017-08-04 18:42:37 -0700)

----------------------------------------------------------------
MTD fixes for 4.13-rc5:

Just NAND fixes (in both the core handling, and a few drivers). Notes stolen
from Boris:

Core fixes:
- Fix data interface setup for ONFI NANDs that do not support the SET
  FEATURES command
- Fix a kernel doc header
- Fix potential integer overflow when retrieving timing information
  from the parameter page
- Fix wrong OOB layout for small page NANDs

Driver fixes:
- Fix potential division-by-zero bug
- Fix backward compat with old atmel-nand DT bindings
- Fix ->setup_data_interface() in the atmel NAND driver

----------------------------------------------------------------
Boris Brezillon (4):
      mtd: nand: atmel: Fix DT backward compatibility in pmecc.c
      mtd: nand: Fix timing setup for NANDs that do not support SET FEATURES
      mtd: nand: Declare tBERS, tR and tPROG as u64 to avoid integer overflow
      mtd: nand: atmel: Fix EDO mode check

Brian Norris (1):
      Merge tag 'nand/fixes-for-4.13-rc4' of git://git.infradead.org/l2-mtd into MTD

Bryan O'Donoghue (1):
      mtd: nand: sunxi: fix potential divide-by-zero error

Jonathan Corbet (1):
      mtd: nand: Fix a docs build warning

Miquel Raynal (1):
      nand: fix wrong default oob layout for small pages using soft ecc

 drivers/mtd/nand/atmel/nand-controller.c |  2 +-
 drivers/mtd/nand/atmel/pmecc.c           | 21 ++++++---------------
 drivers/mtd/nand/nand_base.c             | 13 ++++++++++---
 drivers/mtd/nand/nand_timings.c          |  6 +++---
 drivers/mtd/nand/sunxi_nand.c            |  4 ++++
 include/linux/mtd/nand.h                 |  6 +++---
 6 files changed, 27 insertions(+), 25 deletions(-)
