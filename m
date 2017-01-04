Received: from mail.free-electrons.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOryz-0001QR-FG
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2017 20:16:26 +0000
Date: Wed, 4 Jan 2017 21:15:57 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
 <richard@nod.at>, Marek Vasut <marex@denx.de>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: [PULL] mtd: nand: Fixes for 4.10-rc3
Message-ID: <20170104211557.434b07af@bbrezillon>
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

Here is a fixes PR for 4.10-rc3 (or -rc4 if it's already too late for
-rc3).

The xway and oxnas fixes are fixing bugs introduced before 4.10-rc1. I
know fixes PRs are supposed to contain only fixes for bugs introduced by
code merged during the merge window, but I thought it would be good to
have them applied in this release.

Let me know if this is a problem, and I'll move them to my nand/next and
resend of PR.

Regards,

Boris

The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  git@github.com:linux-nand/linux.git tags/nand/fixes-for-4.10-rc3

for you to fetch changes up to cf9e1672a66c49ed8903c01b4c380a2f2dc91b40:

  mtd: nand: lpc32xx: fix invalid error handling of a requested irq (2017-01-04 20:50:18 +0100)

----------------------------------------------------------------
Fixes for 4.10-rc3
- Forbid compiling xway NAND controller driver as a module
- Fix tango NAND DT binding and make sure the controller is in a clean
  state at probe time
- Add dependency on HAS_IOMEM to the oxnas NAND driver
- Fix irq number validity check in the lpc32xx driver

----------------------------------------------------------------
Hauke Mehrtens (2):
      mtd: nand: xway: disable module support
      mtd: nand: xway: fix build because of module functions

Marc Gonzalez (2):
      mtd: nand: tango: Update DT binding description
      mtd: nand: tango: Reset pbus to raw mode in probe

Randy Dunlap (1):
      mtd: nand: oxnas_nand: fix build errors on arch/um, require HAS_IOMEM

Vladimir Zapolskiy (1):
      mtd: nand: lpc32xx: fix invalid error handling of a requested irq

 Documentation/devicetree/bindings/mtd/tango-nand.txt | 6 +++---
 drivers/mtd/nand/Kconfig                             | 3 ++-
 drivers/mtd/nand/lpc32xx_mlc.c                       | 2 +-
 drivers/mtd/nand/tango_nand.c                        | 4 +++-
 drivers/mtd/nand/xway_nand.c                         | 5 +----
 5 files changed, 10 insertions(+), 10 deletions(-)
