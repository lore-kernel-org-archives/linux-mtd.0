Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KCFM2-0005N8-0B
	for linux-mtd@lists.infradead.org; Fri, 27 Jun 2008 14:55:14 +0000
Date: Fri, 27 Jun 2008 18:55:12 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Iwo Mergler <iwo@call-direct.com.au>
Subject: [PATCH] MTD: NAND: fsl_elbc_nand: implement support for
	flash-based BBT
Message-ID: <20080627145512.GA11372@polina.dev.rtsoft.ru>
References: <20080626184156.GA2356@polina.dev.rtsoft.ru>
	<48648662.1050107@call-direct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
In-Reply-To: <48648662.1050107@call-direct.com.au>
Cc: Scott Wood <scottwood@freescale.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: avorontsov@ru.mvista.com
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

The patch is mandatory for JFFS2 to work on large page NANDs connected
through the ELBC, since it workarounds ecclayout.oobfree first value:
after BBT has been created, BBT tracking code will not look for bad
block pattern anymore.

Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
---

On Fri, Jun 27, 2008 at 04:19:14PM +1000, Iwo Mergler wrote:
> Anton Vorontsov wrote:
>> For large page chips, nand_bbt is looking into OOB area, and checking
>> for "0xff 0xff" pattern at OOB offset 0. That is, two bytes should be
>> reserved for bbt means.
>>
>> But ELBC driver is specifying ecclayout so that oobfree area starts at
>> offset 1, so only one byte left for the bbt purposes.
>>
>> This causes problems with any OOB users, namely JFFS2: after first mount
>> JFFS2 will fill all OOBs with "erased marker", so OOBs will contain:
>>
>>   OOB Data: ff 19 85 20 03 00 ff ff ff 00 00 08 ff ff ff ff
>>   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>
>> And on the next boot, NAND core will rescan for bad blocks, then will
>> see "0xff 0x19" pattern, and will mark all blocks as bad ones.
>>
>> To fix the issue we should implement our own bad block pattern: just one
>> byte at OOB start.
>>
>>   
> Anton,
>
> the problem with bad block markers is that if they are set, _nothing_ is  
> guaranteed
> to work with that block. You cannot assume that it is possible to  
> relocate the BB
> marker into the first byte, if the second one is set.

Just looked into x16 LP NAND spec, and it says that block should be
considered as bad when the first _Word_ isn't 0xff. So we indeed should
not ignore the second byte. Ouch.

How about this patch?

 drivers/mtd/nand/fsl_elbc_nand.c |   34 +++++++++++++++++++++++++++++++++-
 1 files changed, 33 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 1b06d29..1847aa7 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -116,6 +116,34 @@ static struct nand_ecclayout fsl_elbc_oob_lp_eccm1 = {
 	.oobavail = 48,
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
@@ -752,8 +780,12 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
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
