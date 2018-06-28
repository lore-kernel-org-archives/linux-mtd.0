Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYRe2-00079p-OH
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2018 07:47:12 +0000
Date: Thu, 28 Jun 2018 09:46:49 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Marek Vasut
 <marex@denx.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [GIT PULL] mtd: Fixes for 4.18-rc3
Message-ID: <20180628094649.2cf04f1f@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Linus,

Here is the MTD fixes PR for 4.18-rc3.

Regards,

Boris

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-4.18-rc3

for you to fetch changes up to 3f6e6986045d47f87bd982910821b7ab9758487e:

  mtd: rawnand: denali_dt: set clk_x_rate to 200 MHz unconditionally (2018-06-22 18:47:56 +0200)

----------------------------------------------------------------
NAND fixes:
- Add a quirk for a bunch of broken Macronix chips
- Fix nand_block_bad() when chip->ecc.read_oob() returns a positive
  value encoding the number of bitflips
- Fix OOB handling in the MXC driver fo V2.1 controllers
- Flag the ONFI_FEATURE_ON_DIE_ECC as supported in the Micron driver
- Hardcode clk rate in the denali_dt driver to address a bad DT
  representation (the proper fix will be queued for 4.19)

SPI NOR fixes:
- Add an ULL constant to some ID definitions so that the ID is not
  truncated on 32-bit platforms

MTD fixes:
- Fix the sector unlocking logic in the CFI driver

----------------------------------------------------------------
Abhishek Sahu (1):
      mtd: rawnand: fix return value check for bad block status

Chris Packham (1):
      mtd: rawnand: micron: add ONFI_FEATURE_ON_DIE_ECC to supported features

Geert Uytterhoeven (1):
      mtd: dataflash: Use ULL suffix for 64-bit constants

Joakim Tjernlund (4):
      mtd: cfi_cmdset_0002: Use right chip in do_ppb_xxlock()
      mtd: cfi_cmdset_0002: fix SEGV unlocking multiple chips
      mtd: cfi_cmdset_0002: Fix unlocking requests crossing a chip boudary
      mtd: cfi_cmdset_0002: Avoid walking all chips when unlocking.

Martin Kaiser (1):
      mtd: rawnand: mxc: set spare area size register explicitly

Masahiro Yamada (1):
      mtd: rawnand: denali_dt: set clk_x_rate to 200 MHz unconditionally

Mason Yang (1):
      mtd: rawnand: All AC chips have a broken GET_FEATURES(TIMINGS).

 drivers/mtd/chips/cfi_cmdset_0002.c  | 19 +++++++++++--------
 drivers/mtd/devices/mtd_dataflash.c  |  4 ++--
 drivers/mtd/nand/raw/denali_dt.c     |  6 +++++-
 drivers/mtd/nand/raw/mxc_nand.c      |  5 ++++-
 drivers/mtd/nand/raw/nand_base.c     |  2 +-
 drivers/mtd/nand/raw/nand_macronix.c | 48 ++++++++++++++++++++++++++++++++++++------------
 drivers/mtd/nand/raw/nand_micron.c   |  2 ++
 7 files changed, 61 insertions(+), 25 deletions(-)
