Received: from eu1sys200aog119.obsmtp.com ([207.126.144.147])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SB0Ov-0000qL-4P
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2012 09:03:18 +0000
From: Viresh Kumar <viresh.kumar@st.com>
To: <sr@denx.de>, <artem.bityutskiy@linux.intel.com>
Subject: [PATCH] mtd: spear-smi: Update compatible property
Date: Fri, 23 Mar 2012 14:18:07 +0530
Message-ID: <97859bb4d86d008968a784339be8567094c487a1.1332492461.git.viresh.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, Viresh Kumar <viresh.kumar@st.com>,
 spear-devel@list.st.com, viresh.linux@gmail.com, devicetree-discuss@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SPEAr SMI controller version is same for all SPEAr machines. Thus we don't need
per machine compatible property in driver.

Thus this patch updates compatible entry to: "st,spear-smi", so that it
works for all SPEAr machines.

Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
---
 .../devicetree/bindings/mtd/spear_smi.txt          |    4 ++--
 drivers/mtd/devices/spear_smi.c                    |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/spear_smi.txt b/Documentation/devicetree/bindings/mtd/spear_smi.txt
index 7248aad..80dfd96 100644
--- a/Documentation/devicetree/bindings/mtd/spear_smi.txt
+++ b/Documentation/devicetree/bindings/mtd/spear_smi.txt
@@ -1,7 +1,7 @@
 * SPEAr SMI
 
 Required properties:
-- compatible : "st,spear600-smi"
+- compatible : "st,spear-smi"
 - reg : Address range of the mtd chip
 - #address-cells, #size-cells : Must be present if the device has sub-nodes
   representing partitions.
@@ -16,7 +16,7 @@ Optional properties:
 Example:
 
 	smi: flash@fc000000 {
-		compatible = "st,spear600-smi";
+		compatible = "st,spear-smi";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		reg = <0xfc000000 0x1000>;
diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index bebce11..f392594 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -1113,7 +1113,7 @@ int spear_smi_resume(struct platform_device *pdev)
 
 #ifdef CONFIG_OF
 static const struct of_device_id spear_smi_id_table[] = {
-	{ .compatible = "st,spear600-smi" },
+	{ .compatible = "st,spear-smi" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, spear_smi_id_table);
-- 
1.7.8.110.g4cb5d
