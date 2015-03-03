Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuaS-0004w0-Qy
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:45 +0000
Received: by widex7 with SMTP id ex7so26230787wid.4
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:22 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 46/60] mtd: nand: plat_nand: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:30 +0100
Message-Id: <1425418844-25177-47-git-send-email-fransklaver@gmail.com>
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

While at it, make use of the default owner and name set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/plat_nand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 4535c26..72e321e 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -61,8 +61,7 @@ static int plat_nand_probe(struct platform_device *pdev)
 
 	data->chip.priv = &data;
 	data->mtd.priv = &data->chip;
-	data->mtd.owner = THIS_MODULE;
-	data->mtd.name = dev_name(&pdev->dev);
+	data->mtd.dev.parent = &pdev->dev;
 
 	data->chip.IO_ADDR_R = data->io_base;
 	data->chip.IO_ADDR_W = data->io_base;
-- 
2.2.2
