Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwTF-0001Qm-PJ
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:27 +0000
Received: by mail-ww0-f41.google.com with SMTP id 18so2387416wwi.0
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:25 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 24/44] mtd: cafe_nand.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:23 +0400
Message-Id: <1307453803-31950-25-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/cafe_nand.c |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 88ac4b5..db3bfac 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -57,7 +57,6 @@
 
 struct cafe_priv {
 	struct nand_chip nand;
-	struct mtd_partition *parts;
 	struct pci_dev *pdev;
 	void __iomem *mmio;
 	struct rs_control *rs;
@@ -630,8 +629,6 @@ static int __devinit cafe_nand_probe(struct pci_dev *pdev,
 	struct cafe_priv *cafe;
 	uint32_t ctrl;
 	int err = 0;
-	struct mtd_partition *parts;
-	int nr_parts;
 
 	/* Very old versions shared the same PCI ident for all three
 	   functions on the chip. Verify the class too... */
@@ -804,12 +801,8 @@ static int __devinit cafe_nand_probe(struct pci_dev *pdev,
 	mtd_device_register(mtd, NULL, 0);
 
 	mtd->name = "cafe_nand";
-	nr_parts = parse_mtd_partitions(mtd, part_probes, &parts, 0);
-	if (nr_parts > 0) {
-		cafe->parts = parts;
-		dev_info(&cafe->pdev->dev, "%d partitions found\n", nr_parts);
-		mtd_device_register(mtd, parts, nr_parts);
-	}
+	mtd_device_parse_register(mtd, part_probes, 0, NULL, 0);
+
 	goto out;
 
  out_irq:
-- 
1.7.4.4
