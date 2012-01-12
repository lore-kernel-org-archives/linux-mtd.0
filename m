Received: from mgw2.diku.dk ([130.225.96.92])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RlHp9-0004iX-V3
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2012 10:24:01 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH 3/15] drivers/mtd/onenand/samsung.c: add missing iounmap
Date: Thu, 12 Jan 2012 10:55:05 +0100
Message-Id: <1326362117-29371-3-git-send-email-Julia.Lawall@lip6.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <Julia.Lawall@lip6.fr>

Add missing iounmap in error handling code, in a case where the function
already preforms iounmap on some other execution path.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e;
statement S,S1;
int ret;
@@
e = \(ioremap\|ioremap_nocache\)(...)
... when != iounmap(e)
if (<+...e...+>) S
... when any
    when != iounmap(e)
*if (...)
   { ... when != iounmap(e)
     return ...; }
... when any
iounmap(e);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The goto labels are perhaps not ideal, because the ahb/dma resource has not
been allocated yet.  But keeping the labels reduces the number of changes in
the code.

 drivers/mtd/onenand/samsung.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index fa1ee43..deaf762 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -923,7 +923,7 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 		r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 		if (!r) {
 			dev_err(&pdev->dev, "no buffer memory resource defined\n");
-			return -ENOENT;
+			err = -ENOENT;
 			goto ahb_resource_failed;
 		}
 
@@ -964,7 +964,7 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 		r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 		if (!r) {
 			dev_err(&pdev->dev, "no dma memory resource defined\n");
-			return -ENOENT;
+			err = -ENOENT;
 			goto dma_resource_failed;
 		}
 
