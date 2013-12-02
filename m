Received: from mail-qe0-x22a.google.com ([2607:f8b0:400d:c02::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VnJam-0003I6-Gu
 for linux-mtd@lists.infradead.org; Mon, 02 Dec 2013 02:50:37 +0000
Received: by mail-qe0-f42.google.com with SMTP id b4so11964631qen.1
 for <linux-mtd@lists.infradead.org>; Sun, 01 Dec 2013 18:50:15 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: nand: mxc_nand: Check the return value from
 clk_prepare_enable()
Date: Mon,  2 Dec 2013 00:50:02 -0200
Message-Id: <1385952602-20977-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

clk_prepare_enable() may fail, so let's check its return value and propagate it
in the case of error.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/mxc_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 9dfdb06..0c09b8b 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1512,7 +1512,9 @@ static int mxcnd_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	clk_prepare_enable(host->clk);
+	err = clk_prepare_enable(host->clk);
+	if (err)
+		return err;
 	host->clk_act = 1;
 
 	/*
-- 
1.8.1.2
