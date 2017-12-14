Received: from smtp06.smtpout.orange.fr ([80.12.242.128]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePMj1-0002N0-3U
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 06:10:59 +0000
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: kyungmin.park@samsung.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 3/4 v3] mtd: onenand: samsung: Propagate the error returned by
 'onenand_scan()'
Date: Thu, 14 Dec 2017 07:03:51 +0100
Message-Id: <6a50f5e1872bedd649c5f0d0651243b5e4bb1184.1513230484.git.christophe.jaillet@wanadoo.fr>
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

Propagate the error code returned by 'onenand_scan()' instead of a
hard-coded -EFAULT.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Cross-compiled tested-only

v3: new patch in the serie
---
 drivers/mtd/onenand/samsung.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index b5497c5a35f1..206aa90140c9 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -921,8 +921,9 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (onenand_scan(mtd, 1))
-		return -EFAULT;
+	err = onenand_scan(mtd, 1);
+	if (err)
+		return err;
 
 	if (onenand->type != TYPE_S5PC110) {
 		/* S3C doesn't handle subpage write */
-- 
2.14.1
