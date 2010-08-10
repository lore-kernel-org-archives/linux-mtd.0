Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oinj7-00087H-AR
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2010 12:14:41 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 10/12] mxc_nand: remove unused variables.
Date: Tue, 10 Aug 2010 14:14:31 +0200
Message-Id: <1281442473-31428-2-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1281442473-31428-1-git-send-email-s.hauer@pengutronix.de>
References: <1281442473-31428-1-git-send-email-s.hauer@pengutronix.de>
Cc: Baruch Siach <baruch@tkos.co.il>, Sascha Hauer <s.hauer@pengutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, Ivo Clarysse <ivo.clarysse@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: John Ogness <john.ogness@linutronix.de>

Signed-off-by: John Ogness <john.ogness@linutronix.de>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index a85b60a..3767dcc 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1189,8 +1189,6 @@ static int mxcnd_suspend(struct platform_device *pdev, pm_message_t state)
 static int mxcnd_resume(struct platform_device *pdev)
 {
 	struct mtd_info *mtd = platform_get_drvdata(pdev);
-	struct nand_chip *nand_chip = mtd->priv;
-	struct mxc_nand_host *host = nand_chip->priv;
 	int ret = 0;
 
 	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND resume\n");
-- 
1.7.1
