Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYQX2-0000TW-Fe
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2015 02:50:01 +0000
Received: by pdnc3 with SMTP id c3so61716574pdn.0
 for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2015 19:49:39 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 2/4] Documentation: devicetree: add binding doc for
 Broadcom NAND controller
Date: Wed, 18 Mar 2015 19:49:16 -0700
Message-Id: <1426733358-15596-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1426733358-15596-1-git-send-email-computersforpeace@gmail.com>
References: <1426733358-15596-1-git-send-email-computersforpeace@gmail.com>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 .../devicetree/bindings/mtd/brcm,brcmstb-nand.txt  | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/brcm,brcmstb-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmstb-nand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmstb-nand.txt
new file mode 100644
index 000000000000..933d44943cbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmstb-nand.txt
@@ -0,0 +1,109 @@
+* Broadcom STB NAND Controller
+
+The Broadcom Set-Top Box NAND controller supports low-level access to raw NAND
+flash chips. It has a memory-mapped register interface for both control
+registers and for its data input/output buffer. On some SoCs, this controller is
+paired with a custom DMA engine (inventively named "Flash DMA") which supports
+basic PROGRAM and READ functions, among other features.
+
+This controller was originally designed for STB SoCs (BCM7xxx) but is now
+available on a variety of Broadcom SoCs, including some BCM3xxx, BCM63xx, and
+iProc/Cygnus. Its history includes several similar (but not fully register
+compatible) versions.
+
+Required properties:
+- compatible       : should contain "brcm,brcmnand" and an appropriate version
+                      compatibility string, like "brcm,brcmnand-v7.0"
+                      Possible values:
+                         brcm,brcmnand-v4.0
+                         brcm,brcmnand-v5.0
+                         brcm,brcmnand-v6.0
+                         brcm,brcmnand-v7.0
+                         brcm,brcmnand-v7.1
+                         brcm,brcmnand
+- reg              : the register start and length for NAND register region.
+                     (optional) Flash DMA register range (if present)
+                     (optional) NAND flash cache range (if at non-standard offset)
+- reg-names        : a list of the names corresponding to the previous register
+                     ranges. Should contain "nand" and (optionally)
+                     "flash-dma" and/or "nand-cache".
+- interrupts       : The NAND CTLRDY interrupt and (if Flash DMA is available)
+                     FLASH_DMA_DONE
+- interrupt-names  : May be "nand_ctlrdy" or "flash_dma_done"
+- interrupt-parent : See standard interrupt bindings
+- #address-cells   : <1> - subnodes give the chip-select number
+- #size-cells      : <0>
+
+Optional properties:
+- brcm,nand-has-wp          : Some versions of this IP include a write-protect
+                              (WP) control bit. It is always available on >=
+                              v7.0. Use this property to describe the rare
+                              earlier versions of this core that include WP
+
+* NAND chip-select
+
+Each controller (compatible: "brcm,brcmnand") may contain one or more subnodes
+to represent enabled chip-selects which (may) contain NAND flash chips. Their
+properties are as follows.
+
+Required properties:
+- compatible                : should contain "brcm,nandcs"
+- reg                       : a single integer representing the chip-select
+                              number (e.g., 0, 1, 2, etc.)
+- #address-cells            : see partition.txt
+- #size-cells               : see partition.txt
+- nand-ecc-strength         : see nand.txt
+- nand-ecc-step-size        : must be 512 or 1024. See nand.txt
+
+Optional properties:
+- nand-on-flash-bbt         : boolean, to enable the on-flash BBT for this
+                              chip-select. See nand.txt
+- brcm,nand-oob-sector-size : integer, to denote the spare area sector size
+                              expected for the ECC layout in use. This size, in
+                              addition to the strength and step-size,
+                              determines how the hardware BCH engine will lay
+                              out the parity bytes it stores on the flash.
+                              This property can be automatically determined by
+                              the flash geometry (particularly the NAND page
+                              and OOB size) in many cases, but when booting
+                              from NAND, the boot controller has only a limited
+                              number of available options for its default ECC
+                              layout.
+
+Each nandcs device node may optionally contain sub-nodes describing the flash
+partition mapping. See partition.txt for more detail.
+
+Example:
+
+nand@f0442800 {
+	compatible = "brcm,brcmnand-v7.0", "brcm,brcmnand";
+	reg = <0xF0442800 0x600>,
+	      <0xF0443000 0x100>;
+	reg-names = "nand", "flash-dma";
+	interrupt-parent = <&hif_intr2_intc>;
+	interrupts = <24>, <4>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	nandcs@1 {
+		compatible = "brcm,nandcs";
+		reg = <1>; // Chip select 1
+		nand-on-flash-bbt;
+		nand-ecc-strength = <12>;
+		nand-ecc-step-size = <512>;
+
+		// Partitions
+		#address-cells = <1>;  // <2>, for 64-bit offset
+		#size-cells = <1>;     // <2>, for 64-bit length
+		flash0.rootfs@0 {
+			reg = <0 0x10000000>;
+		};
+		flash0@0 {
+			reg = <0 0>; // MTDPART_SIZ_FULL
+		};
+		flash0.kernel@10000000 {
+			reg = <0x10000000 0x400000>;
+		};
+	};
+};
-- 
1.9.1
