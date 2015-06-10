Received: from mail-wi0-x243.google.com ([2a00:1450:400c:c05::243])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mnN-0003qh-Eh
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:21 +0000
Received: by wivr20 with SMTP id r20so11953042wiv.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:40:04 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 52/60] mtd: nand: socrates_nand: drop owner assignment
Date: Wed, 10 Jun 2015 22:39:06 +0200
Message-Id: <1433968754-10651-53-git-send-email-fransklaver@gmail.com>
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

Owner is automatically set by mtdcore. Make use of that.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/socrates_nand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index d710622..b94f534 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -167,7 +167,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	nand_chip->priv = host;		/* link the private data structures */
 	mtd->priv = nand_chip;
 	mtd->name = "socrates_nand";
-	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = &ofdev->dev;
 	ppdata.of_node = ofdev->dev.of_node;
 
-- 
2.4.0
