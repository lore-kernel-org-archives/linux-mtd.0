Received: from conuserg-09.nifty.com ([210.131.2.76])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqqTT-0001GV-AJ
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 00:19:34 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 thorsten.christiansson@idquantique.com, laurent.monat@idquantique.com,
 Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RESEND PATCH v2 50/53] mtd: nand: allocate aligned buffers if
 NAND_OWN_BUFFERS is unset
Date: Thu, 23 Mar 2017 09:17:59 +0900
Message-Id: <1490228282-10805-24-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 66507c7bc889 ("mtd: nand: Add support to use nand_base poi
databuf as bounce buffer") fixed the issue that drivers can be
passed with a kmap()'d buffer.  This addressed the use_bufpoi = 0
case.

When use_bufpoi = 1, chip->buffers->databuf is used.  The databuf
allocated by nand_scan_tail() is not suitable for DMA due to the
offset, sizeof(*chip->buffers).

So, drivers using DMA are very likely to end up with setting the
NAND_OWN_BUFFERS flag and allocate buffers by themselves.  Drivers
tend to use devm_k*alloc to simplify the probe failure path, but
devm_k*alloc() does not return a cache line aligned buffer.

If used, it could violate the DMA-API requirement stated in
Documentation/DMA-API.txt:
  Warnings:  Memory coherency operates at a granularity called the
  cache line width.  In order for memory mapped by this API to
  operate correctly, the mapped region must begin exactly on a cache
  line boundary and end exactly on one (to prevent two separately
  mapped regions from sharing a single cache line).

To sum up, NAND_OWN_BUFFERS is not very convenient for drivers.
nand_scan_tail() can give a separate buffer for each of ecccalc,
ecccode, databuf.  It is guaranteed kmalloc'ed memory is aligned
with ARCH_DMA_MINALIGN.  This is enough for most drivers because
it is rare that DMA engines require larger alignment than CPU's
cache line.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/nand_base.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e13f959..6fc0422 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4614,13 +4614,25 @@ int nand_scan_tail(struct mtd_info *mtd)
 	}
 
 	if (!(chip->options & NAND_OWN_BUFFERS)) {
-		nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
-				+ mtd->oobsize * 3, GFP_KERNEL);
+		nbuf = kzalloc(sizeof(*nbuf), GFP_KERNEL);
 		if (!nbuf)
 			return -ENOMEM;
-		nbuf->ecccalc = (uint8_t *)(nbuf + 1);
-		nbuf->ecccode = nbuf->ecccalc + mtd->oobsize;
-		nbuf->databuf = nbuf->ecccode + mtd->oobsize;
+		nbuf->ecccalc = kmalloc(mtd->oobsize, GFP_KERNEL);
+		if (!nbuf->ecccalc) {
+			ret = -EINVAL;
+			goto err_free;
+		}
+		nbuf->ecccode = kmalloc(mtd->oobsize, GFP_KERNEL);
+		if (!nbuf->ecccode) {
+			ret = -EINVAL;
+			goto err_free;
+		}
+		nbuf->databuf = kmalloc(mtd->writesize + mtd->oobsize,
+					GFP_KERNEL);
+		if (!nbuf->databuf) {
+			ret = -EINVAL;
+			goto err_free;
+		}
 
 		chip->buffers = nbuf;
 	} else {
@@ -4863,8 +4875,12 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/* Build bad block table */
 	return chip->scan_bbt(mtd);
 err_free:
-	if (!(chip->options & NAND_OWN_BUFFERS))
+	if (!(chip->options & NAND_OWN_BUFFERS)) {
+		kfree(chip->buffers->databuf);
+		kfree(chip->buffers->ecccode);
+		kfree(chip->buffers->ecccalc);
 		kfree(chip->buffers);
+	}
 	return ret;
 }
 EXPORT_SYMBOL(nand_scan_tail);
@@ -4915,8 +4931,12 @@ void nand_cleanup(struct nand_chip *chip)
 
 	/* Free bad block table memory */
 	kfree(chip->bbt);
-	if (!(chip->options & NAND_OWN_BUFFERS))
+	if (!(chip->options & NAND_OWN_BUFFERS)) {
+		kfree(chip->buffers->databuf);
+		kfree(chip->buffers->ecccode);
+		kfree(chip->buffers->ecccalc);
 		kfree(chip->buffers);
+	}
 
 	/* Free bad block descriptor memory */
 	if (chip->badblock_pattern && chip->badblock_pattern->options
-- 
2.7.4
