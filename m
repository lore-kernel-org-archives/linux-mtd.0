Received: from mail-wg0-f67.google.com ([74.125.82.67])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mna-0001aM-Kv
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:35 +0000
Received: by wggy19 with SMTP id y19so8972337wgg.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:40:12 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 59/60] mtd: spi-nor: fsl-quadspi: show parent device in
 sysfs
Date: Wed, 10 Jun 2015 22:39:13 +0200
Message-Id: <1433968754-10651-60-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
References: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
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

Fix a bug where mtd parent device symlinks aren't shown in sysfs.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 5d5d362..f7cd06b 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -874,6 +874,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 
 		nor = &q->nor[i];
 		mtd = &q->mtd[i];
+		mtd->dev.parent = dev;
 
 		nor->mtd = mtd;
 		nor->dev = dev;
-- 
2.4.0
