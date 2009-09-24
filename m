Received: from hera.kernel.org ([140.211.167.34])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mqn53-0002bL-17
	for linux-mtd@lists.infradead.org; Thu, 24 Sep 2009 12:05:49 +0000
Subject: [PATCH] mtd: nand: fix htmldocs warnings
From: Jaswinder Singh Rajput <jaswinder@kernel.org>
To: David Woodhouse <David.Woodhouse@intel.com>,
	Sneha Narnakaje <nsnehaprabha@ti.com>, Sandeep Paulraj <s-paulraj@ti.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Randy Dunlap <randy.dunlap@oracle.com>, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain
Date: Thu, 24 Sep 2009 17:34:53 +0530
Message-Id: <1253793893.5860.23.camel@ht.satnam>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Fixed following htmldocs warnings:

  DOCPROC Documentation/DocBook/mtdnand.xml
  Warning(drivers/mtd/nand/nand_base.c:769): No description found for parameter 'page'
  Warning(drivers/mtd/nand/nand_base.c:785): No description found for parameter 'page'
  Warning(drivers/mtd/nand/nand_base.c:824): No description found for parameter 'page'
  Warning(drivers/mtd/nand/nand_base.c:947): No description found for parameter 'page'
  Warning(drivers/mtd/nand/nand_base.c:996): No description found for parameter 'page'
  Warning(drivers/mtd/nand/nand_base.c:1040): No description found for parameter 'page'

Signed-off-by: Jaswinder Singh Rajput <jaswinderrajput@gmail.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Sneha Narnakaje <nsnehaprabha@ti.com>
Cc: Sandeep Paulraj <s-paulraj@ti.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/mtd/nand/nand_base.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 2211386..2957cc7 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -761,6 +761,7 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
+ * @page:	page number to read
  *
  * Not for syndrome calculating ecc controllers, which use a special oob layout
  */
@@ -777,6 +778,7 @@ static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
+ * @page:	page number to read
  *
  * We need a special oob layout and handling even when OOB isn't used.
  */
@@ -818,6 +820,7 @@ static int nand_read_page_raw_syndrome(struct mtd_info *mtd, struct nand_chip *c
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
+ * @page:	page number to read
  */
 static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
 				uint8_t *buf, int page)
@@ -939,6 +942,7 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip, uint3
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
+ * @page:	page number to read
  *
  * Not for syndrome calculating ecc controllers which need a special oob layout
  */
@@ -983,6 +987,7 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
+ * @page:	page number to read
  *
  * Hardware ECC for large page chips, require OOB to be read first.
  * For this ECC mode, the write_page method is re-used from ECC_HW.
@@ -1031,6 +1036,7 @@ static int nand_read_page_hwecc_oob_first(struct mtd_info *mtd,
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
+ * @page:	page number to read
  *
  * The hw generator calculates the error syndrome automatically. Therefor
  * we need a special oob layout and handling.
-- 
1.6.0.6
