Received: from www.tglx.de ([62.245.132.106])
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1lRK-0006GT-OC
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2010 19:38:43 +0000
Date: Fri, 1 Oct 2010 21:37:37 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v2] mtd/nand: introduce NAND_CREATE_EMPTY_BBT
Message-ID: <20101001193737.GA28639@www.tglx.de>
References: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
	<1285782234-32509-5-git-send-email-bigeasy@linutronix.de>
	<1285959468.32172.2.camel@brekeke>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1285959468.32172.2.camel@brekeke>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

it will create an empty BBT table without considering vendor's BBT
information. Vendor's information may be unavailable if the NAND
controller has a different DATA & OOB layout or this information may be
allready purged.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mtd/nand/nand_bbt.c |    3 ++-
 include/linux/mtd/bbm.h     |    2 +-
 include/linux/mtd/nand.h    |    2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index b7b63cf..a27984c 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -999,7 +999,8 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 			continue;
 
 		/* Create the table in memory by scanning the chip(s) */
-		create_bbt(mtd, buf, bd, chipsel);
+		if (!(this->options & NAND_CREATE_EMPTY_BBT))
+			create_bbt(mtd, buf, bd, chipsel);
 
 		td->version[i] = 1;
 		if (md)
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index ba15b52..57cc0e6 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -84,7 +84,7 @@ struct nand_bbt_descr {
 #define NAND_BBT_PERCHIP	0x00000080
 /* bbt has a version counter at offset veroffs */
 #define NAND_BBT_VERSION	0x00000100
-/* Create a bbt if none axists */
+/* Create a bbt if none exists */
 #define NAND_BBT_CREATE		0x00000200
 /* Search good / bad pattern through all pages of a block */
 #define NAND_BBT_SCANALLPAGES	0x00000400
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 27e3d0a..d34b912 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -223,6 +223,8 @@ typedef enum {
  * the OOB area
  */
 #define NAND_USE_FLASH_BBT_NO_OOB	0x00100000
+/* Create an empty BBT with no vendor information if the BBT is available */
+#define NAND_CREATE_EMPTY_BBT		0x00200000
 
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
-- 
1.7.2.3
