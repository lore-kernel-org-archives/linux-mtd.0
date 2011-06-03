Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSJYQ-0005kk-PS
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 01:52:03 +0000
Received: by pzk28 with SMTP id 28so913681pzk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 18:51:58 -0700 (PDT)
Subject: [PATCH 1/2] mtd: nuc900_nand: add missing nand_release in
	nuc900_nand_remove
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 09:51:53 +0800
Message-ID: <1307065913.10001.2.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Wan ZongShun <mcuos.com@gmail.com>
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
 drivers/mtd/nand/nuc900_nand.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nand.c
index 9c30a0b..fa8faed 100644
--- a/drivers/mtd/nand/nuc900_nand.c
+++ b/drivers/mtd/nand/nuc900_nand.c
@@ -339,6 +339,7 @@ static int __devexit nuc900_nand_remove(struct platform_device *pdev)
 	struct nuc900_nand *nuc900_nand = platform_get_drvdata(pdev);
 	struct resource *res;
 
+	nand_release(&nuc900_nand->mtd);
 	iounmap(nuc900_nand->reg);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
1.7.4.1
