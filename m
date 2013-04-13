Received: from smtp37.i.mail.ru ([94.100.177.97])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQuY9-0000pN-Gh
 for linux-mtd@lists.infradead.org; Sat, 13 Apr 2013 07:07:05 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/5] mtd: nand-gpio: Do not override GPIOs if driver uses
 platform_data but OF is enabled in kernel config
Date: Sat, 13 Apr 2013 11:06:38 +0400
Message-Id: <1365836798-29035-5-git-send-email-shc_work@mail.ru>
In-Reply-To: <1365836798-29035-1-git-send-email-shc_work@mail.ru>
References: <1365836798-29035-1-git-send-email-shc_work@mail.ru>
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
index 16b8eeb..ea8adb5 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -105,6 +105,9 @@ static int gpio_nand_get_config_of(const struct device *dev,
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
