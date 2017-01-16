Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTFjG-0007Nl-RZ
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 22:26:20 +0000
Received: by mail-pf0-x242.google.com with SMTP id f144so14789116pfa.2
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 14:25:57 -0800 (PST)
Date: Mon, 16 Jan 2017 14:25:54 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] MTD fixes for 4.10
Message-ID: <20170116222554.GA30118@brian-ubuntu>
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

I've been holding onto this one a little too long.

The following changes since commit 0c744ea4f77d72b3dcebb7a8f2684633ec79be88:

  Linux 4.10-rc2 (2017-01-01 14:31:53 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20170116

for you to fetch changes up to 5bdee5496978c6738dd90869b54c0f30c0344ccf:

  Merge tag 'nand/fixes-for-4.10-rc3' of github.com:linux-nand/linux (2017-01-05 09:33:26 -0800)

----------------------------------------------------------------
MTD fixes for 4.10

Just NAND updates from Boris:
"   - Forbid compiling xway NAND controller driver as a module
    - Fix tango NAND DT binding and make sure the controller is in a clean
      state at probe time
    - Add dependency on HAS_IOMEM to the oxnas NAND driver
    - Fix irq number validity check in the lpc32xx driver
"

----------------------------------------------------------------
Brian Norris (1):
      Merge tag 'nand/fixes-for-4.10-rc3' of github.com:linux-nand/linux

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
