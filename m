From: Daniel Mack <zonque@gmail.com>
To: haojian.zhuang@linaro.org, eric.y.miao@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 13/20] ASoC: pxa: pxa-ssp: add DT bindings
Date: Wed,  7 Aug 2013 17:34:02 +0200
Message-Id: <1375889649-14638-14-git-send-email-zonque@gmail.com>
In-Reply-To: <1375889649-14638-1-git-send-email-zonque@gmail.com>
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 Daniel Mack <zonque@gmail.com>, cxie4@marvell.com, lars@metafoo.de,
 nico@linaro.org, vinod.koul@intel.com, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, arnd@arndb.de,
 broonie@kernel.org, mika.westerberg@linux.intel.com,
 thomas.petazzoni@free-electrons.com, gregkh@linuxfoundation.org,
 g.liakhovetski@gmx.de, sachin.kamat@linaro.org, kernel@pengutronix.de,
 djbw@fb.com, davem@davemloft.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch contains a cruel hack for looking up the the DMA request
number. The problem here is that the implementation as it stands will
allocate the DMA channel from the user of the ssp port, and hence we
cannot allocate a real channel here.

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 Documentation/devicetree/bindings/sound/mrvl,pxa-ssp.txt |  7 +++++++
 sound/soc/pxa/pxa-ssp.c                                  | 12 ++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mrvl,pxa-ssp.txt

diff --git a/Documentation/devicetree/bindings/sound/mrvl,pxa-ssp.txt b/Documentation/devicetree/bindings/sound/mrvl,pxa-ssp.txt
new file mode 100644
index 0000000..19d5488
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mrvl,pxa-ssp.txt
@@ -0,0 +1,7 @@
+Marvell PXA SSP CPU DAI bindings
+
+Required properties:
+
+	compatible	Must be "mrvl,pxa-ssp-dai"
+
+
diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 6f4dd75..82b9985 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -21,6 +21,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/pxa2xx_ssp.h>
+#include <linux/of.h>
 
 #include <asm/irq.h>
 
@@ -798,6 +799,12 @@ static const struct snd_soc_component_driver pxa_ssp_component = {
 	.name		= "pxa-ssp",
 };
 
+#ifdef CONFIG_OF
+static const struct of_device_id pxa_ssp_of_ids[] = {
+	{ .compatible = "mrvl,pxa-ssp-dai" },
+};
+#endif
+
 static int asoc_ssp_probe(struct platform_device *pdev)
 {
 	return snd_soc_register_component(&pdev->dev, &pxa_ssp_component,
@@ -812,8 +819,9 @@ static int asoc_ssp_remove(struct platform_device *pdev)
 
 static struct platform_driver asoc_ssp_driver = {
 	.driver = {
-			.name = "pxa-ssp-dai",
-			.owner = THIS_MODULE,
+		.name = "pxa-ssp-dai",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(pxa_ssp_of_ids),
 	},
 
 	.probe = asoc_ssp_probe,
-- 
1.8.3.1
