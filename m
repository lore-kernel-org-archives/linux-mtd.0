Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXYDN-0001p5-Bn
 for linux-mtd@lists.infradead.org; Fri, 05 Jan 2018 20:03:43 +0000
Received: by mail-qk0-x241.google.com with SMTP id 143so7349038qki.2
 for <linux-mtd@lists.infradead.org>; Fri, 05 Jan 2018 12:03:31 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: boris.brezillon@free-electrons.com
Cc: cyrille.pitchen@wedev4u.fr, architt@codeaurora.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH 2/2] mtd: brcmnand: Add a NULL check for devm_kasprintf()
Date: Fri,  5 Jan 2018 18:02:56 -0200
Message-Id: <1515182576-2704-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1515182576-2704-1-git-send-email-festevam@gmail.com>
References: <1515182576-2704-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@nxp.com>

devm_kasprintf() may fail, so we should better add a NULL check
and propagate an error on failure.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 3310e14..8942aa6 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -2237,6 +2237,8 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
 	nand_set_controller_data(chip, host);
 	mtd->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "brcmnand.%d",
 				   host->cs);
+	if (!mtd->name)
+		return -ENOMEM;
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = &pdev->dev;
 
-- 
2.7.4
