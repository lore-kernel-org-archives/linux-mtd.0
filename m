Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cG8S9-00012N-IE
 for linux-mtd@lists.infradead.org; Sun, 11 Dec 2016 18:02:27 +0000
Received: by mail-pg0-x243.google.com with SMTP id p66so8358429pga.2
 for <linux-mtd@lists.infradead.org>; Sun, 11 Dec 2016 10:02:03 -0800 (PST)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: robert.jarzmik@free.fr, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@atmel.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [V1] mtd: devices: docg3:- Handle return value of devm_ioremap.
Date: Sun, 11 Dec 2016 23:31:50 +0530
Message-Id: <1481479310-2698-1-git-send-email-arvind.yadav.cs@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here, If devm_ioremap will fail. It will return NULL.
Kernel can run into a NULL-pointer dereference.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/mtd/devices/docg3.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index b833e6c..013b5b9 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -2083,9 +2083,12 @@ static int __init docg3_probe(struct platform_device *pdev)
 		dev_err(dev, "No I/O memory resource defined\n");
 		return ret;
 	}
-	base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
 
 	ret = -ENOMEM;
+	base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
+	if (!base)
+		return ret;
+
 	cascade = devm_kzalloc(dev, sizeof(*cascade) * DOC_MAX_NBFLOORS,
 			       GFP_KERNEL);
 	if (!cascade)
-- 
2.7.4
