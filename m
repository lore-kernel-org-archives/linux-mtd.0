Received: from mgw1.diku.dk ([130.225.96.91])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCehE-0004Ln-UT
	for linux-mtd@lists.infradead.org; Thu, 13 May 2010 20:07:53 +0000
Date: Thu, 13 May 2010 22:07:46 +0200 (CEST)
From: Julia Lawall <julia@diku.dk>
To: Vincent Sanders <support@simtec.co.uk>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 20/20] drivers/mtd/nand: Use kzalloc
Message-ID: <Pine.LNX.4.64.1005132207300.6282@ask.diku.dk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <julia@diku.dk>

Use kzalloc rather than the combination of kmalloc and memset.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,size,flags;
statement S;
@@

-x = kmalloc(size,flags);
+x = kzalloc(size,flags);
 if (x == NULL) S
-memset(x, 0, size);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/nand/s3c2410.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff -u -p a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -929,14 +929,13 @@ static int s3c24xx_nand_probe(struct pla
 
 	pr_debug("s3c2410_nand_probe(%p)\n", pdev);
 
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (info == NULL) {
 		dev_err(&pdev->dev, "no memory for flash info\n");
 		err = -ENOMEM;
 		goto exit_error;
 	}
 
-	memset(info, 0, sizeof(*info));
 	platform_set_drvdata(pdev, info);
 
 	spin_lock_init(&info->controller.lock);
@@ -994,15 +993,13 @@ static int s3c24xx_nand_probe(struct pla
 	/* allocate our information */
 
 	size = nr_sets * sizeof(*info->mtds);
-	info->mtds = kmalloc(size, GFP_KERNEL);
+	info->mtds = kzalloc(size, GFP_KERNEL);
 	if (info->mtds == NULL) {
 		dev_err(&pdev->dev, "failed to allocate mtd storage\n");
 		err = -ENOMEM;
 		goto exit_error;
 	}
 
-	memset(info->mtds, 0, size);
-
 	/* initialise all possible chips */
 
 	nmtd = info->mtds;
