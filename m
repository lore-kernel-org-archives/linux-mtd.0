From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
To: Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley
 <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Subject: [PATCH 10/10] mtd: nand: davinci: don't request AEMIF address range
Date: Thu, 21 Nov 2013 13:28:25 +0200
Message-ID: <1385033305-13179-11-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1385033305-13179-1-git-send-email-ivan.khoronzhuk@ti.com>
References: <1385033305-13179-1-git-send-email-ivan.khoronzhuk@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 grygorii.strashko@ti.com, Pawel Moll <pawel.moll@arm.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The TI AEMIF driver registers are used to setup timings for each chip
select. The same registers range is used to setup NAND settings.
The AEMIF and NAND drivers not use the same registers in this range.

In case with TI AEMIF driver, the memory address range is requested
already by AEMIF, so we cannot request it twice, just ioremap.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/mtd/nand/davinci_nand.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index e904364..aa30708 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -638,9 +638,11 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 
-	base = devm_ioremap_resource(&pdev->dev, res2);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	base = devm_ioremap(&pdev->dev, res2->start, resource_size(res2));
+	if (!base) {
+		dev_err(&pdev->dev, "ioremap failed for resource %pR\n", res2);
+		return -EADDRNOTAVAIL;
+	}
 
 	info->dev		= &pdev->dev;
 	info->base		= base;
-- 
1.7.9.5
