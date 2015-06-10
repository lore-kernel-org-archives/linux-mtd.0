Received: from mail-wg0-x241.google.com ([2a00:1450:400c:c00::241])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mmv-0003j2-5z
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:54 +0000
Received: by wggx12 with SMTP id x12so8978923wgg.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:33 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 23/60] mtd: nand: au1550nd: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:37 +0200
Message-Id: <1433968754-10651-24-git-send-email-fransklaver@gmail.com>
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

Fix a bug where parent device symlinks aren't shown in sysfs.

While at it, make use of the default owner value set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/au1550nd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
index c0c3be1..08a130f 100644
--- a/drivers/mtd/nand/au1550nd.c
+++ b/drivers/mtd/nand/au1550nd.c
@@ -439,7 +439,7 @@ static int au1550nd_probe(struct platform_device *pdev)
 
 	this = &ctx->chip;
 	ctx->info.priv = this;
-	ctx->info.owner = THIS_MODULE;
+	ctx->info.dev.parent = &pdev->dev;
 
 	/* figure out which CS# r->start belongs to */
 	cs = find_nand_cs(r->start);
-- 
2.4.0
