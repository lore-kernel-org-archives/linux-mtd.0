Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctTs2-0007EH-HI
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 06:48:00 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v3 11/37] mtd: nand: denali: allow to override revision number
Date: Thu, 30 Mar 2017 15:45:57 +0900
Message-Id: <1490856383-31560-12-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
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
max_banks changed in Denali revision 5.1".

There are exceptional cases, for example, the revision register on
some UniPhier SoCs says the IP is 5.0 but the max_banks is encoded
in the new format.

This IP updates the resister specification from time to time (often
breaking the backward compatibility), but the revision number is not
incremented correctly.

The max_banks is not only the case that needs revision checking.
Let's allow to override an incorrect revision number.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2:
  - Replace the NEW_N_BANKS_FORMAT approach

 drivers/mtd/nand/denali.c    | 23 +++++++++++++----------
 drivers/mtd/nand/denali.h    |  3 +--
 drivers/mtd/nand/denali_dt.c |  5 ++++-
 3 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 417a895..16634df 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -419,17 +419,12 @@ static void find_valid_banks(struct denali_nand_info *denali)
 static void detect_max_banks(struct denali_nand_info *denali)
 {
 	uint32_t features = ioread32(denali->flash_reg + FEATURES);
-	/*
-	 * Read the revision register, so we can calculate the max_banks
-	 * properly: the encoding changed from rev 5.0 to 5.1
-	 */
-	u32 revision = MAKE_COMPARABLE_REVISION(
-				ioread32(denali->flash_reg + REVISION));
 
-	if (revision < REVISION_5_1)
-		denali->max_banks = 2 << (features & FEATURES__N_BANKS);
-	else
-		denali->max_banks = 1 << (features & FEATURES__N_BANKS);
+	denali->max_banks = 1 << (features & FEATURES__N_BANKS);
+
+	/* the encoding changed from rev 5.0 to 5.1 */
+	if (denali->revision < 0x0501)
+		denali->max_banks <<= 1;
 }
 
 static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
@@ -1320,6 +1315,14 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 static void denali_hw_init(struct denali_nand_info *denali)
 {
 	/*
+	 * The REVISION register may not be reliable.  Platforms are allowed to
+	 * override it.
+	 */
+	if (!denali->revision)
+		denali->revision =
+				swab16(ioread32(denali->flash_reg + REVISION));
+
+	/*
 	 * tell driver how many bit controller will skip before
 	 * writing ECC code in OOB, this register may be already
 	 * set by firmware. So we read this value out.
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 1f413d0..ec00485 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -179,8 +179,6 @@
 
 #define REVISION				0x370
 #define     REVISION__VALUE				0xffff
-#define MAKE_COMPARABLE_REVISION(x)		swab16((x) & REVISION__VALUE)
-#define REVISION_5_1				0x00000501
 
 #define ONFI_DEVICE_FEATURES			0x380
 #define     ONFI_DEVICE_FEATURES__VALUE			0x003f
@@ -343,6 +341,7 @@ struct denali_nand_info {
 	int devnum;	/* represent how many nands connected */
 	int bbtskipbytes;
 	int max_banks;
+	unsigned int revision;
 	unsigned int caps;
 };
 
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index ada3863..df9ef36 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -30,6 +30,7 @@ struct denali_dt {
 };
 
 struct denali_dt_data {
+	unsigned int revision;
 	unsigned int caps;
 };
 
@@ -60,8 +61,10 @@ static int denali_dt_probe(struct platform_device *pdev)
 	denali = &dt->denali;
 
 	data = of_device_get_match_data(&pdev->dev);
-	if (data)
+	if (data) {
+		denali->revision = data->revision;
 		denali->caps = data->caps;
+	}
 
 	denali->platform = DT;
 	denali->dev = &pdev->dev;
-- 
2.7.4
