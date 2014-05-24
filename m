From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH 1/2] ARM: dts: Specify the NAND ECC scheme explicitly on
 Armada 375 DB board
Date: Sat, 24 May 2014 11:17:09 -0300
Message-Id: <1400941030-2123-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1400941030-2123-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1400941030-2123-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Tawfik Bayouk <tawfik@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The factory bootloader on A375-DB boards expect the ECC strength to be
4 bits over 512 bytes. Hence, we need to specify this in the devicetree,
to prevent the kernel from assuming any different ECC scheme.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 arch/arm/boot/dts/armada-375-db.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/armada-375-db.dts b/arch/arm/boot/dts/armada-375-db.dts
index 772fec2..1e2919d 100644
--- a/arch/arm/boot/dts/armada-375-db.dts
+++ b/arch/arm/boot/dts/armada-375-db.dts
@@ -91,6 +91,8 @@
 				marvell,nand-keep-config;
 				marvell,nand-enable-arbiter;
 				nand-on-flash-bbt;
+				nand-ecc-strength = <4>;
+				nand-ecc-step-size = <512>;
 
 				partition@0 {
 					label = "U-Boot";
-- 
1.9.1
