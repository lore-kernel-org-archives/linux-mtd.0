Received: from conuserg-11.nifty.com ([210.131.2.78])
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhOJ-000265-MI
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:08:00 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 36/39] mtd: nand: denali: allow to use SoC-specific ECC
 strength
Date: Sun, 27 Nov 2016 03:06:22 +0900
Message-Id: <1480183585-592-37-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ecc.strength of this IP is a platform-dependent parameter.

I chose {15, 8} as the default to respect the historical reason of
this driver, but it should be overridable to use this driver for
other SoCs.

If necessary, SoCs can provide their own ecc_strength_avail.
This must be an array of supported ecc.strength in descending order,
terminated by zero.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c    | 5 ++++-
 drivers/mtd/nand/denali.h    | 1 +
 drivers/mtd/nand/denali_dt.c | 5 ++++-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index f2ed3f8..54c9e0c 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1373,7 +1373,7 @@ static int denali_set_max_ecc_strength(struct denali_nand_info *denali)
 	int oobsize = mtd->oobsize;
 	int ecc_size = chip->ecc.size;
 	int ecc_steps = mtd->writesize / chip->ecc.size;
-	const int *ecc_strength = denali_default_ecc_strength;
+	const int *ecc_strength = denali->ecc_strength_avail;
 	int ecc_bytes;
 
 	/* carve out the BBM area */
@@ -1625,6 +1625,9 @@ int denali_init(struct denali_nand_info *denali)
 		chip->ecc.size = denali->caps & DENALI_CAPS_ECC_SIZE_1024 ?
 								1024 : 512;
 
+	if (!denali->ecc_strength_avail)
+		denali->ecc_strength_avail = denali_default_ecc_strength;
+
 	ret = denali_set_max_ecc_strength(denali);
 	if (ret)
 		goto failed_req_irq;
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 5209625..2892e46 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -428,6 +428,7 @@ struct denali_nand_info {
 	u32 devnum;	/* represent how many nands connected */
 	u32 bbtskipbytes;
 	u32 max_banks;
+	const int *ecc_strength_avail;
 	unsigned int caps;
 #define DENALI_CAPS_HW_ECC_FIXUP		BIT(0)
 #define DENALI_CAPS_DMA_64BIT			BIT(1)
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index f085626..aa1e032 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -30,6 +30,7 @@ struct denali_dt {
 };
 
 struct denali_dt_data {
+	const int *ecc_strength_avail;
 	unsigned int caps;
 };
 
@@ -54,8 +55,10 @@ static int denali_dt_probe(struct platform_device *pdev)
 	denali = &dt->denali;
 
 	data = of_device_get_match_data(&pdev->dev);
-	if (data)
+	if (data) {
+		denali->ecc_strength_avail = data->ecc_strength_avail;
 		denali->caps = data->caps;
+	}
 
 	denali->caps |= DENALI_CAPS_HW_ECC_FIXUP;
 
-- 
2.7.4
