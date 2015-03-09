Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YV1KJ-0001xv-N8
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2015 17:18:48 +0000
Received: by pdbfp1 with SMTP id fp1so45319315pdb.2
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2015 10:18:24 -0700 (PDT)
Date: Mon, 9 Mar 2015 10:18:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/7] mtd: docg3: drop dead code
Message-ID: <20150309171816.GR18140@ld-irv-0074>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
 <1425117750-22298-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425117750-22298-2-git-send-email-computersforpeace@gmail.com>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
v2: kill 'found' entirely

 drivers/mtd/devices/docg3.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 448ce42f951e..0310f9174dcc 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -2033,7 +2033,7 @@ static int __init docg3_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	struct resource *ress;
 	void __iomem *base;
-	int ret, floor, found = 0;
+	int ret, floor;
 	struct docg3_cascade *cascade;
 
 	ret = -ENXIO;
@@ -2073,14 +2073,11 @@ static int __init docg3_probe(struct platform_device *pdev)
 						0);
 		if (ret)
 			goto err_probe;
-		found++;
 	}
 
 	ret = doc_register_sysfs(pdev, cascade);
 	if (ret)
 		goto err_probe;
-	if (!found)
-		goto notfound;
 
 	platform_set_drvdata(pdev, cascade);
 	doc_dbg_register(cascade->floors[0]->priv);
-- 
1.9.1
