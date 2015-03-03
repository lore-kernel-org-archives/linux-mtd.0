Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuad-0003Sw-J1
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:57 +0000
Received: by widex7 with SMTP id ex7so26231914wid.4
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:33 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 58/60] mtd: onenand: samsung: drop owner assignment
Date: Tue,  3 Mar 2015 22:40:42 +0100
Message-Id: <1425418844-25177-59-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Owner is automatically set by mtdcore. Make use of that.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/onenand/samsung.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 19cfb97..5685923 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -864,7 +864,6 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	this = (struct onenand_chip *) &mtd[1];
 	mtd->priv = this;
 	mtd->dev.parent = &pdev->dev;
-	mtd->owner = THIS_MODULE;
 	onenand->pdev = pdev;
 	onenand->type = platform_get_device_id(pdev)->driver_data;
 
-- 
2.2.2
