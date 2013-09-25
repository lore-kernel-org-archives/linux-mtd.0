Received: from mail-ee0-f54.google.com ([74.125.83.54])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOpx8-000248-9U
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 14:20:30 +0000
Received: by mail-ee0-f54.google.com with SMTP id e53so3249740eek.13
 for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2013 07:20:08 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: pxa3xx_nand: fix compilation error
Date: Wed, 25 Sep 2013 16:19:54 +0200
Message-Id: <1380118794-846-1-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <David.Woodhouse@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org,
 Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When building the pxa3xx defconfig without device tree support
(i.e. the pxa3xx_defconfig) the build fails like this:

drivers/mtd/nand/pxa3xx_nand.c: In function ‘pxa3xx_nand_probe’:
drivers/mtd/nand/pxa3xx_nand.c:1325:2: error: implicit declaration of function ‘pxa3xx_nand_get_variant’ [-Werror=implicit-function-declaration]
  info->variant = pxa3xx_nand_get_variant(pdev);
  ^
cc1: some warnings being treated as errors
make[5]: *** [drivers/mtd/nand/pxa3xx_nand.o] Error 1
make[4]: *** [drivers/mtd/nand] Error 2
make[4]: *** Waiting for unfinished jobs....

Fix it up by returning the PXA variant on non-DT boots.

This appears to have been broken since
commit c0f3b8643a6fa2461d70760ec49d21d2b031d611
"mtd: nand: pxa3xx: Introduce 'marvell,armada370-nand' compatible string"

Cc: stable@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Daniel Mack <zonque@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/nand/pxa3xx_nand.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 5db900d..e7a403f 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1285,6 +1285,12 @@ static int pxa3xx_nand_probe_dt(struct platform_device *pdev)
 	return 0;
 }
 #else
+static enum pxa3xx_nand_variant
+pxa3xx_nand_get_variant(struct platform_device *pdev)
+{
+	return PXA3XX_NAND_VARIANT_PXA;
+}
+
 static inline int pxa3xx_nand_probe_dt(struct platform_device *pdev)
 {
 	return 0;
-- 
1.8.3.1
