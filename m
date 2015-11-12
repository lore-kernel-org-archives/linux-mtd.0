Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwmbb-0008Bo-9n
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 07:47:39 +0000
Received: by wmvv187 with SMTP id v187so19260076wmv.1
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 23:47:17 -0800 (PST)
From: LABBE Corentin <clabbe.montjoie@gmail.com>
To: baruch@tkos.co.il, clabbe.montjoie@gmail.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, fransklaver@gmail.com, k.kozlowski.k@gmail.com,
 luis@debethencourt.com, s.hauer@pengutronix.de,
 u.kleine-koenig@pengutronix.de
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: mxc_nand: fix a possible NULL dereference
Date: Thu, 12 Nov 2015 08:46:55 +0100
Message-Id: <1447314423-31225-1-git-send-email-clabbe.montjoie@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

of_match_device could return NULL, and so cause a NULL pointer
dereference later.

Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
---
 drivers/mtd/nand/mxc_nand.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 136e73a..9e42431 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1464,8 +1464,7 @@ static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
 {
 	struct device_node *np = host->dev->of_node;
 	struct mxc_nand_platform_data *pdata = &host->pdata;
-	const struct of_device_id *of_id =
-		of_match_device(mxcnd_dt_ids, host->dev);
+	const struct of_device_id *of_id;
 	int buswidth;
 
 	if (!np)
@@ -1482,6 +1481,9 @@ static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
 
 	pdata->width = buswidth / 8;
 
+	of_id = of_match_device(mxcnd_dt_ids, host->dev);
+	if (!of_id)
+		return -ENODEV;
 	host->devtype_data = of_id->data;
 
 	return 0;
-- 
2.4.10
