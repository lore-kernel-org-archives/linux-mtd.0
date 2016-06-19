From: Icenowy Zheng <icenowy@aosc.xyz>
To: maxime.ripard@free-electrons.com, wens@csie.org,
 boris.brezillon@free-electrons.com
Cc: robh+dt@kernel.org, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH v4 2/2] mtd: nand: sunxi: add reset line support
Date: Sun, 19 Jun 2016 23:40:35 +0800
Message-Id: <20160619154035.45658-2-icenowy@aosc.xyz>
In-Reply-To: <20160619154035.45658-1-icenowy@aosc.xyz>
References: <20160619154035.45658-1-icenowy@aosc.xyz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND controller on some sun8i chips needs its reset line to be deasserted
before they can enter working state. This commit added the reset line process
to the driver.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
Changes in v2:
  - Corrected the error checking code of reset line.

Changes in v3:
  - Corrected a more serious error brought in the "fix" of v2.

Changes in v4:
  - Removed unneeded code block after "else".

 drivers/mtd/nand/sunxi_nand.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index a83a690..b37075b 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -39,6 +39,7 @@
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/reset.h>
 
 #define NFC_REG_CTL		0x0000
 #define NFC_REG_ST		0x0004
@@ -269,6 +270,7 @@ struct sunxi_nfc {
 	void __iomem *regs;
 	struct clk *ahb_clk;
 	struct clk *mod_clk;
+	struct reset_control *reset;
 	unsigned long assigned_cs;
 	unsigned long clk_rate;
 	struct list_head chips;
@@ -1871,6 +1873,19 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_ahb_clk_unprepare;
 
+	nfc->reset = devm_reset_control_get_optional(dev, "ahb");
+
+	if (!IS_ERR(nfc->reset)) {
+		ret = reset_control_deassert(nfc->reset);
+		if (ret) {
+			dev_err(dev, "reset err %d\n", ret);
+			goto out_mod_clk_unprepare;
+		}
+	}
+	else if (PTR_ERR(nfc->reset) != -ENOENT) {
+		return PTR_ERR(nfc->reset);
+	}
+
 	ret = sunxi_nfc_rst(nfc);
 	if (ret)
 		goto out_mod_clk_unprepare;
-- 
2.9.0
