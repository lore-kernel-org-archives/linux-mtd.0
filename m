From: Daniel Mack <zonque@gmail.com>
To: haojian.zhuang@linaro.org, eric.y.miao@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 16/20] ASoC: pxa: add DT bindings for pxa2xx-pcm
Date: Wed,  7 Aug 2013 17:34:05 +0200
Message-Id: <1375889649-14638-17-git-send-email-zonque@gmail.com>
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

The bindings do not carry any resources, as the module only registers
the ASoC platform driver.

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 .../devicetree/bindings/sound/mrvl,pxa2xx-pcm.txt         | 15 +++++++++++++++
 sound/soc/pxa/pxa2xx-pcm.c                                | 13 +++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mrvl,pxa2xx-pcm.txt

diff --git a/Documentation/devicetree/bindings/sound/mrvl,pxa2xx-pcm.txt b/Documentation/devicetree/bindings/sound/mrvl,pxa2xx-pcm.txt
new file mode 100644
index 0000000..551fbb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mrvl,pxa2xx-pcm.txt
@@ -0,0 +1,15 @@
+DT bindings for ARM PXA2xx PCM platform driver
+
+This is just a dummy driver that registers the PXA ASoC platform driver.
+It does not have any resources assigned.
+
+Required properties:
+
+	- compatible		'mrvl,pxa-pcm-audio'
+
+Example:
+
+	pxa_pcm_audio: snd_soc_pxa_audio {
+		compatible = "mrvl,pxa-pcm-audio";
+	};
+
diff --git a/sound/soc/pxa/pxa2xx-pcm.c b/sound/soc/pxa/pxa2xx-pcm.c
index 0aa2d69..806da27 100644
--- a/sound/soc/pxa/pxa2xx-pcm.c
+++ b/sound/soc/pxa/pxa2xx-pcm.c
@@ -13,6 +13,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/dmaengine.h>
+#include <linux/of.h>
 
 #include <sound/core.h>
 #include <sound/soc.h>
@@ -133,10 +134,18 @@ static int pxa2xx_soc_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id snd_soc_pxa_audio_match[] = {
+	{ .compatible   = "mrvl,pxa-pcm-audio" },
+	{ }
+};
+#endif
+
 static struct platform_driver pxa_pcm_driver = {
 	.driver = {
-			.name = "pxa-pcm-audio",
-			.owner = THIS_MODULE,
+		.name = "pxa-pcm-audio",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(snd_soc_pxa_audio_match),
 	},
 
 	.probe = pxa2xx_soc_platform_probe,
-- 
1.8.3.1
