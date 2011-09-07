Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R1OZ7-0001dX-TZ
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2011 20:17:46 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 08/14] mtd: nand: remove gotos in `check_create()'
Date: Wed, 7 Sep 2011 13:13:35 -0700
Message-ID: <1315426421-16243-9-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
References: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a second step in restructuring `check_create()'. When we don't
rely on goto statements for our main functionality, the code will become
a little easier to manipulate.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |   39 +++++++++++++++++++++------------------
 1 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 6b5b2c0..9d4f889 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -875,7 +875,7 @@ static inline int nand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *b
  */
 static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *bd)
 {
-	int i, chips, writeops, chipsel, res;
+	int i, chips, writeops, create, chipsel, res;
 	struct nand_chip *this = mtd->priv;
 	struct nand_bbt_descr *td = this->bbt_td;
 	struct nand_bbt_descr *md = this->bbt_md;
@@ -889,6 +889,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 
 	for (i = 0; i < chips; i++) {
 		writeops = 0;
+		create = 0;
 		rd = NULL;
 		rd2 = NULL;
 		/* Per chip or per device? */
@@ -896,8 +897,8 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 		/* Mirrored table available? */
 		if (md) {
 			if (td->pages[i] == -1 && md->pages[i] == -1) {
+				create = 1;
 				writeops = 0x03;
-				goto create;
 			} else if (td->pages[i] == -1) {
 				rd = md;
 				td->version[i] = md->version[i];
@@ -921,25 +922,27 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 			}
 		} else {
 			if (td->pages[i] == -1) {
+				create = 1;
 				writeops = 0x01;
-				goto create;
+			} else {
+				rd = td;
 			}
-			rd = td;
 		}
-		goto writecheck;
-	create:
-		/* Create the bad block table by scanning the device? */
-		if (!(td->options & NAND_BBT_CREATE))
-			continue;
 
-		/* Create the table in memory by scanning the chip(s) */
-		if (!(this->bbt_options & NAND_BBT_CREATE_EMPTY))
-			create_bbt(mtd, buf, bd, chipsel);
+		if (create) {
+			/* Create the bad block table by scanning the device? */
+			if (!(td->options & NAND_BBT_CREATE))
+				continue;
+
+			/* Create the table in memory by scanning the chip(s) */
+			if (!(this->bbt_options & NAND_BBT_CREATE_EMPTY))
+				create_bbt(mtd, buf, bd, chipsel);
+
+			td->version[i] = 1;
+			if (md)
+				md->version[i] = 1;
+		}
 
-		td->version[i] = 1;
-		if (md)
-			md->version[i] = 1;
-	writecheck:
 		/* Read back first? */
 		if (rd)
 			read_abs_bbt(mtd, buf, rd, chipsel);
-- 
1.7.5.4
