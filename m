Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fH2xc-0006Bc-R7
 for linux-mtd@lists.infradead.org; Fri, 11 May 2018 07:59:30 +0000
Date: Fri, 11 May 2018 09:59:13 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Vasut
 <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [GIT PULL] mtd: Fixes for 4.17-rc5
Message-ID: <20180511095913.27878f1f@bbrezillon>
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

Here is the MTD fixes PR for 4.17-rc5.

Regards,

Boris

The following changes since commit 6da6c0db5316275015e8cc2959f12a17584aeb64:

  Linux v4.17-rc3 (2018-04-29 14:17:42 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-4.17-rc5

for you to fetch changes up to 3057fcef385348fe85173f1b0c824d89f1176f72:

  mtd: rawnand: Make sure we wait tWB before polling the STATUS reg (2018-05-10 08:40:39 +0200)

----------------------------------------------------------------
NAND fixes:
- Make nand_soft_waitrdy() wait tWB before polling the status REG
- Fix BCH write in the the Marvell NAND controller driver
- Fix wrong picosec to msec conversion in the Marvell NAND controller
  driver
- Fix DMA handling in the TI OneNAND controllre driver

----------------------------------------------------------------
Boris Brezillon (1):
      mtd: rawnand: Make sure we wait tWB before polling the STATUS reg

Chris Packham (1):
      mtd: rawnand: marvell: pass ms delay to wait_op

Ladislav Michl (1):
      mtd: onenand: omap2: Disable DMA for HIGHMEM buffers

Miquel Raynal (1):
      mtd: rawnand: marvell: fix command xtype in BCH write hook

 drivers/mtd/nand/onenand/omap2.c    | 105 ++++++++++++++++++++++---------------------------------------
 drivers/mtd/nand/raw/marvell_nand.c |  12 +++++--
 drivers/mtd/nand/raw/nand_base.c    |   5 +++
 3 files changed, 52 insertions(+), 70 deletions(-)
