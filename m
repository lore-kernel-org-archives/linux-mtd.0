Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRePk-0007yJ-EK
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:14:29 +0000
Received: by padbj1 with SMTP id bj1so29295254pad.5
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:14:07 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/5] mtd: diskonchip: don't call nand_scan_bbt() directly
Date: Sat, 28 Feb 2015 02:13:10 -0800
Message-Id: <1425118393-25179-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425118393-25179-1-git-send-email-computersforpeace@gmail.com>
References: <1425118393-25179-1-git-send-email-computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The diskonchip driver almost uses the default nand_base hooks as-is,
except that it provides custom on-flash BBT descriptors and avoids using
factory-marked bad blockers.

So let's refactor the BBT initialization code into a private 'late_init'
hook which handles all the private details. Note the usage of
NAND_SKIP_BBTSCAN, which allows us to defer the BBT scan until we've
prepared everything.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/diskonchip.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index f68a7bccecdc..e5800146cf33 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -69,6 +69,9 @@ struct doc_priv {
 	int mh0_page;
 	int mh1_page;
 	struct mtd_info *nextdoc;
+
+	/* Handle the last stage of initialization (BBT scan, partitioning) */
+	int (*late_init)(struct mtd_info *mtd);
 };
 
 /* This is the syndrome computed by the HW ecc generator upon reading an empty
@@ -1294,10 +1297,10 @@ static int __init nftl_scan_bbt(struct mtd_info *mtd)
 		this->bbt_md = NULL;
 	}
 
-	/* It's safe to set bd=NULL below because NAND_BBT_CREATE is not set.
-	   At least as nand_bbt.c is currently written. */
-	if ((ret = nand_scan_bbt(mtd, NULL)))
+	ret = this->scan_bbt(mtd);
+	if (ret)
 		return ret;
+
 	mtd_device_register(mtd, NULL, 0);
 	if (!no_autopart)
 		mtd_device_register(mtd, parts, numparts);
@@ -1344,10 +1347,10 @@ static int __init inftl_scan_bbt(struct mtd_info *mtd)
 		this->bbt_md->pattern = "TBB_SYSM";
 	}
 
-	/* It's safe to set bd=NULL below because NAND_BBT_CREATE is not set.
-	   At least as nand_bbt.c is currently written. */
-	if ((ret = nand_scan_bbt(mtd, NULL)))
+	ret = this->scan_bbt(mtd);
+	if (ret)
 		return ret;
+
 	memset((char *)parts, 0, sizeof(parts));
 	numparts = inftl_partscan(mtd, parts);
 	/* At least for now, require the INFTL Media Header.  We could probably
@@ -1369,7 +1372,7 @@ static inline int __init doc2000_init(struct mtd_info *mtd)
 	this->read_byte = doc2000_read_byte;
 	this->write_buf = doc2000_writebuf;
 	this->read_buf = doc2000_readbuf;
-	this->scan_bbt = nftl_scan_bbt;
+	doc->late_init = nftl_scan_bbt;
 
 	doc->CDSNControl = CDSN_CTRL_FLASH_IO | CDSN_CTRL_ECC_IO;
 	doc2000_count_chips(mtd);
@@ -1396,13 +1399,13 @@ static inline int __init doc2001_init(struct mtd_info *mtd)
 		   can have multiple chips. */
 		doc2000_count_chips(mtd);
 		mtd->name = "DiskOnChip 2000 (INFTL Model)";
-		this->scan_bbt = inftl_scan_bbt;
+		doc->late_init = inftl_scan_bbt;
 		return (4 * doc->chips_per_floor);
 	} else {
 		/* Bog-standard Millennium */
 		doc->chips_per_floor = 1;
 		mtd->name = "DiskOnChip Millennium";
-		this->scan_bbt = nftl_scan_bbt;
+		doc->late_init = nftl_scan_bbt;
 		return 1;
 	}
 }
@@ -1415,7 +1418,7 @@ static inline int __init doc2001plus_init(struct mtd_info *mtd)
 	this->read_byte = doc2001plus_read_byte;
 	this->write_buf = doc2001plus_writebuf;
 	this->read_buf = doc2001plus_readbuf;
-	this->scan_bbt = inftl_scan_bbt;
+	doc->late_init = inftl_scan_bbt;
 	this->cmd_ctrl = NULL;
 	this->select_chip = doc2001plus_select_chip;
 	this->cmdfunc = doc2001plus_command;
@@ -1591,6 +1594,8 @@ static int __init doc_probe(unsigned long physadr)
 	nand->ecc.bytes		= 6;
 	nand->ecc.strength	= 2;
 	nand->bbt_options	= NAND_BBT_USE_FLASH;
+	/* Skip the automatic BBT scan so we can run it manually */
+	nand->options		|= NAND_SKIP_BBTSCAN;
 
 	doc->physadr		= physadr;
 	doc->virtadr		= virtadr;
@@ -1608,7 +1613,7 @@ static int __init doc_probe(unsigned long physadr)
 	else
 		numchips = doc2001_init(mtd);
 
-	if ((ret = nand_scan(mtd, numchips))) {
+	if ((ret = nand_scan(mtd, numchips)) || (ret = doc->late_init(mtd))) {
 		/* DBB note: i believe nand_release is necessary here, as
 		   buffers may have been allocated in nand_base.  Check with
 		   Thomas. FIX ME! */
-- 
2.1.0
