Received: from gateway31.websitewelcome.com ([192.185.143.43])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dTNF1-0004ZG-C7
 for linux-mtd@lists.infradead.org; Fri, 07 Jul 2017 06:59:53 +0000
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway31.websitewelcome.com (Postfix) with ESMTP id 299A019BC0
 for <linux-mtd@lists.infradead.org>; Fri,  7 Jul 2017 01:59:27 -0500 (CDT)
Date: Fri, 7 Jul 2017 01:59:26 -0500
From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
To: Stefan Agner <stefan@agner.ch>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] mtd: nand: vf610_nfc: add NULL check on of_match_device()
 return value
Message-ID: <20170707065926.GA25776@embeddedgus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Check return value from call to of_match_device()
in order to prevent a NULL pointer dereference.

In case of NULL print error message and return -ENODEV

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/mtd/nand/vf610_nfc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index 744ab10..ca0ab96 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -674,6 +674,11 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	}
 
 	of_id = of_match_device(vf610_nfc_dt_ids, &pdev->dev);
+	if (!of_id) {
+		dev_err(&pdev->dev, "Failed to match device!\n");
+		return -ENODEV;
+	}
+
 	nfc->variant = (enum vf610_nfc_variant)of_id->data;
 
 	for_each_available_child_of_node(nfc->dev->of_node, child) {
-- 
2.5.0
