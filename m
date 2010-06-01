Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJMiy-0001FW-KJ
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2010 08:21:25 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0L3B0099QTVKMC@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 01 Jun 2010 17:21:20 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L3B00EFMTVKQQ@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 01 Jun 2010 17:21:20 +0900 (KST)
Date: Tue, 01 Jun 2010 17:17:36 +0900
From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH 2/2] mtd: OneNAND: Support runtime badblock check of Samsung
	Soc OneNAND
In-reply-to: <1275380256-15315-1-git-send-email-jy0922.shim@samsung.com>
To: linux-mtd@lists.infradead.org
Message-id: <1275380256-15315-2-git-send-email-jy0922.shim@samsung.com>
Content-transfer-encoding: 7BIT
References: <1275380256-15315-1-git-send-email-jy0922.shim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kyungmin Park <kyungmin.park@samsung.com>

This patch is to support runtime badblock check to Samsung Soc OneNAND
driver.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/samsung.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index fa4b743..c2bbeae 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -837,8 +837,12 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	/* Set onenand_chip also */
 	this->base = onenand->base;
 
-	/* Use runtime badblock check */
+	/* Skip unlock all check */
 	this->options |= ONENAND_SKIP_UNLOCK_CHECK;
+#ifdef CONFIG_MTD_RUNTIME_BADBLOCK_CHECK
+	/* Use runtime badblock check */
+	this->options |= ONENAND_RUNTIME_BADBLOCK_CHECK;
+#endif
 
 	if (onenand->type != TYPE_S5PC110) {
 		r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-- 
1.7.0.4
