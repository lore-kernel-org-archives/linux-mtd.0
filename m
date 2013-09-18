From: Josh Wu <josh.wu@atmel.com>
To: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <computersforpeace@gmail.com>
Subject: [PATCH v2 2/2] mtd: atmel_nand: add MODULE_DEVICE_TABLE for nfc driver
Date: Wed, 18 Sep 2013 11:31:20 +0800
Message-ID: <1379475080-14984-2-git-send-email-josh.wu@atmel.com>
In-Reply-To: <1379475080-14984-1-git-send-email-josh.wu@atmel.com>
References: <1379475080-14984-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: nicolas.ferre@atmel.com, Josh Wu <josh.wu@atmel.com>, plagnioj@jcrosoft.com,
 ezequiel.garcia@free-electrons.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch also add a const keyword for the of_device_id of nfc.

Signed-off-by: Josh Wu <josh.wu@atmel.com>
Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/atmel_nand.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 72c2611..5a5d457 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -2244,10 +2244,11 @@ static int atmel_nand_nfc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static struct of_device_id atmel_nand_nfc_match[] = {
+static const struct of_device_id atmel_nand_nfc_match[] = {
 	{ .compatible = "atmel,sama5d3-nfc" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, atmel_nand_nfc_match);
 
 static struct platform_driver atmel_nand_nfc_driver = {
 	.driver = {
-- 
1.7.9.5
