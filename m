Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0cBy-0006my-GB
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 14:29:35 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 19/19] mxc_nand: use DRIVER_NAME where appropriate
Date: Wed, 21 Oct 2009 16:13:26 +0200
Message-Id: <1256134406-25251-20-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1256134406-25251-19-git-send-email-s.hauer@pengutronix.de>
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-2-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-3-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-4-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-5-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-6-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-7-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-8-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-9-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-10-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-11-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-12-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-13-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-14-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-15-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-16-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-17-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-18-git-send-email-s.hauer@pengutronix.de>
	<1256134406-25251-19-git-send-email-s.hauer@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Eric Benard <ebenard@eukrea.com>,
	Vladimir Barinov <vova.barinov@gmail.com>,
	mathieu.berland@eads.com, jbe@pengutronix.de, sha@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index dd80e88..d5445cd 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -698,7 +698,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	mtd->priv = this;
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = &pdev->dev;
-	mtd->name = "mxc_nand";
+	mtd->name = DRIVER_NAME;
 
 	/* 50 us command delay time */
 	this->chip_delay = 5;
@@ -762,7 +762,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 
 	host->irq = platform_get_irq(pdev, 0);
 
-	err = request_irq(host->irq, mxc_nfc_irq, 0, "mxc_nd", host);
+	err = request_irq(host->irq, mxc_nfc_irq, 0, DRIVER_NAME, host);
 	if (err)
 		goto eirq;
 
-- 
1.6.5
