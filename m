Received: from mail.karo-electronics.de ([81.173.242.67])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6x2V-0004oP-RM
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 06:16:09 +0000
From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH/RESEND 2/2] mtd: nand: gpmi-nand: use more sensible error
 codes at various places
Date: Wed,  7 Aug 2013 08:15:38 +0200
Message-Id: <1375856138-3698-3-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1375802039.30770.153.camel@sauron.fi.intel.com>
References: <1375802039.30770.153.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Huang Shijie <b32955@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Acked-by: Huang Shijie <b32955@freescale.com>
Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 4f7ec59..9a47189 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -355,7 +355,7 @@ static int acquire_register_block(struct gpmi_nand_data *this,
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res_name);
 	if (!r) {
 		pr_err("Can't get resource for %s\n", res_name);
-		return -ENXIO;
+		return -ENODEV;
 	}
 
 	p = ioremap(r->start, resource_size(r));
@@ -396,7 +396,7 @@ static int acquire_bch_irq(struct gpmi_nand_data *this, irq_handler_t irq_h)
 	r = platform_get_resource_byname(pdev, IORESOURCE_IRQ, res_name);
 	if (!r) {
 		pr_err("Can't get resource for %s\n", res_name);
-		return -ENXIO;
+		return -ENODEV;
 	}
 
 	err = request_irq(r->start, irq_h, 0, res_name, this);
@@ -1597,7 +1597,7 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 		pdev->id_entry = of_id->data;
 	} else {
 		pr_err("Failed to find the right device id.\n");
-		return -ENOMEM;
+		return -ENODEV;
 	}
 
 	this = kzalloc(sizeof(*this), GFP_KERNEL);
-- 
1.7.2.5
