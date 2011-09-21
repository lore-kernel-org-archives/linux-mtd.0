Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R6BkR-0000Is-QX
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 01:37:16 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 12/14] mtd: nand: do not scan bad blocks with
	NAND_BBT_NO_OOB set
Date: Tue, 20 Sep 2011 18:36:42 -0700
Message-ID: <1316569002-21665-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1315426421-16243-13-git-send-email-computersforpeace@gmail.com>
References: <1315426421-16243-13-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	Matthieu Castet <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Updates to our default function for creating bad block patterns have
broken the "no OOB" feature. The NAND_BBT_NO_OOB option should not be
set while scanning for bad blocks, but we've been passing all BBT
options from nand_chip.bbt_options to the bad block scan. This causes us
to hit the:

	BUG_ON(bd->options & NAND_BBT_NO_OOB);

in create_bbt() when we scan the flash for bad blocks.

Thus, while it can be legal to set NAND_BBT_NO_OOB in a custom badblock
pattern descriptor (presumably with NAND_BBT_CREATE disabled?), we
should not pass it through in our default function.

Also, to help clarify and emphasize that the function creates bad block
patterns only (not, for example, table descriptors for locating
flash-based BBT), I renamed `nand_create_default_bbt_descr' to
`nand_create_badblock_pattern'.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: change to `mtd_is_*' prefix

 drivers/mtd/nand/nand_bbt.c |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index e7976c7..783093d 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1294,26 +1294,27 @@ static struct nand_bbt_descr bbt_mirror_no_bbt_descr = {
 	.pattern = mirror_pattern
 };
 
+#define BADBLOCK_SCAN_MASK (~NAND_BBT_NO_OOB)
 /**
- * nand_create_default_bbt_descr - [INTERN] Creates a BBT descriptor structure
+ * nand_create_badblock_pattern - [INTERN] Creates a BBT descriptor structure
  * @this: NAND chip to create descriptor for
  *
  * This function allocates and initializes a nand_bbt_descr for BBM detection
- * based on the properties of "this". The new descriptor is stored in
+ * based on the properties of @this. The new descriptor is stored in
  * this->badblock_pattern. Thus, this->badblock_pattern should be NULL when
  * passed to this function.
  */
-static int nand_create_default_bbt_descr(struct nand_chip *this)
+static int nand_create_badblock_pattern(struct nand_chip *this)
 {
 	struct nand_bbt_descr *bd;
 	if (this->badblock_pattern) {
-		pr_warn("BBT descr already allocated; not replacing\n");
+		pr_warn("Bad block pattern already allocated; not replacing\n");
 		return -EINVAL;
 	}
 	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
 	if (!bd)
 		return -ENOMEM;
-	bd->options = this->bbt_options;
+	bd->options = this->bbt_options & BADBLOCK_SCAN_MASK;
 	bd->offs = this->badblockpos;
 	bd->len = (this->options & NAND_BUSWIDTH_16) ? 2 : 1;
 	bd->pattern = scan_ff_pattern;
@@ -1367,7 +1368,7 @@ int nand_default_bbt(struct mtd_info *mtd)
 	}
 
 	if (!this->badblock_pattern)
-		nand_create_default_bbt_descr(this);
+		nand_create_badblock_pattern(this);
 
 	return nand_scan_bbt(mtd, this->badblock_pattern);
 }
-- 
1.7.5.4
