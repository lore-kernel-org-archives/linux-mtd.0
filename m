Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjWlW-0002tm-Su
 for linux-mtd@lists.infradead.org; Thu, 02 Mar 2017 19:52:02 +0000
From: Alban <albeu@free.fr>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Moritz Fischer <moritz.fischer@ettus.com>, Alban <albeu@free.fr>
Subject: [PATCH 1/3] doc: bindings: Add bindings documentation for mtd nvmem
Date: Thu,  2 Mar 2017 20:50:21 +0100
Message-Id: <1488484223-844-2-git-send-email-albeu@free.fr>
In-Reply-To: <1488484223-844-1-git-send-email-albeu@free.fr>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the binding to expose MTD partitions as nvmem providers.

Signed-off-by: Alban <albeu@free.fr>
---
 .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt

diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
new file mode 100644
index 0000000..47602f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
@@ -0,0 +1,29 @@
+= NVMEM in MTD =
+
+Config data for drivers is often stored in MTD devices. This binding
+define how such data can be represented in device tree.
+
+An MTD can be defined as an NVMEM provider by adding the `nvmem-provider`
+property to their node. Data cells can then be defined as child nodes
+of the partition as defined in nvmem.txt.
+
+Example:
+
+	flash@0 {
+		...
+
+		partition@2 {
+			label = "art";
+			reg = <0x7F0000 0x010000>;
+			read-only;
+
+			nvmem-provider;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eeprom@1000 {
+				label = "wmac-eeprom";
+				reg = <0x1000 0x1000>;
+			};
+		};
+	};
-- 
2.7.4
