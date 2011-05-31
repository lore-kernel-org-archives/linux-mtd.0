From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/8] mtd: nand: separate chip options / bbt_options
Date: Tue, 31 May 2011 16:31:21 -0700
Message-ID: <1306884687-1824-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1306884687-1824-1-git-send-email-computersforpeace@gmail.com>
References: <1306884687-1824-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: baruch@tkos.co.il, Kevin Cernekee <cernekee@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	nsekhar@ti.com, b25806@freescale.com, tie-fei.zang@freescale.com,
	linux-mtd@lists.infradead.org,
	Florian Fainelli <ffainelli@freebox.fr>, jamie@jamieiles.com,
	Ivan Djelic <ivan.djelic@parrot.com>, kernel@wantstofly.org,
	khilman@ti.com, jesper.nilsson@axis.com, kgene.kim@samsung.com,
	linux@arm.linux.org.uk, hjk@linutronix.de, r64343@freescale.com,
	u.kleine-koenig@pengutronix.de,
	Ricard Wanderlof <ricard.wanderlof@axis.com>, alex@digriz.org.uk,
	john.ogness@linutronix.de, lucas.demarchi@profusion.mobi,
	nicolas.ferre@atmel.com, s.hauer@pengutronix.de,
	starvik@axis.com, joe@perches.com, ben-linux@fluff.org,
	cbouatmailru@gmail.com, linux-arm-kernel@lists.infradead.org,
	grant.likely@secretlab.ca, hong.xu@atmel.com,
	linux-cris-kernel@axis.com, sbranden@broadcom.com,
	nico@fluxnic.net, jkosina@suse.cz,
	Artem Bityutskiy <dedekind1@gmail.com>, blp@cs.stanford.edu,
	w.sang@pengutronix.de, mware@elphinstone.net,
	jdzheng@broadcom.com, chuanxiao.dong@intel.com, olof@lixom.net,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch handles the problems we've been having with using conflicting
flags from nand.h and bbm.h in the same nand_chip.options field. We
should try to separate these two spaces a little more clearly, and so I
have added a bbt_options field to nand_chip.

Important notes about nand_chip fields:
* bbt_options field should contain ONLY flags from bbm.h. They should be
  able to pass safely to a nand_bbt_descr data structure.
    - BBT option flags start with the "NAND_BBT_" prefix.
* options field should contian ONLY flags from nand.h. Ideally, they
  should not be involved in any BBT related options.
    - NAND chip option flags start with the "NAND_" prefix.
* Every flag should have a nice comment explaining what the flag is. While
  this is not yet the case on all existing flags, please be sure to write
  one for new flags. Even better, you can help document the code better
  yourself!

Please try to follow these conventions to make everyone's lives easier.

Among the flags that are being moved to the new bbt_options field
throughout various drivers, etc. are:
 * NAND_BBT_SCANLASTPAGE
 * NAND_BBT_SCAN2NDPAGE
and there will be more to come.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   10 +++++-----
 drivers/mtd/nand/nand_bbt.c  |    5 ++---
 include/linux/mtd/nand.h     |    4 ++++
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 456fb34..8dc2576 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -344,7 +344,7 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 	struct nand_chip *chip = mtd->priv;
 	u16 bad;
 
-	if (chip->options & NAND_BBT_SCANLASTPAGE)
+	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
 
 	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
@@ -396,7 +396,7 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	uint8_t buf[2] = { 0, 0 };
 	int block, ret, i = 0;
 
-	if (chip->options & NAND_BBT_SCANLASTPAGE)
+	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
 
 	/* Get block number */
@@ -426,7 +426,7 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 
 			i++;
 			ofs += mtd->writesize;
-		} while (!ret && (chip->options & NAND_BBT_SCAN2NDPAGE) &&
+		} while (!ret && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE) &&
 				i < 2);
 
 		nand_release_device(mtd);
@@ -3117,7 +3117,7 @@ ident_done:
 	if ((chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
 			(*maf_id == NAND_MFR_SAMSUNG ||
 			 *maf_id == NAND_MFR_HYNIX))
-		chip->options |= NAND_BBT_SCANLASTPAGE;
+		chip->bbt_options |= NAND_BBT_SCANLASTPAGE;
 	else if ((!(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
 				(*maf_id == NAND_MFR_SAMSUNG ||
 				 *maf_id == NAND_MFR_HYNIX ||
@@ -3125,7 +3125,7 @@ ident_done:
 				 *maf_id == NAND_MFR_AMD)) ||
 			(mtd->writesize == 2048 &&
 			 *maf_id == NAND_MFR_MICRON))
-		chip->options |= NAND_BBT_SCAN2NDPAGE;
+		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 
 	/* Check for AND chips with 4 page planes */
 	if (chip->options & NAND_4PAGE_ARRAY)
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 5ffb9a4..5df01d8 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -517,7 +517,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 		from = (loff_t)startblock << (this->bbt_erase_shift - 1);
 	}
 
-	if (this->options & NAND_BBT_SCANLASTPAGE)
+	if (this->bbt_options & NAND_BBT_SCANLASTPAGE)
 		from += mtd->erasesize - (mtd->writesize * len);
 
 	for (i = startblock; i < numblocks;) {
@@ -1301,7 +1301,6 @@ static struct nand_bbt_descr bbt_mirror_no_bbt_descr = {
 	.pattern = mirror_pattern
 };
 
-#define BBT_SCAN_OPTIONS (NAND_BBT_SCANLASTPAGE | NAND_BBT_SCAN2NDPAGE)
 /**
  * nand_create_default_bbt_descr - [Internal] Creates a BBT descriptor structure
  * @this:	NAND chip to create descriptor for
@@ -1324,7 +1323,7 @@ static int nand_create_default_bbt_descr(struct nand_chip *this)
 		printk(KERN_ERR "nand_create_default_bbt_descr: Out of memory\n");
 		return -ENOMEM;
 	}
-	bd->options = this->options & BBT_SCAN_OPTIONS;
+	bd->options = this->bbt_options;
 	bd->offs = this->badblockpos;
 	bd->len = (this->options & NAND_BUSWIDTH_16) ? 2 : 1;
 	bd->pattern = scan_ff_pattern;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c2b9ac4..42f70e2 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -449,6 +449,9 @@ struct nand_buffers {
  * @options:		[BOARDSPECIFIC] various chip options. They can partly
  *			be set to inform nand_scan about special functionality.
  *			See the defines for further explanation.
+ * @bbt_options:	[INTERN] bad block specific options. All options used
+ *			here must come from bbm.h. By default, these options
+ *			will be copied to the appropriate nand_bbt_descr's.
  * @badblockpos:	[INTERN] position of the bad block marker in the oob
  *			area.
  * @badblockbits:	[INTERN] number of bits to left-shift the bad block
@@ -509,6 +512,7 @@ struct nand_chip {
 
 	int chip_delay;
 	unsigned int options;
+	unsigned int bbt_options;
 
 	int page_shift;
 	int phys_erase_shift;
-- 
1.7.0.4
