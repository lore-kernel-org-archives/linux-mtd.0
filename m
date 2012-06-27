From: Roland Stigge <stigge@antcom.de>
To: dedekind1@gmail.com, linux-mtd@lists.infradead.org, aletes.xgr@gmail.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org,
 kevin.wells@nxp.com, srinivas.bakki@nxp.com,
 linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com,
 lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com,
 linux@arm.linux.org.uk
Subject: [PATCH 4/4] mtd: lpc32xx_slc: Make probe() return -EPROBE_DEFER if
 necessary
Date: Wed, 27 Jun 2012 17:51:15 +0200
Message-Id: <1340812275-1197-4-git-send-email-stigge@antcom.de>
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

Via of_get_named_gpio(), wp_gpio can become -EPROBE_DEFER which now makes
probe() return -EPROBE_DEFER as well to wait until the gpio controller is
probed before trying to probe lpc32xx_slc again.

Signed-off-by: Roland Stigge <stigge@antcom.de>
Acked-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
---
 drivers/mtd/nand/lpc32xx_slc.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index 4e8db3a..142a91d 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -821,6 +821,8 @@ static int __devinit lpc32xx_nand_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Missing platform data\n");
 		return -ENOENT;
 	}
+	if (host->ncfg->wp_gpio == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
 	if (gpio_is_valid(host->ncfg->wp_gpio) &&
 			gpio_request(host->ncfg->wp_gpio, "NAND WP")) {
 		dev_err(&pdev->dev, "GPIO not available\n");
-- 
1.7.10.4
