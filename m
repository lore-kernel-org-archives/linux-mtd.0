Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZdAN-00065V-VL
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 08:54:48 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: gpmi: add a new DT property to use the datasheet's
 minimum required ECC
Date: Fri, 25 Oct 2013 16:36:24 +0800
Message-ID: <1382690184-27124-1-git-send-email-b32955@freescale.com>
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

In default way, we use the ecc-strength/ecc-step-size calculated by ourselves
and use all the OOB area.

This patch adds a new property : "fsl,use-minimum-ecc"

If we enable it, we will use the datasheet's minimum required ECC provided by
the MTD layer (the ecc_strength_ds/ecc_strength_ds fields in the nand_chip{}).
So we may have free space in the OOB area by using the minimum ECC, and we may
support JFFS2 with some SLC NANDs, such as Micron's SLC NAND.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 .../devicetree/bindings/mtd/gpmi-nand.txt          |    6 ++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |    4 ++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
index 551b2a1..7a5afa8 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
@@ -17,6 +17,12 @@ Required properties:
 Optional properties:
   - nand-on-flash-bbt: boolean to enable on flash bbt option if not
                        present false
+  - fsl,use-minimum-ecc: By enabling this boolean property, the gpmi will try
+                       to use the datasheet's minimum required ECC provided by
+                       the MTD layer (the ecc_strength_ds/ecc_strength_ds fields
+                       in the nand_chip{}). So we may have free space in the OOB
+                       area by using the minimum ECC, and we may support JFFS2
+                       with some SLC NANDs, such as Micron's SLC NAND.
 
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 43a62e8..d0ae7f4 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -352,6 +352,10 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 
 int common_nfc_set_geometry(struct gpmi_nand_data *this)
 {
+	if (of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc"))
+		return set_geometry_by_ecc_info(this) ? 0 :
+						legacy_set_geometry(this);
+
 	return legacy_set_geometry(this) ?
 		(!set_geometry_by_ecc_info(this)) : 0;
 }
-- 
1.7.2.rc3
