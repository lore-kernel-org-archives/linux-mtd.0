From: Baruch Siach <baruch@tkos.co.il>
To: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 2/2] mxc_nand: remove unused variables
Date: Mon,  9 Aug 2010 14:38:14 +0300
Message-Id: <d4b734ef5662b65466fbe959bd1fc993a7f08398.1281353601.git.baruch@tkos.co.il>
In-Reply-To: <cover.1281353601.git.baruch@tkos.co.il>
References: <1281102791-8089-1-git-send-email-s.hauer@pengutronix.de>
	<cover.1281353601.git.baruch@tkos.co.il>
Cc: John Ogness <john.ogness@linutronix.de>, Baruch Siach <baruch@tkos.co.il>,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/nand/mxc_nand.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 3092240..dfa8311 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1210,15 +1210,12 @@ static int mxcnd_suspend(struct platform_device *pdev, pm_message_t state)
 static int mxcnd_resume(struct platform_device *pdev)
 {
 	struct mtd_info *mtd = platform_get_drvdata(pdev);
-	struct nand_chip *nand_chip = mtd->priv;
-	struct mxc_nand_host *host = nand_chip->priv;
-	int ret = 0;
 
 	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND resume\n");
 
 	mtd->resume(mtd);
 
-	return ret;
+	return 0;
 }
 
 #else
-- 
1.7.1
