Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSua7-0004sA-1B
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:23 +0000
Received: by wiwh11 with SMTP id h11so26267371wiw.3
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:00 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 22/60] mtd: nand: atmel_nand: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:06 +0100
Message-Id: <1425418844-25177-23-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/nand/atmel_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index d93c849..71b0d00 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -2126,7 +2126,7 @@ static int atmel_nand_probe(struct platform_device *pdev)
 
 	nand_chip->priv = host;		/* link the private data structures */
 	mtd->priv = nand_chip;
-	mtd->owner = THIS_MODULE;
+	mtd->dev.parent = &pdev->dev;
 
 	/* Set address of NAND IO lines */
 	nand_chip->IO_ADDR_R = host->io_base;
-- 
2.2.2
