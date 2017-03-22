Received: from conuserg-07.nifty.com ([210.131.2.74])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqgxk-0007tq-S4
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 14:10:10 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: laurent.monat@idquantique.com, thorsten.christiansson@idquantique.com,
 Enrico Jorns <ejo@pengutronix.de>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v2 24/53] mtd: nand: denali: remove meaningless writes to
 read-only registers
Date: Wed, 22 Mar 2017 23:07:31 +0900
Message-Id: <1490191680-14481-25-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The write accesses to LOGICAL_PAGE_{DATA,SPARE}_SIZE have no effect
because the Denali User's Guide says these registers are read-only.

The hardware automatically multiplies the main/spare size by the
number of devices and update LOGICAL_PAGE_{DATA,SPARE}_SIZE.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/mtd/nand/denali.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 3da0a0e..5e89709 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -342,8 +342,6 @@ static void get_samsung_nand_para(struct denali_nand_info *denali,
 
 static void get_toshiba_nand_para(struct denali_nand_info *denali)
 {
-	uint32_t tmp;
-
 	/*
 	 * Workaround to fix a controller bug which reports a wrong
 	 * spare area size for some kind of Toshiba NAND device
@@ -351,10 +349,6 @@ static void get_toshiba_nand_para(struct denali_nand_info *denali)
 	if ((ioread32(denali->flash_reg + DEVICE_MAIN_AREA_SIZE) == 4096) &&
 		(ioread32(denali->flash_reg + DEVICE_SPARE_AREA_SIZE) == 64)) {
 		iowrite32(216, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
-		tmp = ioread32(denali->flash_reg + DEVICES_CONNECTED) *
-			ioread32(denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
-		iowrite32(tmp,
-				denali->flash_reg + LOGICAL_PAGE_SPARE_SIZE);
 #if SUPPORT_15BITECC
 		iowrite32(15, denali->flash_reg + ECC_CORRECTION);
 #elif SUPPORT_8BITECC
@@ -366,22 +360,12 @@ static void get_toshiba_nand_para(struct denali_nand_info *denali)
 static void get_hynix_nand_para(struct denali_nand_info *denali,
 							uint8_t device_id)
 {
-	uint32_t main_size, spare_size;
-
 	switch (device_id) {
 	case 0xD5: /* Hynix H27UAG8T2A, H27UBG8U5A or H27UCG8VFA */
 	case 0xD7: /* Hynix H27UDG8VEM, H27UCG8UDM or H27UCG8V5A */
 		iowrite32(128, denali->flash_reg + PAGES_PER_BLOCK);
 		iowrite32(4096, denali->flash_reg + DEVICE_MAIN_AREA_SIZE);
 		iowrite32(224, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
-		main_size = 4096 *
-			ioread32(denali->flash_reg + DEVICES_CONNECTED);
-		spare_size = 224 *
-			ioread32(denali->flash_reg + DEVICES_CONNECTED);
-		iowrite32(main_size,
-				denali->flash_reg + LOGICAL_PAGE_DATA_SIZE);
-		iowrite32(spare_size,
-				denali->flash_reg + LOGICAL_PAGE_SPARE_SIZE);
 		iowrite32(0, denali->flash_reg + DEVICE_WIDTH);
 #if SUPPORT_15BITECC
 		iowrite32(15, denali->flash_reg + ECC_CORRECTION);
-- 
2.7.4
