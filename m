Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YReEt-00006w-9f
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:03:15 +0000
Received: by pdbft15 with SMTP id ft15so1150733pdb.2
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:02:53 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/7] mtd: docg3: drop dead code
Date: Sat, 28 Feb 2015 02:02:24 -0800
Message-Id: <1425117750-22298-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
Cc: Joe Perches <joe@perches.com>, Brian Norris <computersforpeace@gmail.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If no devices were found, we would already have skipped over this code.

Detected by Coverity, CID #744270

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/docg3.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 448ce42f951e..01eddea1f0d9 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -2079,8 +2079,6 @@ static int __init docg3_probe(struct platform_device *pdev)
 	ret = doc_register_sysfs(pdev, cascade);
 	if (ret)
 		goto err_probe;
-	if (!found)
-		goto notfound;
 
 	platform_set_drvdata(pdev, cascade);
 	doc_dbg_register(cascade->floors[0]->priv);
-- 
2.1.0
