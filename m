Received: from mail-lf0-x231.google.com ([2a00:1450:4010:c07::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1de6PW-0007e7-Lm
 for linux-mtd@lists.infradead.org; Sat, 05 Aug 2017 21:15:04 +0000
Received: by mail-lf0-x231.google.com with SMTP id g25so18147526lfh.1
 for <linux-mtd@lists.infradead.org>; Sat, 05 Aug 2017 14:14:41 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170805211436.181653483@cogentembedded.com>
Date: Sun, 06 Aug 2017 00:14:28 +0300
To: Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] mtd: nand: atmel: fix of_irq_get() error check
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline;
 filename=mtd-nand-atmel-fix-of_irq_get-error-check.patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

of_irq_get() may return 0 as well as negative error number on failure,
while the driver only checks for the negative values.  The driver would
then call devm_request_irq() for IRQ0  in its probe method and never get
a valid interrupt.

Check for 'nc->irq <= 0' instead and return -ENXIO from the driver's probe
iff of_irq_get() returned 0.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'master' branch of the 'linux-mtd.git' repo --
the 'nand/fixes'  branch seems too old...

 drivers/mtd/nand/atmel/nand-controller.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

Index: linux-mtd/drivers/mtd/nand/atmel/nand-controller.c
===================================================================
--- linux-mtd.orig/drivers/mtd/nand/atmel/nand-controller.c
+++ linux-mtd/drivers/mtd/nand/atmel/nand-controller.c
@@ -2078,11 +2078,11 @@ atmel_hsmc_nand_controller_legacy_init(s
 	}
 
 	nc->irq = of_irq_get(nand_np, 0);
-	if (nc->irq < 0) {
-		ret = nc->irq;
-		if (ret != -EPROBE_DEFER)
+	if (nc->irq <= 0) {
+		if (nc->irq != -EPROBE_DEFER)
 			dev_err(dev, "Failed to get IRQ number (err = %d)\n",
-				ret);
+				nc->irq);
+		ret = nc->irq ?: -ENXIO;
 		goto out;
 	}
 
@@ -2168,11 +2168,11 @@ atmel_hsmc_nand_controller_init(struct a
 
 	nc->irq = of_irq_get(np, 0);
 	of_node_put(np);
-	if (nc->irq < 0) {
+	if (nc->irq <= 0) {
 		if (nc->irq != -EPROBE_DEFER)
 			dev_err(dev, "Failed to get IRQ number (err = %d)\n",
 				nc->irq);
-		return nc->irq;
+		return nc->irq ?: -ENXIO;
 	}
 
 	np = of_parse_phandle(dev->of_node, "atmel,nfc-io", 0);
