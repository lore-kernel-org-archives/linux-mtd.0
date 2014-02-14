Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEMAO-0007LG-D3
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 17:03:09 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: [PATCH v2 2/3] mtd: nand: omap: fix ecclayout->oobfree->length
Date: Fri, 14 Feb 2014 22:31:47 +0530
Message-ID: <1392397308-17630-3-git-send-email-pekon@ti.com>
In-Reply-To: <1392397308-17630-1-git-send-email-pekon@ti.com>
References: <1392397308-17630-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Felipe Balbi <balbi@ti.com>, u-boot@lists.denx.de,
 Enric Balletbo Serra <eballetbo@iseebcn.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Stefan Roese <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ECC layout of some ecc-schemes expect a 'reserve-marker' as specific
byte-position in OOB. But current calculation of oobfree->length does not
consider that for all ecc-schemes.
But in general, for all ecc-schems, OOB bytes from oobfree->offset till end of
OOB region are unused. So this patch fixes oobfree->length calculation.

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 874fd9d..433e58a 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1977,9 +1977,8 @@ static int omap_nand_probe(struct platform_device *pdev)
 		goto return_error;
 	}
 
-	/* populate remaining ECC layout data */
-	ecclayout->oobfree->length = mtd->oobsize - (BADBLOCK_MARKER_LENGTH +
-							ecclayout->eccbytes);
+	/* all OOB bytes from oobfree->offset till end off OOB are free */
+	ecclayout->oobfree->length = mtd->oobsize - ecclayout->oobfree->offset;
 	for (i = 1; i < ecclayout->eccbytes; i++)
 		ecclayout->eccpos[i] = ecclayout->eccpos[0] + i;
 	/* check if NAND device's OOB is enough to store ECC signatures */
-- 
1.8.5.1.163.gd7aced9
