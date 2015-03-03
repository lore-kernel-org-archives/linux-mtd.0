Received: from mail-we0-x233.google.com ([2a00:1450:400c:c03::233])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuaQ-00078S-Io
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:43 +0000
Received: by wesx3 with SMTP id x3so42586206wes.6
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:21 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 44/60] mtd: nand: orion_nand: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:28 +0100
Message-Id: <1425418844-25177-45-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/nand/orion_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index c3c6d30..81897ef 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -124,7 +124,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	}
 
 	mtd->priv = nc;
-	mtd->owner = THIS_MODULE;
+	mtd->dev.parent = &pdev->dev;
 
 	nc->priv = board;
 	nc->IO_ADDR_R = nc->IO_ADDR_W = io_base;
-- 
2.2.2
