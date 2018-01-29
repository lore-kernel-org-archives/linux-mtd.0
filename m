Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1egAgD-0007iv-2U
 for linux-mtd@lists.infradead.org; Mon, 29 Jan 2018 14:45:07 +0000
From: Stefan Agner <stefan@agner.ch>
To: han.xu@nxp.com,
	boris.brezillon@free-electrons.com
Cc: marek.vasut@gmail.com, richard@nod.at, dwmw2@infradead.org,
 cyrille.pitchen@wedev4u.fr, max.oss.09@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>
Subject: [PATCH] mtd: nand: gpmi: fall back to legacy mode if no ECC
 information present
Date: Mon, 29 Jan 2018 15:44:40 +0100
Message-Id: <20180129144440.13648-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In case fsl,use-minimum-ecc is set, the driver tries to determine
ECC layout by using the ECC information provided by the MTD stack.
However, in case the NAND chip does not provide any information,
the driver currently fails with:
  nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xf1
  nand: Macronix NAND 128MiB 3,3V 8-bit
  nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
  gpmi-nand 1806000.gpmi-nand: Error setting BCH geometry : 1
  gpmi-nand: probe of 1806000.gpmi-nand failed with error 1

Fall back to implementation specific default mode if no ECC
information are provided by the NAND chip and fsl,use-minimum-ecc
is specified.

This is more in line with what the device tree binding documentation
promises:
  "However, note that if this strength is not
  discoverable or this property is not enabled,
  the software may chooses an implementation-defined
  ECC scheme."

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 50f8d4a1b983..7b8e8c629081 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -206,7 +206,7 @@ static int set_geometry_by_ecc_info(struct gpmi_nand_data *this)
 	unsigned int block_mark_bit_offset;
 
 	if (!(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0))
-		return -EINVAL;
+		return -ENOTSUPP;
 
 	switch (chip->ecc_step_ds) {
 	case SZ_512:
@@ -423,11 +423,15 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 
 int common_nfc_set_geometry(struct gpmi_nand_data *this)
 {
-	if ((of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc"))
-				|| legacy_set_geometry(this))
-		return set_geometry_by_ecc_info(this);
+	int ret = -ENOTSUPP;
 
-	return 0;
+	if (of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc"))
+		ret = set_geometry_by_ecc_info(this);
+
+	if (ret == -ENOTSUPP)
+		return legacy_set_geometry(this);
+
+	return ret;
 }
 
 struct dma_chan *get_dma_chan(struct gpmi_nand_data *this)
-- 
2.16.1
