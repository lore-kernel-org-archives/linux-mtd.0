Received: from smtp41.i.mail.ru ([94.100.177.101])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZLsC-0004lw-PO
 for linux-mtd@lists.infradead.org; Mon, 06 May 2013 13:54:44 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [RESEND PATCH v2 7/7] mtd: nand-gpio: Add missing "owner" field in
 platform_driver struct
Date: Mon,  6 May 2013 17:53:54 +0400
Message-Id: <1367848434-28493-7-git-send-email-shc_work@mail.ru>
In-Reply-To: <1367848434-28493-1-git-send-email-shc_work@mail.ru>
References: <1367848434-28493-1-git-send-email-shc_work@mail.ru>
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
 drivers/mtd/nand/gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 6bf8f2e..ba62899 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -307,6 +307,7 @@ static struct platform_driver gpio_nand_driver = {
 	.remove		= gpio_nand_remove,
 	.driver		= {
 		.name	= "gpio-nand",
+		.owner	= THIS_MODULE,
 		.of_match_table = of_match_ptr(gpio_nand_id_table),
 	},
 };
-- 
1.8.1.5
