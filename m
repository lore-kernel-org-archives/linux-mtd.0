Received: from mail-bn1bon0096.outbound.protection.outlook.com
 ([157.56.111.96] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBQ6d-0001fG-NN
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 15:43:40 +0000
From: <dinguyen@opensource.altera.com>
To: <computersforpeace@gmail.com>
Subject: [PATCH] mtd: denali: Disable sub-page writes in Denali NAND driver
Date: Wed, 14 Jan 2015 09:38:50 -0600
Message-ID: <1421249930-21229-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dinh.linux@gmail.com, josh@joshtriplett.org, linux-kernel@vger.kernel.org,
 yamada.m@jp.panasonic.com, linux-mtd@lists.infradead.org,
 Dinh Nguyen <dinguyen@opensource.altera.com>, dwmw2@infradead.org,
 Graham Moore <grmoore@opensource.altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Graham Moore <grmoore@opensource.altera.com>

The Denali Controller IP does not support sub-page writes.

Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
 drivers/mtd/nand/denali.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index b3b7ca1..b16b040 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1565,6 +1565,9 @@ int denali_init(struct denali_nand_info *denali)
 	denali->nand.options |= NAND_SKIP_BBTSCAN;
 	denali->nand.ecc.mode = NAND_ECC_HW_SYNDROME;
 
+	/* no subpage writes on denali */
+	denali->nand.options |= NAND_NO_SUBPAGE_WRITE;
+
 	/*
 	 * Denali Controller only support 15bit and 8bit ECC in MRST,
 	 * so just let controller do 15bit ECC for MLC and 8bit ECC for
-- 
2.2.1
