Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q0oCk-0004tf-FD
	for linux-mtd@lists.infradead.org; Sat, 19 Mar 2011 04:55:59 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: nand: dynamic allocation of flash-based BBT structs
Date: Fri, 18 Mar 2011 21:53:42 -0700
Message-ID: <1300510422-4841-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1300510422-4841-1-git-send-email-computersforpeace@gmail.com>
References: <1300510422-4841-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Kevin Cernekee <cernekee@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is nicer to dynamically create our badblock patterns than to
statically define them. The nand_create_default_bbt_descr() function
does a sufficient job of handling various bad block scanning options
for either flash-based or non-flash-based BBTs, so we might as well
use the function for both cases.

This patch simplifies and shortens our code (and removes a TODO that
I left a few months ago).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |   27 ++++-----------------------
 1 files changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index a1e8b30..2753bb1 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1276,20 +1276,6 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
  * while scanning a device for factory marked good / bad blocks. */
 static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
 
-static struct nand_bbt_descr smallpage_flashbased = {
-	.options = NAND_BBT_SCAN2NDPAGE,
-	.offs = NAND_SMALL_BADBLOCK_POS,
-	.len = 1,
-	.pattern = scan_ff_pattern
-};
-
-static struct nand_bbt_descr largepage_flashbased = {
-	.options = NAND_BBT_SCAN2NDPAGE,
-	.offs = NAND_LARGE_BADBLOCK_POS,
-	.len = 2,
-	.pattern = scan_ff_pattern
-};
-
 static uint8_t scan_agand_pattern[] = { 0x1C, 0x71, 0xC7, 0x1C, 0x71, 0xC7 };
 
 static struct nand_bbt_descr agand_flashbased = {
@@ -1355,10 +1341,6 @@ static struct nand_bbt_descr bbt_mirror_no_bbt_descr = {
  * this->badblock_pattern. Thus, this->badblock_pattern should be NULL when
  * passed to this function.
  *
- * TODO: Handle other flags, replace other static structs
- *        (e.g. handle NAND_BBT_FLASH for flash-based BBT,
- *             replace smallpage_flashbased)
- *
  */
 static int nand_create_default_bbt_descr(struct nand_chip *this)
 {
@@ -1422,15 +1404,14 @@ int nand_default_bbt(struct mtd_info *mtd)
 				this->bbt_md = &bbt_mirror_descr;
 			}
 		}
-		if (!this->badblock_pattern) {
-			this->badblock_pattern = (mtd->writesize > 512) ? &largepage_flashbased : &smallpage_flashbased;
-		}
 	} else {
 		this->bbt_td = NULL;
 		this->bbt_md = NULL;
-		if (!this->badblock_pattern)
-			nand_create_default_bbt_descr(this);
 	}
+
+	if (!this->badblock_pattern)
+		nand_create_default_bbt_descr(this);
+
 	return nand_scan_bbt(mtd, this->badblock_pattern);
 }
 
-- 
1.7.0.4
