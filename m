Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QROsc-00072R-42
	for linux-mtd@lists.infradead.org; Tue, 31 May 2011 13:21:07 +0000
Received: by pvh11 with SMTP id 11so2428865pvh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 May 2011 06:21:03 -0700 (PDT)
Subject: [PATCH] mtd: OneNAND: OMAP2: Return proper error if regulator_get
	fails
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 31 May 2011 21:20:53 +0800
Message-ID: <1306848053.13412.1.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/mtd/onenand/omap2.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index a916dec..0d9073d 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -741,6 +741,7 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 		c->regulator = regulator_get(&pdev->dev, "vonenand");
 		if (IS_ERR(c->regulator)) {
 			dev_err(&pdev->dev,  "Failed to get regulator\n");
+			r = PTR_ERR(c->regulator);
 			goto err_release_dma;
 		}
 		c->onenand.enable = omap2_onenand_enable;
-- 
1.7.4.1
