Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIZXD-0004VC-Sq
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 11:54:03 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v5 20/23] mtd: nand: denali: support hardware-assisted erased
 page detection
Date: Wed,  7 Jun 2017 20:52:29 +0900
Message-Id: <1496836352-8016-21-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Recent versions of this IP support automatic erased page detection.
If an erased page is detected on reads, the controller does not set
INTR__ECC_UNCOR_ERR, but INTR__ERASED_PAGE.

The detection of erased page is based on the number of zeros in a
page; if the number of zeros is less than the value in the field
ERASED_THRESHOLD, the page is assumed as erased.

Please note ERASED_THRESHOLD specifies the number of zeros in a _page_
instead of an ECC chunk.  Moreover, the controller does not provide a
way to know the actual number of bitflips.

Actually, an erased page (all 0xff) is not an ECC correctable pattern
on the Denali ECC engine.  In other words, there is overlap between
the following two:

[1] a bit pattern reachable from a valid payload + ECC pattern within
    ecc.strength bitflips
[2] a bit pattern reachable from an erased state (all 0xff) within
    ecc.strength bitflips

So, this feature may intercept ECC correctable patterns, then replace
[1] with [2].

After all, this feature can work safely only when ECC_THRESHOLD == 1,
i.e. detect erased pages without any bitflips.  This should be the
case most of the time.  If there are some bitflips, the driver will
fallback to the software method by using nand_check_erased_ecc_chunk().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v5:
  - Set ECC_THRESHOLD to 1

Changes in v4: None
Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 3 ++-
 drivers/mtd/nand/denali.h | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index dcadf9655d7a..90c702b9f14c 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1446,7 +1446,8 @@ int denali_init(struct denali_nand_info *denali)
 		"chosen ECC settings: step=%d, strength=%d, bytes=%d\n",
 		chip->ecc.size, chip->ecc.strength, chip->ecc.bytes);
 
-	iowrite32(chip->ecc.strength, denali->flash_reg + ECC_CORRECTION);
+	iowrite32(MAKE_ECC_CORRECTION(chip->ecc.strength, 1),
+		  denali->flash_reg + ECC_CORRECTION);
 	iowrite32(mtd->erasesize / mtd->writesize,
 		  denali->flash_reg + PAGES_PER_BLOCK);
 	iowrite32(chip->options & NAND_BUSWIDTH_16 ? 1 : 0,
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index f5da52f09e34..657a794af695 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -110,6 +110,10 @@
 
 #define ECC_CORRECTION				0x1b0
 #define     ECC_CORRECTION__VALUE			GENMASK(4, 0)
+#define     ECC_CORRECTION__ERASE_THRESHOLD		GENMASK(31, 16)
+#define     MAKE_ECC_CORRECTION(val, thresh)		\
+			(((val) & (ECC_CORRECTION__VALUE)) | \
+			(((thresh) << 16) & (ECC_CORRECTION__ERASE_THRESHOLD)))
 
 #define READ_MODE				0x1c0
 #define     READ_MODE__VALUE				GENMASK(3, 0)
@@ -233,6 +237,7 @@
 #define     INTR__RST_COMP				BIT(13)
 #define     INTR__PIPE_CMD_ERR				BIT(14)
 #define     INTR__PAGE_XFER_INC				BIT(15)
+#define     INTR__ERASED_PAGE				BIT(16)
 
 #define PAGE_CNT(bank)				(0x430 + (bank) * 0x50)
 #define ERR_PAGE_ADDR(bank)			(0x440 + (bank) * 0x50)
-- 
2.7.4
