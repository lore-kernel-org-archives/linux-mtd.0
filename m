Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1rYw-00081P-GM
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2015 08:05:55 +0000
Received: by wmww144 with SMTP id w144so10721165wmw.1
 for <linux-mtd@lists.infradead.org>; Thu, 26 Nov 2015 00:05:32 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH] mtd: spi-nor: include mtd.h header for struct mtd_info
 definition
Date: Thu, 26 Nov 2015 09:05:04 +0100
Message-Id: <1448525104-20101-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So far struct spi_nor was using just a pointer to struct mtd_info so it
wasn't needed to have it fully defined there. After recent change we
embed whole struct so we need to include a proper header.

Fixes: 1976367173a4 ("mtd: spi-nor: embed struct mtd_info within struct spi_nor")
Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 include/linux/mtd/spi-nor.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 7bed974..fac3f6f 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -12,6 +12,7 @@
 
 #include <linux/bitops.h>
 #include <linux/mtd/cfi.h>
+#include <linux/mtd/mtd.h>
 
 /*
  * Manufacturer IDs
@@ -117,8 +118,6 @@ enum spi_nor_option_flags {
 	SNOR_F_USE_FSR		= BIT(0),
 };
 
-struct mtd_info;
-
 /**
  * struct spi_nor - Structure for defining a the SPI NOR layer
  * @mtd:		point to a mtd_info structure
-- 
1.8.4.5
