Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eQvlc-0005SR-9Z
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 13:47:47 +0000
From: Richard Weinberger <richard@nod.at>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr
Subject: [GIT PULL] MTD fixes for 4.15-rc4
Date: Mon, 18 Dec 2017 14:48:02 +0100
Message-ID: <6764587.y1iLJdv0sS@blindfold>
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

The following changes since commit 50c4c4e268a2d7a3e58ebb698ac74da0de40ae36:

  Linux 4.15-rc3 (2017-12-10 17:56:26 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20171218

for you to fetch changes up to d82c3682168431d29ba1741d0cd5ef45c68bf8e0:

  mtd: Fix mtd_check_oob_ops() (2017-12-18 09:16:35 +0100)

----------------------------------------------------------------
This pull request contains the following regression fixes:

* Fixed bitflip handling in brcmnand and gpmi nand drivers
* Reverted a bad device tree binding for spi-nor
* Fixed a copy&paste error in gpio-nand driver
* Fixed a too strict length check in mtd core

----------------------------------------------------------------
Albert Hsieh (1):
      mtd: nand: brcmnand: Zero bitflip is not an error

Christophe Leroy (1):
      mtd: nand: gpio: Fix ALE gpio configuration

Cyrille Pitchen (1):
      Revert "dt-bindings: mtd: add sst25wf040b and en25s64 to sip-nor list"

Miquel Raynal (1):
      mtd: Fix mtd_check_oob_ops()

Richard Weinberger (1):
      Merge branch 'spi-nor/fixes' of ssh://bombadil/srv/git/linux-mtd into 
mtd/fixes-for-4.15-rc4

Sascha Hauer (1):
      mtd: nand: gpmi: Fix failure when a erased page has a bitflip at BBM

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 --
 drivers/mtd/mtdcore.c                                   | 2 +-
 drivers/mtd/nand/brcmnand/brcmnand.c                    | 2 +-
 drivers/mtd/nand/gpio.c                                 | 6 +++---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c                  | 6 +++---
 5 files changed, 8 insertions(+), 10 deletions(-)
