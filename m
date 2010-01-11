Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NUKu0-0000DD-2V
	for linux-mtd@lists.infradead.org; Mon, 11 Jan 2010 14:05:52 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mxc-nand: no need to check for validity of platform drive data
Date: Mon, 11 Jan 2010 15:05:35 +0100
Message-Id: <1263218735-17244-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Vladimir Barinov <vova.barinov@gmail.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The probe function calls platform_set_drvdata with a valid pointer when
the probe is successful.  As mxcnd_suspend and mxcnd_resume are only
called on bound devices, platform_get_drvdata always returns non-NULL.

This fix isn't critical as the pointer is always valid so it doesn't
matter if the compiler generated code for it or not.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Reported-by: David Binderman <dcb314@hotmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: Vladimir Barinov <vova.barinov@gmail.com>
---
 drivers/mtd/nand/mxc_nand.c |   17 +++++++----------
 1 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 45dec57..84f3635 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -886,11 +886,10 @@ static int mxcnd_suspend(struct platform_device *pdev, pm_message_t state)
 	int ret = 0;
 
 	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND suspend\n");
-	if (mtd) {
-		ret = mtd->suspend(mtd);
-		/* Disable the NFC clock */
-		clk_disable(host->clk);
-	}
+
+	ret = mtd->suspend(mtd);
+	/* Disable the NFC clock */
+	clk_disable(host->clk);
 
 	return ret;
 }
@@ -904,11 +903,9 @@ static int mxcnd_resume(struct platform_device *pdev)
 
 	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND resume\n");
 
-	if (mtd) {
-		/* Enable the NFC clock */
-		clk_enable(host->clk);
-		mtd->resume(mtd);
-	}
+	/* Enable the NFC clock */
+	clk_enable(host->clk);
+	mtd->resume(mtd);
 
 	return ret;
 }
-- 
1.6.5.2
