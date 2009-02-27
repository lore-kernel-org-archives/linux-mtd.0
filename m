Received: from n17.bullet.mail.mud.yahoo.com ([68.142.206.144])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LctP4-0004Gg-HI
	for linux-mtd@lists.infradead.org; Fri, 27 Feb 2009 03:28:49 +0000
From: David Brownell <david-b@pacbell.net>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [patch/RESEND 2.6.29-rc6] NAND: fix "raw" reads with ECC syndrome
	layouts
Date: Thu, 26 Feb 2009 19:28:43 -0800
References: <200902241508.13835.david-b@pacbell.net>
	<20090226122543.797eac77.akpm@linux-foundation.org>
In-Reply-To: <20090226122543.797eac77.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200902261928.43642.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 26 February 2009, Andrew Morton wrote:
> > +     temp = chip->ecc.steps;
> > +     do {
> > +             ...
> > +     } while (--temp);
> 
> It would be clearer to code this as a plain old up-counting for loop.

Downside:  GCC adds a pointless jump-to-loop-test instruction at
the top of the loop ... but we know there's at least one step,
so there's no need to do that.  And up-counting needs an extra
variable, with initialization etc.


======== CUT HERE
From: David Brownell <dbrownell@users.sourceforge.net>

Cosmetic fixes to the patch fixing raw HW_SYNDROME read/write.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
 drivers/mtd/nand/nand_base.c |   28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -773,10 +773,9 @@ static int nand_read_page_raw_syndrome(s
 	int eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
 	uint8_t *oob = chip->oob_poi;
-	int temp;
+	int steps, size;
 
-	temp = chip->ecc.steps;
-	do {
+	for (steps = chip->ecc.steps; steps > 0; steps--) {
 		chip->read_buf(mtd, buf, eccsize);
 		buf += eccsize;
 
@@ -792,11 +791,11 @@ static int nand_read_page_raw_syndrome(s
 			chip->read_buf(mtd, oob, chip->ecc.postpad);
 			oob += chip->ecc.postpad;
 		}
-	} while (--temp);
+	}
 
-	temp = mtd->oobsize - (oob - chip->oob_poi);
-	if (temp)
-		chip->read_buf(mtd, oob, temp);
+	size = mtd->oobsize - (oob - chip->oob_poi);
+	if (size)
+		chip->read_buf(mtd, oob, size);
 
 	return 0;
 }
@@ -1542,7 +1541,7 @@ static void nand_write_page_raw(struct m
  * @chip:	nand chip info structure
  * @buf:	data buffer
  *
- * We need a special oob layout and handling even when ECC isn't used.
+ * We need a special oob layout and handling even when ECC isn't checked.
  */
 static void nand_write_page_raw_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 				const uint8_t *buf)
@@ -1550,10 +1549,9 @@ static void nand_write_page_raw_syndrome
 	int eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
 	uint8_t *oob = chip->oob_poi;
-	int temp;
+	int steps, size;
 
-	temp = chip->ecc.steps;
-	do {
+	for (steps = chip->ecc.steps; steps > 0; steps--) {
 		chip->write_buf(mtd, buf, eccsize);
 		buf += eccsize;
 
@@ -1569,11 +1567,11 @@ static void nand_write_page_raw_syndrome
 			chip->write_buf(mtd, oob, chip->ecc.postpad);
 			oob += chip->ecc.postpad;
 		}
-	} while (--temp);
+	}
 
-	temp = mtd->oobsize - (oob - chip->oob_poi);
-	if (temp)
-		chip->write_buf(mtd, oob, temp);
+	size = mtd->oobsize - (oob - chip->oob_poi);
+	if (size)
+		chip->write_buf(mtd, oob, size);
 }
 /**
  * nand_write_page_swecc - [REPLACABLE] software ecc based page write function
