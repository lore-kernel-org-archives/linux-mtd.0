Received: from hauke-m.de ([5.39.93.123] helo=mail.hauke-m.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQhBK-0000dQ-HO
 for linux-mtd@lists.infradead.org; Thu, 29 Jun 2017 21:41:00 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: ralf@linux-mips.org
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 martin.blumenstingl@googlemail.com, john@phrozen.org,
 linux-spi@vger.kernel.org, hauke.mehrtens@intel.com, robh@kernel.org,
 andy.shevchenko@gmail.com, p.zabel@pengutronix.de,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v6 05/16] watchdog: lantiq: add device tree binding
 documentation
Date: Thu, 29 Jun 2017 23:39:40 +0200
Message-Id: <20170629213951.31176-6-hauke@hauke-m.de>
In-Reply-To: <20170629213951.31176-1-hauke@hauke-m.de>
References: <20170629213951.31176-1-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The binding was not documented before, add the documentation now.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 .../devicetree/bindings/watchdog/lantiq-wdt.txt    | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt b/Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt
new file mode 100644
index 000000000000..c3967feebb6c
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt
@@ -0,0 +1,24 @@
+Lantiq WTD watchdog binding
+============================
+
+This describes the binding of the Lantiq watchdog driver.
+
+-------------------------------------------------------------------------------
+Required properties:
+- compatible		: Should be one of
+				"lantiq,wdt"
+				"lantiq,xrx100-wdt"
+				"lantiq,xrx200-wdt"
+				"lantiq,falcon-wdt"
+- lantiq,rcu		: A phandle to the RCU syscon (required for
+			  "lantiq,falcon-wdt", "lantiq,xrx200-wdt" and
+			  "lantiq,xrx100-wdt")
+
+-------------------------------------------------------------------------------
+Example for the watchdog on the xRX200 SoCs:
+		watchdog@803f0 {
+			compatible = "lantiq,xrx200-wdt", "lantiq,xrx100-wdt";
+			reg = <0x803f0 0x10>;
+
+			lantiq,rcu = <&rcu0>;
+		};
-- 
2.11.0
