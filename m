Received: from conuserg-11.nifty.com ([210.131.2.78])
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhOC-00025f-4e
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:53 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 16/39] mtd: nand: denali: rename handle_ecc() to
 denali_sw_ecc_fixup()
Date: Sun, 27 Nov 2016 03:06:02 +0900
Message-Id: <1480183585-592-17-git-send-email-yamada.masahiro@socionext.com>
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

I am going to add HW_ECC_FIXUP capability in the next commit.
Rename the software ECC handling function to denali_sw_ecc_fixup()
for clarification.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index b577560..271b41a 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -903,8 +903,8 @@ static bool is_erased(u8 *buf, int len)
 #define ECC_ERR_DEVICE(x)	(((x) & ERR_CORRECTION_INFO__DEVICE_NR) >> 8)
 #define ECC_LAST_ERR(x)		((x) & ERR_CORRECTION_INFO__LAST_ERR_INFO)
 
-static bool handle_ecc(struct denali_nand_info *denali, u8 *buf,
-		       u32 irq_status, unsigned int *max_bitflips)
+static bool denali_sw_ecc_fixup(struct denali_nand_info *denali, u8 *buf,
+				u32 irq_status, unsigned int *max_bitflips)
 {
 	bool check_erased_page = false;
 	unsigned int bitflips = 0;
@@ -1139,7 +1139,8 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 	memcpy(buf, denali->buf.buf, mtd->writesize);
 
-	check_erased_page = handle_ecc(denali, buf, irq_status, &max_bitflips);
+	check_erased_page = denali_sw_ecc_fixup(denali, buf, irq_status,
+						&max_bitflips);
 	denali_enable_dma(denali, false);
 
 	if (check_erased_page) {
-- 
2.7.4
