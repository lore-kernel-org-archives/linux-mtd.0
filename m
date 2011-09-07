From: Linus Walleij <linus.walleij@stericsson.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: drop Integrator flash map Kconfig
Date: Wed, 7 Sep 2011 09:50:29 +0200
Message-ID: <1315381829-21548-1-git-send-email-linus.walleij@stericsson.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Marc Zyngier <marc.zyngier@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Linus Walleij <linus.walleij@linaro.org>

The integrator flash has been deleted, even from the Makefile.
Drop the Kconfig entry as well.

Cc: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/maps/Kconfig |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index c0c328c..c3d02d4 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -339,10 +339,6 @@ config MTD_SOLUTIONENGINE
 	  This enables access to the flash chips on the Hitachi SolutionEngine and
 	  similar boards. Say 'Y' if you are building a kernel for such a board.
 
-config MTD_ARM_INTEGRATOR
-	tristate "CFI Flash device mapped on ARM Integrator/P720T"
-	depends on ARM && MTD_CFI
-
 config MTD_CDB89712
 	tristate "Cirrus CDB89712 evaluation board mappings"
 	depends on MTD_CFI && ARCH_CDB89712
-- 
1.7.3.2
