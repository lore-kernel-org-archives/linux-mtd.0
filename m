Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6LFk-0004di-0C
 for linux-mtd@lists.infradead.org; Fri, 27 May 2016 17:08:52 +0000
Received: by mail-pa0-x244.google.com with SMTP id fg1so13113547pad.3
 for <linux-mtd@lists.infradead.org>; Fri, 27 May 2016 10:08:31 -0700 (PDT)
Date: Fri, 27 May 2016 10:08:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [GIT PULL] MTD fixes for v4.7-rc1
Message-ID: <20160527170827.GE89390@google.com>
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

The following changes since commit e5366a266a8cd4cd6b0fe66876462cca2e1c6a89:

  mtd: spi-nor: support GigaDevice gd25lq64c (2016-05-10 15:44:18 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20160527

for you to fetch changes up to 507e617440d70bc4269daac1b0ee96671bf2761a:

  Documentation: dt: mtd: drop "soft_bch" from example (2016-05-27 09:56:26 -0700)

----------------------------------------------------------------
MTD fixes for v4.7-rc1

We've already noticed a few flaws in the MTD work for v4.7-rc1:

 * The Atmel folks got ahead of themselves on trying to support their latest
   hardware and were working off incorrect documentation. Fix up the NAND
   driver to get this correct.

 * Fix up device tree example documentation to use the latest recommendations
   for describing NAND ECC algorithms.

----------------------------------------------------------------
Baruch Siach (1):
      Documentation: dt: mtd: drop "soft_bch" from example

Wenyou Yang (1):
      Revert "mtd: atmel_nand: Support variable RB_EDGE interrupts"

 .../devicetree/bindings/mtd/atmel-nand.txt         |  2 +-
 Documentation/devicetree/bindings/mtd/nand.txt     |  3 +-
 drivers/mtd/nand/atmel_nand.c                      | 35 +++++-----------------
 drivers/mtd/nand/atmel_nand_nfc.h                  |  3 +-
 4 files changed, 12 insertions(+), 31 deletions(-)
