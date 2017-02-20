From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] mtd: nand: atmel: Add PM ops
Date: Mon, 20 Feb 2017 18:16:18 +0100
Message-Id: <1487610978-12423-7-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1487610978-12423-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1487610978-12423-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Provide a ->resume() hook to make sure the NAND timings are correctly
restored by resetting all chips connected to the controller.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/atmel/nand-controller.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
index ae46ef711d67..cd107e6edcbc 100644
--- a/drivers/mtd/nand/atmel/nand-controller.c
+++ b/drivers/mtd/nand/atmel/nand-controller.c
@@ -2575,6 +2575,24 @@ static int atmel_nand_controller_remove(struct platform_device *pdev)
 	return nc->caps->ops->remove(nc);
 }
 
+static int atmel_nand_controller_resume(struct device *dev)
+{
+	struct atmel_nand_controller *nc = dev_get_drvdata(dev);
+	struct atmel_nand *nand;
+
+	list_for_each_entry(nand, &nc->chips, node) {
+		int i;
+
+		for (i = 0; i < nand->numcs; i++)
+			nand_reset(&nand->base, i);
+	}
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(atmel_nand_controller_pm_ops, NULL,
+			 atmel_nand_controller_resume);
+
 static struct platform_driver atmel_nand_controller_driver = {
 	.driver = {
 		.name = "atmel-nand-controller",
-- 
2.7.4
