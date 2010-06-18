Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OPYVC-0000Oq-Vu
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2010 10:08:49 +0000
Received: from vaebh106.NOE.Nokia.com (vaebh106.europe.nokia.com
	[10.160.244.32])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o5IA8J9k024914
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jun 2010 05:08:44 -0500
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] mtd: create the mtd master device for given set of
	partitions
Date: Fri, 18 Jun 2010 13:08:31 +0300
Message-Id: <1276855711-18570-5-git-send-email-roman.tereshonkov@nokia.com>
In-Reply-To: <1276855711-18570-4-git-send-email-roman.tereshonkov@nokia.com>
References: <1276855711-18570-1-git-send-email-roman.tereshonkov@nokia.com>
	<1276855711-18570-2-git-send-email-roman.tereshonkov@nokia.com>
	<1276855711-18570-3-git-send-email-roman.tereshonkov@nokia.com>
	<1276855711-18570-4-git-send-email-roman.tereshonkov@nokia.com>
Cc: Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The master device is needed for repartioning to be done.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/onenand/omap2.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 9f322f1..f9bdad8 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -724,12 +724,14 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 	}
 
 #ifdef CONFIG_MTD_PARTITIONS
-	if (pdata->parts != NULL)
+	if (pdata->parts != NULL) {
 		r = add_mtd_partitions(&c->mtd, pdata->parts,
 				       pdata->nr_parts);
-	else
+		if (r < 0)
+			goto err_release_onenand;
+	}
 #endif
-		r = add_mtd_device(&c->mtd);
+	r = add_mtd_device(&c->mtd);
 	if (r < 0)
 		goto err_release_onenand;
 
-- 
1.6.2.4
