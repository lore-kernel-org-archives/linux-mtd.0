Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eeHyq-0007Nl-2G
 for linux-mtd@lists.infradead.org; Wed, 24 Jan 2018 10:08:33 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23992821AbeAXKIaWZvDV (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Wed, 24 Jan 2018 11:08:30 +0100
Date: Wed, 24 Jan 2018 11:08:28 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Borislav Petkov <bp@suse.de>, Ingo Molnar <mingo@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH v2 3/3] mtd: nand: davinci: Use devm_ioremap_shared_resource()
Message-ID: <20180124100828.GD19593@lenoch>
References: <20180124100604.GA19593@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180124100604.GA19593@lenoch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Simplify error handling by using devm_ioremap_shared_resource().

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 Changes:
 - v2: None

 drivers/mtd/nand/davinci_nand.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index ccc8c43abcff..9b6f06b177b9 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -612,10 +612,8 @@ static int nand_davinci_probe(struct platform_device *pdev)
 {
 	struct davinci_nand_pdata	*pdata;
 	struct davinci_nand_info	*info;
-	struct resource			*res1;
-	struct resource			*res2;
+	struct resource			*res;
 	void __iomem			*vaddr;
-	void __iomem			*base;
 	int				ret;
 	uint32_t			val;
 	struct mtd_info			*mtd;
@@ -638,14 +636,8 @@ static int nand_davinci_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, info);
 
-	res1 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	res2 = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!res1 || !res2) {
-		dev_err(&pdev->dev, "resource missing\n");
-		return -EINVAL;
-	}
-
-	vaddr = devm_ioremap_resource(&pdev->dev, res1);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	vaddr = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 
@@ -655,14 +647,12 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	 * by AEMIF, so we cannot request it twice, just ioremap.
 	 * The AEMIF and NAND drivers not use the same registers in this range.
 	 */
-	base = devm_ioremap(&pdev->dev, res2->start, resource_size(res2));
-	if (!base) {
-		dev_err(&pdev->dev, "ioremap failed for resource %pR\n", res2);
-		return -EADDRNOTAVAIL;
-	}
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	info->base = devm_ioremap_shared_resource(&pdev->dev, res);
+	if (IS_ERR(info->base))
+		return PTR_ERR(info->base);
 
 	info->dev		= &pdev->dev;
-	info->base		= base;
 	info->vaddr		= vaddr;
 
 	mtd			= nand_to_mtd(&info->chip);
-- 
2.15.1
