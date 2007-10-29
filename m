Received: from [212.176.242.38] (helo=vaxon.spb.rtsoft.ru)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ImaGN-0000ga-O9
	for linux-mtd@lists.infradead.org; Mon, 29 Oct 2007 19:27:06 +0000
Date: Mon, 29 Oct 2007 23:23:59 +0300
From: Valentine Barshak <vbarshak@ru.mvista.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 3/3] PowerPC: NDFC entry for 440EPx Sequoia DTS
Message-ID: <20071029202359.GA2176@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20071029201738.GA2022@ru.mvista.com>
Cc: tglx@linutronix.de, sr@denx.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NDFC DTS entry for PowerPC 440EPx Sequoia board.

Signed-off-by: Valentine Barshak <vbarshak@ru.mvista.com>
---
 arch/powerpc/boot/dts/sequoia.dts |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+)

diff -pruN linux-2.6.orig/arch/powerpc/boot/dts/sequoia.dts linux-2.6/arch/powerpc/boot/dts/sequoia.dts
--- linux-2.6.orig/arch/powerpc/boot/dts/sequoia.dts	2007-10-29 16:02:11.000000000 +0300
+++ linux-2.6/arch/powerpc/boot/dts/sequoia.dts	2007-10-29 18:59:11.000000000 +0300
@@ -141,6 +141,29 @@
 				interrupts = <5 1>;
 				interrupt-parent = <&UIC1>;
 
+				ndfc@0,0 {
+					compatible = "ibm,ndfc-440epx", "ibm,ndfc";
+					reg = <3 000000 2000>;
+					ndfc-mtd0 {
+						bank-settings = <80002222>;
+						bank-map = <3>;
+						chip-delay = <32>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						partition@0 {
+							label = "u-boot-nand";
+							reg = <0 0080000>;
+						};
+						partition@80000 {
+							label = "kernel-nand";
+							reg = <0080000 0180000>;
+						};
+						partition@200000 {
+							label = "filesystem";
+							reg = <0200000 1e00000>;
+						};
+					};
+				};
 				nor_flash@0,0 {
 					compatible = "amd,s29gl256n", "cfi-flash";
 					bank-width = <2>;
