Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1erlpx-00063j-WC
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2018 14:40:17 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Han Xu <han.xu@nxp.com>
Cc: linux-mtd@lists.infradead.org, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH RESEND v2 0/2] Migrate the GPMI driver to use NAND core timings
Date: Fri,  2 Mar 2018 15:38:38 +0100
Message-Id: <20180302143840.3157-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

The GPMI NAND controller driver has its own timings logic while the core
also has its own that should be preferred to avoid code duplication.
This series migrates the driver to use the ->setup_data_interface()
hook, preferred way to handle timings negotiation between controllers
and NAND chips.

This driver has stronger requirements in terms of respect of the ONFI
specification than the core has, and last time I sent changes in the
GPMI timings section, this was raised to me as a no go. Since then, I
sent a series improving timings handling in the core, see [1] and [2],
so this kind of change that moves the shared logic in the core can be
applied safely.

[1] http://lists.infradead.org/pipermail/linux-mtd/2018-March/079456.html
[2] http://lists.infradead.org/pipermail/linux-mtd/2018-March/079460.html

Thank you,
Miquèl


Changes since v2:
=================
  - Fix ->select_chip(): chipnr == 0 is valid.
  - Fix ->select_chip(): hw.must_apply_timings must be reset after a
    ->setup_data_interface().

Changes since v1:
=================
  - Removed inline on non-static gpmi_enable/disable_clk() functions.
  - Rewording some lines of the patch.
  - Use tREA_max value provided by the core instead of a locally defined
    value.
  - Check ->conf in gpmi_setup_data_interface() instead of
    ->onfi_timing_mode_default (use tRC).
  - Removed useless copy of hw.timing_mode.
  - Moved gpmi_nfc_apply_timings() to ->select_chip().
  - Canceled the useless move of one structure.


Miquel Raynal (2):
  mtd: rawnand: gpmi: support ->setup_data_interface()
  mtd: rawnand: gpmi: use core timings instead of an empirical
    derivation

 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  | 811 +++++------------------------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |  82 ++-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h | 131 +----
 drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h |   5 +
 4 files changed, 185 insertions(+), 844 deletions(-)

-- 
2.14.1
