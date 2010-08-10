From: John Ogness <john.ogness@linutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 2/3] mxc_nand: remove unused variables
References: <80r5i63dn4.fsf@merkur.tec.linutronix.de>
Date: Tue, 10 Aug 2010 13:35:22 +0200
In-Reply-To: <80r5i63dn4.fsf@merkur.tec.linutronix.de> (John Ogness's message
	of "Tue, 10 Aug 2010 13:34:07 +0200")
Message-ID: <80mxsu3dl1.fsf@merkur.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, Ivo Clarysse <ivo.clarysse@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch removes some unused variable declarations.

This patch is against the latest patches from Sascha Hauer.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |    2 --
 1 file changed, 2 deletions(-)

Index: linux-2.6-454a740/drivers/mtd/nand/mxc_nand.c
===================================================================
--- linux-2.6-454a740.orig/drivers/mtd/nand/mxc_nand.c
+++ linux-2.6-454a740/drivers/mtd/nand/mxc_nand.c
@@ -1221,8 +1221,6 @@ static int mxcnd_suspend(struct platform
 static int mxcnd_resume(struct platform_device *pdev)
 {
 	struct mtd_info *mtd = platform_get_drvdata(pdev);
-	struct nand_chip *nand_chip = mtd->priv;
-	struct mxc_nand_host *host = nand_chip->priv;
 	int ret = 0;
 
 	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND resume\n");
