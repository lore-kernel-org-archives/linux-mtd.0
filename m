Message-ID: <546C8B7F.6030600@ti.com>
Date: Wed, 19 Nov 2014 14:22:23 +0200
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: <computersforpeace@gmail.com>, <dwmw2@infradead.org>, <tony@atomide.com>
Subject: [PATCH v2] mtd: nand: omap: Fix NAND enumeration on 3430 LDP
References: <1415185258-11747-1-git-send-email-rogerq@ti.com>
In-Reply-To: <1415185258-11747-1-git-send-email-rogerq@ti.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: "Rini, Tom" <trini@ti.com>, pekon@pek-sem.com, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org, ezequiel@vanguardiasur.com.ar
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

3430LDP has NAND flash with 32 bytes OOB size which is sufficient to hold
BCH8 codes but the small page check introduced in
commit b491da7233d5 ("mtd: nand: omap: clean-up ecc layout for BCH ecc schemes")
considers anything below 64 bytes unsuitable for BCH4/8/16. There is another
bug in that code where it doesn't skip the check for OMAP_ECC_HAM1_CODE_SW.

Get rid of that small page check code as it is insufficient and redundant
because we are checking for OOB available bytes vs ecc layout before calling
nand_scan_tail().

Fixes: b491da7233d5 ("mtd: nand: omap: clean-up ecc layout for BCH ecc schemes")

Reported-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/mtd/nand/omap2.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 3b357e9..10d07dd 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1741,13 +1741,6 @@ static int omap_nand_probe(struct platform_device *pdev)
 		goto return_error;
 	}
 
-	/* check for small page devices */
-	if ((mtd->oobsize < 64) && (pdata->ecc_opt != OMAP_ECC_HAM1_CODE_HW)) {
-		dev_err(&info->pdev->dev, "small page devices are not supported\n");
-		err = -EINVAL;
-		goto return_error;
-	}
-
 	/* re-populate low-level callbacks based on xfer modes */
 	switch (pdata->xfer_type) {
 	case NAND_OMAP_PREFETCH_POLLED:
-- 
1.8.3.2
