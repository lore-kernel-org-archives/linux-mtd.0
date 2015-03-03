Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuaX-0003Nw-Kv
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:50 +0000
Received: by wghl18 with SMTP id l18so42783190wgh.8
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:27 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 51/60] mtd: nand: sharpsl: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:35 +0100
Message-Id: <1425418844-25177-52-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/nand/sharpsl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 842c47a..082b600 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -144,7 +144,7 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 
 	/* Link the private data with the MTD structure */
 	sharpsl->mtd.priv = this;
-	sharpsl->mtd.owner = THIS_MODULE;
+	sharpsl->mtd.dev.parent = &pdev->dev;
 
 	platform_set_drvdata(pdev, sharpsl);
 
-- 
2.2.2
