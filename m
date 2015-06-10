Received: from mail-wg0-x244.google.com ([2a00:1450:400c:c00::244])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mn0-0003jZ-7B
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:59 +0000
Received: by wggy19 with SMTP id y19so8937199wgg.0
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:39 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 27/60] mtd: nand: davinci_nand: drop owner and name
 assignment
Date: Wed, 10 Jun 2015 22:38:41 +0200
Message-Id: <1433968754-10651-28-git-send-email-fransklaver@gmail.com>
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

Owner and name are automatically set by mtdcore. Make use of that.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/davinci_nand.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index feb6d18..78e0c4d 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -657,9 +657,6 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	info->vaddr		= vaddr;
 
 	info->mtd.priv		= &info->chip;
-	info->mtd.name		= dev_name(&pdev->dev);
-	info->mtd.owner		= THIS_MODULE;
-
 	info->mtd.dev.parent	= &pdev->dev;
 
 	info->chip.IO_ADDR_R	= vaddr;
-- 
2.4.0
