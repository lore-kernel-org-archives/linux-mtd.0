Received: from smtp18.mail.ru ([94.100.176.155])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVnq5-0002p6-ER
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2013 18:57:46 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/7] mtd: nand-gpio: Do not override GPIOs if driver uses
 platform_data but OF is enabled in kernel config
Date: Fri, 26 Apr 2013 22:57:24 +0400
Message-Id: <1367002648-8269-3-git-send-email-shc_work@mail.ru>
In-Reply-To: <1367002648-8269-1-git-send-email-shc_work@mail.ru>
References: <1367002648-8269-1-git-send-email-shc_work@mail.ru>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/mtd/nand/gpio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 8f102d1..0d26f8b 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -151,6 +151,9 @@ static int gpio_nand_get_config_of(const struct device *dev,
 {
 	u32 val;
 
+	if (!dev->of_node)
+		return -ENODEV;
+
 	if (!of_property_read_u32(dev->of_node, "bank-width", &val)) {
 		if (val == 2) {
 			plat->options |= NAND_BUSWIDTH_16;
-- 
1.8.1.5
