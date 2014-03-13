Received: from mail-yh0-f54.google.com ([209.85.213.54])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOBU0-0004no-4N
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 19:40:07 +0000
Received: by mail-yh0-f54.google.com with SMTP id f73so1579909yha.27
 for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2014 12:39:39 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Mike Turquette <mturquette@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 5/6] ARM: mvebu: Enable NAND controller in Armada 385-DB
Date: Thu, 13 Mar 2014 16:39:01 -0300
Message-Id: <1394739542-30017-6-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1394739542-30017-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1394739542-30017-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 sergei.shtylyov@cogentembedded.com, Tawfik Bayouk <tawfik@marvell.com>,
 Andrew Lunn <andrew@lunn.ch>, Seif Mazareeb <seif@marvell.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

The Armada 385-DB board has a NAND flash, so enable it in the
devicetree and add the partitions as prepared in the factory images.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 arch/arm/boot/dts/armada-385-db.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/armada-385-db.dts b/arch/arm/boot/dts/armada-385-db.dts
index 9a13642..edcf7ff 100644
--- a/arch/arm/boot/dts/armada-385-db.dts
+++ b/arch/arm/boot/dts/armada-385-db.dts
@@ -80,6 +80,27 @@
 					reg = <1>;
 				};
 			};
+
+			flash: flash@d0000 {
+				status = "okay";
+				num-cs = <1>;
+				marvell,nand-keep-config;
+				marvell,nand-enable-arbiter;
+				nand-on-flash-bbt;
+
+				partition@0 {
+					label = "U-Boot";
+					reg = <0 0x800000>;
+				};
+				partition@800000 {
+					label = "Linux";
+					reg = <0x800000 0x800000>;
+				};
+				partition@1000000 {
+					label = "Filesystem";
+					reg = <0x1000000 0x3f000000>;
+				};
+			};
 		};
 
 		pcie-controller {
-- 
1.9.0
