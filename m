From: Roland Stigge <stigge@antcom.de>
To: dedekind1@gmail.com, linux-mtd@lists.infradead.org, aletes.xgr@gmail.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org,
 kevin.wells@nxp.com, srinivas.bakki@nxp.com,
 linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com,
 lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com,
 linux@arm.linux.org.uk
Subject: [PATCH 3/4] mtd: lpc32xx_slc: Use of_get_named_gpio()
Date: Wed, 27 Jun 2012 17:51:14 +0200
Message-Id: <1340812275-1197-3-git-send-email-stigge@antcom.de>
In-Reply-To: <1340812275-1197-1-git-send-email-stigge@antcom.de>
References: <1340812275-1197-1-git-send-email-stigge@antcom.de>
Cc: Roland Stigge <stigge@antcom.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch makes the lpc32xx_slc driver use of_get_named_gpio() instead of
of_get_named_gpio_flags() whose flags are discarded anyway.

Signed-off-by: Roland Stigge <stigge@antcom.de>
Acked-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
---
 drivers/mtd/nand/lpc32xx_slc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index ab72aca..4e8db3a 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -770,7 +770,7 @@ static struct lpc32xx_nand_cfg_slc *lpc32xx_parse_dt(struct device *dev)
 	}
 
 	pdata->use_bbt = of_get_nand_on_flash_bbt(np);
-	pdata->wp_gpio = of_get_named_gpio_flags(np, "gpios", 0, NULL);
+	pdata->wp_gpio = of_get_named_gpio(np, "gpios", 0);
 
 	return pdata;
 }
-- 
1.7.10.4
