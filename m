Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TyGgH-0008Do-Re
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2013 06:53:02 +0000
From: Philip Avinash <avinashphilip@ti.com>
To: <dwmw2@infradead.org>, <artem.bityutskiy@linux.intel.com>,
 <grant.likely@secretlab.ca>, <rob.herring@calxeda.com>, <rob@landley.net>
Subject: [PATCH] mtd: devices: elm: Removes <xx> literals in elm DT node
Date: Thu, 24 Jan 2013 12:23:30 +0530
Message-ID: <9580c5839ea64e09ddd61610ce922d7cd1adc861.1359010256.git.avinashphilip@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org,
 nsekhar@ti.com, linux-kernel@vger.kernel.org, hvaibhav@ti.com,
 gururaja.hebbar@ti.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As part of removing generalized dependency, replace <xx> literal fields
in DT compatible field with <52> for am335x platforms.

Signed-off-by: Philip Avinash <avinashphilip@ti.com>
---
 Documentation/devicetree/bindings/mtd/elm.txt |    2 +-
 drivers/mtd/devices/elm.c                     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/elm.txt b/Documentation/devicetree/bindings/mtd/elm.txt
index e43c668..8c1528c 100644
--- a/Documentation/devicetree/bindings/mtd/elm.txt
+++ b/Documentation/devicetree/bindings/mtd/elm.txt
@@ -10,7 +10,7 @@ Optional properties:
 
 Example:
 elm: elm@0 {
-	compatible	= "ti,am33xx-elm";
+	compatible = "ti,am3352-elm";
 	reg = <0x48080000 0x2000>;
 	interrupts = <4>;
 };
diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index f78f43f..f034239 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -381,7 +381,7 @@ static int elm_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_OF
 static const struct of_device_id elm_of_match[] = {
-	{ .compatible = "ti,am33xx-elm" },
+	{ .compatible = "ti,am3352-elm" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, elm_of_match);
-- 
1.7.9.5
