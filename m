Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC8iu-00044C-Ny
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2018 19:40:18 +0000
Received: by mail-lj1-x241.google.com with SMTP id y71-v6so18614857lje.9
 for <linux-mtd@lists.infradead.org>; Mon, 15 Oct 2018 12:40:05 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 1/3] mtd: rawnand: Provide helper for polling GPIO R/B pin
Date: Mon, 15 Oct 2018 21:41:28 +0200
Message-Id: <20181015194130.21764-1-jmkrzyszt@gmail.com>
In-Reply-To: <20181012204101.26274-1-jmkrzyszt@gmail.com>
References: <20181012204101.26274-1-jmkrzyszt@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each controller driver having access to NAND R/B pin over GPIO would
have to reimplement the polling loop otherwise.

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changelog:
v3:
- don't surround added code with #ifdef CONFIG_GPIOLIB - sugeested by
  Boris Brezillon - thanks,
- drop inadequate comment on calling ->exec_op() recursively - catched
  by Boris Brezillon, thanks,
- drop redundant commend from header file - suggensted by Boris
  Brezillon - thanks,
- update comment on waiting for R/B pin rather than command completion
v2:
New patch - v1 consisted of only one patch reusing legacy helper

 drivers/mtd/nand/raw/nand_base.c | 31 +++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      |  4 ++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 05bd0779fe9b..0d5a2dc59b8d 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -45,6 +45,7 @@
 #include <linux/io.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
+#include <linux/gpio/consumer.h>
 
 #include "internals.h"
 
@@ -531,6 +532,36 @@ int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
 };
 EXPORT_SYMBOL_GPL(nand_soft_waitrdy);
 
+/**
+ * nand_gpio_waitrdy - Poll R/B GPIO pin until ready
+ * @chip: NAND chip structure
+ * @gpiod: GPIO descriptor of R/B pin
+ * @timeout_ms: Timeout in ms
+ *
+ * Poll the R/B GPIO pin until it becomes ready. If that does not happen
+ * whitin the specified timeout, -ETIMEDOUT is returned.
+ *
+ * This helper is intended to be used when the controller has access to the
+ * NAND R/B pin over GPIO.
+ *
+ * Return 0 if the R/B pin indicates chip is ready, a negative error otherwise.
+ */
+int nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod,
+		      unsigned long timeout_ms)
+{
+	/* Wait until R/B pin indicates chip is ready or timeout occurs */
+	timeout_ms = jiffies + msecs_to_jiffies(timeout_ms);
+	do {
+		if (gpiod_get_value_cansleep(gpiod))
+			return 0;
+
+		cond_resched();
+	} while	(time_before(jiffies, timeout_ms));
+
+	return gpiod_get_value_cansleep(gpiod) ? 0 : -ETIMEDOUT;
+};
+EXPORT_SYMBOL_GPL(nand_gpio_waitrdy);
+
 /**
  * panic_nand_get_device - [GENERIC] Get chip for selected access
  * @chip: the nand chip descriptor
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index e10b126e148f..4e91a70ede10 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1346,4 +1346,8 @@ void nand_release(struct nand_chip *chip);
  */
 int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms);
 
+struct gpio_desc;
+int nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod,
+		      unsigned long timeout_ms);
+
 #endif /* __LINUX_MTD_RAWNAND_H */
-- 
2.16.4
