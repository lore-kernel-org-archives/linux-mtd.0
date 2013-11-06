Received: from mail-qc0-x22d.google.com ([2607:f8b0:400d:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve6it-0006dq-3i
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 17:16:55 +0000
Received: by mail-qc0-f173.google.com with SMTP id l13so6206668qcy.32
 for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2013 09:16:31 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH 1/2] mtd: gpmi: Revert "mtd: gpmi: scan two nand chips"
Date: Wed,  6 Nov 2013 15:16:11 -0200
Message-Id: <1383758172-29798-1-git-send-email-festevam@gmail.com>
Cc: marex@denx.de, b32955@freescale.com, dwmw2@infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

This revert is needed so that the revert of commit f720e7ce5 
("mtd: gpmi: remove the nand_scan()") can be succesfully applied.

This reverts commit cdef39de399fc6806f85c60ef97c9e394b3a92d4.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 7ac2280..a5c60c4 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1674,7 +1674,7 @@ static int gpmi_nfc_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_out;
 
-	ret = nand_scan_ident(mtd, 2, NULL);
+	ret = nand_scan_ident(mtd, 1, NULL);
 	if (ret)
 		goto err_out;
 
-- 
1.8.1.2
