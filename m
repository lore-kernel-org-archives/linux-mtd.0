Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXYDL-0001ou-7Z
 for linux-mtd@lists.infradead.org; Fri, 05 Jan 2018 20:03:41 +0000
Received: by mail-qt0-x241.google.com with SMTP id g10so7068418qtj.12
 for <linux-mtd@lists.infradead.org>; Fri, 05 Jan 2018 12:03:28 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: boris.brezillon@free-electrons.com
Cc: cyrille.pitchen@wedev4u.fr, architt@codeaurora.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH 1/2] mtd: qcom_nandc: Add a NULL check for devm_kasprintf()
Date: Fri,  5 Jan 2018 18:02:55 -0200
Message-Id: <1515182576-2704-1-git-send-email-festevam@gmail.com>
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
 drivers/mtd/nand/qcom_nandc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 245d0f3..3fe2ff8 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -2639,6 +2639,8 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 
 	nand_set_flash_node(chip, dn);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "qcom_nand.%d", host->cs);
+	if (!mtd->name)
+		return -ENOMEM;
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = dev;
 
-- 
2.7.4
