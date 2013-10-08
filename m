Received: from mail-pa0-f53.google.com ([209.85.220.53])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTTl5-0000Be-Ai
 for linux-mtd@lists.infradead.org; Tue, 08 Oct 2013 09:39:16 +0000
Received: by mail-pa0-f53.google.com with SMTP id kq14so8549909pab.40
 for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2013 02:38:50 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: fsl_ifc_nand: Remove redundant dev_set_drvdata
Date: Tue,  8 Oct 2013 15:08:19 +0530
Message-Id: <1381225100-19693-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, artem.bityutskiy@linux.intel.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Driver core will set the driver data to NULL upon detach or
probe failure.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/fsl_ifc_nand.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 47acda6..64a30ef 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -905,7 +905,6 @@ static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
 		iounmap(priv->vbase);
 
 	ifc_nand_ctrl->chips[priv->bank] = NULL;
-	dev_set_drvdata(priv->dev, NULL);
 
 	return 0;
 }
-- 
1.7.9.5
