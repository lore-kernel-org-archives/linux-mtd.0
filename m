Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB4Ds-0001wK-MX
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2018 20:39:59 +0000
Received: by mail-lj1-x243.google.com with SMTP id v7-v6so12451211ljg.5
 for <linux-mtd@lists.infradead.org>; Fri, 12 Oct 2018 13:39:37 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v2 1/2] mtd: rawnand: Provide helper for polling GPIO R/B pin
Date: Fri, 12 Oct 2018 22:41:00 +0200
Message-Id: <20181012204101.26274-1-jmkrzyszt@gmail.com>
In-Reply-To: <20181003120028.9257-1-jmkrzyszt@gmail.com>
References: <20181003120028.9257-1-jmkrzyszt@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each controller driver with access to NAND R/B pin over GPIO would have 
to reimplement the polling loop otherwise.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
Changelog:
v2:
New patch - v1 consisted of only one patch (the followning one)


 drivers/mtd/nand/raw/nand_base.c | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      | 10 ++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 05bd0779fe9b..ff1ac4a3c647 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -45,6 +45,9 @@
 #include <linux/io.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
+#ifdef CONFIG_GPIOLIB
+#include <linux/gpio/consumer.h>
+#endif
 
 #include "internals.h"
 
@@ -531,6 +534,41 @@ int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
 };
 EXPORT_SYMBOL_GPL(nand_soft_waitrdy);
 
+#ifdef CONFIG_GPIOLIB
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
+ * Be aware that calling this helper from an ->exec_op() implementation means
+ * ->exec_op() must be re-entrant.
+ *
+ * Return 0 if the R/B pin indicates chip is ready, a negative error otherwise.
+ */
+int nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod,
+		      unsigned long timeout_ms)
+{
+	/* Wait until command is processed or timeout occurs */
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
+#endif
+
 /**
  * panic_nand_get_device - [GENERIC] Get chip for selected access
  * @chip: the nand chip descriptor
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index e10b126e148f..09f0ed1345b1 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1346,4 +1346,14 @@ void nand_release(struct nand_chip *chip);
  */
 int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms);
 
+#ifdef CONFIG_GPIOLIB
+struct gpio_desc;
+/*
+ * External helper for controller drivers that have to implement the WAITRDY
+ * instruction and do have GPIO pin to check it.
+ */
+int nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod,
+		      unsigned long timeout_ms);
+#endif
+
 #endif /* __LINUX_MTD_RAWNAND_H */
-- 
2.16.4
