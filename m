Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dcDQn-0002je-WB
 for linux-mtd@lists.infradead.org; Mon, 31 Jul 2017 16:20:35 +0000
Date: Mon, 31 Jul 2017 18:20:07 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse
 <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: [PULL ] mtd: nand: Fixes for 4.13-rc4
Message-ID: <20170731182007.26aac243@bbrezillon>
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

Here is a PR containing a few fixes for 4.13. Some of them are fixing
long standing bugs which no one ever complained about (like the small
page OOB layout fix) or theoretical ones (like the div-by-zero in the
sunxi driver), but others are fixing real bugs introduced in 4.13
(all atmel related bugs have been discovered recently and should
ideally be fixed before 4.13 is released).

As usual, let me know if there's something wrong in this PR. If not, can
you do your best to get these sent to Linus before the end of the week?

Thanks,

Boris

The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.infradead.org/l2-mtd.git tags/nand/fixes-for-4.13-rc4

for you to fetch changes up to 5c2522533f4c82a116f92154927eccd38cb5c418:

  mtd: nand: atmel: Fix EDO mode check (2017-07-31 15:26:55 +0200)

----------------------------------------------------------------
This PR contains both core and drivers fixes for 4.13.

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
