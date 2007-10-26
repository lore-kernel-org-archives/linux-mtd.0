Received: from [212.176.242.38] (helo=vaxon.spb.rtsoft.ru)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IlSHq-0005nC-R3
	for linux-mtd@lists.infradead.org; Fri, 26 Oct 2007 17:43:57 +0100
Date: Fri, 26 Oct 2007 20:41:30 +0400
From: Valentine Barshak <vbarshak@ru.mvista.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 2/2] PowerPC: NDFC entry for PowerPC 440EPx Sequoia DTS
Message-ID: <20071026164130.GA11812@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20071026163058.GA11354@ru.mvista.com>
Cc: tglx@linutronix.de, sr@denx.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NDFC (NAND Flash Controller) DTS entry for PowerPC 440EPx Sequoia board.
The NDFC is relocatable in EBC space.

Signed-off-by: Valentine Barshak <vbarshak@ru.mvista.com>
---
 arch/powerpc/boot/dts/sequoia.dts |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+)

diff -pruN linux-2.6.orig/arch/powerpc/boot/dts/sequoia.dts linux-2.6.bld/arch/powerpc/boot/dts/sequoia.dts
--- linux-2.6.orig/arch/powerpc/boot/dts/sequoia.dts	2007-10-22 18:33:07.000000000 +0400
+++ linux-2.6.bld/arch/powerpc/boot/dts/sequoia.dts	2007-10-22 22:19:42.000000000 +0400
 		POB0: opb {
 		  	compatible = "ibm,opb-440epx", "ibm,opb";
 			#address-cells = <1>;
@@ -141,6 +148,26 @@
 				interrupts = <5 1>;
 				interrupt-parent = <&UIC1>;
 
+				ndfc@0,0 {
+					compatible = "ibm,ndfc-440epx", "ibm,ndfc";
+					reg = <3 000000 2000>;
+					bank-width = <1>;
+					bank-mask = <8>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					partition@0 {
+						label = "u-boot-nand";
+						reg = <0 0080000>;
+					};
+					partition@80000 {
+						label = "kernel-nand";
+						reg = <0080000 0180000>;
+					};
+					partition@200000 {
+						label = "filesystem";
+						reg = <0200000 1e00000>;
+					};
+				};
 				nor_flash@0,0 {
 					compatible = "amd,s29gl256n", "cfi-flash";
 					bank-width = <2>;
