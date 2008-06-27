Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KCJEz-0001Bv-T4
	for linux-mtd@lists.infradead.org; Fri, 27 Jun 2008 19:04:14 +0000
Date: Fri, 27 Jun 2008 23:04:13 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/3] MTD: NAND: fsl_elbc_nand: implement support for
	flash-based BBT
Message-ID: <20080627190413.GB16901@polina.dev.rtsoft.ru>
References: <20080627190243.GA4713@polina.dev.rtsoft.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
In-Reply-To: <20080627190243.GA4713@polina.dev.rtsoft.ru>
Cc: Scott Wood <scottwood@freescale.com>, linux-mtd@lists.infradead.org,
	Iwo Mergler <iwo@call-direct.com.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch implements support for flash-based BBT for chips working
through ELBC NAND controller, so that NAND core will not have to re-scan
for bad blocks on every boot.

Because ELBC controller may provide HW-generated ECCs we should adjust
bbt pattern and bbt version positions in the OOB free area.

Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
Acked-by: Scott Wood <scottwood@freescale.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |   34 +++++++++++++++++++++++++++++++++-
 1 files changed, 33 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 99dc2be..5f1bc5e 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -130,6 +130,34 @@ static struct nand_bbt_descr largepage_memorybased = {
 	.pattern = scan_ff_pattern,
 };
 
+/*
+ * ELBC may use HW ECC, so that OOB offsets, that NAND core uses for bbt,
+ * interfere with ECC positions, that's why we implement our own descriptors.
+ * OOB {11, 5}, works for both SP and LP chips, with ECCM = 1 and ECCM = 0.
+ */
+static u8 bbt_pattern[] = {'B', 'b', 't', '0' };
+static u8 mirror_pattern[] = {'1', 't', 'b', 'B' };
+
+static struct nand_bbt_descr bbt_main_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE |
+		   NAND_BBT_2BIT | NAND_BBT_VERSION,
+	.offs =	11,
+	.len = 4,
+	.veroffs = 15,
+	.maxblocks = 4,
+	.pattern = bbt_pattern,
+};
+
+static struct nand_bbt_descr bbt_mirror_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE |
+		   NAND_BBT_2BIT | NAND_BBT_VERSION,
+	.offs =	11,
+	.len = 4,
+	.veroffs = 15,
+	.maxblocks = 4,
+	.pattern = mirror_pattern,
+};
+
 /*=================================*/
 
 /*
@@ -767,8 +795,12 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	chip->cmdfunc = fsl_elbc_cmdfunc;
 	chip->waitfunc = fsl_elbc_wait;
 
+	chip->bbt_td = &bbt_main_descr;
+	chip->bbt_md = &bbt_mirror_descr;
+
 	/* set up nand options */
-	chip->options = NAND_NO_READRDY | NAND_NO_AUTOINCR;
+	chip->options = NAND_NO_READRDY | NAND_NO_AUTOINCR |
+			NAND_USE_FLASH_BBT;
 
 	chip->controller = &ctrl->controller;
 	chip->priv = priv;
-- 
1.5.5.4
