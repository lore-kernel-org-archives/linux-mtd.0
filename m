Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VadQz-0001jt-Jz
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2013 03:24:06 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2] mtd: gpmi: add a new DT property to use the datasheet's
 minimum required ECC
Date: Mon, 28 Oct 2013 11:05:17 +0800
Message-ID: <1382929517-22606-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, Huang Shijie <b32955@freescale.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In default way, we use the ecc_strength/ecc_step size calculated by ourselves
and use all the OOB area.

This patch adds a new property : "fsl,use-minimum-ecc"

If we enable it, we will firstly try to use the datasheet's minimum required
ECC provided by the MTD layer (the ecc_strength_ds/ecc_step_ds fields
in the nand_chip{}). So we may have free space in the OOB area by using the
minimum ECC, and we may support JFFS2 with some SLC NANDs, such as Micron's
SLC NAND.

If we fail to use the minimum ECC, we will use the legacy method to calculate
the ecc_strength and ecc_step size.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
v1 --> v2:
	based on David's patch to fix the regression.
---
 .../devicetree/bindings/mtd/gpmi-nand.txt          |    6 ++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |    3 +++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
index 551b2a1..4297795 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
@@ -17,6 +17,12 @@ Required properties:
 Optional properties:
   - nand-on-flash-bbt: boolean to enable on flash bbt option if not
                        present false
+  - fsl,use-minimum-ecc: By enabling this boolean property, the gpmi will try
+                       to use the datasheet's minimum required ECC provided by
+                       the MTD layer (the ecc_strength_ds/ecc_step_ds fields
+                       in the nand_chip{}). So we may have free space in the OOB
+                       area by using the minimum ECC, and we may support JFFS2
+                       with some SLC NANDs, such as Micron's SLC NAND.
 
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 7ac2280..3ec55d0 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -352,6 +352,9 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 
 int common_nfc_set_geometry(struct gpmi_nand_data *this)
 {
+	if (of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc")
+		&& set_geometry_by_ecc_info(this))
+		return 0;
 	return legacy_set_geometry(this);
 }
 
-- 
1.7.2.rc3
