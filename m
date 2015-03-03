Received: from mail-we0-x22d.google.com ([2a00:1450:400c:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuaR-0004vi-PD
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:44 +0000
Received: by wesw55 with SMTP id w55so42546698wes.4
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:21 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 45/60] mtd: nand: pasemi_nand: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:29 +0100
Message-Id: <1425418844-25177-46-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
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

Fix a bug where devices aren't shown in sysfs.

While at it, make use of the default owner value set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/pasemi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_nand.c
index 66c345b..83cf021 100644
--- a/drivers/mtd/nand/pasemi_nand.c
+++ b/drivers/mtd/nand/pasemi_nand.c
@@ -124,7 +124,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	/* Link the private data with the MTD structure */
 	pasemi_nand_mtd->priv = chip;
-	pasemi_nand_mtd->owner = THIS_MODULE;
+	pasemi_nand_mtd->dev.parent = &ofdev->dev;
 
 	chip->IO_ADDR_R = of_iomap(np, 0);
 	chip->IO_ADDR_W = chip->IO_ADDR_R;
-- 
2.2.2
