From: Arnaud Ebalard <arno@natisbad.org>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH 1/2] ARM: mvebu: Netgear RN104: Use Hardware BCH ECC
In-Reply-To: <cover.1410035142.git.arno@natisbad.org>
References: <cover.1410035142.git.arno@natisbad.org>
Message-Id: <920c7e7169dc6aaaa3eb4bced2336d38e77b8864.1410035142.git.arno@natisbad.org>
Date: Sat, 06 Sep 2014 22:49:25 +0200
MIME-Version: 1.0
Content-Type: text/plain
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 devicetree@vger.kernel.org, Ben Peddell <klightspeed@killerwolves.net>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


The bootloader on the Netgear ReadyNAS RN104 uses Hardware BCH
ECC (strength = 4), while the pxa3xx NAND driver by default uses
Hamming ECC (strength = 1).

This patch changes the ECC mode on these machines to match that
of the bootloader and of the stock firmware. That way, it is
now possible to update the kernel from userland (e.g. using
standard tools from mtd-utils package); u-boot will happily
load and boot it.

The issue was initially reported and fixed by Ben Pedell for
RN102. The RN104 shares the same Hynix H27U1G8F2BTR NAND
flash and setup. This patch is based on Ben's fix for RN102.

Fixes: 0373a558bd79 ("ARM: mvebu: Enable NAND controller in ReadyNAS 104 .dts file")
Depends-on: 5b3e507820c6 ("mtd: nand: pxa3xx: Use ECC strength and step size devicetree binding")
Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
---
 arch/arm/boot/dts/armada-370-netgear-rn104.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/armada-370-netgear-rn104.dts b/arch/arm/boot/dts/armada-370-netgear-rn104.dts
index f7eb110f43d4..d49e8f24a1c9 100644
--- a/arch/arm/boot/dts/armada-370-netgear-rn104.dts
+++ b/arch/arm/boot/dts/armada-370-netgear-rn104.dts
@@ -165,6 +165,10 @@
 				marvell,nand-enable-arbiter;
 				nand-on-flash-bbt;
 
+				/* Use Hardware BCH ECC */
+				nand-ecc-strength = <4>;
+				nand-ecc-step-size = <512>;
+
 				partition@0 {
 					label = "u-boot";
 					reg = <0x0000000 0x180000>;  /* 1.5MB */
-- 
2.1.0
