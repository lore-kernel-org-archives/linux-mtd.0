Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fD47o-0002zL-JX
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2018 08:25:34 +0000
Received: by mail-wr0-x241.google.com with SMTP id v60-v6so7198799wrc.7
 for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2018 01:25:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 11/12] mtd: nand: davinci: stop using pdev->id as chipselect
Date: Mon, 30 Apr 2018 10:24:52 +0200
Message-Id: <20180430082453.8091-12-brgl@bgdev.pl>
In-Reply-To: <20180430082453.8091-1-brgl@bgdev.pl>
References: <20180430082453.8091-1-brgl@bgdev.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

All platform now use the core_chipsel field in platform data. Stop
using pdev->id in the driver.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 7255a0d94374..cd12e5abafde 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -545,7 +545,7 @@ static struct davinci_nand_pdata
 			return ERR_PTR(-ENOMEM);
 		if (!of_property_read_u32(pdev->dev.of_node,
 			"ti,davinci-chipselect", &prop))
-			pdev->id = prop;
+			pdata->core_chipsel = prop;
 		else
 			return ERR_PTR(-EINVAL);
 
@@ -627,7 +627,7 @@ static int nand_davinci_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	/* which external chipselect will we be managing? */
-	if (pdev->id < 0 || pdev->id > 3)
+	if (pdata->core_chipsel < 0 || pdata->core_chipsel > 3)
 		return -ENODEV;
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
@@ -683,7 +683,7 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	info->ioaddr		= (uint32_t __force) vaddr;
 
 	info->current_cs	= info->ioaddr;
-	info->core_chipsel	= pdev->id;
+	info->core_chipsel	= pdata->core_chipsel;
 	info->mask_chipsel	= pdata->mask_chipsel;
 
 	/* use nandboot-capable ALE/CLE masks by default */
-- 
2.17.0
