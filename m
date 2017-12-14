Received: from smtp06.smtpout.orange.fr ([80.12.242.128]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePMj1-0002Hh-3Z
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 06:10:58 +0000
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: kyungmin.park@samsung.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/4 v3] mtd: onenand: samsung: return an error if
 'mtd_device_parse_register()' fails
Date: Thu, 14 Dec 2017 07:03:50 +0100
Message-Id: <a4e43e367b09184a7caa0bb9b9f1bc3fa8be54d1.1513230484.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
References: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
References: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If 'mtd_device_parse_register()' fails, we still return 0 which mean
success.
Return the error code instead, as done in all the other error handling
paths.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Cross-compiled tested-only

v2: call 'onenand_release()' to undo 'onenand_scan()'
v3: no change
---
 drivers/mtd/onenand/samsung.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index b650290611d2..b5497c5a35f1 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -936,6 +936,11 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	err = mtd_device_parse_register(mtd, NULL, NULL,
 					pdata ? pdata->parts : NULL,
 					pdata ? pdata->nr_parts : 0);
+	if (err) {
+		dev_err(&pdev->dev, "failed to parse partitions and register the MTD device\n");
+		onenand_release(mtd);
+		return err;
+	}
 
 	platform_set_drvdata(pdev, mtd);
 
-- 
2.14.1
