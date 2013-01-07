From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mtd: mxc_nand: Make use of supplied pinctrl data
Date: Mon,  7 Jan 2013 15:28:05 +0100
Message-Id: <1357568885-15507-1-git-send-email-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Marek Vasut <marex@denx.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The MXC NAND driver doesn't consider the pinctrl data supplied via DT, which
will result in NAND pins not being properly configured.

Make the driver use pinctrl, but to prevent breakage on various boards, do not
fail if the pinctrl data are not available, only print a warning message.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: Lothar Waßmann <LW@KARO-electronics.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 45204e4..ed805fb 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -34,6 +34,7 @@
 #include <linux/completion.h>
 #include <linux/of_device.h>
 #include <linux/of_mtd.h>
+#include <linux/pinctrl/consumer.h>
 
 #include <asm/mach/flash.h>
 #include <linux/platform_data/mtd-mxc_nand.h>
@@ -1385,6 +1386,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	struct mxc_nand_host *host;
 	struct resource *res;
+	struct pinctrl *pinctrl;
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
@@ -1449,6 +1451,10 @@ static int mxcnd_probe(struct platform_device *pdev)
 	if (!res)
 		return -ENODEV;
 
+	pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
+	if (IS_ERR(pinctrl))
+		dev_warn(&pdev->dev, "No PINCTRL data for the NAND driver!\n");
+
 	host->base = devm_request_and_ioremap(&pdev->dev, res);
 	if (!host->base)
 		return -ENOMEM;
-- 
1.7.10.4
