Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cb1mj-00085q-PN
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2017 09:10:07 +0000
Date: Tue, 7 Feb 2017 10:09:34 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: [PULL] mtd: nand: Changes for 4.11
Message-ID: <20170207100934.74c85386@bbrezillon>
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

Hi Brian,

Here is a rather small PR for 4.11. No fancy things in this release, and
not even a single new driver (which is completely my fault since I failed
to review the Arasan driver in time :-().

As usual, let me know if I did something wrong.

Marek, Richard, Cyrille, don't hesitate to point any patches I may have
missed.

Thanks,

Boris

The following changes since commit 566cf877a1fcb6d6dc0126b076aad062054c2637:

  Linux 4.10-rc6 (2017-01-29 14:25:17 -0800)

are available in the git repository at:

  git@github.com:linux-nand/linux.git tags/nand/for-4.11

for you to fetch changes up to a4077ce5871304f8a78f80b74b18b6052a410f1a:

  mtd: nand: Add Winbond manufacturer id (2017-02-06 11:42:43 +0100)

----------------------------------------------------------------
This pull request contains minor fixes/improvements on existing drivers:
- sunxi: avoid busy-waiting for NAND events
- ifc: fix ECC handling on IFC v1.0
- OX820: add explicit dependency on ARCH_OXNAS in Kconfig
- core: add a new manufacture ID and fix a kernel-doc warning
- fsmc: kill pdata support
- lpc32xx_slc: remove unneeded NULL check

----------------------------------------------------------------
Andrey Jr. Melnikov (1):
      mtd: nand: Add Winbond manufacturer id

Boris Brezillon (3):
      mtd: nand: sunxi: Fix the non-polling case in sunxi_nfc_wait_events()
      mtd: nand: sunxi: Stop using polling mode when waiting for long operations
      mtd: nand: sunxi: Improve sunxi_nfc_cmd_ctrl()

Fabio Estevam (1):
      mtd: nand: lpc32xx_slc: Remove unneeded NULL check on 'rc'

Jean Delvare (1):
      mtd: nand: Add OX820 NAND hardware dependency

Linus Walleij (1):
      mtd: nand: fsmc: remove stale non-DT probe path

Mark Marshall (1):
      mtd: nand: ifc: Fix location of eccstat registers for IFC V1.0

Randy Dunlap (1):
      mtd: nand: fix nand.h kernel-doc warnings

Wei Yongjun (1):
      mtd: nand: mediatek: remove redundant dev_err call in mtk_nfc_probe()

 drivers/mtd/nand/Kconfig        |   2 +
 drivers/mtd/nand/fsl_ifc_nand.c |   8 +++-
 drivers/mtd/nand/fsmc_nand.c    | 153 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------
 drivers/mtd/nand/lpc32xx_slc.c  |   9 +----
 drivers/mtd/nand/mtk_nand.c     |   1 -
 drivers/mtd/nand/nand_ids.c     |   1 +
 drivers/mtd/nand/sunxi_nand.c   |  36 +++++++++++++-----
 include/linux/fsl_ifc.h         |   8 +++-
 include/linux/mtd/fsmc.h        | 156 -----------------------------------------------------------------------------
 include/linux/mtd/nand.h        |   4 +-
 10 files changed, 179 insertions(+), 199 deletions(-)
 delete mode 100644 include/linux/mtd/fsmc.h
