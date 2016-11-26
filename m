Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhNu-00055P-QQ
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:37 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 24/39] mtd: nand: denali: add NEW_N_BANKS_FORMAT capability
Date: Sun, 27 Nov 2016 03:06:10 +0900
Message-Id: <1480183585-592-25-git-send-email-yamada.masahiro@socionext.com>
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

Commit 271707b1d817 ("mtd: nand: denali: max_banks calculation
changed in revision 5.1") added a revision check to support the
new max_banks encoding.  Its git-log states "The encoding of
max_banks changed in Denali revision 5.1" but I doubt it.

The revision register on some UniPhier SoCs says the IP is 5.0
but the max_banks is encoded in the new format.  The revision of
this IP is often useless.

In order to provide a way to calculate correct max_banks without
relying on the revision register, add DENALI_CAPS_NEW_N_BANKS_FORMAT
capability (quirk).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 24 +++++++++++++++++-------
 drivers/mtd/nand/denali.h |  1 +
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 752ad98..614b4a5 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -448,17 +448,27 @@ static void find_valid_banks(struct denali_nand_info *denali)
 static void detect_max_banks(struct denali_nand_info *denali)
 {
 	u32 features = ioread32(denali->flash_reg + FEATURES);
+	bool old_format;
+
 	/*
-	 * Read the revision register, so we can calculate the max_banks
-	 * properly: the encoding changed from rev 5.0 to 5.1
+	 * There are some IP versions with different n_banks encoding.
+	 * Some people say the change happened from rev 5.0 to 5.1, while
+	 * there exist variants with revision older than 5.1 but new encoding.
+	 * The option flag is available in case the revision is useless.
 	 */
-	u32 revision = MAKE_COMPARABLE_REVISION(
+	if (denali->caps & DENALI_CAPS_NEW_N_BANKS_FORMAT)
+		old_format = false;
+	else {
+		u32 revision = MAKE_COMPARABLE_REVISION(
 				ioread32(denali->flash_reg + REVISION));
 
-	if (revision < REVISION_5_1)
-		denali->max_banks = 2 << (features & FEATURES__N_BANKS);
-	else
-		denali->max_banks = 1 << (features & FEATURES__N_BANKS);
+		old_format = revision < REVISION_5_1;
+	}
+
+	denali->max_banks = 1 << (features & FEATURES__N_BANKS);
+
+	if (old_format)
+		denali->max_banks <<= 1;
 }
 
 static u16 denali_nand_timing_set(struct denali_nand_info *denali)
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 9bdf037..e3fe3bc 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -436,6 +436,7 @@ struct denali_nand_info {
 	unsigned int caps;
 #define DENALI_CAPS_HW_ECC_FIXUP		BIT(0)
 #define DENALI_CAPS_DMA_64BIT			BIT(1)
+#define DENALI_CAPS_NEW_N_BANKS_FORMAT		BIT(2)
 };
 
 extern int denali_init(struct denali_nand_info *denali);
-- 
2.7.4
