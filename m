Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SiDO2-0004hF-IX
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2012 23:35:36 +0000
Received: by dadm1 with SMTP id m1so3145823dad.36
 for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2012 16:35:33 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/8] mtd: nand: rename "no_bbt" descriptors to "no_oob"
Date: Fri, 22 Jun 2012 16:35:40 -0700
Message-Id: <1340408145-24531-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These descriptors are for BBT's that don't use OOB; the "no_bbt" name doesn't
really make sense.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index c126469..dff24fa 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1274,7 +1274,7 @@ static struct nand_bbt_descr bbt_mirror_descr = {
 	.pattern = mirror_pattern
 };
 
-static struct nand_bbt_descr bbt_main_no_bbt_descr = {
+static struct nand_bbt_descr bbt_main_no_oob_descr = {
 	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
 		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP
 		| NAND_BBT_NO_OOB,
@@ -1284,7 +1284,7 @@ static struct nand_bbt_descr bbt_main_no_bbt_descr = {
 	.pattern = bbt_pattern
 };
 
-static struct nand_bbt_descr bbt_mirror_no_bbt_descr = {
+static struct nand_bbt_descr bbt_mirror_no_oob_descr = {
 	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
 		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP
 		| NAND_BBT_NO_OOB,
@@ -1355,8 +1355,8 @@ int nand_default_bbt(struct mtd_info *mtd)
 		/* Use the default pattern descriptors */
 		if (!this->bbt_td) {
 			if (this->bbt_options & NAND_BBT_NO_OOB) {
-				this->bbt_td = &bbt_main_no_bbt_descr;
-				this->bbt_md = &bbt_mirror_no_bbt_descr;
+				this->bbt_td = &bbt_main_no_oob_descr;
+				this->bbt_md = &bbt_mirror_no_oob_descr;
 			} else {
 				this->bbt_td = &bbt_main_descr;
 				this->bbt_md = &bbt_mirror_descr;
-- 
1.7.10
