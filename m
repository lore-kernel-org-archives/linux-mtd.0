Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQ4Y7-0002ZU-Ey
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 22:31:00 +0000
Received: by pbbrq13 with SMTP id rq13so3292314pbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 03 May 2012 15:30:57 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: nand: fixup 1/0 vs. true/false
Date: Thu,  3 May 2012 15:30:08 -0700
Message-Id: <1336084208-20461-1-git-send-email-computersforpeace@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The 'oob_required' argument is an int, according to the boolean style used in
nand_base.c, so we should use 1 and 0 instead of true and false.

Thanks Mike for spotting this.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
Cc: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
 drivers/mtd/nand/bcm_umi_nand.c        |    2 +-
 drivers/mtd/nand/docg4.c               |    4 ++--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
index c6d691a..c855e7c 100644
--- a/drivers/mtd/nand/bcm_umi_nand.c
+++ b/drivers/mtd/nand/bcm_umi_nand.c
@@ -341,7 +341,7 @@ static int bcm_umi_nand_verify_buf(struct mtd_info *mtd, const u_char * buf,
 	 * for MLC parts which may have permanently stuck bits.
 	 */
 	struct nand_chip *chip = mtd->priv;
-	int ret = chip->ecc.read_page(mtd, chip, readbackbuf, false, 0);
+	int ret = chip->ecc.read_page(mtd, chip, readbackbuf, 0, 0);
 	if (ret < 0)
 		return -EFAULT;
 	else {
diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 16221b2..1f8485d 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -1003,7 +1003,7 @@ static int __init read_factory_bbt(struct mtd_info *mtd)
 		return -ENOMEM;
 
 	read_page_prologue(mtd, g4_addr);
-	status = docg4_read_page(mtd, nand, buf, false, DOCG4_FACTORY_BBT_PAGE);
+	status = docg4_read_page(mtd, nand, buf, 0, DOCG4_FACTORY_BBT_PAGE);
 	if (status)
 		goto exit;
 
@@ -1080,7 +1080,7 @@ static int docg4_block_markbad(struct mtd_info *mtd, loff_t ofs)
 
 	/* write first page of block */
 	write_page_prologue(mtd, g4_addr);
-	docg4_write_page(mtd, nand, buf, true);
+	docg4_write_page(mtd, nand, buf, 1);
 	ret = pageprog(mtd);
 	if (!ret)
 		mtd->ecc_stats.badblocks++;
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 805bcf3..dcf4152 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1311,7 +1311,7 @@ static int mx23_write_transcription_stamp(struct gpmi_nand_data *this)
 		/* Write the first page of the current stride. */
 		dev_dbg(dev, "Writing an NCB fingerprint in page 0x%x\n", page);
 		chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
-		chip->ecc.write_page_raw(mtd, chip, buffer, false);
+		chip->ecc.write_page_raw(mtd, chip, buffer, 0);
 		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
 
 		/* Wait for the write to finish. */
-- 
1.7.5.4.2.g519b1
