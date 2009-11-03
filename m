Received: from mail-ew0-f228.google.com ([209.85.219.228])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N5PCf-0006xd-5W
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 19:38:09 +0000
Received: by ewy28 with SMTP id 28so6348053ewy.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 Nov 2009 11:38:03 -0800 (PST)
Message-ID: <4AF0893E.8040101@gmail.com>
Date: Tue, 03 Nov 2009 20:49:18 +0100
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] UBI: Ensure index is positive
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The index is signed, make sure it is not negative
when we read the array element.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
 drivers/mtd/mtdcore.c      |    2 +-
 drivers/mtd/nand/fsl_upm.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 467a4f1..c356c0a 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -447,7 +447,7 @@ struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num)
 		for (i=0; i< MAX_MTD_DEVICES; i++)
 			if (mtd_table[i] == mtd)
 				ret = mtd_table[i];
-	} else if (num < MAX_MTD_DEVICES) {
+	} else if (num >= 0 && num < MAX_MTD_DEVICES) {
 		ret = mtd_table[num];
 		if (mtd && mtd != ret)
 			ret = NULL;
diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index d120cd8..071a60c 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -112,7 +112,7 @@ static void fun_select_chip(struct mtd_info *mtd, int mchip_nr)
 
 	if (mchip_nr == -1) {
 		chip->cmd_ctrl(mtd, NAND_CMD_NONE, 0 | NAND_CTRL_CHANGE);
-	} else if (mchip_nr >= 0) {
+	} else if (mchip_nr >= 0 && mchip_nr < NAND_MAX_CHIPS) {
 		fun->mchip_number = mchip_nr;
 		chip->IO_ADDR_R = fun->io_base + fun->mchip_offsets[mchip_nr];
 		chip->IO_ADDR_W = chip->IO_ADDR_R;
