Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fByFh-0000gn-Kw
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2018 07:57:11 +0000
Date: Fri, 27 Apr 2018 09:56:45 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Marek Vasut <marex@denx.de>, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, Brian Norris
 <computersforpeace@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] mtd: Fixes for 4.17-rc3
Message-ID: <20180427095645.5e583c24@bbrezillon>
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

Here is the MTD fixes PR for 4.17-rc3.

Regards,

Boris

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-4.17-rc3

for you to fetch changes up to f6997bec6af43396ff530caee79e178d32774a49:

  mtd: rawnand: marvell: fix the chip-select DT parsing logic (2018-04-26 19:06:42 +0200)

----------------------------------------------------------------
* Fix nanddev_mtd_erase() function to match the changes done in
  e7bfb3fdbde3 ("mtd: Stop updating erase_info->state and calling
  mtd_erase_callback()")
* Fix a memory leak in the Tango NAND controller driver
* Fix read/write to a suspended erase block in the CFI driver
* Fix the DT parsing logic in the Marvell NAND controller driver

----------------------------------------------------------------
Boris Brezillon (1):
      mtd: nand: Fix nanddev_mtd_erase()

Joakim Tjernlund (3):
      mtd: cfi: cmdset_0001: Do not allow read/write to suspend erase block.
      mtd: cfi: cmdset_0001: Workaround Micron Erase suspend bug.
      mtd: cfi: cmdset_0002: Do not allow read/write to suspend erase block.

Marc Gonzalez (1):
      mtd: rawnand: tango: Fix struct clk memory leak

Miquel Raynal (1):
      mtd: rawnand: marvell: fix the chip-select DT parsing logic

Thor Thayer (1):
      mtd: spi-nor: cadence-quadspi: Fix page fault kernel panic

 drivers/mtd/chips/cfi_cmdset_0001.c   | 33 ++++++++++++++++++++++++++++-----
 drivers/mtd/chips/cfi_cmdset_0002.c   |  9 ++++++---
 drivers/mtd/nand/core.c               |  3 ---
 drivers/mtd/nand/raw/marvell_nand.c   | 25 ++++++++-----------------
 drivers/mtd/nand/raw/tango_nand.c     |  2 +-
 drivers/mtd/spi-nor/cadence-quadspi.c | 19 +++++++++++++++++--
 include/linux/mtd/flashchip.h         |  1 +
 7 files changed, 61 insertions(+), 31 deletions(-)
