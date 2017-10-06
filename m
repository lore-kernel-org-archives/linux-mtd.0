Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e0aXb-0000EX-Tg
 for linux-mtd@lists.infradead.org; Fri, 06 Oct 2017 21:52:22 +0000
Received: by mail-wm0-x236.google.com with SMTP id t69so10010101wmt.2
 for <linux-mtd@lists.infradead.org>; Fri, 06 Oct 2017 14:51:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org
Subject: [PATCH] ARM: pxa: cm-x255: Fix up GPIO NAND device name in table
Date: Fri,  6 Oct 2017 23:51:44 +0200
Message-Id: <20171006215144.18039-1-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My patch set the device name wrong because I confused the
device name for a partition name. Sorry.

Cc: arm@kernel.org
Fixes: ("mtd: nand: gpio: Convert to use GPIO descriptors")
Reported-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This can be squashed into the commit or applied on top
as a fix. The original patch was ACKed by the ARM SoC
maintainers so I believe this is fine to apply.
---
 arch/arm/mach-pxa/cm-x255.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/cm-x255.c b/arch/arm/mach-pxa/cm-x255.c
index f8d67acb7194..fa8e7dd4d898 100644
--- a/arch/arm/mach-pxa/cm-x255.c
+++ b/arch/arm/mach-pxa/cm-x255.c
@@ -178,7 +178,7 @@ static inline void cmx255_init_nor(void) {}
 #if defined(CONFIG_MTD_NAND_GPIO) || defined(CONFIG_MTD_NAND_GPIO_MODULE)
 
 static struct gpiod_lookup_table cmx255_nand_gpiod_table = {
-	.dev_id         = "cmx255-nand",
+	.dev_id         = "gpio-nand",
 	.table          = {
 		GPIO_LOOKUP("gpio-pxa", GPIO_NAND_CS, "nce", GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP("gpio-pxa", GPIO_NAND_CLE, "cle", GPIO_ACTIVE_HIGH),
-- 
2.13.5
