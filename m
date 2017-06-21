Received: from mail-qk0-f196.google.com ([209.85.220.196])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNeX0-0005Ol-1u
 for linux-mtd@lists.infradead.org; Wed, 21 Jun 2017 12:14:48 +0000
Received: by mail-qk0-f196.google.com with SMTP id 16so9795719qkg.2
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2017 05:14:25 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] dt-bindings: gpmc: Correct location of generic gpmc binding
Date: Wed, 21 Jun 2017 08:14:54 -0400
Message-Id: <1498047294-31075-1-git-send-email-trini@konsulko.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The binding bus/ti-gpmc.txt has been moved to
memory-controllers/omap-gpmc.txt.  Update all references to this in
order to make reading and understanding a given binding easier.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc:Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 Documentation/devicetree/bindings/mtd/gpmc-nand.txt    | 2 +-
 Documentation/devicetree/bindings/mtd/gpmc-nor.txt     | 4 ++--
 Documentation/devicetree/bindings/mtd/gpmc-onenand.txt | 2 +-
 Documentation/devicetree/bindings/net/gpmc-eth.txt     | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
index 174f68c26c1b..dd559045593d 100644
--- a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
@@ -5,7 +5,7 @@ the GPMC controller with a name of "nand".
 
 All timing relevant properties as well as generic gpmc child properties are
 explained in a separate documents - please refer to
-Documentation/devicetree/bindings/bus/ti-gpmc.txt
+Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 
 For NAND specific properties such as ECC modes or bus width, please refer to
 Documentation/devicetree/bindings/mtd/nand.txt
diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nor.txt b/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
index 4828c17bb784..131d3a74d0bd 100644
--- a/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmc-nor.txt
@@ -5,7 +5,7 @@ child nodes of the GPMC controller with a name of "nor".
 
 All timing relevant properties as well as generic GPMC child properties are
 explained in a separate documents. Please refer to
-Documentation/devicetree/bindings/bus/ti-gpmc.txt
+Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 
 Required properties:
 - bank-width: 		Width of NOR flash in bytes. GPMC supports 8-bit and
@@ -28,7 +28,7 @@ Required properties:
 
 Optional properties:
 - gpmc,XXX		Additional GPMC timings and settings parameters. See
-			Documentation/devicetree/bindings/bus/ti-gpmc.txt
+			Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 
 Optional properties for partition table parsing:
 - #address-cells: should be set to 1
diff --git a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
index 5d8fa527c496..b6e8bfd024f4 100644
--- a/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
@@ -5,7 +5,7 @@ the GPMC controller with a name of "onenand".
 
 All timing relevant properties as well as generic gpmc child properties are
 explained in a separate documents - please refer to
-Documentation/devicetree/bindings/bus/ti-gpmc.txt
+Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 
 Required properties:
 
diff --git a/Documentation/devicetree/bindings/net/gpmc-eth.txt b/Documentation/devicetree/bindings/net/gpmc-eth.txt
index ace4a64b3695..f7da3d73ca1b 100644
--- a/Documentation/devicetree/bindings/net/gpmc-eth.txt
+++ b/Documentation/devicetree/bindings/net/gpmc-eth.txt
@@ -9,7 +9,7 @@ the GPMC controller with an "ethernet" name.
 
 All timing relevant properties as well as generic GPMC child properties are
 explained in a separate documents. Please refer to
-Documentation/devicetree/bindings/bus/ti-gpmc.txt
+Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 
 For the properties relevant to the ethernet controller connected to the GPMC
 refer to the binding documentation of the device. For example, the documentation
@@ -43,7 +43,7 @@ Required properties:
 
 Optional properties:
 - gpmc,XXX		Additional GPMC timings and settings parameters. See
-			Documentation/devicetree/bindings/bus/ti-gpmc.txt
+			Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 
 Example:
 
-- 
1.9.1
