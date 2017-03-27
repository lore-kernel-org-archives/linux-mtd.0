From: Simon Baatz <gmbnomis@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, boris.brezillon@free-electrons.com,
 u.kleine-koenig@pengutronix.de, richard@nod.at, jason@lakedaemon.net,
 andrew@lunn.ch, dan.carpenter@oracle.com
Subject: [PATCH v2 2/2] mtd: nand: orion: improve handling of optional clock
Date: Mon, 27 Mar 2017 20:02:08 +0200
Message-Id: <20170327180208.13414-2-gmbnomis@gmail.com>
In-Reply-To: <20170327180208.13414-1-gmbnomis@gmail.com>
References: <20170327180208.13414-1-gmbnomis@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The clock gate used by orion_nand is not available on all platforms.
When getting this optional clock gate, the code masked all errors.
Let's be more precise here and actually only allow ENOENT.

EPROBE_DEFER is handled like any other error code since probe deferral
is not supported by drivers using module_platform_driver_probe().

Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
---

Changes in v2:
* added patch

 drivers/mtd/nand/orion_nand.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 3acdc20485f1..f8e463a97b9e 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -156,8 +156,17 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	/* Not all platforms can gate the clock, so it is not
 	   an error if the clock does not exists. */
 	info->clk = devm_clk_get(&pdev->dev, NULL);
-	if (!IS_ERR(info->clk))
-		clk_prepare_enable(info->clk);
+	if (IS_ERR(info->clk)) {
+		ret = PTR_ERR(info->clk);
+		if (ret == -ENOENT) {
+			info->clk = NULL;
+		} else {
+			dev_err(&pdev->dev, "failed to get clock!\n");
+			return ret;
+		}
+	}
+
+	clk_prepare_enable(info->clk);
 
 	ret = nand_scan(mtd, 1);
 	if (ret)
@@ -173,9 +182,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	return 0;
 
 no_dev:
-	if (!IS_ERR(info->clk))
-		clk_disable_unprepare(info->clk);
-
+	clk_disable_unprepare(info->clk);
 	return ret;
 }
 
@@ -187,8 +194,7 @@ static int orion_nand_remove(struct platform_device *pdev)
 
 	nand_release(mtd);
 
-	if (!IS_ERR(info->clk))
-		clk_disable_unprepare(info->clk);
+	clk_disable_unprepare(info->clk);
 
 	return 0;
 }
-- 
2.9.3
