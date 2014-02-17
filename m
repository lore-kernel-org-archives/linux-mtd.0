Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFIq9-0002Qv-MB
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2014 07:42:10 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v3 3/3] mtd: nand: omap: fix ecclayout->oobfree->length
Date: Mon, 17 Feb 2014 13:11:25 +0530
Message-ID: <1392622885-8415-4-git-send-email-pekon@ti.com>
In-Reply-To: <1392622885-8415-1-git-send-email-pekon@ti.com>
References: <1392622885-8415-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Felipe Balbi <balbi@ti.com>,
 u-boot@lists.denx.de, Enric Balletbo Serra <eballetbo@iseebcn.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 stable@vger.kernel.org, Stefan Roese <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch excludes reserved-marker byte-position from oobfree->length
calculation. Thus all bytes from oobfree->offset till end of OOB are free.

CC: <stable@vger.kernel.org> # 3.13.x+
Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 58685ab..bf642ce 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1994,9 +1994,8 @@ static int omap_nand_probe(struct platform_device *pdev)
 		goto return_error;
 	}
 
-	/* populate remaining ECC layout data */
-	ecclayout->oobfree->length = mtd->oobsize - (BADBLOCK_MARKER_LENGTH +
-							ecclayout->eccbytes);
+	/* all OOB bytes from oobfree->offset till end off OOB are free */
+	ecclayout->oobfree->length = mtd->oobsize - ecclayout->oobfree->offset;
 	/* check if NAND device's OOB is enough to store ECC signatures */
 	if (mtd->oobsize < (ecclayout->eccbytes + BADBLOCK_MARKER_LENGTH)) {
 		pr_err("not enough OOB bytes required = %d, available=%d\n",
-- 
1.8.5.1.163.gd7aced9
