Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YasHy-0007S2-C5
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2015 20:52:35 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] of_mtd: Add support for on-die ECC mode
Date: Wed, 25 Mar 2015 21:52:02 +0100
Message-Id: <1427316722-9635-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

...teach of_get_nand_ecc_mode() to understand "hw_on_die".

Signed-off-by: Richard Weinberger <richard@nod.at>

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
index b53f92e..2de960e 100644

In my initial patch series I forgot about of_mtd.
This patch will be added to v2 of the series.

Thanks,
//richard

--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -2,7 +2,7 @@
 
 - nand-ecc-mode : String, operation mode of the NAND ecc mode.
   Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
-  "soft_bch".
+  "hw_on_die", "soft_bch".
 - nand-bus-width : 8 or 16 bus width if not present 8
 - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
 
diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
index b7361ed..3b38c9a 100644
--- a/drivers/of/of_mtd.c
+++ b/drivers/of/of_mtd.c
@@ -22,6 +22,7 @@ static const char *nand_ecc_modes[] = {
 	[NAND_ECC_HW]		= "hw",
 	[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
 	[NAND_ECC_HW_OOB_FIRST]	= "hw_oob_first",
+	[NAND_ECC_HW_ON_DIE]	= "hw_on_die",
 	[NAND_ECC_SOFT_BCH]	= "soft_bch",
 };
 
-- 
2.3.4
