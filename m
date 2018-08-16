Received: from mta-01.yadro.com ([89.207.88.251])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqFsN-0007dk-6x
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2018 10:51:36 +0000
From: Alexander Soldatov <a.soldatov@yadro.com>
To: <linux-mtd@lists.infradead.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
CC: Alexander Soldatov <a.soldatov@yadro.com>, <stable@vger.kernel.org>
Subject: [PATCH linux dev-4.17 2/2] mtd: spi-nor: fix spi register address for
 AST2400
Date: Thu, 16 Aug 2018 13:40:55 +0300
Message-ID: <1534416055-23939-2-git-send-email-a.soldatov@yadro.com>
In-Reply-To: <1534416055-23939-1-git-send-email-a.soldatov@yadro.com>
References: <1534416055-23939-1-git-send-email-a.soldatov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According to AST2400 datasheet v1.4 the SPI Flash Read Timing
Setting register is at offset 0x14. There is no register at
offset 0x94 (unlike FMC controller and AST2500).

Cc: stable@vger.kernel.org
Fixes: aad58eba7209 ("mtd: spi-nor: aspeed: optimize read mode")
Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index c9cd20f199d9..9ddf24b042f1 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -71,7 +71,7 @@ static const struct aspeed_smc_info spi_2400_info = {
 	.hastype = false,
 	.we0 = 0,
 	.ctl0 = 0x04,
-	.timing = 0x94,
+	.timing = 0x14,
 	.set_4b = aspeed_smc_chip_set_4b_spi_2400,
 	.optimize_read = aspeed_smc_optimize_read,
 };
-- 
2.7.4
