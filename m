Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQ1KK-00043K-JC
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 22:50:25 +0000
Received: by paccq16 with SMTP id cq16so2793310pac.1
 for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2015 15:50:03 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Joachim Eastwood <manabian@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Han Xu <han.xu@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [RFT PATCH 3/4] mtd: spi-nor: add forward declaration for mtd_info
Date: Thu, 13 Aug 2015 15:46:04 -0700
Message-Id: <1439505965-134748-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
References: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This header can't actually stand alone, as it relies on the declaration
(but not definition) of struct mtd_info. Let's fix that.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/spi-nor.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index e5409524bb0a..85a24baea093 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -127,6 +127,8 @@ enum spi_nor_option_flags {
 	SNOR_F_USE_FSR		= BIT(0),
 };
 
+struct mtd_info;
+
 /**
  * struct spi_nor - Structure for defining a the SPI NOR layer
  * @mtd:		point to a mtd_info structure
-- 
2.5.0.276.gf5e568e
