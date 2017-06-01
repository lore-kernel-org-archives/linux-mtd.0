Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGNoa-00024u-8R
 for linux-mtd@lists.infradead.org; Thu, 01 Jun 2017 10:58:53 +0000
Received: by mail-io0-x241.google.com with SMTP id m4so4753571ioe.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Jun 2017 03:58:27 -0700 (PDT)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: orion: Handle return value of clk_prepare_enable
Date: Thu,  1 Jun 2017 16:28:15 +0530
Message-Id: <8ff46d4fcedc129a76cef82f344ae182309e633d.1496314473.git.arvind.yadav.cs@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

clk_prepare_enable() can fail here and we must check its return value.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/mtd/nand/orion_nand.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index f8e463a..209170e 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -166,7 +166,11 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		}
 	}
 
-	clk_prepare_enable(info->clk);
+	ret = clk_prepare_enable(info->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to prepare clock!\n");
+		return ret;
+	}
 
 	ret = nand_scan(mtd, 1);
 	if (ret)
-- 
1.9.1
