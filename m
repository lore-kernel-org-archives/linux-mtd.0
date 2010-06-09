Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OMLui-0005D2-Di
	for linux-mtd@lists.infradead.org; Wed, 09 Jun 2010 14:05:53 +0000
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
	by mailout1.w1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0L3R00A5935MU0@mailout1.w1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 09 Jun 2010 15:05:46 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
	by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul
	14 2004)) with ESMTPA id <0L3R00JEF35LAL@spt1.w1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 09 Jun 2010 15:05:46 +0100 (BST)
Date: Wed, 09 Jun 2010 16:05:34 +0200
From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/4] s5pc110: OneNAND runtime badblock check
In-reply-to: <1276092335-3245-1-git-send-email-m.szyprowski@samsung.com>
To: linux-mtd@lists.infradead.org
Message-id: <1276092335-3245-5-git-send-email-m.szyprowski@samsung.com>
MIME-version: 1.0
Content-type: TEXT/PLAIN
Content-transfer-encoding: 7BIT
References: <1276092335-3245-1-git-send-email-m.szyprowski@samsung.com>
Cc: kyungmin.park@samsung.com, m.szyprowski@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kyungmin Park <kyungmin.park@samsung.com>

This patch enables runtime badblock check for Samsung OneNAND driver
depending on the value of CONFIG_MTD_RUNTIME_BADBLOCK_CHECK option.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

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
1.6.4
