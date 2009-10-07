Received: from aa001msb.fastweb.it ([85.18.95.80])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MvVon-0003tx-7U
	for linux-mtd@lists.infradead.org; Wed, 07 Oct 2009 12:40:37 +0000
Message-ID: <4ACC8C34.6030007@evidence.eu.com>
Date: Wed, 07 Oct 2009 14:40:20 +0200
From: Claudio Scordino <claudio@evidence.eu.com>
MIME-Version: 1.0
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] atmel_nand: unused variable "eccpos" removed
Content-Type: multipart/mixed; boundary="------------010103070708010103020201"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010103070708010103020201
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi everybody,

    this (trivial) patch removes an unused variable from atmel_nand driver.

Best regards,

              Claudio






--------------010103070708010103020201
Content-Type: text/x-patch;
 name="0001-atmel_nand-unused-variable-removed.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-atmel_nand-unused-variable-removed.patch"

From: Claudio Scordino <claudio@evidence.eu.com>
Date: Wed, 7 Oct 2009 14:27:07 +0200
Subject: [PATCH 1/1] atmel_nand: unused variable removed

Unused variable "eccpos" removed from atmel_nand driver.

Signed-off-by: Claudio Scordino <claudio@evidence.eu.com>
---
 drivers/mtd/nand/atmel_nand.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index f8e9975..4f62d20 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -192,7 +192,6 @@ static int atmel_nand_calculate(struct mtd_info *mtd,
 {
 	struct nand_chip *nand_chip = mtd->priv;
 	struct atmel_nand_host *host = nand_chip->priv;
-	uint32_t *eccpos = nand_chip->ecc.layout->eccpos;
 	unsigned int ecc_value;
 
 	/* get the first 2 ECC bytes */
-- 
1.6.0.4


--------------010103070708010103020201--
