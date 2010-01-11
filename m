Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NUNWJ-0001yZ-WA
	for linux-mtd@lists.infradead.org; Mon, 11 Jan 2010 16:53:37 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mxc-nand: don't disable clock in mxcnd-suspend
Date: Mon, 11 Jan 2010 17:53:16 +0100
Message-Id: <1263228796-23054-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1263218735-17244-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1263218735-17244-1-git-send-email-u.kleine-koenig@pengutronix.de>
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

The clock must already be off after mtd->suspend.  Disabling it again
results in an negative overflow of the clock usage count.  This didn't
hurt as mxcnd_resume undid it after wake up.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: Vladimir Barinov <vova.barinov@gmail.com>
---
 drivers/mtd/nand/mxc_nand.c |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 84f3635..970ce6b 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -888,8 +888,12 @@ static int mxcnd_suspend(struct platform_device *pdev, pm_message_t state)
 	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND suspend\n");
 
 	ret = mtd->suspend(mtd);
-	/* Disable the NFC clock */
-	clk_disable(host->clk);
+
+	/*
+	 * nand_suspend locks the device for exclusive access, so
+	 * the clock must already be off.
+	 */
+	BUG_ON(!ret && host->clk_act);
 
 	return ret;
 }
@@ -903,8 +907,6 @@ static int mxcnd_resume(struct platform_device *pdev)
 
 	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND resume\n");
 
-	/* Enable the NFC clock */
-	clk_enable(host->clk);
 	mtd->resume(mtd);
 
 	return ret;
-- 
1.6.5.2
