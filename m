Received: from eu1sys200aog109.obsmtp.com ([207.126.144.127])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SB0MY-0000kj-DZ
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2012 09:00:50 +0000
From: Viresh Kumar <viresh.kumar@st.com>
To: <sr@denx.de>, <artem.bityutskiy@linux.intel.com>
Subject: [PATCH] mtd: fsmc-nand: Update compatible property
Date: Fri, 23 Mar 2012 14:15:32 +0530
Message-ID: <2667979af077daa0f1bff81db7e25f5c8157b4bc.1332492218.git.viresh.kumar@st.com>
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

FSMC NAND driver can verify device version by itself and so we wouldn't be
required to have separate .compatible entries for different SPEAr SoCs.

Thus this patch updates compatible entry to: "st,spear-fsmc-nand", so that it
works for all SPEAr machines.

Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
---
 .../devicetree/bindings/mtd/fsmc-nand.txt          |    4 ++--
 drivers/mtd/nand/fsmc_nand.c                       |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
index e2c663b..7551600 100644
--- a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
@@ -1,7 +1,7 @@
 * FSMC NAND
 
 Required properties:
-- compatible : "st,spear600-fsmc-nand"
+- compatible : "st,spear-fsmc-nand"
 - reg : Address range of the mtd chip
 - reg-names: Should contain the reg names "fsmc_regs" and "nand_data"
 - st,ale-off : Chip specific offset to ALE
@@ -15,7 +15,7 @@ Optional properties:
 Example:
 
 	fsmc: flash@d1800000 {
-		compatible = "st,spear600-fsmc-nand";
+		compatible = "st,spear-fsmc-nand";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		reg = <0xd1800000 0x1000	/* FSMC Register */
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 1b8330e..ecb103e 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1231,7 +1231,7 @@ static SIMPLE_DEV_PM_OPS(fsmc_nand_pm_ops, fsmc_nand_suspend, fsmc_nand_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id fsmc_nand_id_table[] = {
-	{ .compatible = "st,spear600-fsmc-nand" },
+	{ .compatible = "st,spear-fsmc-nand" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsmc_nand_id_table);
-- 
1.7.8.110.g4cb5d
