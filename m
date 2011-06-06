Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTcP7-0000IB-Hf
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 16:11:50 +0000
Received: by wyb28 with SMTP id 28so4044358wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 09:11:43 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: denali: detect the number of banks before resetting NAND
Date: Mon,  6 Jun 2011 17:11:34 +0100
Message-Id: <1307376694-17905-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit c89eeda810f0ec4f0eee0206ebb79e476df9f83e (mtd: denali: detect the
number of banks) introduced runtime detection of the number of banks.

However, denali_nand_reset() uses uses denanli_nand_info::max_banks so
we need to detect the maximum number of banks before doing the reset.

Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---

Artem, I believe that this one will be needed for 3.0 to avoid breakage
on Moorestown.

 drivers/mtd/nand/denali.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index eebdfb5..3984d48 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1346,6 +1346,7 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	 * */
 	denali->bbtskipbytes = ioread32(denali->flash_reg +
 						SPARE_AREA_SKIP_BYTES);
+	detect_max_banks(denali);
 	denali_nand_reset(denali);
 	iowrite32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
 	iowrite32(CHIP_EN_DONT_CARE__FLAG,
@@ -1356,7 +1357,6 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	/* Should set value for these registers when init */
 	iowrite32(0, denali->flash_reg + TWO_ROW_ADDR_CYCLES);
 	iowrite32(1, denali->flash_reg + ECC_ENABLE);
-	detect_max_banks(denali);
 	denali_nand_timing_set(denali);
 	denali_irq_init(denali);
 }
-- 
1.7.4.1
