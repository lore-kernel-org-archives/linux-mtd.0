Received: from mo-p05-ob.rzone.de ([81.169.146.180])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LuQQt-0006Bp-JU
	for linux-mtd@lists.infradead.org; Thu, 16 Apr 2009 12:11:14 +0000
From: Stefan Roese <sr@denx.de>
To: linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 3/3 v3] mtd/powerpc: Describe multiple "reg" tuples usage
Date: Thu, 16 Apr 2009 14:11:05 +0200
Message-Id: <1239883865-17915-1-git-send-email-sr@denx.de>
Cc: grant.likely@secretlab.ca, devicetree-discuss@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Stefan Roese <sr@denx.de>
CC: Grant Likely <grant.likely@secretlab.ca>
---
Changes in ver3:
- Removed reference to Intel P30 parts
- Added exact chip compatible property for best practice.

 Documentation/powerpc/dts-bindings/mtd-physmap.txt |   19 ++++++++++++++++++-
 1 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/Documentation/powerpc/dts-bindings/mtd-physmap.txt b/Documentation/powerpc/dts-bindings/mtd-physmap.txt
index cd474f9..667c9bd 100644
--- a/Documentation/powerpc/dts-bindings/mtd-physmap.txt
+++ b/Documentation/powerpc/dts-bindings/mtd-physmap.txt
@@ -5,7 +5,9 @@ file systems on embedded devices.
 
  - compatible : should contain the specific model of flash chip(s)
    used, if known, followed by either "cfi-flash" or "jedec-flash"
- - reg : Address range of the flash chip
+ - reg : Address range(s) of the flash chip(s)
+   It's possible to (optionally) define multiple "reg" tuples so that
+   non-identical NOR chips can be described in one flash node.
  - bank-width : Width (in bytes) of the flash bank.  Equal to the
    device width times the number of interleaved chips.
  - device-width : (optional) Width of a single flash chip.  If
@@ -61,3 +63,18 @@ Example:
 			read-only;
 		};
 	};
+
+Here an example with multiple "reg" tuples:
+
+	flash@f0000000,0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "intel,PC48F4400P0VB", "cfi-flash";
+		reg = <0 0x00000000 0x02000000
+		       0 0x02000000 0x02000000>;
+		bank-width = <2>;
+		partition@0 {
+			label = "test-part1";
+			reg = <0 0x04000000>;
+		};
+	};
-- 
1.6.2.3
