Received: from gateway33.websitewelcome.com ([192.185.146.82])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dTFDy-00019F-Iu
 for linux-mtd@lists.infradead.org; Thu, 06 Jul 2017 22:26:31 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id 356747E554
 for <linux-mtd@lists.infradead.org>; Thu,  6 Jul 2017 17:25:51 -0500 (CDT)
Date: Thu, 6 Jul 2017 17:25:50 -0500
From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] mtd: spear_smi: add NULL check on devm_kzalloc() return value
Message-ID: <20170706222550.GA30998@embeddedgus>
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

Check return value from call to devm_kzalloc()
in order to prevent a NULL pointer dereference.

This issue was detected using Coccinelle and the following semantic patch:

@@
expression x;
identifier fld;
@@

* x = devm_kzalloc(...);
  ... when != x == NULL
  x->fld

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/mtd/devices/spear_smi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index dd50698..ddf4789 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -775,6 +775,8 @@ static int spear_smi_probe_config_dt(struct platform_device *pdev,
 	pdata->board_flash_info = devm_kzalloc(&pdev->dev,
 					       sizeof(*pdata->board_flash_info),
 					       GFP_KERNEL);
+	if (!pdata->board_flash_info)
+		return -ENOMEM;
 
 	/* Fill structs for each subnode (flash device) */
 	while ((pp = of_get_next_child(np, pp))) {
-- 
2.5.0
