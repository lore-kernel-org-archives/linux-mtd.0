From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <galak@codeaurora.org>, <santosh.shilimkar@ti.com>
Subject: [PATCH v2] ARM: dts: k2hk-evm: set ubifs partition size for 512M NAND
Date: Thu, 20 Mar 2014 22:20:13 +0200
Message-ID: <1395346813-13439-1-git-send-email-ivan.khoronzhuk@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com,
 linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, m-karicheri2@ti.com, rob@landley.net,
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Murali Karicheri <m-karicheri2@ti.com>

The UBIFS partition size was incorrectly defined as for 128M NAND,
but on k2hk-evm installed NAND flash size is 512M.
Hence, correct it.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---

Just cut from series
v1:
[PATCH 1/3] ARM: dts: k2hk-evm: set ubifs partition size for 512M NAND
https://lkml.org/lkml/2014/3/20/462

 arch/arm/boot/dts/k2hk-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/k2hk-evm.dts b/arch/arm/boot/dts/k2hk-evm.dts
index 1a1335b..949ef7d 100644
--- a/arch/arm/boot/dts/k2hk-evm.dts
+++ b/arch/arm/boot/dts/k2hk-evm.dts
@@ -133,7 +133,7 @@
 
 			partition@180000 {
 				label = "ubifs";
-				reg = <0x180000 0x7E80000>;
+				reg = <0x180000 0x1fe80000>;
 			};
 		};
 	};
-- 
1.8.3.2
