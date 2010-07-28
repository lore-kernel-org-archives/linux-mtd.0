MIME-Version: 1.0
Date: Wed, 28 Jul 2010 13:57:44 +0800
Message-ID: <AANLkTin4vm2oxiRv=Zuoujdk9G8ojmsDgmiJKNWkv1Cg@mail.gmail.com>
Subject: [PATCH 17/29] mmp: correct nand clock setting for pxa168 and pxa910
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	David Woodhouse <david.woodhouse@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-mtd@lists.infradead.org,
	Lei Wen <leiwen@marvell.com>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 6fcc38f6e3429ed972b2a45856d70b8e69db8f35 Mon Sep 17 00:00:00 2001
From: Lei Wen <leiwen@marvell.com>
Date: Thu, 3 Jun 2010 15:46:50 +0800
Subject: [PATCH 17/29] mmp: correct nand clock setting for pxa168 and pxa910

There is no clock setting at 208Mhz for nand on pxa168 and pxa910
platform. Set correct register and lock the clock at
156MHZ.

Signed-off-by: Lei Wen <leiwen@marvell.com>
---
 arch/arm/mach-mmp/pxa168.c |    2 +-
 arch/arm/mach-mmp/pxa910.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-mmp/pxa168.c b/arch/arm/mach-mmp/pxa168.c
index 652ae66..70d2231 100644
--- a/arch/arm/mach-mmp/pxa168.c
+++ b/arch/arm/mach-mmp/pxa168.c
@@ -78,7 +78,7 @@ static APBC_CLK(ssp3, PXA168_SSP3, 4, 0);
 static APBC_CLK(ssp4, PXA168_SSP4, 4, 0);
 static APBC_CLK(ssp5, PXA168_SSP5, 4, 0);

-static APMU_CLK(nand, NAND, 0x01db, 208000000);
+static APMU_CLK(nand, NAND, 0x19B, 156000000);

 /* device and clock bindings */
 static struct clk_lookup pxa168_clkregs[] = {
diff --git a/arch/arm/mach-mmp/pxa910.c b/arch/arm/mach-mmp/pxa910.c
index 46f2d69..96f2b61 100644
--- a/arch/arm/mach-mmp/pxa910.c
+++ b/arch/arm/mach-mmp/pxa910.c
@@ -110,7 +110,7 @@ static APBC_CLK(pwm2, PXA910_PWM2, 1, 13000000);
 static APBC_CLK(pwm3, PXA910_PWM3, 1, 13000000);
 static APBC_CLK(pwm4, PXA910_PWM4, 1, 13000000);

-static APMU_CLK(nand, NAND, 0x01db, 208000000);
+static APMU_CLK(nand, NAND, 0x19B, 156000000);

 /* device and clock bindings */
 static struct clk_lookup pxa910_clkregs[] = {
-- 
1.7.0.4
