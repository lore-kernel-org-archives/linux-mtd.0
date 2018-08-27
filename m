Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuBXu-0007uV-Hl
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2018 07:02:44 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2] mtd: rawnand: denali: do not pass zero maxchips to
 nand_scan()
Date: Mon, 27 Aug 2018 16:01:41 +0900
Message-Id: <1535353301-1727-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 49aa76b16676 ("mtd: rawnand: do not execute nand_scan_ident()
if maxchips is zero") gave a new meaning for calling nand_scan_ident()
with maxchips=0.

It is a special usage for some drivers such as docg4, but actually
the Denali driver may pass maxchips=0 to nand_scan() when the driver
is enabled but no NAND chip is found on the board for some reasons.

If nand_scan_with_ids() is called with maxchips=0, nand_scan_ident()
is skipped, then nand_set_defaults() is skipped as well.  Thus, the
driver must set chip->controller beforehand.  Otherwise, nand_attach()
causes NULL pointer dereference.

In fact, the Denali controller knows the number of connected chips
before calling nand_scan_ident(); if DEVICE_RESET fails, there is no
chip in that chip select.  Then, denali_reset_banks() sets the maxchips
to the number of detected chips.  If no chip is found, maxchips is zero.

In this case, there is no point for calling nand_scan() because we know
it will fail for sure.  Let's make the probe function fail immediately.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Return -ENODEV immediately if no chip was found on the board
    for some reasons.
    This is the smallest, and safest change for the fixes branch.
    (I will investigate later if further cleanups are possible or not.)

 drivers/mtd/nand/raw/denali.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index ca18612..67b2065 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1338,6 +1338,11 @@ int denali_init(struct denali_nand_info *denali)
 
 	denali_enable_irq(denali);
 	denali_reset_banks(denali);
+	if (!denali->max_banks) {
+		/* Error out earlier if no chip is found for some reasons. */
+		ret = -ENODEV;
+		goto disable_irq;
+	}
 
 	denali->active_bank = DENALI_INVALID_BANK;
 
-- 
2.7.4
